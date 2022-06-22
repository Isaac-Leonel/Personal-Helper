package per.helper.caregiver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import per.helper.caregiver.DTO.CaregiverDTO;
import per.helper.caregiver.DTO.ElderlyDTO;
import per.helper.caregiver.entity.Caregiver;

import java.util.ArrayList;
import java.util.Collection;

public interface CaregiverRepository extends JpaRepository<Caregiver, Long> {

    @Query(value = "SELECT * FROM `caregiver` WHERE `cpf` = :cpf", nativeQuery = true)
    Collection<Caregiver> caregiverData(@Param("cpf") String cpf);

    @Query(value = "select `cpf` from `caregiver` where `login` = :login and `password`=:password", nativeQuery = true)
    String validateLogin(@Param("login") String login, @Param("password") String password);

    @Query(value = "SELECT name FROM `caregiver` WHERE `cpf` = :cpfCaregiver",nativeQuery = true)
    String cardData(@Param("cpfCaregiver") String cpfCaregiver);

}
