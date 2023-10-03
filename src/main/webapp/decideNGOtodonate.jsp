<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>
<%
String cno=session.getAttribute("cno").toString();
    String itemname = request.getParameter("category");
    int qty = Integer.parseInt(request.getParameter("Quantity"));
    String description = request.getParameter("desc");
    String ngoName = request.getParameter("selectedId");
    String CNumber=request.getParameter("cno");
    
    String sql = "INSERT INTO items(itemname, qty, description, ngo_id,CNumber) VALUES (?, ?, ?, ?,?)";
   // discription
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngosystem", "root", "root");
        PreparedStatement pstmt = conn.prepareStatement(sql);
        Statement stmt = conn.createStatement();
        String q1 = "SELECT Ngo_id FROM ngo WHERE name = '" + ngoName + "'";
        ResultSet rs = stmt.executeQuery(q1);
        
        int ngo_id = 0;
        if (rs.next()) {
            ngo_id = rs.getInt("Ngo_id");
        }
        
        pstmt.setString(1, itemname);
        pstmt.setInt(2, qty);
        pstmt.setString(3, description);
        pstmt.setInt(4, ngo_id);
        pstmt.setString(5, cno); // replace with CNumber if needed
        System.out.println("done11");
        pstmt.executeUpdate();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
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

    <h1>Thank you for your donation!</h1>
</body>
</html>
