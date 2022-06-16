package per.helper.medicament.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
public class Medicament {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(nullable = false)
    private String name;
    @Column(nullable = false)
    private String description;
    @Column(nullable = false)
    private Long idelderly;
    @Column(nullable = false)
    private String dosage;
    @Column(nullable = false)
    private Long totalamount;
    @Column(nullable = false)
    private Long currentamount;
}
