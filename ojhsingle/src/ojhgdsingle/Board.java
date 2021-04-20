package ojhgdsingle;

import java.util.Date;

public class Board {
	private int num;
	private String id;
	private String pass;
	private String title;
	private String content;
	private String file1;
	private Date regdate;
	private int readcnt;
	private String	btype;
	private String tradetype;
	private String selltype;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}
	public String getTradetype() {
		return tradetype;
	}
	public void setTradetype(String tradetype) {
		this.tradetype = tradetype;
	}
	public String getSelltype() {
		return selltype;
	}
	public void setSelltype(String selltype) {
		this.selltype = selltype;
	}
	
	@Override
	public String toString() {
		return "Board [num=" + num + ", id=" + id + ", pass=" + pass + ", title=" + title + ", content="
				+ content + ", file1=" + file1 + ", regdate=" + regdate + ", readcnt=" + readcnt + ", btype=" + btype
				+ ", tradetype=" + tradetype + ", selltype=" + selltype + "]";
	}
	
}
