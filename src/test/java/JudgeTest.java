import dao.JudgeDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.Competition;
import po.Judge;
import po.Referee;

import java.util.List;

import static org.junit.Assert.*;
public class JudgeTest extends BaseTest{
    @Autowired
    private JudgeDAO judgeDAO;

    @Test
    public void getRefJudges(){
        List<Judge> judges = judgeDAO.getJudgesByRef(3);
        assertEquals(2,judges.toArray().length);
        boolean r= false;
        for(Judge j : judges){
            if (j.getCompetition().getProject().equals("跳马")){
                r = true;
                break;
            }
        }
        assertTrue(r);

    }

    @Test
    public void getCompJudges(){
        List<Judge> judges = judgeDAO.getJudgesByComp(2);
        assertEquals(1,judges.toArray().length);
        boolean r= false;
        for(Judge j : judges){
            if (j.getReferee().getName().equals("Tompson")){
                r = true;
                break;
            }
        }
        assertTrue(r);

    }

    @Test
    public void addJudge(){
        Judge judge = new Judge(new Referee(1),new Competition(2),1,0);
        assertTrue(judgeDAO.addJudge(judge));
    }

    @Test
    public void deleteJudge(){
        assertTrue(judgeDAO.deleteJudge(1));
    }

    /*不如删了再重新添加
    boolean updateJudge();
     */

    @Test
    public void updateScore(){
        Judge judge = new Judge(new Referee(1),new Competition(2),1,0);
        judge.setId(2);
        assertTrue(judgeDAO.updateJudge(judge));
    }
}
