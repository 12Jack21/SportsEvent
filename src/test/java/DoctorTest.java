import dao.DoctorDAO;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.Doctor;
import po.Team;

import java.util.List;

public class DoctorTest extends BaseTest {
    @Autowired
    private DoctorDAO doctorDAO;

    @Test
    public void testGetAll(){
        List<Doctor> doctors = doctorDAO.getAllDoctors();

        Assert.assertEquals(2,doctors.toArray().length);
    }

    @Test
    public void testTeamDoctor(){
        List<Doctor> doctors = doctorDAO.getTeamDoctors(1);

        Assert.assertEquals(1,doctors.toArray().length);

    }

    @Test
    public void testAdd(){
        Doctor doctor = new Doctor("WIca","1112",
                "123123",new Team(1,null));
        boolean result = doctorDAO.addDoctor(doctor);

        Assert.assertTrue(result);

    }

    @Test
    public void testDelete(){
        boolean result = doctorDAO.deleteDoctor(2);
        Assert.assertTrue(result);
    }

    @Test
    public void testUpdate(){
        Doctor doctor = new Doctor("HUa","312",
                "12qrwq",new Team(2,null));
        doctor.setId(2);
        boolean result = doctorDAO.updateDoctor(doctor);
        Assert.assertTrue(result);
    }
}
