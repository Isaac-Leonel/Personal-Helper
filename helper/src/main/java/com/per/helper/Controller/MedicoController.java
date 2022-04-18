package com.per.helper.Controller;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.per.helper.Entity.Medico;
import com.per.helper.Service.MedicoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/ph/medico")
public class MedicoController {
    
    @Autowired
    private MedicoService service; 
    
    @PostMapping
    public ResponseEntity<Object> salvarMedico(@RequestBody Medico medico, HttpServletRequest request){
        return  ResponseEntity.ok(new Gson().toJson(service.salvarMedico(medico)));
    }
}
