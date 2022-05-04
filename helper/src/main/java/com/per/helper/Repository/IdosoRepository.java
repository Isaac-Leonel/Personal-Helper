package com.per.helper.Repository;

import java.util.List;

import com.per.dto.IdosoDto;
import com.per.helper.Entity.Idoso;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface IdosoRepository extends JpaRepository<Idoso,  Long>{

    @Query(value = "SELECT * FROM `idoso` WHERE `cpf` = :cpf", nativeQuery = true)
    public List<Object> dadosIdoso(@Param("cpf") String cpf);
}
