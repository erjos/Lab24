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
    
    
  	//rs = st.executeQuery();
	
    out.println("<table align='center'>");
    //while there's still another result
    boolean grey = false;
    while (rs.next()) {
    	if(grey)
    		out.println("<tr bgcolor=#AAAAAA>");
    	else
    		out.println("<tr bgcolor=#FFFFFF>");
    	grey = !grey; 
    	// flip it everytime
    	//basically it sets grey false - when grey is false it prints the row in black
    	//when it is true it prints it as grey - every loop it flips the boolean so that it alternates
    	//what are the numbers in here? How does it know
    			
    			//declare new variables and get the type as the "rs"
    		String username = rs.getString(1);
    		String email = rs.getString(2);
    		String fullname = rs.getString(3);
    		out.println("<td>"+ username + "</td><td>" + email + "</td><td> " + fullname + "</td><td> ");
    }
    out.println("</table>");
    
    		
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