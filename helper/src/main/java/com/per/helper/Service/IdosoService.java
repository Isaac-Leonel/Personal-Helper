package com.per.helper.Service;

import com.per.helper.Entity.Idoso;
import com.per.helper.Repository.IdosoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IdosoService {

    @Autowired
    private final IdosoRepository repository;
    
    public IdosoService(IdosoRepository repository){
        this.repository = repository;
    }

    public String salvarIdoso(Idoso idoso){
        try{
            repository.save(idoso);
            return "Idoso salvo!";
        } catch (Exception e){
            return "Impossivel salvar! | " + e; 
        }
    }
}
