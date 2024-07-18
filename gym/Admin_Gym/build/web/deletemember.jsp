<%@page import="Controller.MemberDAO,Model.MemberBean"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String idParam = request.getParameter("id");
    if (idParam != null && !idParam.isEmpty()) {
        int id = Integer.parseInt(idParam);
        MemberBean mb = MemberDAO.getRecordById(id);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gym Membership Deletion Confirmation</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <div class="login-image">
                <img src="pngimg.com - batman_PNG87.png" alt="Workout Image">
            </div>
            <div class="login-form">
                <h1>ARE YOU SURE YOU WANT TO DELETE THIS MEMBER ACCOUNT?</h1>
                <p>users will not be able to use this account anymore..</p>
                <div class="button-container">
                    <a href="delete.jsp?id=<%= id %>"><button type="submit">YES</button></a>
                    <a href="beranda.jsp"><button type="button">BACK</button></a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%
    } else {
        out.println("Invalid member ID");
    }
%>
