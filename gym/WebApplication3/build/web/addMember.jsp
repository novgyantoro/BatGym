<%@page import="Controller.MemberDAO"%>
<jsp:useBean id="mb" class="Model.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>

<%
    int i = MemberDAO.simpan(mb);
    if(i > 0){
        response.sendRedirect("success.html");
    }else{
        response.sendRedirect("akunerror.html");
    }
%>