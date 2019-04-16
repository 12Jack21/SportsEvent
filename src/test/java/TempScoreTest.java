import dao.TempScoreDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.Competition;
import po.Judge;
import po.Referee;
import po.TempScore;

import java.util.List;

import static org.junit.Assert.*;
public class TempScoreTest extends BaseTest {
    @Autowired
    private TempScoreDAO tempScoreDAO;

    private static final double DELTA = 1e-15;
    @Test
    public void getAthTempScores(){
        List<TempScore> tempScores = tempScoreDAO.getAthTempScores(2,1);
        TempScore t = tempScores.get(0);
        assertTrue(t.getJudge().getReferee().getName().equals("Kelao"));
        assertEquals(100.0,t.getScore(),DELTA);

    }

    @Test
    public void addTempScore(){
        Judge j = new Judge(new Referee(1),new Competition(2),1,0);
        j.setId(2);
        TempScore t = new TempScore(1,100.2,j);
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
