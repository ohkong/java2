package ojhgdsingle;

public class Member {
	private String id;
	private String pass;
	private String name;
	private String tel;
	private String picture;
	private String region;
	private String kind1;
	private String kind2;
	private String kind3;
	private String score1;
	private String score2;
	private String score3;
	private int cue;
	private int totgame;
	private int win;
	private int lose;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getKind1() {
		return kind1;
	}
	public void setKind1(String kind1) {
		this.kind1 = kind1;
	}
	public String getKind2() {
		return kind2;
	}
	public void setKind2(String kind2) {
		this.kind2 = kind2;
	}
	public String getKind3() {
		return kind3;
	}
	public void setKind3(String kind3) {
		this.kind3 = kind3;
	}
	public String getScore1() {
		return score1;
	}
	public void setScore1(String score1) {
		this.score1 = score1;
	}
	public String getScore2() {
		return score2;
	}
	public void setScore2(String score2) {
		this.score2 = score2;
	}
	public String getScore3() {
		return score3;
	}
	public void setScore3(String score3) {
		this.score3 = score3;
	}
	public int getCue() {
		return cue;
	}
	public void setCue(int cue) {
		this.cue = cue;
	}
	public int getTotgame() {
		return totgame;
	}
	public void setTotgame(int totgame) {
		this.totgame = totgame;
	}
	public int getWin() {
		return win;
	}
	public void setWin(int win) {
		this.win = win;
	}
	public int getLose() {
		return lose;
	}
	public void setLose(int lose) {
		this.lose = lose;
	}
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", pass=" + pass + ", name=" + name + ", tel=" + tel + ", picture=" + picture
				+ ", region=" + region + ", kind1=" + kind1 + ", kind2=" + kind2 + ", kind3=" + kind3 + ", score1="
				+ score1 + ", score2=" + score2 + ", score3=" + score3 + ", cue=" + cue + ", totgame=" + totgame
				+ ", win=" + win + ", lose=" + lose + "]";
	}
	
}
