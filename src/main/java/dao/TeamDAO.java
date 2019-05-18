package dao;

import org.springframework.stereotype.Repository;
import po.Team;

import java.util.List;

@Repository
public interface TeamDAO {

    //根据队伍用户名得到对应的密码，来判定其是否可以登陆
    String getPassWord(String user);

    List<Team> getAllTeams();

    Team getTeam(int teamid);

    //得到未报名结束的所有队伍
    List<Team> getUnSignTeams();

    //根据账户得到队伍标识符id
    Integer getTeamIdByUser(String user,String password);

    //得到东道主代表队
    Team getHostTeam();

    boolean addTeam(Team team);

    boolean deleteTeam(int teamid);

    boolean updateTeam(Team team);

    //设置队伍为报名结束
    boolean updateTeamSign(int teamid);

    //设置队伍为东道主队
    boolean updateTeamHost(int teamid);

    //更新队伍上传的附件
    boolean updateTeamAttach(int teamid,byte[] attach);
}
