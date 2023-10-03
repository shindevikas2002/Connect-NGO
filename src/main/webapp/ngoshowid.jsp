<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
     <%@page import="java.sql.*" %>
<html>
<body>
<%







try {
	System.out.print("Hello");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ngosystem", "root", "root");
	Statement st = conn.createStatement();
	Statement st1 =conn.createStatement();
	String email=session.getAttribute("email").toString();
	 String q = "SELECT * FROM ngo WHERE  Email = " + email;
	    ResultSet rs = st1.executeQuery(q);
	    if (rs.next()) { // Move the ResultSet to the first row
	        int id = rs.getInt("Ngo_id"); // Retrieve the Ngo_id column value
	        response.getWriter().print("Your id is " + id);
	        
	    }
	




//	System.out.println(query);
	st.close();
	conn.close();
} catch (ClassNotFoundException | SQLException e) {
	e.printStackTrace();
}





%>

    
</body>
</html>











