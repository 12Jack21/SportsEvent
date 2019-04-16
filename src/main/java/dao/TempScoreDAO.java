package dao;

import po.TempScore;

import java.util.List;

public interface TempScoreDAO {

//    List<TempScore> getAllTempScores();

    List<TempScore> getAthTempScores(int athid,int compid);
//TODO 考虑在Mapper文件中使用 <sql></sql>减少重复sql语句的使用
    List<TempScore> getAthValidScores(int athid,int compid);

    boolean addTempScore(TempScore tempScore);

    boolean deleteTempScore(int tempScoreid);

    boolean updateTempScore(int tempScoreid,Integer valid);

}
