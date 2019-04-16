package dao;

import po.Judge;

import java.util.List;

public interface JudgeDAO {

    List<Judge> getRefJudges(int refid);

    List<Judge> getCompJudges(int compid);

    boolean addJudge(Judge judge);

    boolean deleteJudge(int judgeid);

    boolean updateJudge(Judge judge);

}
