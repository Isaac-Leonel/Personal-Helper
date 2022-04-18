package com.per.helper.Controller;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.per.helper.Entity.Idoso;
import com.per.helper.Service.IdosoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/idoso")
public class IdosoController {
    
    @Autowired
    private IdosoService service;

    @PostMapping("/salvaridoso")
    public ResponseEntity<Object> salvarIdoso(@RequestBody Idoso idoso, HttpServletRequest request){
        return ResponseEntity.ok(new Gson().toJson(service.salvarIdoso(idoso)));
    }
}
