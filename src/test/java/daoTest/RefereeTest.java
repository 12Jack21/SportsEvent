package daoTest;

import baseTest.BaseTest;
import dao.RefereeDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.Referee;
import po.Team;

import java.util.List;
import static org.junit.Assert.*;

public class RefereeTest extends BaseTest {
    @Autowired
    private RefereeDAO refereeDAO;

    @Test
    public void getUser(){
        String user = refereeDAO.getUser("Kelao");
        assertEquals("0",user);
    }

    @Test
    public void getAllReferees(){
        List<Referee> referees = refereeDAO.getAllReferees();
        assertEquals(3,referees.toArray().length);
        assertEquals("Tompson",referees.get(2).getName());
    }

    @Test
    public void getTeamReferees(){

    }

//    在JudgeDAO中得到了更好的实现
//    List<Referee> getCompReferees(int compid);

    @Test
    public void addReferee(){
        Referee r = new Referee("q","12","123",new Team(2,null));
        assertTrue(refereeDAO.addReferee(r));
    }

    @Test
    public void deleteReferee(){
        assertTrue(refereeDAO.deleteReferee(2));
    }

    @Test
    public void updateReferee(){
        Referee r = new Referee("q","12","123",new Team(2,null));
        r.setId(2);
        assertTrue(refereeDAO.updateReferee(r));
    }

    @Test
    public void updateRefUser(){
        assertTrue(refereeDAO.updateRefUser(1,"ui"));
    }
}
