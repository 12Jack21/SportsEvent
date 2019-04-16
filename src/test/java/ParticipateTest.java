import dao.ParticipateDAO;
import static org.junit.Assert.*;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.Participate;

import java.util.List;

public class ParticipateTest extends BaseTest{
    @Autowired
    private ParticipateDAO participateDAO;

    private static final double DELTA = 1e-15;

    @Test
    public void getAthScores(){
        List<Participate> participates = participateDAO.getAthScores(1);
        assertEquals(2,participates.toArray().length);
        assertEquals(90.2,participates.get(1).getScore(),DELTA);
    }

    @Test
    public void getCompScores(){
        List<Participate> participates = participateDAO.getCompScores(1);
        assertEquals(3,participates.toArray().length);

        boolean r = false;
        for(Participate p : participates){
            if(p.getAthlete().getName().equals("Jane")){
                r = true;
                break;
            }
        }
        assertTrue(r);
    }

    @Test
    public void addParticipate(){
        assertTrue(participateDAO.addParticipate(3,2));
    }

    @Test
    public void deleteParticipate(){
        assertTrue(participateDAO.deleteParticipate(3,1));
    }

    /*不如删了再重新添加
    boolean updateParticipate();
     */

    @Test
    public void updateScore(){
        assertTrue(participateDAO.updateScore(1,2,990.1));
    }
}
