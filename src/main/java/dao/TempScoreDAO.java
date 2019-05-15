package dao;

import org.springframework.stereotype.Repository;
import po.TempScore;

import java.util.List;

@Repository
public interface TempScoreDAO {

//    List<TempScore> getAllTempScores();

    TempScore getAthScoreListNormal(int jud_id,int athid);

    //得到一个裁判对某位运动员最新的给分
    TempScore getNewestScoreOfRef(int compid,int refid,int athid);

    List<TempScore> getSingleAthTemp(int jud_id,int athid);

    //得到一个普通裁判对于某个运动员的所有评分（一般为 isValid = false)
    List<TempScore> getRefLogOfSingleAth(int compid,int refid,int athid);

    List<TempScore> getAthTempScores(int athid,int compid);


    List<TempScore> getAthValidScores(int athid,int compid);

    Double getAthResultScore(int athid,int compid);

    boolean addTempScore(TempScore tempScore);

    boolean deleteTempScore(int tempScoreid);

    boolean updateTempScore(int tempScoreid,Integer valid);

}
