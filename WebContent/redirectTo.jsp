<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<%
    String redirectTo = (String) request.getAttribute("redirectTo");
    response.sendRedirect(redirectTo);
%>
