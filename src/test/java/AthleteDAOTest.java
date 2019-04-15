import dao.AthleteDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.Athlete;

import java.util.List;

import static org.junit.Assert.*;

public class AthleteDAOTest extends BaseTest {
    @Autowired
    private AthleteDAO athleteDAO;

    @Test
    public void testGetAll(){
        List<Athlete> athletes = athleteDAO.getAllAthletes();
        assertEquals(2,athletes.toArray().length);
    }
}