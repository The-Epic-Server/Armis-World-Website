package net.tkdkid1000.armiworldweb;

import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.google.gson.JsonSyntaxException;

public class Database {

	@SuppressWarnings("unchecked")
	public static Map<String, Object> load() throws JsonSyntaxException, JsonIOException, IOException {
		return new Gson().fromJson(Files.newBufferedReader(Paths.get("database.json")), Map.class);
	}
	
	public static void save(Map<String, Object> json) throws JsonIOException, IOException {
		new Gson().toJson(json, new FileWriter("database.json"));
	}
}
