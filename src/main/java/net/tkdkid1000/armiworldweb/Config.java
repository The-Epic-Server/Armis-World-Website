package net.tkdkid1000.armiworldweb;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class Config {

	public static String get(String property, String defaultProperty) {
		Properties prop = new Properties();
		FileInputStream ip;
		try {
			ip = new FileInputStream("config.properties");
			try {
				prop.load(ip);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return prop.getProperty(property, defaultProperty);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		return "null";
	}
}
