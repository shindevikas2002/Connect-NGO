<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*"%>

<%
    int ngoid = Integer.parseInt(request.getParameter("ngoid"));
	String dis=request.getParameter("description");
	String itemname=request.getParameter("itemname");

	
	
	
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ngosystem", "root", "root");
        String sql = "UPDATE items SET status='collected' WHERE Ngo_id=? AND description=? AND itemname=?";
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setInt(1, ngoid); // assuming itemId is the ID of the item you want to update
        pstmt.setString(2, dis);
        pstmt.setString(3, itemname);
        int rowsUpdated = pstmt.executeUpdate();
        if (rowsUpdated > 0) {
            out.println("Status updated successfully");
        } else {
            out.println("Status update failed");
        }
        connection.close();
        response.sendRedirect("ngohome.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
