package service;

public interface AthleteService {

    //设置运动员的编号
    void setAthleteNo();

    /*根据代表队的选择设置参加比赛的队员的参赛信息，即往 participate表中插入数据
    根据运动员的年龄和性别拿到该单项比赛的id，加入到participate表中*/
    void setMatchGroup();
    

}
