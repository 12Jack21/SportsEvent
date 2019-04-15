package dao;

import po.Referee;

import java.util.List;

public interface RefereeDAO {

    List<Referee> getAllReferees();

    List<Referee> getTeamReferees(int teamid);

    List<Referee> getCompReferees(int compid);

    boolean addReferee(Referee referee);

    boolean deleteReferee(int refid);

    boolean updateReferee(Referee referee);

    boolean updateRefUser(int refid,String user);
}
