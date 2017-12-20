package csci3830_Assignment2;

public class User {
	private String firstName;
	private String surname;
	private String loginName;
	private int age;
	
	public String getFirstName() { return firstName; }
	
	public void setFirstName(String newFirstName) {
		this.firstName = newFirstName;
	}
	
	public String getSurname() { return surname; }
	
	public void setSurname(String newSurname) {
		this.surname = newSurname;
	}
	
	public String getLoginName() { return loginName; }
	
	public void setLoginName(String newLoginName) {
		this.loginName = newLoginName;
	}
	
	public int getAge() { return age; }
	
	public void setAge(int newAge) {
		this.age = newAge;
	}
}
