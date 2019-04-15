package dao;

import po.Team;

import java.util.List;

public interface TeamDAO {

    List<Team> getAllTeams();

    Team getTeam(int teamid);

    List<Team> getUnSignTeams();

    boolean addTeam(Team team);

    boolean deleteTeam(int teamid);

    boolean updateTeam(Team team);

    boolean updateTeamSign(int teamid);
}
