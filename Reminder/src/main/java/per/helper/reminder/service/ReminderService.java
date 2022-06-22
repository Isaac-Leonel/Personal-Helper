package per.helper.reminder.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import per.helper.reminder.DTO.ReminderDTO;
import per.helper.reminder.entity.Reminder;
import per.helper.reminder.repository.ReminderRepository;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class ReminderService {

    @Autowired
    private ReminderRepository repository;

    public String saveReminder(ReminderDTO reminderDTO){
        try {
            if(ValalidateCPF.isCPF(reminderDTO.getCpfForReminder()) == true){
            Reminder reminder = new Reminder();
            reminder.setName(reminderDTO.getName());
            String enconderData = encoder(reminderDTO.getCpfForReminder());
            reminder.setCpfforreminder(enconderData);
            SimpleDateFormat dateParser = new SimpleDateFormat("dd/MM/yyyy HH:mm");
            Date date = dateParser.parse(reminderDTO.getDateRemider().toString());
            reminder.setDateremider(date);
            if (reminderDTO.getDescription() != null) {
                reminder.setDescription(reminderDTO.getDescription());
            }
            repository.save(reminder);
            return "Lembrete salvo!";
            }
            else{
                return "Erro CPF inválido!";
            }
        }catch (Exception e){
            return "Erro Impossível salvar! ";
        }
    }

    public List<ReminderDTO> fetchAllReminders(String cpf){
        try {
            String encoderData = encoder(cpf);
            Collection<Reminder> reminders = repository.fetchAllReminders(encoderData);
            List<ReminderDTO> reminderDTOS = new ArrayList<>();
            ReminderDTO dto;
            for (Reminder reminder: reminders) {
                dto = new ReminderDTO();
                dto.setName(reminder.getName());
                dto.setCpfForReminder(decoder(reminder.getCpfforreminder()));
                String test = String.valueOf(reminder.getDateremider());
                dto.setDateRemider(String.format(test, "dd/MM/yyyy HH:mm"));
                dto.setDescription(reminder.getDescription());
                reminderDTOS.add(dto);
            }
            return reminderDTOS;
        }catch (Exception e){

        }
        return null;
    }

    public List<ReminderDTO> fetchAllRemindersThree(String cpf){
        try {
            String encoderData = encoder(cpf);
            Collection<Reminder> reminders = repository.fetchAllRemindersThree(encoderData);
            List<ReminderDTO> reminderDTOS = new ArrayList<>();
            ReminderDTO dto;
            for (Reminder reminder: reminders) {
                dto = new ReminderDTO();
               dto.setName(reminder.getName());
               dto.setCpfForReminder(decoder(reminder.getCpfforreminder()));
               String test = String.valueOf(reminder.getDateremider());
               dto.setDateRemider(String.format(test, "dd/MM/yyyy HH:mm"));
               dto.setDescription(reminder.getDescription());
               reminderDTOS.add(dto);
            }
                return reminderDTOS;
        }catch (Exception e){

        }
        return null;
    }

    public String deleteReminder(Long idMedicament, String cpf){
        try {
            String encoderData = encoder(cpf);
            repository.deleteReminder(idMedicament, encoderData);
            return "Remedio deletado com sucesso!!";
        }catch (Exception e){
        }
        return "Error ao deletar remédio!";
    }

    private String encoder(String sensitiveData){
        return new String(Base64.getEncoder().encode(sensitiveData.getBytes()));
    }
    private String decoder(String sensitiveData){
        return new String(Base64.getDecoder().decode(sensitiveData.getBytes()));
    }
}
