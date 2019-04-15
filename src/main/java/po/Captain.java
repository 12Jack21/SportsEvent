package po;

public class Captain {
    private int id;
    private String name;
    private String capID;
    private String phone;

    private Team team;

    public Captain() {
    }


    public Captain(String name, String capID, String phone, Team team) {
        this.name = name;
        this.capID = capID;
        this.phone = phone;
        this.team = team;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
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

    public String getCapID() {
        return capID;
    }

    public void setCapID(String capID) {
        this.capID = capID;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
