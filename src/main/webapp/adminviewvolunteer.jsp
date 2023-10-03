<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ page import="java.sql.*"%>
<%
	ResultSet resultset = null;
%>
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

   
   
   
<h3>View Volunteers</h3>





<%

	String cnumber= session.getAttribute("cnumber").toString();
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ngosystem", "root",
									"root");

							Statement statement = connection.createStatement();
							Statement st1=connection.createStatement();
							String 	q1="select * from ngoadmin where CNumber="+cnumber;
							ResultSet rs1 = st1.executeQuery(q1);

							rs1.next();
							String cno=rs1.getString ("Ngo_id");
							String sqlq="select * from volunteer where Ngo_id= " + cno;
						//	Name text ,CNumber text, Email text, Address text, City text,  Password text
							
							System.out.print(sqlq);
							resultset = statement
									.executeQuery(sqlq);
							while(resultset.next()){
					%>
			<table border="2" width="40%" height="300px" >
					<tr >
						<td style="text-align:centeer;"><b>Name</td>
						<td>
							<%
								out.println(resultset.getString(1));
							%>
						</td>
					</tr>
					<tr>
						<td><b>CNumber</b></td>
						<td>
							<%
								out.println(resultset.getString(2));
							%>
						</td>
					</tr>

					<tr>
						<td><b>Address</td>
						<td>
							<%
								out.println(resultset.getString(4));
							%>
						</td>
					</tr>

					<tr>
						<td><b>City</td>
						<td>
							<%
								out.println(resultset.getString(5));
							%>
						</td>
					</tr>

					<tr>
						<td><b>Email</td>
						<td>
							<%
								out.println(resultset.getString(3));
							%>
						</td>
					</tr>
					
					<br>
					<br>

					

					
					
					<%
							}
						statement.close();
							connection.close();
						} catch (Exception e) {
							out.println("wrong entry" + e);
						}
					%>

</table>
</body>
</html>
