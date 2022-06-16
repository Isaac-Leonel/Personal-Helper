package per.helper.elderly.DTO;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;

@Setter
@Getter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ElderlyDTO {
    private Long id;
    private String name;
    private String cpf;
    private String birthday;
    private String login;
    private String password;
    private String image;
    private String rg;
    private String cpfCaregiver;
    private String numberSUS;
    private String medicalInsurance;
    private String medicalInsuranceNumber;
    private String street;
    private String neighborhood;
    private String city;
    private String complement;
    private String number;
    private String emergencyContact;
    private String emergencyContact2;
}
