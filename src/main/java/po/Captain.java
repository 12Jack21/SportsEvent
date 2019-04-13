package po;

public class Captain {
    private int id;
    private String name;
    private String capID;
    private int teamid;

    public Captain(String name, String capID, int teamid) {
        this.name = name;
        this.capID = capID;
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

    public String getCapID() {
        return capID;
    }

    public void setCapID(String capID) {
        this.capID = capID;
    }

    public int getTeamid() {
        return teamid;
    }

    public void setTeamid(int teamid) {
        this.teamid = teamid;
    }
}
