package per.helper.caregiver.controller;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import per.helper.caregiver.entity.Caregiver;
import per.helper.caregiver.service.CaregiverService;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;

@RestController
@RequestMapping("/api/ph/caregiver")
public class CaregiverController {
    @Autowired
    private CaregiverService service;

    @PostMapping("/save")
    public ResponseEntity<Object> saveCaregiver(@RequestBody Caregiver caregiver, HttpServletRequest request){
        return ResponseEntity.ok(new Gson().toJson(service.saveCaregiver(caregiver)));
    }

    @GetMapping("/look_for/{cpf}")
    public ResponseEntity<Object> lookForCaregiver(@PathVariable("cpf") String cpf){
        return ResponseEntity.ok(new Gson().toJson(service.lookForCaregiver(cpf)));
    }

    @GetMapping("/validate_login/{login}/{password}")
    public String validateLogin(@PathVariable("login") String login, @PathVariable("password") String password){
        return service.validateLogin(login, password);
    }

    @GetMapping("/look_for_elderly_by_caregiver/{cpf}")
    public ResponseEntity<Object> lookForElderlyByCaregiver(@PathVariable("cpf") String cpf){
        return ResponseEntity.ok(new Gson().toJson(service.lookForElderlyByCaregiver(cpf)));
    }

    @PatchMapping("/link_elderly_caregiver/{cpfElderly}/{cpfCaregiver}/{token}")
    public ResponseEntity<Object> linkElderlyCaregiver(@PathVariable("cpfElderly") String cpfElderly, @PathVariable("cpfCaregiver") String cpfCaregiver, @PathVariable("token") String token) {
        return ResponseEntity.ok(new Gson().toJson(service.linkElderlyCaregiver(cpfElderly, cpfCaregiver, token)));
    }

    @GetMapping("/card_data/{cpfCaregiver}")
    public ResponseEntity<Object> cardData(@PathVariable("cpfCaregiver") String cpfCaregiver){
        return ResponseEntity.ok(new Gson().toJson(service.cardData(cpfCaregiver)));
    }
    
}
