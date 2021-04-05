package net.tkdkid1000.armiworldweb;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.client.utils.URIBuilder;

public class User {

	private String email;
	private String username;
	private String password;
	private String icon;
	private int reputation;
	private String role;
	
	public static User from(String email) {
		List<HashMap<String, Object>> result = Database.runQuery(String.format("SELECT * FROM users WHERE email=\"%s\"", email));
		if (result.size() > 0) {
			HashMap<String, Object> user = result.get(0);
			User usr = new User((String) user.get("email"), 
					(String) user.get("username"), 
					(String) user.get("password"), 
					(String) user.get("icon"),
					(int) user.get("reputation"),
					(String) user.get("role"));
			return usr;
		}
		return null;
	}
	
	public User(String email, String username, String password) {
		this.email = email;
		this.username = username;
		this.password = password;
		this.icon = "https://purr.objects-us-east-1.dream.io/i/20160824_163745-1.jpg";
		this.reputation = 0;
		this.role = "default";
	}
	
	public User(String email, String username, String password, String icon, int reputation, String role) {
		this.email = email;
		this.username = username;
		this.password = password;
		this.icon = icon;
		this.reputation = reputation;
		this.role = role;
	}
	
	public String getUrl() {
		URIBuilder builder = new URIBuilder();
		builder.setPath("/user");
		builder.addParameter("name", username);
		try {
			return builder.build().toString();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
		try {
			update();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
		try {
			update();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
		try {
			update();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getIcon() {
		return icon;
	}
	
	public void setIcon(String icon) {
		this.icon = icon;
		try {
			update();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int getReputation() {
		return reputation;
	}
	
	public void setReputation(int reputation) {
		this.reputation = reputation;
		try {
			update();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Map<String, Object> getData() {
		return Database.runQuery(String.format("SELECT * FROM users WHERE email=\"%s\"", email)).get(0);
	}
	
	public void register() {
		Database.runCommand(String.format("INSERT INTO users(email,username,password,icon,reputation,role) VALUES(\"%s\",\"%s\",\"%s\",\"%s\",%s,\"%s\");", email, username, password, icon, reputation, role));
	}
	
	private void update() throws IOException {
		System.out.println(String.format("UPDATE users SET email=\"%s\", "
				+ "username=\"%s\", "
				+ "password=\"%s\", "
				+ "icon=\"%s\", "
				+ "reputation=%s, "
				+ "role=%s "
				+ "WHERE email=\""+email+"\";", email, username, password, icon, reputation, role));
		Database.runCommand(String.format("UPDATE users SET email=\"%s\", "
				+ "username=\"%s\", "
				+ "password=\"%s\", "
				+ "icon=\"%s\", "
				+ "reputation=%s, "
				+ "role=%s "
				+ "WHERE email=\""+email+"\";", email, username, password, icon, reputation, role));
	}
}
