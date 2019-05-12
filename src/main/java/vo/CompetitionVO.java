package vo;

import po.Athlete;
import po.Referee;

import java.sql.Timestamp;
import java.util.List;

public class CompetitionVO {
    private int id;
    private String project;
    private String type;
    private String sexgroup;
    private String agegroup;

    private String place;
    private Timestamp date;
    private String isEnd;

    public CompetitionVO() {
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSexgroup() {
        return sexgroup;
    }

    public void setSexgroup(String sexgroup) {
        this.sexgroup = sexgroup;
    }

    public String getAgegroup() {
        return agegroup;
    }

    public void setAgegroup(String agegroup) {
        this.agegroup = agegroup;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getIsEnd() {
        return isEnd;
    }

    public void setIsEnd(String isEnd) {
        this.isEnd = isEnd;
    }
}
