package daoTest;

import baseTest.BaseTest;
import dao.TeamDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import po.Team;

import java.util.List;

import static org.junit.Assert.*;

public class TeamTest extends BaseTest {
    @Autowired
    private TeamDAO teamDAO;

    @Test
    public void getPassWord(){
        assertEquals("789",teamDAO.getPassWord("scc"));
    }

    @Test
    public void getAllTeams(){
        List<Team> teams = teamDAO.getAllTeams();
        assertEquals(4,teams.toArray().length);
    }

    @Test
    public void getTeam(){
        Team team = teamDAO.getTeam(4);
        assertEquals("10293",team.getPassword());

    }

    @Test
    public void getUnSignTeams(){
        List<Team> teams = teamDAO.getUnSignTeams();
        assertEquals(3,teams.toArray().length);
    }

    @Test
    public void addTeam(){
        Team team = new Team("Hainan","HNn","qqqaz");

        boolean result = teamDAO.addTeam(team);

        assertTrue(result);
    }

    @Test
    public void deleteTeam(){
        boolean result = teamDAO.deleteTeam(2);
        assertTrue(result);
    }

    @Rollback(false)
    @Test
    public void updateTeam(){
        Team team = new Team(null,null,"qqw123");
        team.setId(1);
        boolean result = teamDAO.updateTeam(team);
        assertTrue(result);
    }

    @Rollback(false)
    @Test
    public void updateTeamSign(){
        boolean result = teamDAO.updateTeamSign(1);
        assertTrue(result);
    }
}