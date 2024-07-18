<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin | Bat Gym</title>
    <link rel="stylesheet" href="beranda.css">
    
</head>
<body>
    <%@page import="Controller.MemberDAO,Model.MemberBean,java.util.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <%
        List<MemberBean> list = MemberDAO.getAllRecords();
        request.setAttribute("list", list);
    %>
    <%
        String username = (String) request.getSession().getAttribute("user");
        if (username != null) {
    %>
    <div class="header">
        <div class="admin-section">
            <h1>HALO <%=username%></h1>
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
            <div class="search-container">
            <form action="search.jsp" method="GET">
            <input type="text" name="search" placeholder="Search by ID or Username...">
            <button type="submit">Search</button>
            </form>
    </div>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>EMAIL</th>
                <th>PACKAGE</th>
                <th>PROGRAM</th>
                <th>ACTION</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="mb" items="${list}">
                <tr>
                    <td>${mb.id}</td>
                    <td>${mb.username}</td>
                    <td>${mb.email}</td>
                    <td>${mb.paket}</td>
                    <td>${mb.program}</td>
                    <td>
                        <a href="editform.jsp?id=${mb.id}">Edit</a>
                        <a href="deletemember.jsp?id=${mb.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <%
        }
    %>
</body>
<div class="search-container">
<a href="index.jsp"><button class="search-container" type="submit">Log Out</button></a>
</div>
</html>
