<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Users</title>
</head>
<body>
<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

String url = "jdbc:mysql://localhost:3306/webproducts";
//DO NOT include this info in .java files pushed to GitHub in real projects
String user = "java";
String password = "java123";

try {
	Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(url, user, password);
    st = con.createStatement();
    
    String query = "SELECT username, email, full_name FROM Users";
    PreparedStatement insertStatement = con.prepareStatement(query);
    
    rs = st.executeQuery(query);
	
    out.println("<table align='center'>");
    
    boolean grey = false;
    while (rs.next()) {
    	if(grey)
    		out.println("<tr bgcolor=#AAAAAA>");
    	else
    		out.println("<tr bgcolor=#FFFFFF>");
    	grey = !grey; 
    			
    		String username = rs.getString(1);
    		String email = rs.getString(2);
    		String fullname = rs.getString(3);
    		out.println("<td>"+ username + "</td><td>" + email + "</td><td> " + fullname + "</td><td><form name = 'deleteuser' action = 'deleteuser.jsp' align='center'> <input type='hidden' name = 'username' value = \""+ username +"\"> <input type='submit' value = 'Delete User'> </form></td> ");
			out.println("<td> <form name = 'modifyuser' action = 'modifyuserform.jsp' align='center'> <input type='hidden' name = 'username' value = \""+ username +"\"> <input type='submit' value = 'Modify User'> </form></td>" );    
    }
    out.println("</table><br><form method = 'link' action = 'index.html' align = 'center'> <input type = submit value = 'HOME'></form>");
    
    		
} catch (SQLException e) {
    out.println("DB Exception: " + e);

} finally {
    try {
        if (rs != null) {
            rs.close();
        }
        if (st != null) {
            st.close();
        }
        if (con != null) {
            con.close();
        }

    } catch (SQLException e) {
    		out.println("DB Exception in finally: " + e);
    }
}

%>
</body>
</html>