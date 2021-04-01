package net.tkdkid1000.armiworldweb;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.JsonIOException;
import com.google.gson.JsonSyntaxException;

public class User {

	private String email;
	private String username;
	private String password;
	private String icon;
	private int reputation;
	
	public User(String email, String username, String password) {
		this.email = email;
		this.username = username;
		this.password = password;
		this.icon = "https://purr.objects-us-east-1.dream.io/i/20160824_163745-1.jpg";
		this.reputation = 0;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
		try {
			update();
		} catch (JsonIOException | IOException e) {
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
		} catch (JsonIOException | IOException e) {
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
		} catch (JsonIOException | IOException e) {
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
		} catch (JsonIOException | IOException e) {
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
		} catch (JsonIOException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getData() throws JsonSyntaxException, JsonIOException, IOException {
		Map<String, Object> users = (Map<String, Object>) Database.load().get("users");
		return (Map<String, Object>) users.get(getEmail());
	}
	
	@SuppressWarnings("unchecked")
	public void register() throws JsonSyntaxException, JsonIOException, IOException {
		Map<String, Object> users = (Map<String, Object>) Database.load().get("users");
		Map<String, Object> data = new HashMap<String, Object>();
		users.put(email, data);
		Map<String, Object> db = Database.load();
		db.replace("users", users);
		System.out.println(db);
		Database.save(db);
	}
	
	@SuppressWarnings("unchecked")
	private void update() throws JsonIOException, IOException {
		Map<String, Object> users = (Map<String, Object>) Database.load().get("users");
		Map<String, Object> data = new HashMap<String, Object>();
		users.replace(email, data);
		Map<String, Object> db = Database.load();
		db.replace("users", users);
		Database.save(db);
	}
}
