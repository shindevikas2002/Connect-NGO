
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
     <%@page import="java.sql.*" %>
<html>
<body>
<%
String fullname = "\"" + request.getParameter("name") + "\"";
//String NGO_ID = "\"" + request.getParameter("ngo_id") + "\"";
String address = "\"" + request.getParameter("address") + "\"";
String city = "\"" + request.getParameter("city") + "\"";
String pincode = "\"" + request.getParameter("pin_code") + "\"";
String email = "\"" + request.getParameter("email_id") + "\"";
String cno = "\"" + request.getParameter("mobile") + "\"";
String pass = "\"" + request.getParameter("pass") + "\"";

String ton = "\"" + request.getParameter("type") + "\"";







try {
	System.out.print("Hello");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ngosystem", "root", "root");
	Statement st = conn.createStatement();
	Statement st1 =conn.createStatement();
	
	String query = "INSERT INTO `ngo`( `Name`, `Address`, `City`, `Pincode`, "
			+ "`Email`, `Mobile`, `Type`, `Password`) " + "VALUES (" 
			+ fullname + "," + address + "," + city + "," + pincode + "," + email + "," + cno + "," + ton + ","
			+ pass + ")";
	System.out.println(query);
	
	
	if (st.executeUpdate(query) != 0) {
	  	session.setAttribute("email",email);
	    response.getWriter().print("<div>You have successfully registered <br>... Please login to continue</div>");
        RequestDispatcher rd = request.getRequestDispatcher("ngoshowid.jsp");
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