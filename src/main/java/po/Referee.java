package po;

public class Referee {
    private int id;
    private String name;
    private String refID;
    private String phone;
    private String user;

    private Team team;

    public Referee() {
    }

    public Referee(int id) {
        this.id = id;
    }

    public Referee(String name, String user) {
        this.name = name;
        this.user = user;
    }

    public Referee(String name, String refID, String phone, Team team) {
        this.name = name;
        this.refID = refID;
        this.phone = phone;
        this.team = team;
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

    public String getRefID() {
        return refID;
    }

    public void setRefID(String refID) {
        this.refID = refID;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }
}
