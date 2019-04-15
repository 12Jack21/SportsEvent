package service;

import po.Team;

import java.util.List;

public interface AdminService {

    //登陆成功与否
    boolean isLogin(String user,String password);

    //添加代表队的信息（账号密码）
    void addTeamAccount(Team team);

    //删除代表队的信息
    void deleteTeamAccount(int teamid);

    //查询所有代表队的信息
    List<Team> getAllTeams();

    //查询未报名完成的代表队的信息
    List<Team> getUnSighTeams();

    //设置裁判的账户名
    void addRefereeAccount(int refereeid);

}
