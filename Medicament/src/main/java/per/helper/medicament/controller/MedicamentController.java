package per.helper.medicament.controller;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import per.helper.medicament.DTO.MedicamentoDTO;
import per.helper.medicament.service.MedicamentService;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/ph/medicament")
public class MedicamentController {

    @Autowired
    private MedicamentService service;

    @PostMapping("/save")
    public ResponseEntity<Object> saveMedicament(@RequestBody MedicamentoDTO medicament, HttpServletRequest request){
        return ResponseEntity.ok(new Gson().toJson(service.saveMedicament(medicament)));
    }

    @GetMapping("/get_medicine/{cpfElderly}")
    public ResponseEntity<Object> getMedicine(@PathVariable("cpfElderly") String cpfElderly){
        return ResponseEntity.ok(new Gson().toJson(service.getMedicine(cpfElderly)));
    }
}
