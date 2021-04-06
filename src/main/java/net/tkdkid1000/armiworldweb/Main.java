package net.tkdkid1000.armiworldweb;

import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.ServerConnector;
import org.eclipse.jetty.webapp.WebAppContext;

public class Main {

	public static void main(String[] args) throws Exception {
		Server server = new Server(Integer.parseInt(Config.get("port", "8080")));
		ServerConnector conn = new ServerConnector(server);
		conn.setHost(Config.get("hostname", "localhost"));
		server.addConnector(conn);
		WebAppContext ctx = new WebAppContext();
		ctx.setDescriptor("src/main/webapp/WEB-INF/web.xml");
		ctx.setResourceBase("src/main/webapp");
		ctx.setContextPath("/");
		ctx.setAttribute("org.eclipse.jetty.server.webapp.ContainerIncludeJarPattern",".*/[^/]*jstl.*\\.jar$");
		ctx.setInitParameter("org.eclipse.jetty.servlet.Default.dirAllowed", "false");
		org.eclipse.jetty.webapp.Configuration.ClassList classlist = org.eclipse.jetty.webapp.Configuration.ClassList.setServerDefault(server);
		classlist.addAfter("org.eclipse.jetty.webapp.FragmentConfiguration", "org.eclipse.jetty.plus.webapp.EnvConfiguration", "org.eclipse.jetty.plus.webapp.PlusConfiguration");
		classlist.addBefore("org.eclipse.jetty.webapp.JettyWebXmlConfiguration", "org.eclipse.jetty.annotations.AnnotationConfiguration");
		server.setHandler(ctx);
		Database.runCommand("CREATE TABLE IF NOT EXISTS users (email text NOT NULL,username text NOT NULL,password text NOT NULL,icon text DEFAULT \"https://purr.objects-us-east-1.dream.io/i/20160824_163745-1.jpg\",reputation integer DEFAULT 1,role TEXT DEFAULT 'default',status TEXT DEFAULT 'Nothing yet.');");
		Database.runCommand("CREATE TABLE IF NOT EXISTS comments (id INTEGER UNIQUE, thread INTEGER NOT NULL, author TEXT NOT NULL, content TEXT NOT NULL, date DATETIME NOT NULL, rep INTEGER DEFAULT (0));");
		Database.runCommand("CREATE TABLE IF NOT EXISTS forums (id INTEGER UNIQUE, name TEXT UNIQUE, description TEXT, parent TEXT NOT NULL, lastpost INTEGER);");
		Database.runCommand("CREATE TABLE IF NOT EXISTS categories (id INTEGER UNIQUE, name TEXT NOT NULL, description TEXT NOT NULL);");
		Database.runCommand("CREATE TABLE IF NOT EXISTS threads (id INTEGER UNIQUE, title TEXT, author TEXT NOT NULL, content TEXT NOT NULL, date DATETIME NOT NULL, forum INTEGER NOT NULL);");
		server.start();
		server.join();
	}
}
