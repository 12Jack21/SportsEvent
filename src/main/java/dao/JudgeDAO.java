package dao;

import org.springframework.stereotype.Repository;
import po.Judge;

import java.util.List;

@Repository
public interface JudgeDAO {

    List<Judge> getRefJudges(int refid);

    List<Judge> getCompJudges(int compid);

    boolean addJudge(Judge judge);

    boolean deleteJudge(int judgeid);

    boolean updateJudge(Judge judge);

}
