import dao.TempScoreDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.TempScore;

import java.util.List;

import static org.junit.Assert.*;
public class TempScoreTest extends BaseTest {
    @Autowired
    private TempScoreDAO tempScoreDAO;

    private static final double DELTA = 1e-15;
    @Test
    public void getAthTempScores(){
        List<TempScore> tempScores = tempScoreDAO.getAthTempScores(1,2);
        TempScore t = tempScores.get(0);
        assertEquals("Kelao",t.getReferee().getName());
        assertEquals(90.10,t.getScore(),DELTA);

    }

    @Test
    public void addTempScore(){
        TempScore t = new TempScore(1,2,3,22.1);
        boolean result = tempScoreDAO.addTempScore(t);
        assertTrue(result);
    }

    @Test
    public void deleteTempScore(){
        assertTrue(tempScoreDAO.deleteTempScore(2));
    }

    @Test
    public void updateTempScore(){
        assertTrue(tempScoreDAO.updateTempScore(3,1));
    }

}
