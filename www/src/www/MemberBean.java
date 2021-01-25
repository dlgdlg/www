package www;

public class MemberBean {

	private String id;
	private String pass;
	private String group;
	private String gidNumber;
	private String email;

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
	
	public String getGroup() {
		return group;
	}
	
	public void setGroup(String group) {
		this.group = group;
		setGidNumber(group);
	}
	
	public String getGidNumber() {
		return gidNumber;
	}
	
	public void setGidNumber(String group) {
		if(group == "users") {
			this.gidNumber = "501";
		}
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}	
}