package serviceTest;

import baseTest.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import service.Imp.AthleteServiceImp;
import static org.junit.Assert.*;

public class AthleteServiceTest extends BaseTest {
    @Autowired
    private AthleteServiceImp athleteServiceImp;

    @Test
    public void setAthNo(){
        boolean result = athleteServiceImp.setAthleteNo();
        assertTrue(result);
    }

    @Test
    public void testString(){
        String s1 = "if";
        String s2 = new String("if");

        assertTrue(s1.equals(s2));
    }

}
