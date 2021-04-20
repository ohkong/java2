package ojhgdsingle;

import java.util.Date;
public class Reply {
		private int seq;
		private int num;
		private String id1;
		private String id2;
		private String rcontent;
		private Date rregdate;
		private boolean gameresult;
		private String rtype;
		private String bresult;
		private String rresult;
		private Date gregdate;
		
		public int getSeq() {
			return seq;
		}
		public void setSeq(int seq) {
			this.seq = seq;
		}
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getId1() {
			return id1;
		}
		public void setId1(String id1) {
			this.id1 = id1;
		}
		public String getId2() {
			return id2;
		}
		public void setId2(String id2) {
			this.id2 = id2;
		}
		public String getRcontent() {
			return rcontent;
		}
		public void setRcontent(String rcontent) {
			this.rcontent = rcontent;
		}
		public Date getRregdate() {
			return rregdate;
		}
		public void setRregdate(Date rregdate) {
			this.rregdate = rregdate;
		}
		public boolean isGameresult() {
			return gameresult;
		}
		public void setGameresult(boolean gameresult) {
			this.gameresult = gameresult;
		}
		public String getRtype() {
			return rtype;
		}
		public void setRtype(String rtype) {
			this.rtype = rtype;
		}
		public String getBresult() {
			return bresult;
		}
		public void setBresult(String bresult) {
			this.bresult = bresult;
		}
		public String getRresult() {
			return rresult;
		}
		public void setRresult(String rresult) {
			this.rresult = rresult;
		}
		public Date getGregdate() {
			return gregdate;
		}
		public void setGregdate(Date gregdate) {
			this.gregdate = gregdate;
		}
		@Override
		public String toString() {
			return "reply [seq=" + seq + ", num=" + num + ", id1=" + id1 + ", id2=" + id2 + ", rcontent=" + rcontent
					+ ", rregdate=" + rregdate + ", gameresult=" + gameresult + ", rtype=" + rtype + ", bresult=" + bresult
					+ ", rresult=" + rresult + ", gregdate=" + gregdate + "]";
		}
		
		
	}


