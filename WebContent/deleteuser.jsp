<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete User</title>
</head>
<body>
<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

String username = request.getParameter("username");

String url = "jdbc:mysql://localhost:3306/webproducts";
//DO NOT include this info in .java files pushed to GitHub in real projects
String user = "java";
String password = "java123";

try {
	Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(url, user, password);
    st = con.createStatement();
    
    //create query statement - use ? to the values so that it can call the perpared statement
    String query = "DELETE FROM Users WHERE username = ?";
    
    PreparedStatement insertStatement = con.prepareStatement(query);

    insertStatement.setString(1, username);
    insertStatement.executeUpdate();
    		
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