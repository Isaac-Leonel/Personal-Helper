package per.helper.elderly.controller;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import per.helper.elderly.DTO.ElderlyDTO;
import per.helper.elderly.entity.Elderly;
import per.helper.elderly.service.ElderlyService;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/ph/elderly")
public class ElderlyController {

        @Autowired
        private ElderlyService service;

        @PostMapping("/save")
        public ResponseEntity<Object> saveElderly(@RequestBody Elderly elderly, HttpServletRequest request){
            return ResponseEntity.ok(new Gson().toJson(service.saveElderly(elderly)));
        }

        @GetMapping("/look_for/{cpf}")
        public ResponseEntity<Object> lookForElderly(@PathVariable("cpf") String cpf){
            return ResponseEntity.ok(new Gson().toJson(service.lookForElderly(cpf)));
        }

        @GetMapping("/validate_login/{login}/{password}")
        public String validateLogin(@PathVariable("login") String login, @PathVariable("password") String password){
            return service.validateLogin(login, password);
        }

        @GetMapping("/link_elderly_caregiver/{cpfElderly}/{cpfCaregiver}/{token}")
        public ResponseEntity<Object> linkElderlyCaregiver(@PathVariable("cpfElderly") String cpfElderly,
                                                           @PathVariable("cpfCaregiver") String cpfCaregiver,
                                                           @PathVariable("token") String token) {
            return ResponseEntity.ok(new Gson().toJson(service.linkElderlyCaregiver(cpfElderly, cpfCaregiver, token)));
        }

        @GetMapping("/validate_cpf_medicament/{cpf}")
        public Long validateCPFMedicament(@PathVariable("cpf") String cpf){
            return service.validateCPFMedicament(cpf);
        }

        @GetMapping("/look_for_elderly_by_caregiver/{cpf}")
        public List<ElderlyDTO> lookForElderlyByCaregiver(@PathVariable("cpf") String cpfCaregiver){
            return service.lookForElderlyByCaregiver(cpfCaregiver);
        }

        @GetMapping("/generate_token/{cpf}")
        public String generateToken(@PathVariable("cpf") String cpf){
            return service.generateToken(cpf);
        }

        @GetMapping("/card_data/{cpf}")
        public ResponseEntity<Object> cardData(@PathVariable("cpf") String cpf){
            return ResponseEntity.ok(new Gson().toJson(service.cardData(cpf)));
        }
}