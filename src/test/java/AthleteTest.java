import MyUtil.MyConvertor;
import dao.AthleteDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import po.Athlete;
import po.Team;

import java.util.List;

import static org.junit.Assert.*;

public class AthleteTest extends BaseTest {
    @Autowired
    private AthleteDAO athleteDAO;

    @Test
    public void testGetAll(){
        List<Athlete> athletes = athleteDAO.getAllAthletes();
        assertEquals(2,athletes.toArray().length);
    }

    @Test
    public void getTeamAthletes(){
        List<Athlete> athletes = athleteDAO.getTeamAthletes(1);
        assertEquals(1,athletes.toArray().length);
    }

    @Test
    public void getGroupAthletes(){
        List<Athlete> athletes = athleteDAO.getGroupAthletes(2,0,9,10);
        assertEquals(1,athletes.toArray().length);

        String group = MyConvertor.groupString(athletes.get(0).getSex(),
                athletes.get(0).getAge());
        System.out.println(group);
    }

    @Test
    public void getCompAthletes(){
        List<Athlete> athletes = athleteDAO.getCompAthletes(1);
        assertEquals(2,athletes.toArray().length);
    }

    @Test
    public void addAthlete(){
        Athlete athlete = new Athlete("Maria",0,7,
                "122221",new Team(1,null));
        boolean result = athleteDAO.addAthlete(athlete);
        assertTrue(result);
    }

    @Test
    public void deleteAthlete(){
        boolean result = athleteDAO.deleteAthlete(1);
        assertTrue(result);
    }

    //无No编号的更新
    @Test
    public void updateAthlete(){
        Athlete athlete = new Athlete("Cousin",-1,-1,
                null,null);
        athlete.setId(1);

        boolean result = athleteDAO.updateAthlete(athlete);
        assertTrue(result);
    }

//    @Rollback(false)
    @Test
    public void updateNo(){
        boolean result = athleteDAO.updateNo(1,"099");
        assertTrue(result);
    }
}