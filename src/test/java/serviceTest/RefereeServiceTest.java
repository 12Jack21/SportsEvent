package serviceTest;

import baseTest.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import service.RefereeService;
import vo.Rank;

import java.util.List;

public class RefereeServiceTest extends BaseTest {
    @Autowired
    private RefereeService refereeService;



    @Test
    public void getAthRank(){
        int compid = 12;
        List<Rank> ranks = refereeService.getAthleteRank(12);


    }


    @Test
    public void getTeamRank(){
        int compid = 12;
        List<Rank> teamRank = refereeService.getTeamRank(compid);

    }


}
