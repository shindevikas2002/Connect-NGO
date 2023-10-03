<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %>
     <%@page import="java.sql.*" %>
     <%@ page import = "javax.servlet.*" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home | My Website</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="index.html" class="active">Home</a></li>
                <li><a href="register.html">Register</a></li>
                <li><a href="login.html">Login</a></li>
                <li><a href="donate.html">Donate</a></li>
                <li><a href="about_us.html">About Us</a></li>
            </ul>
        </nav>
    </header>



<%
String cno = request.getParameter("cno");
String passWord = request.getParameter("pass");
try{
String url = "jdbc:mysql://localhost:3306/Ngosystem";
String username = "root";
String password = "root";
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(url, username, password);


String sql = "SELECT * FROM donator WHERE `CNumber`="+cno;
//String sql2 = "SELECT * FROM ngo WHERE`Password`="+passWord;
PreparedStatement st = con.prepareStatement(sql);
System.out.println(sql);
//System.out.println(sql2);
ResultSet rs = st.executeQuery(sql);
rs.next();
String cheakpass=rs.getString("Password");
if(passWord.equals(cheakpass)){
	System.out.println("done");
	
	
	//response.sendRedirect("ngoprofile.jsp");
		
	System.out.println("ok");
	RequestDispatcher rd = request.getRequestDispatcher("donatorhome.jsp");
	session.setAttribute("cno", cno);
	
	rd.forward(request , response);
}
else{
	System.out.println("not ok");
}
}
catch(Exception e){}
	
	%>
    
</body>
</html>