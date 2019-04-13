package service;

import po.*;

import java.util.List;

public interface TeamService {

    //登陆成功与否
    boolean isLogin();

    //添加运动员
    void addAthlete(Athlete athlete);

    //添加队医
    void addDoctor(Doctor doctor);

    //添加教练
    void addCoach(Coach coach);

    //添加队长
    void addCaptain(Captain captain);

    //添加裁判
    void addReferee(Referee referee);

    //更新运动员
    void updateAthlete(Athlete athlete);

    //更新队医
    void updateDoctor(Doctor doctor);

    //更新教练
    void updateCoach(Coach coach);

    //更新队长
    void updateCaptain(Captain captain);

    //更新裁判
    void updateReferee(Referee referee);

    //给运动员报名
    void signupAthlete(int athid,int sexGroup,int ageGroup);

    //查询所有运动员
    List<Athlete> getAllAthletes();

    //查询所有比赛的信息
    List<Competition> getAllCompetition();


}
