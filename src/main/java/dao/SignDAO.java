package dao;

import org.springframework.stereotype.Repository;
import po.Sign;

import java.util.List;

@Repository
public interface SignDAO {

    //判断是否报名了某比赛
    Integer getSignByTeamComp(int teamid,int compid);

    //得到某场比赛所有参加的队伍id
    List<Integer> getTeamidsOfComp(int compid);

    //添加队伍对某场比赛的报名
    boolean addSign(int teamid,int compid);
//    boolean updateSign(Sign sign);

}
