package dao;

import org.springframework.stereotype.Repository;
import po.TempScore;

import java.util.List;

@Repository
public interface TempScoreDAO {

//    List<TempScore> getAllTempScores();

    List<TempScore> getAthTempScores(int athid,int compid);

    List<TempScore> getAthValidScores(int athid,int compid);

    Double getAthResultScore(int athid,int compid);

    boolean addTempScore(TempScore tempScore);

    boolean deleteTempScore(int tempScoreid);

    boolean updateTempScore(int tempScoreid,Integer valid);

}
