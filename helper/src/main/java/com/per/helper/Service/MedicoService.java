package com.per.helper.Service;

import com.per.helper.Entity.Medico;
import com.per.helper.Repository.MedicoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MedicoService {
    
    @Autowired
    private final MedicoRepository repository;

    public MedicoService(MedicoRepository repository){
        this.repository = repository;
    }

    public String salvarMedico(Medico medico){
        try {
            repository.save(medico);
            return "Medico registrado!";
        } catch (Exception e) {
            return "Impossivel salvar! | " + e; 
        }
    }
}
