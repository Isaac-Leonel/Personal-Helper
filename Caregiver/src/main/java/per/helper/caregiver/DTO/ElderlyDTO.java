package per.helper.caregiver.DTO;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.gson.annotations.SerializedName;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ElderlyDTO {
    @SerializedName("name")
    private String name;
    @SerializedName("cpf")
    private String cpf;
    @SerializedName("birthday")
    private String birthday;
    @SerializedName("image")
    private String image;
    @SerializedName("rg")
    private String rg;
}
