package dao;

import po.Judge;

import java.util.List;

public interface JudgeDAO {

    List<Judge> getRefJudges(int refid);

    List<Judge> getCompJudges(int compid);

    boolean addJudge(int compid,int refid,int reftype);

    boolean deleteJudge(int compid,int refid);

    boolean updateJudge(int compid,int refid,int reftype);

}
