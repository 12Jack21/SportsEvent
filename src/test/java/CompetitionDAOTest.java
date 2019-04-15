import dao.CompetitionDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.Competition;

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
}