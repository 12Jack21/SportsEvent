import dao.JudgeDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.Judge;

import java.util.List;

import static org.junit.Assert.*;
public class JudgeTest extends BaseTest{
    @Autowired
    private JudgeDAO judgeDAO;

    @Test
    public void getRefJudges(){
        List<Judge> judges = judgeDAO.getRefJudges(3);
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
        List<Judge> judges = judgeDAO.getCompJudges(2);
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
        assertTrue(judgeDAO.addJudge(2,2,0));
    }

    @Test
    public void deleteJudge(){
        assertTrue(judgeDAO.deleteJudge(2,3));
    }

    /*不如删了再重新添加
    boolean updateJudge();
     */

    @Test
    public void updateScore(){
        assertTrue(judgeDAO.updateJudge(1,3,0));
    }
}
