package service.Imp;

import dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.*;
import service.TeamService;

import java.util.LinkedList;
import java.util.List;

@Service
public class TeamServiceImp implements TeamService {
    @Autowired
    private TeamDAO teamDAO;
    @Autowired
    private AthleteDAO athleteDAO;
    @Autowired
    private DoctorDAO doctorDAO;
    @Autowired
    private CoachDAO coachDAO;
    @Autowired
    private RefereeDAO refereeDAO;
    @Autowired
    private CaptainDAO captainDAO;
    @Autowired
    private ParticipateDAO participateDAO;
    @Autowired
    private CompetitionDAO competitionDAO;
    @Autowired
    private JudgeDAO judgeDAO;

    @Override
    public boolean canLogin(Team team) {
        String pwd = teamDAO.getPassWord(team.getUser());
        return pwd.equals(team.getPassword());
    }

    @Override
    public boolean updatePassWord(Team team) {
        return teamDAO.updateTeam(team);
    }

    @Override
    public Athlete getAthlete(int athid) {
        return athleteDAO.getAthlete(athid);
    }

    @Override
    public boolean addAthlete(Athlete athlete) {
        return athleteDAO.addAthlete(athlete);
    }

    @Override
    public boolean addDoctor(Doctor doctor) {
        return doctorDAO.addDoctor(doctor);
    }

    @Override
    public boolean addCoach(Coach coach) {
        return coachDAO.addCoach(coach);
    }

    @Override
    public boolean addCaptain(Captain captain) {
        return captainDAO.addCaptain(captain);
    }

    @Override
    public boolean addReferee(Referee referee) {
        return refereeDAO.addReferee(referee);
    }

    @Override
    public boolean deleteAthlete(int id) {
        return athleteDAO.deleteAthlete(id);
    }

    @Override
    public boolean deleteDoctor(int id) {
        return doctorDAO.deleteDoctor(id);
    }

    @Override
    public boolean deleteCoach(int id) {
        return coachDAO.deleteCoach(id);
    }

    @Override
    public boolean deleteCaptain(int id) {
        return captainDAO.deleteCaptain(id);
    }

    @Override
    public boolean deleteReferee(int id) {
        return refereeDAO.deleteReferee(id);
    }

    @Override
    public boolean updateAthlete(Athlete athlete) {
        return athleteDAO.updateAthlete(athlete);
    }

    @Override
    public boolean updateDoctor(Doctor doctor) {
        return doctorDAO.updateDoctor(doctor);
    }

    @Override
    public boolean updateCoach(Coach coach) {
        return coachDAO.updateCoach(coach);
    }

    @Override
    public boolean updateCaptain(Captain captain) {
        return captainDAO.updateCaptain(captain);
    }

    @Override
    public boolean updateReferee(Referee referee) {
        return refereeDAO.updateReferee(referee);
    }

    @Override
    public boolean signUpAthlete(int athid, int compid) {
        return participateDAO.addParticipate(athid, compid);
    }

    @Override
    public boolean setSignUpFinish(int teamid) {
        return teamDAO.updateTeamSign(teamid);
    }

    @Override
    public List<Athlete> getTeamAthletes(int teamid) {
        return athleteDAO.getTeamAthletes(teamid);
    }

    @Override
    public List<Doctor> getTeamDoctors(int teamid) {
        return doctorDAO.getTeamDoctors(teamid);
    }

    @Override
    public List<Coach> getTeamCoaches(int teamid) {
        return coachDAO.getTeamCoaches(teamid);
    }

    @Override
    public List<Referee> getTeamReferees(int teamid) {
        return refereeDAO.getTeamReferees(teamid);
    }

    @Override
    public Captain getTeamCaptain(int teamid) {
        return captainDAO.getTeamCaptain(teamid);
    }

    @Override
    public List<Competition> getAllCompetition() {
        return competitionDAO.getAllCompetitions();
    }

    @Override
    public Competition getCompetition(int compid) {
        return competitionDAO.getCompetition(compid);
    }

    @Override
    public List<Participate> getParticipateByComp(int compid) {
        return participateDAO.getScoresByComp(compid);
    }

    @Override
    public List<Judge> getJudgeByComp(int compid) {
        return judgeDAO.getJudgesByComp(compid);
    }

    @Override
    public List<Competition> getCompetitionByType(int type) {
        return  competitionDAO.getCompetitionsByType(type);
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
    public List<Double> getCompScoresByTeam(int teamid) {//TODO Not test
        List<Competition> competitions = competitionDAO.getCompetitionsByTeam(teamid);

        List<Double> scores = new LinkedList<>();
        List<Participate> compScores = null;
        Double score;
        for (Competition c : competitions) {
            compScores = participateDAO.getCompScoresByTeam(c.getId(), teamid);
            //少于四个则不计算成绩，即记为 0.0
            if (compScores.toArray().length < 4)
                scores.add(0.0);
            //取前四名来计算成绩总和
            else
            {
                score = compScores.get(0).getScore() + compScores.get(1).getScore() +
                        compScores.get(2).getScore() + compScores.get(3).getScore();
                scores.add(score);
            }
        }
        return scores;
    }
}
