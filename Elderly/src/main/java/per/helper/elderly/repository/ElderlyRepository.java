package per.helper.elderly.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import per.helper.elderly.DTO.ElderlyDTO;
import per.helper.elderly.entity.Elderly;

import javax.transaction.Transactional;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


@Repository
public interface ElderlyRepository extends JpaRepository<Elderly,  Long> {
    @Query(value = "SELECT * FROM `elderly` WHERE `cpf` = :cpf", nativeQuery = true)
    Collection<Elderly> elderlyData(@Param("cpf") String cpf);

    @Query(value = "select `email`, `name`, `cpf` from `elderly` where `email` = :login and `password`=:password", nativeQuery = true)
    ArrayList<String> validateLogin(@Param("login") String login, @Param("password") String password);
    @Modifying
    @Transactional
    @Query(value = "UPDATE elderly set `cpf_caregiver` = :cpf_caregiver where `cpf`=:cpf", nativeQuery = true)
    void linkElderlyCaregiver(@Param("cpf_caregiver") String cpf_caregiver, @Param("cpf")String cpf);

    @Query(value = "SELECT id FROM `elderly` WHERE `cpf` = :cpf", nativeQuery = true)
    Long validateCPFMedicament(@Param("cpf") String cpf);

    @Query(value = "SELECT * FROM elderly WHERE cpf_caregiver = :cpfCaregiver", nativeQuery = true)
    List<Elderly> lookForElderlyByCaregiver(@Param("cpfCaregiver") String cpfCaregiver);

    @Modifying
    @Transactional
    @Query(value = "UPDATE elderly set `tokencarigiver` = :token where `cpf`=:cpf", nativeQuery = true)
    void saveToken(@Param("token") String token, @Param("cpf") String cpf);

    @Query(value = "Select tokencarigiver FROM elderly where `cpf` = :cpf and tokencarigiver = :token",nativeQuery = true)
    String validateToken(@Param("token") String token, @Param("cpf") String cpf);

    @Modifying
    @Transactional
    @Query(value = "UPDATE elderly set `tokencarigiver` = '' where `cpf`=:cpf", nativeQuery = true)
    void deleteToken( @Param("cpf") String cpf);

    @Query(value = "SELECT * FROM elderly WHERE `cpf`=:cpf", nativeQuery = true)
    Elderly cardData(@Param("cpf") String cpf);

}
