package per.helper.reminder.repository;

import org.hibernate.annotations.CollectionId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import per.helper.reminder.entity.Reminder;

import javax.transaction.Transactional;
import java.util.Collection;

@Repository
public interface ReminderRepository extends JpaRepository<Reminder, Long> {

    @Query(value = "select * from reminder where cpfforreminder= :cpf",nativeQuery = true)
    Collection<Reminder> fetchAllReminders(@Param("cpf") String cpf);

    @Query(value = "select * from reminder where cpfforreminder= :cpf order by dateremider DESC limit 3 ",nativeQuery = true)
    Collection<Reminder> fetchAllRemindersThree(@Param("cpf") String cpf);

    @Modifying
    @Transactional
    @Query(value = "delete from reminder where id =:idMedicament and cpfforreminder =:cpf", nativeQuery = true)
    void deleteReminder(@PathVariable("idMedicament") Long idMedicament, @PathVariable("cpf") String cpf);
}