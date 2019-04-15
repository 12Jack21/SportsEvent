package dao;

import po.TempScore;

import java.util.List;

public interface TempScoreDAO {

//    List<TempScore> getAllTempScores();

    List<TempScore> getAthTempScores(String athno,int compid);

    boolean addTempScore(TempScore tempScore);

    boolean updateTempScore(int tempScoreid,int valid);
}
