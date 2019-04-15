package dao;

import po.Coach;

import java.util.List;

public interface CoachDAO {
    List<Coach> getAllCoaches();

    List<Coach> getTeamCoaches(int teamid);

    boolean addCoach(Coach coachtain);

    boolean deleteCoach(int coachid);

    boolean updateCoach(Coach coach);
}
