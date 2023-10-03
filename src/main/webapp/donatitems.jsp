<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home | My Website</title>
    <link rel="stylesheet" href="styles.css">
    <style>
    input[type="radio"] {
        text-align: center;
    }

    input[name="image"] {
        background-color: #FF008C;
        width: 120px;
        border: none;
        color: white;
        height: 30px;
        text-align: center;
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

    <h3 class="hdng">What do you want to donate?</h3>


  <form action="decideNGOtodonate.jsp">
			        <select name="category" required style="width:70%;height:47px;line-height:47px; text-align:center;">
			        <option>Books</option>
			        <option>Clothes</option>
			        <option>Stationary</option>
			        <option>Food-kit</option>
			        <option>Health-kit</option>
			        <option>Other</option>
			        </select>
            <br>
            <br>
            <br>
            <input name="Quantity" placeholder="Quantity"  required style="width:70%;height:47px;line-height:47px; text-align:center;" type="text"/><br/>
            <br/>
            <input name="desc" placeholder="Description"  style="width:70%;height:94px;line-height:47px; text-align:center;" type="text"/><br/>
            <label style="text-align=center;"><h3>choose ngo to donate the item</h3></label>
            <%
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ngosystem", "root", "root");
	Statement statement = connection.createStatement();
	
		ResultSet resultSet = statement.executeQuery("SELECT * FROM ngo");
	%>
            
              <%
              String cno=session.getAttribute("cno").toString();
              session.setAttribute("cno", cno);
              
        while(resultSet.next()) {
            int id = resultSet.getInt("Ngo_id");
            String name=resultSet.getString("Name");
            
            
          
    %>
    		<table>
    		<tr>
    		<td style="width: 300px;"></td><td style="width: 300px;"></td><td></td><td></td><td></td><td></td>
            <td colspan="2" style="width: 300px;"> <%= name %></td> 
           <td colspan="2" style="width: 100px;"> <input type="radio" name="selectedId" value="<%= name %>"> </td>
          <td></td><td></td>
           
    <%
        }
    %>
    		</tr>
            </table>
            
            <br/>
<div style="text-align: center;">
  <input name="image" style="background-color: #FF008C; width: 120px; border: none; color: white; height: 30px;" type="submit" value="Donate">
</div>            <br/>
            <input type="hidden" name="cno" value="<%= cno%> ">
            <br/>
            <br/>
            <br/>
            <br/>
            
           
            
            
           
            
            
            
</body>
</html>














       