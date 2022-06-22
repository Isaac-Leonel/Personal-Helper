package per.helper.reminder.DTO;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class ReminderDTO {

    private String cpfForReminder;
    private String name;
    private String description;
    private String dateRemider;
}
