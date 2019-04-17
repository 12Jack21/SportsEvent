package daoTest;

import baseTest.BaseTest;
import dao.CompetitionDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import po.Competition;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

public class CompetitionTest extends BaseTest {
    @Autowired
    private CompetitionDAO competitionDAO;

    @Test
    public void getAllCompetitions(){
        List<Competition> competitions = competitionDAO.getAllCompetitions();

        assertEquals(2,competitions.toArray().length);
    }

    @Test
    public void getAthCompetitions(){
        List<Competition> competitions = competitionDAO.getCompetitionsByAth(2);

        assertEquals(1,competitions.toArray().length);
        assertEquals("单杠",competitions.get(0).getProject());
    }

    @Test
    public void getRefCompetitions(){
        List<Competition> competitions = competitionDAO.getCompetitionsByRef(3);
        assertEquals(2,competitions.toArray().length);
        assertEquals(0,competitions.get(1).getIsEnd());
    }

    @Test
    public void getUnEndCompetitions(){
        List<Competition> competitions = competitionDAO.getUnEndCompetitions();
        assertEquals(1,competitions.toArray().length);
    }

    @Rollback
    @Test
    public void addCompetition(){
        Date date = new Date();
        long longTime = date.getTime();
        Timestamp timestamp = new Timestamp(longTime);
        System.out.println(timestamp);
        Competition competition = new Competition("吊环",0,1,
                3,"Momount",timestamp);

        boolean result = competitionDAO.addCompetition(competition);
        assertTrue(result);

    }

    @Test
    public void deleteCompetition(){
        boolean result = competitionDAO.deleteCompetition(2);
        assertTrue(result);
    }

    @Test
    public void updateCompetition(){
        Date date = new Date();
        long longTime = date.getTime();
        Timestamp timestamp = new Timestamp(longTime);

        Competition c = new Competition(null,0,1,
                3,"Momount",timestamp);
        c.setId(2);
        boolean result = competitionDAO.updateCompetition(c);
        assertTrue(result);
    }

    @Test
    public void updateCompetitionEnd(){
        boolean result = competitionDAO.updateCompetitionEnd(2);
        assertTrue(result);
    }
}