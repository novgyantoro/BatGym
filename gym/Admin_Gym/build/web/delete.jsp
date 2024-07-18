<%@page import="Controller.MemberDAO"%>
<jsp:useBean id="mb" class="Model.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>

<%
    MemberDAO.delete(mb);
    response.sendRedirect("beranda.jsp");
%>