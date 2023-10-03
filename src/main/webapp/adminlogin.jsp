<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
     <%@page import="java.sql.*" %>
     <%@ page import = "javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home | My Website</title>
    <link rel="stylesheet" href="styles.css">
     <style>
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input[type="number"], input[type="password"], input[type="submit"] {
            border: solid;
            padding: 10px;
            font-size: 16px;
            margin-bottom: 10px;
            width: 200px;
        }

        input[type="submit"] {
            background-color: #FF008C;
            width: 200px;
            color: #fff;
            height: 50px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #FF0055;
        }
    </style>
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

            
               <form action="adminlogin.jsp" method="POST">
        Contact no:<input maxlength="10" name="cnumber" type="number"/><br/><br/>
        Password :  <input maxlength="20" name="pass" type="password"/><br/><br/>
        <input type="submit" value=" Login" />
    </form>
            <br/>
    
    <%
String cnumber = request.getParameter("cnumber");
String passWord = request.getParameter("pass");
try{
String url = "jdbc:mysql://localhost:3306/Ngosystem";
String username = "root";
String password = "root";
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(url, username, password);


String sql = "SELECT * FROM ngoadmin WHERE `CNumber`="+cnumber;
String sql2 = "SELECT * FROM ngoadmin WHERE`Password`="+passWord;
PreparedStatement st = con.prepareStatement(sql);
System.out.println(sql);
System.out.println(sql2);
ResultSet rs = st.executeQuery(sql);

rs.next();
String cheakpass=rs.getString("Password");
System.out.println(cheakpass);
if(passWord.equals(cheakpass)){
	System.out.println("done");
	
	
	//response.sendRedirect("ngoprofile.jsp");
		

	RequestDispatcher rd = request.getRequestDispatcher("adminhome.jsp");
	session.setAttribute("cnumber", cnumber);
	
	rd.forward(request , response);
}
}
catch(Exception e){}
	
	%>
    


</body>
</html>