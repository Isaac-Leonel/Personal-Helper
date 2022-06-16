package per.helper.medicament.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import per.helper.medicament.DTO.MedicamentoDTO;
import per.helper.medicament.entity.Medicament;
import per.helper.medicament.repository.MedicamentRepository;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Service
public class MedicamentService {

    @Autowired
    private MedicamentRepository repository;

    public String saveMedicament(MedicamentoDTO medicamento){
        try {
            RestTemplate restTemplate = new RestTemplate();
            String cpf = medicamento.getCpf();
            String url = "http://localhost:8080/api/ph/elderly/validate_cpf_medicament/"+cpf;
            ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
            System.out.println(response.getBody());
            Long idElderly = Long.valueOf(response.getBody());
            if (idElderly!=null) {
                Medicament medicament = new Medicament();
                medicament.setDescription(medicamento.getDescription());
                medicament.setDosage(medicamento.getDosage());
                medicament.setIdelderly(idElderly);
                medicament.setName(medicamento.getName());
                medicament.setCurrentamount(medicamento.getCurrentAmount());
                medicament.setTotalamount(medicamento.getTotalAmount());
                repository.save(medicament);
                return "Medicament saved!";
            } else {
                return "Id elderly invalid!";
            }
        } catch (Exception e){
            return "Impossible to save | " + e;
        }
    }
    public List<Medicament> getMedicine(String cpfElderly){
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://localhost:8080/api/ph/elderly/validate_cpf_medicament/"+cpfElderly;
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        Long idElderly = Long.valueOf(response.getBody());
        return repository.getMedicine(idElderly);
    }
}

