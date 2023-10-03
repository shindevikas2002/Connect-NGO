<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*"%>
<%
	ResultSet resultset = null;
%>

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

   
   <h3>Collect Items </h3>
   
   
   






<%

	String cno= session.getAttribute("cno").toString();
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ngosystem", "root",
									"root");

							Statement statement = connection.createStatement();
							Statement st1=connection.createStatement();
							String q="select * from volunteer where CNumber="+cno;
							ResultSet rs1=st1.executeQuery(q);
							rs1.next();
								String ngoid=rs1.getString(7);
							
							String sqlq="SELECT * FROM items WHERE Ngo_id="+ ngoid +" AND status='not collected'";						//	Name text ,CNumber text, Email text, Address text, City text,  Password text
							//create table items(itemname text ,qty integer,description text,Ngo_id Int,CNumber varchar(10),FOREIGN KEY (Ngo_id) REFERENCES ngo(Ngo_id),FOREIGN KEY (CNumber) REFERENCES donator(CNumber))
							System.out.print(sqlq);
							resultset = statement
									.executeQuery(sqlq);
							while(resultset.next()){
							String cnumber=resultset.getString(5);
							
							
							 Statement stmt = connection.createStatement();
						        String q1 = "SELECT * FROM donator WHERE CNumber = '" + cnumber+ "'";
						        ResultSet rs = stmt.executeQuery(q1);
						        
						        String name=" ";
						        String address=" ";
						        if (rs.next()) {
						            name = rs.getString("Name");
						            address =rs.getString("Address");
						        }
					%>
				<table border="2" width="70%" height="300px">
					<tr>
						<td><b>Item name</td>
						<td>
							<%
								out.println(resultset.getString(1));
							%>
						</td>
					</tr>
					<tr>
						<td><b>Quantity</b></td>
						<td>
							<%
								out.println(resultset.getString(2));
							%>
						</td>
					</tr>

					<tr>
						<td><b>Discription</td>
						<td>
							<%
								out.println(resultset.getString(3));
							%>
						</td>
					</tr>

					<tr>
						<td><b>Name of Donor</td>
						<td>
							<%
								out.println(name);
							%>
						</td>
						</tr>
						<tr>
						<td><b>Address to collect items</td>
						<td>
							<%
								out.println(address);
							%>
						</td>
					</tr>
					<tr>
    		<td colspan="2">
      			  <form method="post" action="volunteerupdateitemsstatus.jsp">
           		 <input type="hidden" name="itemname" value="<%=resultset.getString(1)%>">
           <input type="hidden" name="description" value="<%=resultset.getString(3)%>">
           	 <input type="hidden" name="ngoid" value="<%=resultset.getInt(4)%>">
           		 
            		<button type="submit">Collect items</button>
            		
       			 </form>
   		 </td>
	</tr>
					
					

					
					
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
