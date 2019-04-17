package dao;

import org.springframework.stereotype.Repository;
import po.Judge;

import java.util.List;

@Repository
public interface JudgeDAO {

    List<Judge> getJudgesByRef(int refid);

    List<Judge> getJudgesByComp(int compid);

    int getReftype(int refid,int compid);

    boolean addJudge(Judge judge);

    boolean deleteJudge(int judgeid);

    boolean updateJudge(Judge judge);

}
