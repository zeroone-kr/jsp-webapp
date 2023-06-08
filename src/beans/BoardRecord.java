package beans;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardRecord {
		
	private Long recordId=0L; //게시글 id
	private String userId=null; //작성자
	private String subject=null; //제목
	private String content=null; //내용
	private Integer hit=0; //조회수
	private Date modifiedTime=null; //최근 생성, 수정 날짜
	
	public Long getRecordId() {
		return recordId;
	}
	public void setRecordId(Long recordId) {
		this.recordId = recordId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getHit() {
		System.out.println("--bean--"+hit);
		return hit;
	}
	public void setHit(Integer hit) {
		this.hit = hit;
	}
	
	public String getModifiedTime() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일");
		System.out.println(modifiedTime);
		return format.format(modifiedTime);	
	}
	
	public void setModifiedTime(Date modifiedTime) {
		this.modifiedTime = modifiedTime;
	}
	
	

}
