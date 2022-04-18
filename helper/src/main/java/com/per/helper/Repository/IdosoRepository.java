package com.per.helper.Repository;

import com.per.helper.Entity.Idoso;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IdosoRepository extends JpaRepository<Idoso,  Long>{
    
}
