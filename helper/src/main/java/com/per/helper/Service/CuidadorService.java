package com.per.helper.Service;

import com.per.helper.Entity.Cuidador;
import com.per.helper.Repository.CuidadorRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CuidadorService {
    
    @Autowired
    private final CuidadorRepository repository;

    public CuidadorService(CuidadorRepository repository){
        this.repository = repository;
    }

    public String salvarCuidador(Cuidador cuidador){
        try {
            repository.save(cuidador);
            return "Cuidador Salvo!";
        } catch (Exception e) {
            return "Impossivel salvar! | " + e; 
        }
    }
}
