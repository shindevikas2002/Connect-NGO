<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@page import="java.sql.*" %>
     <%@page import="java.sql.*" %>
     <%@ page import = "javax.servlet.*" %>
<html lang="en">
<body>


<%
String cName = request.getParameter("ngo_id");
String passWord = request.getParameter("pass");
try{
String url = "jdbc:mysql://localhost:3306/Ngosystem";
String username = "root";
String password = "root";
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(url, username, password);


String sql = "SELECT * FROM ngo WHERE `Ngo_id`="+cName;
String sql2 = "SELECT * FROM ngo WHERE`Password`="+passWord;
PreparedStatement st = con.prepareStatement(sql);
System.out.println(sql);
System.out.println(sql2);
ResultSet rs = st.executeQuery(sql);
rs.next();
String cheakpass=rs.getString("Password");
if(passWord.equals(cheakpass)){
	System.out.println("done");
	
	
	//response.sendRedirect("ngoprofile.jsp");
		

	RequestDispatcher rd = request.getRequestDispatcher("ngohome.jsp");
	session.setAttribute("cName", cName);
	
	rd.forward(request , response);
}
}
catch(Exception e){}
	
	%>
    
</body>
</html>