<%@page import="java.util.List"%>
<%@page import="Model.MemberBean"%>
<%@page import="Controller.MemberDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String searchParam = request.getParameter("search");

    // Perform search by ID or username
    List<MemberBean> searchResults = MemberDAO.searchRecords(searchParam);
    request.setAttribute("searchResults", searchResults);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin | Bat Gym - Search Results</title>
    <link rel="stylesheet" href="beranda.css">
</head>
<body>
    

    <div class="search-container">
        <h2>Search Results for "<%= searchParam %>"</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Package</th>
                    <th>Program</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="mb" items="${searchResults}">
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
    </div>

  
</body>
</html>
