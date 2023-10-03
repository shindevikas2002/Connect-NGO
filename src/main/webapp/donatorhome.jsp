<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
        String cno=session.getAttribute("cno").toString();
        
        
        
        %>
        <tr>
        
        <form action="donatitems.jsp">
        <%
        session.setAttribute("cno", cno);
        %>
                       <input style="background-color:#FF008C;width:120px;border:none;color:white;height:30px"  type="submit"  value="Donate items" />
                         
   
   
   						</form>
        </tr>
         <tr>
        
        <form action="donorprofile.jsp">
        
         <%
        session.setAttribute("cno", cno);
        %>
                       <input style="background-color:#FF008C;width:120px;border:none;color:white;height:30px"  type="submit"  value="view Profile" />
                         
   
   
   						</form>
        </tr>
         <tr>
        
        <form action="ngoviewitems.jsp">
        
         <%
        session.setAttribute("cno", cno);
        %>
                       <input style="background-color:#FF008C;width:120px;border:none;color:white;height:30px"  type="submit"  value="view items" />
                         
   
   
   						</form>
        </tr>
    </table>
</body>
</html>
