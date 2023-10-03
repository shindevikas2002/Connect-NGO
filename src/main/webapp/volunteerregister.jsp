<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
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
     <h1>Registration form</h1>
     
     
      <div style="text-align:center;">
<table>
    <tr>

       
       
       
    </tr> 
    
    <tr>
 <%
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ngosystem", "root", "root");
Statement statement = connection.createStatement();
ResultSet resultSet = statement.executeQuery("SELECT * FROM ngo");
%>
        <th colspan="6">
            <center>
                <form action="volunteerregister.jsp" method="POST">
                   Name: <input maxlength="45" name="name"  type="text"/><br/><br/>
                    
                    Mobile no:<input maxlength="10" name="mobile"  type="number"/><br/><br/>
                    Address :<input maxlength="45" name="address"  type="text"/><br/><br/>
                    City :<input maxlength="45" name="city"  type="text"/><br/></br>
                   
                    Email id : <input maxlength="45" name="email_id"  type="email"/><br/><br/>
                    
                   Passwod :  <input maxlength="20" name="pass"  type="password"/><br/><br/>
                    
            
            <%
        while(resultSet.next()) {
            int id = resultSet.getInt("Ngo_id");
          String name=resultSet.getString("Name");
    %>
            <input type="radio" name="selectedId" value="<%= id %>"> <%= name %> <br>
    <%
        }
    %>

<input style="background-color:#FF008C;width:120px;border:none;color:white;height:30px"  type="submit"  value="Register" />
            
                  
            <br/>
    </th>
       
       
    </tr> 

</table>
<div>




<%
String getngo = "\"" + request.getParameter("selectedId") + "\"";

String fullname = "\"" + request.getParameter("name") + "\"";
String address = "\"" + request.getParameter("address") + "\"";
String city = "\"" + request.getParameter("city") + "\"";
String email = "\"" + request.getParameter("email_id") + "\"";
String cno = "\"" + request.getParameter("mobile") + "\"";
String pass = "\"" + request.getParameter("pass") + "\"";


try {
    System.out.print("Hello");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ngosystem", "root", "root");
    Statement st = conn.createStatement();
	
    String query = "INSERT INTO `volunteer`( `Name`, `CNumber`, `Email`, `Address`, `City`, `Password`,`Ngo_id`) " + 
                   "VALUES (" + fullname + "," + cno + "," + email + "," + address + "," + city + "," + pass + "," + getngo + ")";
    System.out.println(query);
    if (st.executeUpdate(query) != 0) {
        response.getWriter().print("<div>You have successfully Registered... Please login to continue</div>");
        //response.sendRedirect("volunteerlogin.html");
        RequestDispatcher rd = request.getRequestDispatcher("volunteerlogin.html");
        rd.forward(request, response);
    }

    System.out.println(query);
    st.close();
    conn.close();
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
}
%>



</body>
</html>
