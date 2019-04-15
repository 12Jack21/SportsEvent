package dao;

import po.Captain;

import java.util.List;

public interface CaptainDAO {

    List<Captain> getAllCaptains();

    Captain getTeamCaptain(int teamid);

    boolean addCaptain(Captain captain);

    boolean deleteCaptain(int capid);

    boolean updateCaptain(Captain captain);

}
