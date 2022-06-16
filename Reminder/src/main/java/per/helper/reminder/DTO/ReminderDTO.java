package per.helper.reminder.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReminderDTO {

    private Long idmedicament;
    private String cpfCaregiver;
    private String name;
    private String description;
    private String dateRemider;
}
