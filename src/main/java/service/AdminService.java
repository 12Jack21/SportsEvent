package service;

import po.Team;

import java.util.List;

public interface AdminService {

    //登陆成功与否
    boolean isLogin();

    //添加代表队的信息（账号密码）
    void addTeamAccount(Team team);

    //删除代表队的信息
    void deleteTeamAccount(int id);

    //查询所有代表队的信息
    List<Team> getAllTeams();

}
