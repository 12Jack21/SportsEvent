package service;

import po.Athlete;
import po.Referee;
import po.TempScore;

import java.util.List;

public interface RefereeService {
    //登陆是否成功
    boolean isLogin(Referee referee);

    //是否为主裁判
    boolean isMajorReferee(Referee referee);

    //给运动员打分
    void addScore(Athlete athlete,double score);

    //主裁判检查成绩是否有效
    boolean checkScore(TempScore tempScore);

    //得到所有打分信息
    List<TempScore> getAllScores();

    //得到指定运动员的打分信息
    List<TempScore> getAthleteScores(int athid);


    //计算并设置个人最终单项成绩
    double figureResultScore(double D,double P,int athid,int compid);

    //得到个人全能分数（分为初赛和决赛）
    double getAthleteAllScore(int compType,int athid);

    //得到每个类别的团体成绩
    double getTeamScore(int teamid);

    //得到某项比赛的 单项排名表
    List<Athlete> getAthleteRank(int compid);

    //得到某项比赛的 决赛名单
    List<Athlete> getFinalCompAthletes(int compid);
}
