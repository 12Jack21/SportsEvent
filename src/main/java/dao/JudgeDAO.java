package dao;

import org.springframework.stereotype.Repository;
import po.Judge;

import java.util.List;

@Repository
public interface JudgeDAO {

    List<Judge> getJudgesByRef(int refid,int refType);

    List<Judge> getJudgesByComp(int compid);

    Judge getJudgeByRefComp(int compid,int refid);

    int getReftype(int refid,int compid);

    Integer getMaxRefGroupNoOfComp(int compid);

    boolean addJudge(Judge judge);

    boolean deleteJudge(int judgeid);

    boolean updateJudge(Judge judge);

}
