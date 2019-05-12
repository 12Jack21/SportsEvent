package daoTest;

import baseTest.BaseTest;
import dao.ParticipateDAO;
import static org.junit.Assert.*;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.Participate;

import java.util.List;

public class ParticipateTest extends BaseTest {
    @Autowired
    private ParticipateDAO participateDAO;

    private static final double DELTA = 1e-15;

    @Test
    public void getScoresByAth(){
        List<Participate> participates = participateDAO.getScoresByAth(1,0);
        assertEquals(2,participates.toArray().length);
        assertEquals(90.2,participates.get(1).getScore(),DELTA);
    }

    @Test
    public void getScoresByComp(){
        List<Participate> participates = participateDAO.getScoresByComp(1);
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
    public void getCompScoresByTeam(){
        List<Participate> participates = participateDAO.getCompScoresByTeam(1,3);
        assertEquals(401.0,participates.get(0).getScore(),DELTA);
    }

    @Test
    public void getTotalCompScoreByTeam(){
        Double score = participateDAO.getCompTotalScoreByTeam(1,3);
        assertEquals(401.0,score,DELTA);
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
//    @Rollback(false)
    @Test
    public void updateGroupNo(){
        assertTrue(participateDAO.updateGroupNo(1,2,1));
    }

    @Test
    public void updateScore(){
        assertTrue(participateDAO.updateScore(1,2,990.1));
    }
}
