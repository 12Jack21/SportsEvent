package dao;

import org.springframework.stereotype.Repository;
import po.Judge;
import po.Referee;

import java.util.List;

@Repository
public interface JudgeDAO {

    List<Judge> getJudgesByRef(int refid,int refType);

    //得到比赛中吹罚的裁判
    List<Judge> getJudgesByComp(int compid);

    Judge getJudge(int jud_id);

    List<Referee> getJudgeByCompGroup(int compid, int groupno);

    Judge getJudgeByRefComp(int compid,int refid);

    int getReftype(int refid,int compid);

    Integer getMaxRefGroupNoOfComp(int compid);

    boolean addJudge(Judge judge);

    boolean deleteJudge(int judgeid);

    boolean updateJudge(Judge judge);

}
