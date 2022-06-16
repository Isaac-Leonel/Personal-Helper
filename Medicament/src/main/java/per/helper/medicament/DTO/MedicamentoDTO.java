package per.helper.medicament.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MedicamentoDTO {

    private String name;
    private String description;
    private String dosage;
    private String cpf;
    private Long totalAmount;
    private Long currentAmount;
}
