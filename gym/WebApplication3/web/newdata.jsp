<%@page import="Controller.MemberDAO,Model.MemberBean"%>

<%
    String id = request.getParameter("id");
    MemberBean mb = MemberDAO.getRecordById(Integer.parseInt(id));
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Member</title>
    <link rel="stylesheet" href="profile.css">
</head>
<body>
    <div class="container">
        <div class="profile-info">
            <center>
            <form action="updatemember.jsp" method="post">
                <div>
                    <span>ID</span>
                    <input type="text" name="id" value="<%= mb.getId() %>">
                </div>
                <div>
                    <span>Username</span>
                    <input type="text" name="username" value="<%= mb.getUsername() %>">
                </div>
                <div>
                    <span>Email</span>
                    <input type="email" name="email" value="<%= mb.getEmail() %>">
                    <input style="display: none" name="password" value="<%= mb.getPassword() %>">
                </div>
                <div>
                    <span>Package</span>
                    <input type="text" name="paket" value="<%= mb.getPaket() %>">
                </div>
                <div>
                    <span>Program</span>
                    <input type="text" name="program" value="<%= mb.getProgram() %>">
                </div>
                <button type="submit">Update</button>
            </form>
       
            </center>
        </div>
        <div class="switch-button">Update Profile</div>
        <a href="login.html"><div class="personal-info-button exit">EXIT</div></a>
    </div>
</body>
</html>
