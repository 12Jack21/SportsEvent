package dao;

import po.Athlete;

import java.util.List;

public interface AthleteDAO {

    List<Athlete> getAllAthletes();

    List<Athlete> getTeamAthletes(int teamid);

    List<Athlete> getGroupAthletes(int teamid,int sex,int ageStart,int ageEnd);

    List<Athlete> getCompAthletes(int compid);

    boolean addAthlete(Athlete athlete);

    boolean deleteAthlete(int athid);

    boolean updateAthlete(Athlete athlete);

    boolean updateNo(int athid,String no);
}
