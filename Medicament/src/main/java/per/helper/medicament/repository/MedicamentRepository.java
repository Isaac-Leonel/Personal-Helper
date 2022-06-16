package per.helper.medicament.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import per.helper.medicament.entity.Medicament;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Repository
public interface MedicamentRepository extends JpaRepository<Medicament, Long> {

    @Query(value = "SELECT * from medicament WHERE idelderly = :idelderly", nativeQuery = true)
    List<Medicament> getMedicine(@Param("idelderly") Long idelderly);
}