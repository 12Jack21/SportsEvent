package dao;

import po.Participate;

import java.util.List;

public interface ParticipateDAO {

    List<Participate> getAthScores(int athid);

    List<Participate> getCompScores(int compid);

    boolean addParticipate(int athid,int compid);

    boolean deleteParticipate(int athid,int compid);

    /*不如删了再重新添加
    boolean updateParticipate();
     */

    boolean updateScore(int athid,int compid,double score);
}
