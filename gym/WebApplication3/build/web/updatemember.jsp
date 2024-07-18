<%@page import="Controller.MemberDAO"%>
<jsp:useBean id="mb" class="Model.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>

<%
    int status = MemberDAO.update(mb);
    if(status > 0 ){
     String id = request.getParameter("id");
     mb = MemberDAO.getRecordById(Integer.parseInt(id));
     response.sendRedirect("coba.jsp?id=" + id);
    } else{
     response.sendRedirect("errorUpdate.html");
    }
%>