<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify User</title>
</head>
<body>
<%
Connection con = null;
Statement st = null;
ResultSet rss = null;
int rs = 0;

String origuser = request.getParameter("useroriginal");
String username = request.getParameter("username");
String email = request.getParameter("email");
String fullname = request.getParameter("full_name");

String url = "jdbc:mysql://localhost:3306/webproducts";
//DO NOT include this info in .java files pushed to GitHub in real projects
String user = "java";
String password = "java123";

try {
	Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(url, user, password);
    st = con.createStatement();
    
    //create query statement - use ? to the values so that it can call the perpared statement
    String query = "UPDATE Users SET username = ?, email = ?, full_name = ? WHERE username = ?";
    
    PreparedStatement insertStatement = con.prepareStatement(query);

    insertStatement.setString(1, username);
    insertStatement.setString(2, email);
    insertStatement.setString(3, fullname);
    insertStatement.setString(4, origuser);
    rs = insertStatement.executeUpdate();
    
    if(rs > 0)
    {
       out.println("Success");
       String redirectURL = "http://localhost:8080/Lab24/index.html";
       response.sendRedirect(redirectURL);
    }
    		
} catch (SQLException e) {
    out.println("DB Exception: " + e);

} finally {
    try {
        if (rss != null) {
            rss.close();
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
</body>
</html>