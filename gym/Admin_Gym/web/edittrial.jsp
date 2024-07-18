<%@page import="Controller.MemberDAO"%>
<%@page import="Model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mb" class="Model.MemberBean"/>
<jsp:setProperty property="*" name="mb"/>

<%
    int status = MemberDAO.update(mb);
    if (status > 0) {
        response.sendRedirect("beranda.jsp");
    } else {
        out.println("Gagal melakukan update member.");
    }
%>
