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
            if(ValalidateCPF.isCPF(reminderDTO.getCpfCaregiver()) == true){
            Reminder reminder = new Reminder();
            reminder.setName(reminderDTO.getName());
            String enconderData = encoder(reminderDTO.getCpfCaregiver());
            reminder.setCpfforreminder(enconderData);
            SimpleDateFormat dateParser = new SimpleDateFormat("dd/MM/yyyy HH:mm");
            Date date = dateParser.parse(reminderDTO.getDateRemider());
            reminder.setDateremider(date);
            if (reminderDTO.getDescription() != null) {
                reminder.setDescription(reminderDTO.getDescription());
            }
            if (reminderDTO.getIdmedicament() != null) {
                reminder.setIdmedicament(reminderDTO.getIdmedicament());
            }
            repository.save(reminder);
            return "Reminder saved!";
            }
            else{
                return "Invalid CPF!";
            }
        }catch (Exception e){
            return "Impossible to save | " + e;
        }
    }

    public List<ReminderDTO>  fetchAllReminders(String cpf){
        try {
            String encoderData = encoder(cpf);
            Collection<Reminder> listReminder = repository.fetchAllReminders(encoderData);
            ArrayList<ReminderDTO> dto = new ArrayList<>();
            ReminderDTO reminderDTO = new ReminderDTO();
            for (Reminder reminder: listReminder) {
                reminderDTO.setIdmedicament(reminder.getIdmedicament());
                reminderDTO.setDescription(reminder.getDescription());
                reminderDTO.setName(reminder.getName());
                String decoderData = decoder(reminder.getCpfforreminder());
                reminderDTO.setCpfCaregiver(decoderData);
                SimpleDateFormat dateParser = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                reminderDTO.setDateRemider(dateParser.format(reminder.getDateremider()));
                dto.add(reminderDTO);
            }
            return dto;
        }catch (Exception e){

        }
        return null;
    }

    public String deleteReminder(Long idMedicament, String cpf){
        try {
            String encoderData = encoder(cpf);
            repository.deleteReminder(idMedicament, encoderData);
            return "Drug successfully deleted!!";
        }catch (Exception e){
        }
        return "Error when deleting medicine";
    }

    private String encoder(String sensitiveData){
        return new String(Base64.getEncoder().encode(sensitiveData.getBytes()));
    }
    private String decoder(String sensitiveData){
        return new String(Base64.getDecoder().decode(sensitiveData.getBytes()));
    }
}
