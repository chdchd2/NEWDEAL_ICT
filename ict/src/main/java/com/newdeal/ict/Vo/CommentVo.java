package com.newdeal.ict.Vo;

public class CommentVo {
		public int qacNum;       //게시글 번호
		public String qacWriter;   //이름
		public String qacComm;//커맨트
		
		public int getQacNum() {
			return qacNum;
		}
		public void setQacNum(int qacNum) {
			this.qacNum = qacNum;
		}
		public String getQacWriter() {
			return qacWriter;
		}
		public void setQacWriter(String qacWriter) {
			this.qacWriter = qacWriter;
		}
		public String getQacComm() {
			return qacComm;
		}
		public void setQacComm(String qacComm) {
			this.qacComm = qacComm;
		}
		@Override
		public String toString() {
			return "CommentDTO [qacNum=" + qacNum + ", qacWriter=" + qacWriter + ", qacComm=" + qacComm + "]";
		}

}
