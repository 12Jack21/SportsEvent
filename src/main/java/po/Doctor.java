package po;

public class Doctor {
    private int id;
    private String name;
    private String phone;
    private String docID;

    private Team team;

    public Doctor() {
    }

    public Doctor(String name, String phone, String docID, Team team) {
        this.name = name;
        this.phone = phone;
        this.docID = docID;
        this.team = team;
    }

    public Doctor(String name, String phone, String docID) {
        this.name = name;
        this.phone = phone;
        this.docID = docID;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDocID() {
        return docID;
    }

    public void setDocID(String docID) {
        this.docID = docID;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }
}
