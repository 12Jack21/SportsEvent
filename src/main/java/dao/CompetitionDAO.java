package dao;

import org.springframework.stereotype.Repository;
import po.Competition;

import java.util.List;

@Repository
public interface CompetitionDAO {

    List<Competition> getAllCompetitions();

    List<Competition> getCompetitionsByAth(int athid);

    List<Competition> getCompetitionsByRef(int refid);

    List<Competition> getCompetitionsByTeam(int teamid);

    List<Competition> getEndCompetitions();

    List<Competition> getUnEndCompetitions();

    boolean addCompetition(Competition competition);

    boolean deleteCompetition(int compid);

    boolean updateCompetition(Competition competition);

    boolean updateCompetitionEnd(int compid);

}
