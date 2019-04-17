package po;

import java.util.List;

public class Team {
    private int id;
    private String name;
    private String user;
    private String password;
    private int isSign;
    private int isHost;

//    private Captain captain;
//    private List<Athlete> athletes;
//    private List<Coach> coaches;
//    private List<Referee> referees;
//    private List<Doctor> doctors;

    public Team() {
    }

    public Team(String name, String user, String password) {
        this.name = name;
        this.user = user;
        this.password = password;
    }

    public Team(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsSign() {
        return isSign;
    }

    public void setIsSign(int isSign) {
        this.isSign = isSign;
    }

    public int getIsHost() {
        return isHost;
    }

    public void setIsHost(int isHost) {
        this.isHost = isHost;
    }

    //    public Captain getCaptain() {
//        return captain;
//    }
//
//    public void setCaptain(Captain captain) {
//        this.captain = captain;
//    }
//
//    public List<Athlete> getAthletes() {
//        return athletes;
//    }
//
//    public void setAthletes(List<Athlete> athletes) {
//        this.athletes = athletes;
//    }
//
//    public List<Coach> getCoaches() {
//        return coaches;
//    }
//
//    public void setCoaches(List<Coach> coaches) {
//        this.coaches = coaches;
//    }
//
//    public List<Referee> getReferees() {
//        return referees;
//    }
//
//    public void setReferees(List<Referee> referees) {
//        this.referees = referees;
//    }
//
//    public List<Doctor> getDoctors() {
//        return doctors;
//    }
//
//    public void setDoctors(List<Doctor> doctors) {
//        this.doctors = doctors;
//    }
}
