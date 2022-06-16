package per.helper.caregiver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import per.helper.caregiver.DTO.CaregiverDTO;
import per.helper.caregiver.DTO.ElderlyDTO;
import per.helper.caregiver.entity.Caregiver;
import per.helper.caregiver.repository.CaregiverRepository;

import java.util.Base64;
import java.util.Collection;
import java.util.List;

@Service
public class CaregiverService {
    @Autowired
    private CaregiverRepository repository;
    public String saveCaregiver(Caregiver caregiver){
        try{
            ValalidateCPF valalidateCPF = new ValalidateCPF();
            boolean vcpf = valalidateCPF.isCPF(caregiver.getCpf());
            if (vcpf == true) {
                String encoderCPF = encoder(caregiver.getCpf());
                String encoderPass = encoder(caregiver.getPassword());
                caregiver.setCpf(encoderCPF);
                caregiver.setPassword(encoderPass);
                repository.save(caregiver);
                return "Caregiver saved!";
            } else{
                return "CPF invalid!";
            }
        } catch (Exception e){
            return "Impossible to save | " + e;
        }
    }
    public CaregiverDTO lookForCaregiver(String cpf){
        String search = encoder(cpf);
        Collection<Caregiver> listCaregiver = repository.caregiverData(search);
        CaregiverDTO dto = new CaregiverDTO();
        for (Caregiver list: listCaregiver) {
            dto.setSchooling(list.getSchooling());
            dto.setStreet(list.getStreet());
            dto.setNeighborhood(list.getNeighborhood());
            dto.setCity(list.getCity());
            dto.setComplement(list.getComplement());
            dto.setNumber(list.getNumber());
            dto.setName(list.getName());
            dto.setCpf(decoder(list.getCpf()));
            dto.setBirthday(list.getBirthday());
            dto.setLogin(list.getLogin());
            dto.setImage(list.getImage());
        }
        return dto;
    }
    public String validateLogin(String login, String password){
        String search = encoder(password);
        String listElderly = repository.validateLogin(login, search);
        if(listElderly.isEmpty()){
            return null;
        }else {
            return decoder(listElderly);
        }
    }

    public List<ElderlyDTO> lookForElderlyByCaregiver(String cpf){
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://localhost:8080/api/ph/elderly/look_for_elderly_by_caregiver/"+cpf;
        ResponseEntity<Object> response = restTemplate.getForEntity(url,Object.class);
        if(response.getBody().equals(null)){
            return null;
        }else{
            return (List<ElderlyDTO>) response.getBody();
        }
    }

    public String linkElderlyCaregiver(String cpfElderly, String cpfCaregiver, String token){
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://localhost:8080/api/ph/elderly/link_elderly_caregiver/"+cpfElderly+"/"+cpfCaregiver+"/"+token;
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        return response.getBody();
    }

    private String encoder(String sensitiveData){
        return new String(Base64.getEncoder().encode(sensitiveData.getBytes()));
    }
    private String decoder(String sensitiveData){
        return new String(Base64.getDecoder().decode(sensitiveData.getBytes()));
    }

    public String removeDoubleQuotes(String input){
        StringBuilder sb = new StringBuilder();
        char[] tab = input.toCharArray();
        for( char current : tab ){
            if( current != '"' && current != '[' && current != ']' )
                sb.append( current );
        }
        return sb.toString();
    }
}
