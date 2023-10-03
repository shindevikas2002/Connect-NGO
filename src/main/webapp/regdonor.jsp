<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
     <%@page import="java.sql.*" %>

<%
String fullname = "\"" + request.getParameter("name") + "\"";
//String NGO_ID = "\"" + request.getParameter("ngo_id") + "\"";
String address = "\"" + request.getParameter("address") + "\"";
String city = "\"" + request.getParameter("city") + "\"";
String pincode = "\"" + request.getParameter("pin_code") + "\"";
String email = "\"" + request.getParameter("email_id") + "\"";
String cno = "\"" + request.getParameter("mobile") + "\"";
String pass = "\"" + request.getParameter("pass") + "\"";

//String ton = "\"" + request.getParameter("type") + "\"";




session.setAttribute("cno",cno);


try {
	System.out.print("Hello");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ngosystem", "root", "root");
	Statement st = conn.createStatement();
	
	
	String query = "INSERT INTO `donator`( `Name`, `Address`, `City`, `Pincode`, "
			+ "`Email`, `CNumber`,  `Password`) " + "VALUES (" 
			+ fullname + "," + address + "," + city + "," + pincode + "," + email + "," + cno +  ","
			+ pass + ")";
	System.out.println(query);
	if (st.executeUpdate(query) != 0) {
		response.getWriter().print("<div>You have successfully Registered... Please login to continue</div>");
		
		System.out.println("done");
		RequestDispatcher rd = request.getRequestDispatcher("index.html");
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