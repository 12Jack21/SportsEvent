package dao;

import org.springframework.stereotype.Repository;
import po.Doctor;

import java.util.List;

@Repository
public interface DoctorDAO {

    List<Doctor> getAllDoctors();

    List<Doctor> getTeamDoctors(int teamid);

    boolean addDoctor(Doctor doctor);

    boolean deleteDoctor(int docid);

    boolean updateDoctor(Doctor doctor);

}
