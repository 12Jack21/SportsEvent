package UtilTest;

import MyUtil.MyConvertor;
import baseTest.BaseTest;
import org.junit.Test;
import po.Referee;
import po.Team;
import vo.RefereeVO;
import static org.junit.Assert.*;

public class ConvertorTest extends BaseTest {

    @Test
    public void coonvertRef(){
        Referee r = new Referee("Micheal","1213124124","12qewq",new Team("Wuhan",null,null));
        RefereeVO rVO = MyConvertor.convertRef(r);

        assertEquals(r.getName(), rVO.getName());
        assertEquals(r.getTeam().getName(),rVO.getTeam());
    }

}
