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
		ctx.setDescriptor("src/main/resources/WEB-INF/web.xml");
		ctx.setResourceBase("src/main/resources/webapp");
		ctx.setContextPath("/");
		ctx.setAttribute("org.eclipse.jetty.server.webapp.ContainerIncludeJarPattern",".*/[^/]*jstl.*\\.jar$");
		ctx.setInitParameter("org.eclipse.jetty.servlet.Default.dirAllowed", "false");
		org.eclipse.jetty.webapp.Configuration.ClassList classlist = org.eclipse.jetty.webapp.Configuration.ClassList.setServerDefault(server);
		classlist.addAfter("org.eclipse.jetty.webapp.FragmentConfiguration", "org.eclipse.jetty.plus.webapp.EnvConfiguration", "org.eclipse.jetty.plus.webapp.PlusConfiguration");
		classlist.addBefore("org.eclipse.jetty.webapp.JettyWebXmlConfiguration", "org.eclipse.jetty.annotations.AnnotationConfiguration");
		server.setHandler(ctx);
		Database.runCommand("CREATE TABLE IF NOT EXISTS users (\n"
				+ "email text NOT NULL,\n"
				+ "username text NOT NULL,\n"
				+ "password text NOT NULL,\n"
				+ "icon text DEFAULT \"https://purr.objects-us-east-1.dream.io/i/20160824_163745-1.jpg\",\n"
				+ "reputation integer DEFAULT 1,\n"
				+ "table_constraints\n"
				+ ");");
		server.start();
		server.join();
	}
}
