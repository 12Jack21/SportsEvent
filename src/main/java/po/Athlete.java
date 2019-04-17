package po;

public class Athlete {
    private int id;
    private String name;
    private int sex;
    private int age;
    private String athID;
    private String no;

    private Team team;

    public Athlete() {
    }

    public Athlete(String name, int sex, int age, String athID, Team team) {
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.athID = athID;
        this.team = team;
    }

    public Athlete(int id, String no) {
        this.id = id;
        this.no = no;
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getAthID() {
        return athID;
    }

    public void setAthID(String athID) {
        this.athID = athID;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }
}
