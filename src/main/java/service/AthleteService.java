package service;

import po.Participate;
import po.TempScore;

import java.util.List;

public interface AthleteService {

    /**
     * 设置运动员的编号（自动分配）
     * 从000到999，女运动员为双号，男运动员为单号，东道主排在最后
     */
    boolean setAthleteNo();

//    /*根据代表队的选择设置参加比赛的队员的参赛信息，即往 participate表中插入数据
//    根据运动员的年龄和性别拿到该单项比赛的id，加入到participate表中*/
//    void setMatchGroup();

    //得到个人所有成绩详情
    List<Participate> getAthScores(int athid);

    //得到相应的名称比赛的个人成绩
    List<Participate> getAthScoresByCompName(int athid,String compName);

    //得到个人全能成绩(分为初赛与决赛)
    double getPersonalScore(int athid,int compType);

}
