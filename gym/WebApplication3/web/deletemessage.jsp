<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Controller.MemberDAO,Model.MemberBean,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
    Integer id = (Integer) session.getAttribute("id");
    // Use the id as needed, for example, to fetch user data from the database
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gym Membership Login</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <%
                String id_member = request.getParameter("id");
                MemberBean mb = MemberDAO.getRecordById(Integer.parseInt(id_member));
            %>
    <div class="login-container">
        <div class="login-box">
            <div class="login-image">
                <img src="assets/Image/pngimg.com - batman_PNG87.png" alt="Workout Image">
            </div>
            <div class="login-form">
                <h1>ARE YOU SURE WANT TO DELETE YOUR MEMBER ACCOUNT?</h1>
                <p>If you delete your id, it will be deleted, and you will have to recreate your account, to make member payments.</p>
                <div class="button-container">
                    <a href="deletemember.jsp?id=<%= id %>"><button type="submit">YES</button></a>
                    <a href="coba.jsp?id=<%= mb.getId() %>"><button type="button">BACK</button></a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
