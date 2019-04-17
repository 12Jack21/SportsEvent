package service.Imp;

import dao.AthleteDAO;
import dao.ParticipateDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.Participate;
import service.AthleteService;

import java.util.List;

@Service
public class AthleteServiceImp implements AthleteService {
    @Autowired
    private ParticipateDAO participateDAO;
    @Autowired
    private AthleteDAO athleteDAO;

    @Override
    public boolean setAthleteNo() {


    }

    @Override
    public List<Participate> getAthScores(int athid) {
        return null;
    }

    @Override
    public List<Participate> getAthScoresByCompName(int athid, String compName) {
        return null;
    }

    @Override
    public double getPersonalScore(int athid, int compType) {
        return 0;
    }
}
