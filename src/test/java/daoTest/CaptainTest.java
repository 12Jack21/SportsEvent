package daoTest;

import baseTest.BaseTest;
import dao.CaptainDAO;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.Captain;
import po.Team;

import java.util.List;

public class CaptainTest extends BaseTest {
    @Autowired
    private CaptainDAO captainDAO;

    @Test
    public void testGetAll(){
        List<Captain> captains = captainDAO.getAllCaptains();

        Assert.assertEquals(2,captains.toArray().length);
    }

    @Test
    public void testTeamCaptain(){
        Captain captain = captainDAO.getTeamCaptain(1);

        Assert.assertEquals("22222",captain.getCapID());

    }

    @Test
    public void testAdd(){
        Captain captain = new Captain("WIca","1112",
                "123123",new Team(1,null));
        boolean result = captainDAO.addCaptain(captain);

        Assert.assertTrue(result);

    }

    @Test
    public void testDelete(){
        boolean result = captainDAO.deleteCaptain(2);
        Assert.assertTrue(result);
    }

    @Test
    public void testUpdate(){
        Captain captain = new Captain("HUa","312",
                "12qrwq",new Team(2,null));
        captain.setId(2);
        boolean result = captainDAO.updateCaptain(captain);
        Assert.assertTrue(result);
    }
}
