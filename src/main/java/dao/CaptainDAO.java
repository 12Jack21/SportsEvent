package dao;

import po.Captain;

import java.util.List;

public interface CaptainDAO {

    List<Captain> getAllCaptains();

    List<Captain> getTeamCaptains(int teamid);

    boolean addCaptain(Captain captain);

    boolean deleteCaptain(int capid);

    boolean updateCaptain(Captain captain);

}
