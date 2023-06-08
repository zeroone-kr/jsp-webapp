package dao;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;
import beans.User;

public class UserManager {

	private Map<String, User> userTable = new ConcurrentHashMap<String, User>();

	public UserManager() {
		User admin = new User();
		admin.setUserId("admin");
		admin.setUserPassword("1234");
		userTable.put(admin.getUserId(), admin);
		
		
		User test = new User();
		test.setUserId("test");
		test.setUserPassword("1234");
		userTable.put(test.getUserId(), test);
		
	}

	// 사용자 찾기
	public User findUsers(String userId) {
		User user = userTable.get(userId);
		if (user == null) {
			System.out.println("user Not found");
		}

		return user;
	}

	// 사용자 인증
	public boolean validateUsers(User user) {

		String username = user.getUserId();
		String passwd = user.getUserPassword();

		// 입력값 검증
		if (username == null || passwd == null || 
				username.isEmpty() || passwd.isEmpty()) {
			System.out.println("login error");
			return false; //로그인 실패
		} else {

			System.out.println("userId: " + username + ", pass: " + passwd);
			Set<Entry<String, User>> keySet = userTable.entrySet();
			Iterator<Entry<String, User>> keyIterator = keySet.iterator();

			while (keyIterator.hasNext()) {
				Entry<String, User> set = keyIterator.next();
				User tmpUser = set.getValue();

				String tmpUsername = tmpUser.getUserId();
				String tmpPasswd = tmpUser.getUserPassword();

				if (username.equals(tmpUsername) && passwd.equals(tmpPasswd)) {
					
					System.out.println("Success:: userId: " + username + ", pass: " + passwd);
					return true; // 로그인 성공
				}
			}
			System.out.println("fail:: userId: " + username + ", pass: " + passwd);
			return false; // 로그인 실패
		}
	}
}