package dao;

import org.springframework.stereotype.Repository;
import po.Participate;

import java.util.List;


//TODO 还有很多各种类型的查询方法（按不同的需求来查询）没有写，注意可能得利用好<sql></sql>减少重复
@Repository
public interface ParticipateDAO {

    List<Participate> getScoresByAth(int athid,int type);

    List<Participate> getAthScoresByCompName(int athid,String compName); //TODO 没有写对应的测试类来测试

    //得到具体某个运动员的信息和给分
    Participate getSingleAthById(int compid,int athid);

    //得到运动员在一场比赛里的参赛表现，按成绩从高到低排列
    List<Participate> getAthletesRankByComp(int comid);

    List<Participate> getScoresByComp(int compid);

    //得到一个队伍中运动员在某比赛中的所有成绩，成绩从高到低排（团体成绩取前四名）
    List<Participate> getCompScoresByTeam(int compid,int teamid);

    Double getPersonalScore(int athid,int compType); //TODO 此为单项个人初赛总成绩或决赛总成绩，若求成绩组则需要另写带有 GROUP BY语句的查询

    Double getFinalScore(int compid,int athid);

    Double getCompTotalScoreByTeam(int compid,int teamid);//这里应只取前四名的成绩来计算，所以用getCompScoreByTeam更好

    Integer getMaxAthGroupNoOfComp(int compid);

    List<Integer> getAthByCompGroup(int compid,int groupno);

    boolean addParticipate(int athid,int compid);

    boolean deleteParticipate(int athid,int compid);

    /*不如删了再重新添加
    boolean updateParticipate();
     */

    boolean updateGroupNo(int athid,int compid,int groupno);

    boolean updateScore(int athid,int compid,Double score);
}
