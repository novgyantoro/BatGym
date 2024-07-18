<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Member | Bat Gym</title>
    <link rel="stylesheet" href="beranda.css">
</head>
<body>
    <%@page import="Controller.MemberDAO,Model.MemberBean"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <%
        String id = request.getParameter("id");
        MemberBean mb = MemberDAO.getRecordById(Integer.parseInt(id));
        request.setAttribute("member", mb);
    %>
    <div class="header">
        <div class="admin-section">
            <h1>EDIT FORM</h1>
            <p>www.batgym.com</p>
        </div>
        <div class="contact-section">
            <p>+62-746-7890</p>
            <p>888 Kenanga St, Jakarta</p>
        </div>
        <div class="logo-section">
            <h1>BAT GYM</h1>
        </div>
    </div>
    <form action="edittrial.jsp" method="post">
        <input type="hidden" name="id" value="${member.id}"/>
        <table>
            <thead>
                <tr>
                    <th>Field</th>
                    <th>Value</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>ID</td>
                    <td>${member.id}</td>
                </tr>
                <tr>
                    <td>Username</td>
                    <td><input class="update-edit" type="text" name="username" value="${member.username}"/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input class="update-edit" type="text" name="email" value="${member.email}"/></td>
                </tr>
                <tr>
                    <td>Package</td>
                    <td><input class="update-edit" type="text" name="paket" value="${member.paket}"/></td>
                </tr>
                <tr>
                    <td>Program</td>
                    <td><input class="update-edit" type="text" name="program" value="${member.program}"/></td>
                </tr>
<!--                <tr>
                    <td colspan="2"><input type="submit" value="Update Member"/></td>
                </tr>-->
            </tbody>
        </table>
                <div class="search-container">
                <input class="update" type="submit" value="Update Member"/>
                <a href="beranda.jsp"><input class="update" type="submit" value="Back"/></a>
                </div>
    </form>
</body>
</html>
    