package service;

import po.Referee;
import po.Team;

import java.util.List;

public interface AdminService {

    //登陆成功与否
    boolean canLogin(String user,String password);

    //添加代表队的信息（账号密码）
    void addTeamAccount(Team team);

    //删除代表队的信息
    void deleteTeamAccount(int teamid);

    //更新代表队的信息
    void updateTeamAccount(int teamid);

    //查询所有代表队的信息
    List<Team> getAllTeams();

    //查询未报名完成的代表队的信息
    List<Team> getUnSighTeams();

    //查询所有裁判的信息（包括所属的代表队）
    List<Referee> getAllReferees();

    //设置分组并生成赛事表


    //设置某场比赛的裁判（包括一个主裁判和最多四个普通裁判）
    void setRefereeInComp(int compid,int refid,int reftype);

    //设置裁判的账户名
    void addRefereeAccount(int refereeid,String user);


}
