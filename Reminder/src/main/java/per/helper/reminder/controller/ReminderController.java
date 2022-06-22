package per.helper.reminder.controller;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import per.helper.reminder.DTO.ReminderDTO;
import per.helper.reminder.service.ReminderService;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/ph/reminder")
public class ReminderController {

    @Autowired
    private ReminderService service;

    @PostMapping("/save")
    public ResponseEntity<Object> saveReminder(@RequestBody ReminderDTO reminder, HttpServletRequest request){
        return ResponseEntity.ok(new Gson().toJson(service.saveReminder(reminder)));
    }

    @GetMapping("fetch_allr_reminders/{cpf}")
    public ResponseEntity<Object> fetchAllReminders(@PathVariable("cpf") String cpf){
        return ResponseEntity.ok(new Gson().toJson(service.fetchAllReminders(cpf)));
    }

    @GetMapping("fetch_allr_reminders_three/{cpf}")
    public ResponseEntity<Object> fetchAllRemindersThree(@PathVariable("cpf") String cpf){
        return ResponseEntity.ok(new Gson().toJson(service.fetchAllRemindersThree(cpf)));
    }

    @DeleteMapping("delete_reminder/{idMedicament}/{cpf}")
    public String deleteReminder(@PathVariable("idMedicament") Long idMedicament, @PathVariable("cpf") String cpf ){
        return service.deleteReminder(idMedicament, cpf);
    }

}
