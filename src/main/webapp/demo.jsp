<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
    <%@ page import="java.sql.*"%>
<%
	ResultSet row = null;
%>
<%
    // Don't use scriptlets to handle database operations. Use a separate Java class or a framework.
    String cno = session.getAttribute("ngoid").toString();
    // ...
    	try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ngosystem", "root",
									"root");

							Statement statement = connection.createStatement();
							String sqlq="select * from volunteer where Ngo_id= " + cno;
						//	Name text ,CNumber text, Email text, Address text, City text,  Password text
							
							System.out.print(sqlq);
							row = statement
									.executeQuery(sqlq);
    	statement.close();
		connection.close();
	} catch (Exception e) {
		out.println("wrong entry" + e);
	}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Volunteer details</title>
</head>
<body>

<table border="1">
    <thead>
        <tr>
            <th>Name</th>
            <th>Contact Number</th>
            <th>Address</th>
            <th>City</th>
            <th>Email</th>
            <th>NGO ID</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${not empty cno}">
            <c:set var="volunteerSql" value="SELECT * FROM volunteer WHERE Ngo_id = ${cno}" />
            <c:forEach var="row" items="${database.executeQuery(volunteerSql)}">
                <tr>
                    <td><c:out value="${row.name}" /></td>
                    <td><c:out value="${row.cnumber}" /></td>
                    <td><c:out value="${row.address}" /></td>
                    <td><c:out value="${row.city}" /></td>
                    <td><c:out value="${row.email}" /></td>
                    <td><c:out value="${row.ngo_id}" /></td>
                </tr>
            </c:forEach>
        </c:if>
    </tbody>
</table>

</body>
</html>
