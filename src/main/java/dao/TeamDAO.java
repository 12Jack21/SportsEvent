package dao;

import org.springframework.stereotype.Repository;
import po.Team;

import java.util.List;

@Repository
public interface TeamDAO {

    String getPassWord(String user);

    List<Team> getAllTeams();

    Team getTeam(int teamid);

    List<Team> getUnSignTeams();

    Integer getTeamIdByUser(String user,String password);

    Team getHostTeam();

    boolean addTeam(Team team);

    boolean deleteTeam(int teamid);

    boolean updateTeam(Team team);

    boolean updateTeamSign(int teamid);

    boolean updateTeamHost(int teamid);

    boolean updateTeamAttach(int teamid,byte[] attach);
}
