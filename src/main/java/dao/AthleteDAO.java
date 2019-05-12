package dao;

import org.springframework.stereotype.Repository;
import po.Athlete;

import java.util.List;

@Repository
public interface AthleteDAO {

    List<Athlete> getAllAthletes();

    Athlete getAthlete(int athid);

    List<Athlete> getTeamAthletes(int teamid);

    List<Athlete> getGroupAthletes(int teamid,int sex,int ageStart,int ageEnd);

    List<Athlete> getCompAthletes(int compid);

    //东道主在最后(param: 东道主队伍id）
    List<Athlete> getMaleAthletes(int teamid);

    List<Athlete> getFemaleAthletes(int teamid);

    boolean addAthlete(Athlete athlete); //TODO 考虑 batch 批量增加或者删除、更新，其他的 DAO 也是一样

    boolean deleteAthlete(int athid);

    boolean updateAthlete(Athlete athlete);

    boolean updateNo(int athid,String no);

    boolean updateNoBatch(List<Athlete> athletes);

}
