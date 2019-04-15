package dao;

import po.Doctor;

import java.util.List;

public interface DoctorDAO {

    List<Doctor> getAllDoctors();

    List<Doctor> getTeamDoctors(int teamid);

    boolean addDoctor(Doctor doctor);

    boolean deleteDoctor(int docid);

    boolean updateDoctor(Doctor doctor);

}
