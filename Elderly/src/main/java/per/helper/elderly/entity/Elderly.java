package per.helper.elderly.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
public class Elderly {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(nullable = false)
    private String name;
    @Column(nullable = false)
    private String cpf;
    @Column(nullable = false)
    private String birthday;
    @Column(nullable = false)
    private String email;
    @Column(nullable = false)
    private String password;
    @Column(nullable = true)
    private String image;
    @Column(nullable = false)
    private String rg;
    @Column(nullable = true)
    private String cpfCaregiver;
    @Column(nullable = true)
    private String numberSUS;
    @Column(nullable = true)
    private String medicalInsurance;
    @Column(nullable = true)
    private String medicalInsuranceNumber;
    @Column(nullable = false)
    private String street;
    @Column(nullable = false)
    private String neighborhood;
    @Column(nullable = false)
    private String city;
    @Column(nullable = true)
    private String complement;
    @Column(nullable = false)
    private String number;
    @Column(nullable = false)
    private String emergencycontact;
    @Column(nullable = true)
    private String emergencycontact2;
    @Column(nullable = true)
    private String tokencarigiver;
}
