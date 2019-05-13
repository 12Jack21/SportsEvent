package dao;

import org.springframework.stereotype.Repository;
import po.Sign;

import java.util.List;

@Repository
public interface SignDAO {
    List<Sign> getSignsByTeam(int teamid);

//    boolean addSign(int teamid,int compid);

//    boolean updateSign(Sign sign);

}
