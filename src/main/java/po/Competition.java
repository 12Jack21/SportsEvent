package po;

import java.util.Date;
import java.util.List;

public class Competition {
    private int id;
    private String project;
    private int type;
    private int sexgroup;
    private int agegroup;

    private String place;
    private Date date;
    private int isEnd;

    private List<Athlete> athletes;
    private List<Referee> referees;

    public Competition() {
    }

    public Competition(int id) {
        this.id = id;
    }

    public Competition(String project, int type, int sexgroup,
                       int agegroup, String place, Date date) {
        this.project = project;
        this.type = type;
        this.sexgroup = sexgroup;
        this.agegroup = agegroup;
        this.place = place;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getSexgroup() {
        return sexgroup;
    }

    public void setSexgroup(int sexgroup) {
        this.sexgroup = sexgroup;
    }

    public int getAgegroup() {
        return agegroup;
    }

    public void setAgegroup(int agegroup) {
        this.agegroup = agegroup;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getIsEnd() {
        return isEnd;
    }

    public void setIsEnd(int isEnd) {
        this.isEnd = isEnd;
    }

    public List<Athlete> getAthletes() {
        return athletes;
    }

    public void setAthletes(List<Athlete> athletes) {
        this.athletes = athletes;
    }

    public List<Referee> getReferees() {
        return referees;
    }

    public void setReferees(List<Referee> referees) {
        this.referees = referees;
    }
}
