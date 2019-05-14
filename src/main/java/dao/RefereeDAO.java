package dao;

import org.springframework.stereotype.Repository;
import po.Referee;

import java.util.List;

@Repository
public interface RefereeDAO {

    String getUser(String name);

    List<Referee> getAllReferees();

    List<Referee> getTeamReferees(int teamid);

    Referee getReferee(int refid);

    List<Referee> getUnGroupRef(int compid);
//    在JudgeDAO中得到了更好的实现
//    List<Referee> getCompReferees(int compid);

    boolean addReferee(Referee referee);

    boolean deleteReferee(int refid);

    boolean updateReferee(Referee referee);

    boolean updateRefUser(int refid,String user);
}
