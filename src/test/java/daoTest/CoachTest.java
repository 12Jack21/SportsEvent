package daoTest;

import baseTest.BaseTest;
import dao.CoachDAO;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.Coach;
import po.Team;

import java.util.List;

public class CoachTest extends BaseTest {
    @Autowired
    private CoachDAO coachDAO;

    @Test
    public void testGetAll(){
        List<Coach> coaches = coachDAO.getAllCoaches();

        Assert.assertEquals(2,coaches.toArray().length);
    }

    @Test
    public void testTeamCoach(){
        List<Coach> coaches = coachDAO.getTeamCoaches(1);

        Assert.assertEquals(1,coaches.toArray().length);

    }

    @Test
    public void testAdd(){
        Coach coach = new Coach("1",1,"qweqwe","213123"
                ,new Team(2,null));
        boolean result = coachDAO.addCoach(coach);

        Assert.assertTrue(result);

    }

    @Test
    public void testDelete(){
        boolean result = coachDAO.deleteCoach(2);
        Assert.assertTrue(result);
    }

    @Test
    public void testUpdate(){
        Coach coach = new Coach(null,0,null,null,null);
        coach.setId(2);
        boolean result = coachDAO.updateCoach(coach);
        Assert.assertTrue(result);
    }
}
