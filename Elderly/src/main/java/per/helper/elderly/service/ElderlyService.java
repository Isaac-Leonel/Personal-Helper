package per.helper.elderly.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import per.helper.elderly.DTO.ElderlyDTO;
import per.helper.elderly.converter.ElderlyConverter;
import per.helper.elderly.entity.Elderly;
import per.helper.elderly.repository.ElderlyRepository;

import javax.ws.rs.core.Response;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class ElderlyService {
    @Autowired
    private ElderlyRepository repository;

    @Autowired
    private ElderlyConverter converter;
    public String saveElderly(Elderly elderly){
        try{
            ValalidateCPF valalidateCPF = new ValalidateCPF();
            boolean vcpf = valalidateCPF.isCPF(elderly.getCpf());
            if (vcpf == true) {
                String encoderCPF = encoder(elderly.getCpf());
                String encoderRG = encoder(elderly.getRg());
                String encoderPass = encoder(elderly.getPassword());
                elderly.setCpf(encoderCPF);
                elderly.setRg(encoderRG);
                elderly.setPassword(encoderPass);

                if(repository.elderlyData(encoderCPF).isEmpty()){
                    repository.save(elderly);
                    return "Idoso salvo!";
                }else{
                 return "Erro Impossível salvar pois CPF já cadastrado!";
                }
            } else{
                return "Erro CPF inválido!";
            }
        } catch (Exception e){
            return "Erro Impossível salvar! ";
        }
    }
    public ElderlyDTO lookForElderly(String cpf){
        String search = encoder(cpf);
        Collection<Elderly> listElderly = repository.elderlyData(search);
        ElderlyDTO dto = new ElderlyDTO();
       for (Elderly list: listElderly) {
           dto.setName(list.getName());
           dto.setCpf(decoder(list.getCpf()));
           dto.setBirthday(list.getBirthday());
           dto.setLogin(list.getEmail());
           dto.setImage(list.getImage());
           dto.setRg(decoder(list.getRg()));
           dto.setMedicalInsurance(list.getMedicalInsurance());
           dto.setMedicalInsuranceNumber(list.getMedicalInsuranceNumber());
           dto.setNumberSUS(list.getNumberSUS());
           dto.setStreet(list.getStreet());
           dto.setNeighborhood(list.getNeighborhood());
           dto.setCity(list.getCity());
           dto.setComplement(list.getComplement());
           dto.setNumber(list.getNumber());
           dto.setEmergencyContact(list.getEmergencycontact());
           dto.setEmergencyContact2(list.getEmergencycontact2());
        }
        return dto;
    }
    public String validateLogin(String login, String password){
        Response.ResponseBuilder responseBuilder;
        String search = encoder(password);
        ArrayList<String> listElderly = repository.validateLogin(login, search);
        if(listElderly.isEmpty()){

       return "falhou";
        }else{
            ElderlyDTO dto = new ElderlyDTO();
            String[] separateData = new String[0];
            for (String list: listElderly) {
                separateData = list.split(",");
            }
            dto.setCpf(decoder(separateData[2]));
            return decoder(separateData[2]);
        }
    }
    public String linkElderlyCaregiver(String cpfElderly, String cpfCaregiver, String token){
        try{
            ValalidateCPF valalidateCPF = new ValalidateCPF();
            boolean vcpf = valalidateCPF.isCPF(cpfElderly);
            boolean vcpfC = valalidateCPF.isCPF(cpfCaregiver);
            if(vcpf == true && vcpfC == true){
                String cpf = encoder(cpfElderly);
                String CPFCaregiver = encoder(cpfCaregiver);
                String tokenEncoder = encoder(token);
                if(repository.validateToken(tokenEncoder, cpf) != null){
                    repository.deleteToken(cpf);
                    repository.linkElderlyCaregiver(CPFCaregiver,cpf);
                }
                else {
                    return "Erro Token incorreto!";
                }
            }
            else {
                return "Erro CPF incorreto!";
            }
        }catch (Exception e){
            return "Erro Impossível vincular! ";
        }
        return "Cuidador vinculado ao Idoso com sucesso!";
    }

    public Long validateCPFMedicament(String cpf){
        ValalidateCPF valalidateCPF = new ValalidateCPF();
        boolean vcpf = valalidateCPF.isCPF(cpf);
        if (vcpf == true) {
            String search = encoder(cpf);
            Long  id = repository.validateCPFMedicament(search);
            System.out.println(id);
            return id;
        }else{
            return null;
        }
    }

    public List<ElderlyDTO> lookForElderlyByCaregiver(String cpfCaregiver){
        String search = encoder(cpfCaregiver);
        List<Elderly> listElderly = repository.lookForElderlyByCaregiver(search);
        List<ElderlyDTO> lista = listElderly.stream().map(converter::converterToDto).collect(Collectors.toList());
        System.out.println(lista);

        return lista;
    }

    public ElderlyDTO cardData(String cpf){
        String search = encoder(cpf);
        Collection<Elderly>  elderly = repository.elderlyData(search);
        RestTemplate restTemplate = new RestTemplate();
        String cpfCaregiver = null;
        for (Elderly elderly1: elderly) {
            cpfCaregiver = elderly1.getCpfCaregiver();
        }
        String url = "https://caregiverapi.calmpebble-e433262b.canadacentral.azurecontainerapps.io/api/ph/caregiver/card_data/"+cpfCaregiver;
        ResponseEntity<Object> response = restTemplate.getForEntity(url,Object.class);
        System.out.println(response.getBody());
        ElderlyDTO dto = new ElderlyDTO();
        for (Elderly elderly1: elderly) {
        if(cpfCaregiver != null) {
            dto.setName(elderly1.getName());
            dto.setCpf(decoder(elderly1.getCpf()));
            dto.setRg(decoder(elderly1.getRg()));
            dto.setBirthday(elderly1.getBirthday());
            dto.setEmergencyContact(elderly1.getEmergencycontact());
            String nameCaregiver = response.getBody().toString();
            nameCaregiver = nameCaregiver.substring(6, nameCaregiver.length()-1);
            dto.setNameCaregiver(nameCaregiver);
        }else{
            dto.setName(elderly1.getName());
            dto.setCpf(decoder(elderly1.getCpf()));
            dto.setRg(decoder(elderly1.getRg()));
            dto.setBirthday(elderly1.getBirthday());
            dto.setEmergencyContact(elderly1.getEmergencycontact());
            dto.setNameCaregiver("Nao possui");
        }
        }
        return dto;
    }

    public String generateToken(String cpf){
        final String token = UUID.randomUUID().toString().replace("-", "");
        String tokenCoder, cpfCoder;
        tokenCoder = encoder(token);
        cpfCoder = encoder(cpf);
        repository.saveToken(tokenCoder,cpfCoder);
        return token;
    }

    private String encoder(String sensitiveData){
        return new String(Base64.getEncoder().encode(sensitiveData.getBytes()));
    }
    private String decoder(String sensitiveData){
        return new String(Base64.getDecoder().decode(sensitiveData.getBytes()));
    }
}