package dao;

import org.springframework.stereotype.Repository;
import po.Captain;

import java.util.List;

@Repository
public interface CaptainDAO {

    List<Captain> getAllCaptains();

    Captain getTeamCaptain(int teamid);

    boolean addCaptain(Captain captain);

    boolean deleteCaptain(int capid);

    boolean updateCaptain(Captain captain);

}
