package dao;

import po.Competition;

import java.util.List;

public interface CompetitionDAO {

    List<Competition> getAllCompetitions();

    List<Competition> getAthCompetitions();

    List<Competition> getRefCompetitions();

    List<Competition> getUnEndCompetitions();

    boolean addCompetition(Competition competition);

    boolean deleteCompetition(int compid);

    boolean updateCompetition(Competition competition);

    boolean updateCompetitionEnd(int compid);

}
