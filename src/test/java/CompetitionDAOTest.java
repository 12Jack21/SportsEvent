import dao.CompetitionDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.Competition;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

public class CompetitionDAOTest extends BaseTest {
    @Autowired
    private CompetitionDAO competitionDAO;

    @Test
    public void getAllCompetitions(){
        List<Competition> competitions = competitionDAO.getAllCompetitions();

        assertEquals(2,competitions.toArray().length);
    }

    @Test
    public void getAthCompetitions(){
        List<Competition> competitions = competitionDAO.getAthCompetitions(2);

        assertEquals(1,competitions.toArray().length);
        assertEquals("单杠",competitions.get(0).getProject());
    }

    @Test
    public void getRefCompetitions(){
        List<Competition> competitions = competitionDAO.getRefCompetitions(3);
        assertEquals(2,competitions.toArray().length);
        assertEquals(0,competitions.get(1).getIsEnd());
    }

    @Test
    public void getUnEndCompetitions(){
        List<Competition> competitions = competitionDAO.getUnEndCompetitions();
        assertEquals(1,competitions.toArray().length);
    }

    @Test
    public void addCompetition(){
        Competition competition = new Competition("吊环",0,1,
                3,"Momount",new Date());
        boolean result = competitionDAO.addCompetition(competition);
        assertTrue(result);
    }

    public void deleteCompetition(){
        boolean result = competitionDAO.deleteCompetition(2);
        assertTrue(result);
    }

    public void updateCompetition(){
        Competition c = new Competition(null,0,1,
                3,"Momount",new Date());
        boolean result = competitionDAO.updateCompetition(c);
        assertTrue(result);
    }

    public void updateCompetitionEnd(){
        boolean result = competitionDAO.updateCompetitionEnd(2);
        assertTrue(result);
    }
}