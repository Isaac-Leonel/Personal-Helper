package com.per.helper.Repository;

import com.per.helper.Entity.Cuidador;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CuidadorRepository extends JpaRepository<Cuidador, Long>{
    
}
