package beans;

public class User {

	private String userId=null; ////사용자 이름(기본키)
	private String userPassword=null; //사용자 패스워드(1234)
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
}
