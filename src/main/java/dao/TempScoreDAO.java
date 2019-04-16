package dao;

import po.TempScore;

import java.util.List;

public interface TempScoreDAO {

//    List<TempScore> getAllTempScores();

    List<TempScore> getAthTempScores(int athid,int compid);

    boolean addTempScore(int athid,int compid,int refid,double score);

    boolean deleteTempScore(int tempScoreid);

    boolean updateTempScore(int tempScoreid,int valid);
}
