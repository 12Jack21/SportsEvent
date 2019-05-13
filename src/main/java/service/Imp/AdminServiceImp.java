package service.Imp;

import dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.Competition;
import po.Judge;
import po.Referee;
import po.Team;
import service.AdminService;

import java.util.List;

@Service
public class AdminServiceImp implements AdminService {
    @Autowired
    private TeamDAO teamDAO;

    @Autowired
    private CompetitionDAO competitionDAO;

    @Autowired
    private ParticipateDAO participateDAO;

    @Autowired
    private RefereeDAO refereeDAO;

    @Autowired
    private JudgeDAO judgeDAO;

    @Override
    public boolean canLogin(String user, String password) {
        if(user.equals("Sports") && password.equals("123"))
            return true;
        return false;
    }

    @Override
    public boolean addTeamAccount(Team team) {
        return teamDAO.addTeam(team);
    }

    @Override
    public boolean deleteTeamAccount(int teamid) {
        return teamDAO.deleteTeam(teamid);
    }

    @Override
    public boolean updateTeamAccount(Team team) {
        return teamDAO.updateTeam(team);
    }

    @Override
    public List<Team> getAllTeams() {
        return teamDAO.getAllTeams();
    }

    @Override
    public List<Team> getUnSighTeams() {
        return teamDAO.getUnSignTeams();
    }

    @Override
    public List<Referee> getAllReferees() {
        return refereeDAO.getAllReferees();
    }

    @Override
    public List<Competition> getAllCompetitions() {
        return competitionDAO.getAllCompetitions();
    }

    @Override
    public List<Competition> getUnEndCompetition() {
        return competitionDAO.getUnEndCompetitions();
    }

    @Override
    public List<Competition> getEndCompetition() {
        return competitionDAO.getEndCompetitions();
    }

    @Override
    public boolean addCompetition(Competition competition) {
        return competitionDAO.addCompetition(competition);
    }

    @Override
    public boolean updateCompetition(Competition competition) {
        return competitionDAO.updateCompetition(competition);
    }

    @Override
    public boolean deleteCompetition(int compid) {
        return competitionDAO.deleteCompetition(compid);
    }

    @Override
    public boolean setAthGroupNo(int athid, int compid, int groupno) {
        return participateDAO.updateGroupNo(athid, compid, groupno);
    }

    @Override
    public boolean setRefereeInComp(Judge judge) {
        return judgeDAO.addJudge(judge);
    }

    @Override
    public boolean addRefereeAccount(int refid, String user) {
        return refereeDAO.updateRefUser(refid, user);
    }
}
