package net.tkdkid1000.armiworldweb;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

public class Ticket {
	
	private int id;
	private String email;
	private String title;
	private String content;
	private Timestamp date;
	private boolean status;
	private boolean accepted;

	public static Ticket from(int id) {
		List<HashMap<String, Object>> result = Database.runQuery(String.format("SELECT * FROM tickets WHERE email=%s", id));
		if (result.size() != 0) {
			HashMap<String, Object> ticket = result.get(0);
			Ticket tick = new Ticket((int)ticket.get("id"),
					(String)ticket.get("author"),
					(String)ticket.get("title"),
					(String)ticket.get("title"),
					Timestamp.valueOf((String)ticket.get("date")),
					(boolean)ticket.get("status"),
					(boolean)ticket.get("accepted"));
			return tick;
		}
		return null;
	}

	
	public Ticket(String email, String title, String content) {
		this.setId(ThreadLocalRandom.current().nextInt(10000, 99999 + 1));
		this.setEmail(email);
		this.setTitle(title);
		this.setContent(content);
		this.setDate(new Timestamp(System.currentTimeMillis()));
		this.setStatus(false);
		this.setAccepted(false);
	}
	
	public Ticket(int id, String email, String title, String content, Timestamp date, boolean status, boolean accepted) {
		this.setId(id);
		this.setEmail(email);
		this.setTitle(title);
		this.setContent(content);
		this.setDate(date);
		this.setStatus(status);
		this.setAccepted(accepted);
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
		update();
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
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


	public Timestamp getDate() {
		return date;
	}


	public void setDate(Timestamp date) {
		this.date = date;
	}


	public boolean isStatus() {
		return status;
	}


	public void setStatus(boolean status) {
		this.status = status;
	}


	public boolean isAccepted() {
		return accepted;
	}


	public void setAccepted(boolean accepted) {
		this.accepted = accepted;
	}
	
	public Map<String, Object> getData() {
		return Database.runQuery(String.format("SELECT * FROM tickets WHERE id=%s", id)).get(0);
	}
	
	public void create() {
		Database.runCommand(String.format("INSERT INTO tickets(id,author,title,content,date,status,accepted) VALUES(%s,\"%s\",\"%s\",\"%s\",%s,%s)", id, email, title, content, status, accepted));
	}
	
	public void update() {
		Database.runCommand(String.format("UPDATE tickets SET id=%s,"
				+ "author=\"%s\","
				+ "title=\"%s\","
				+ "content=\"%s\","
				+ "date=\"%s\","
				+ "status=%s,"
				+ "accepted=%s WHERE id=%s;", id, email, title, content, date, status, accepted, id));
	}
}
