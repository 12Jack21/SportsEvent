package po;

public class Doctor {
    private int id;
    private String name;
    private String docID;
    private int teamid;

    public Doctor(String name, String docID, int teamid) {
        this.name = name;
        this.docID = docID;
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

    public String getDocID() {
        return docID;
    }

    public void setDocID(String docID) {
        this.docID = docID;
    }

    public int getTeamid() {
        return teamid;
    }

    public void setTeamid(int teamid) {
        this.teamid = teamid;
    }
}
