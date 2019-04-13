package po;

public class Coach {
    private int id;
    private String name;
    private int sex;
    private String phone;
    private String coachID;

    public Coach(String name, int sex, String phone, String coachID, int teamid) {
        this.name = name;
        this.sex = sex;
        this.phone = phone;
        this.coachID = coachID;
        this.teamid = teamid;
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

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCoachID() {
        return coachID;
    }

    public void setCoachID(String coachID) {
        this.coachID = coachID;
    }

    public int getTeamid() {
        return teamid;
    }

    public void setTeamid(int teamid) {
        this.teamid = teamid;
    }

    private int teamid;
}
