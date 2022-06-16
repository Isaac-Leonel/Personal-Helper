package per.helper.elderly.converter;

import org.springframework.stereotype.Component;
import per.helper.elderly.DTO.ElderlyDTO;
import per.helper.elderly.entity.Elderly;

import java.util.Base64;

@Component
public class ElderlyConverter {

    public ElderlyDTO converterToDto(Elderly elderly){
        ElderlyDTO dto = new ElderlyDTO();
        String cpfDecoder = decoder(elderly.getCpf());
        dto.setCpf(cpfDecoder);
        dto.setName(elderly.getName());
        dto.setBirthday(elderly.getBirthday());
        dto.setImage(elderly.getImage());
        String rgDecoder = decoder(elderly.getRg());
        dto.setRg(rgDecoder);
        return dto;
    }

    private String decoder(String sensitiveData){
        return new String(Base64.getDecoder().decode(sensitiveData.getBytes()));
    }
}
