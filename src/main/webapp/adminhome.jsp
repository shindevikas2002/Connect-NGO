<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<table>
        <%
        String cnumber=session.getAttribute("cnumber").toString();
        
        
        
        %>
        <tr>
        
        <form action="adminviewvolunteer.jsp">
        <%
        session.setAttribute("cnumber", cnumber);
        %>
                       <input style="background-color:#FF008C;width:120px;border:none;color:white;height:30px"  type="submit"  value="view volunteer" />
                         
   
   
   						</form>
        </tr>
                 <tr>
        
        <form action="adminacceptitem.jsp">
        <%
        session.setAttribute("cnumber", cnumber);
        %>
                       <input style="background-color:#FF008C;width:120px;border:none;color:white;height:30px"  type="submit"  value="accept item" />
                         
   
   
   						</form>
        </tr>
       
    </table>
</body>
</html>
