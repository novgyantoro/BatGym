<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Controller.MemberDAO,Model.MemberBean,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BAT GYM</title>
    <link rel="stylesheet" href="profile.css">
</head>
<body>
    <div class="container">
        <div class="profile-info">
            <center>
            <%
                String id_member = request.getParameter("id");
                MemberBean mb = MemberDAO.getRecordById(Integer.parseInt(id_member));
            %>
            <h1>Hi welcome <%= mb.getUsername() %></h1>
            <div>
                <span>ID</span>
                <input type="text" value="<%= mb.getId() %>" readonly>
            </div>
            <div>
                <span>Username</span>
                <input type="text" value="<%= mb.getUsername() %>" readonly>
            </div>
            <div>
                <span>Email</span>
                <input type="text" value="<%= mb.getEmail() %>" readonly>
            </div>
            <div>
                <span>Package</span>
                <input type="text" value="<%= mb.getPaket() %>" readonly>
            </div>
            <div>
                <span>Program</span>
                <input type="text" value="<%= mb.getProgram() %>" readonly>
            </div>
<!--            <div>
                <span>Password</span>
                <input type="text" value="<%= mb.getPassword() %>" readonly>
            </div>-->
            </center>
        </div>
        <a href="updateform.jsp?id=<%= mb.getId() %>"><div class="switch-button">Edit Account</div></a>
        <a href="deletemessage.jsp?id=<%= mb.getId() %>"><div class="personal-info-button">Delete Account</div></a>
        <a href="login.html"><div class="personal-info-button exit">Exit</div></a>
    </div>
</body>
</html>
