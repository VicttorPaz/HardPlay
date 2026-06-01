
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
  
    HttpSession sesionABorrar = request.getSession(false);

    if (sesionABorrar != null) {
    
        sesionABorrar.invalidate(); 
    }
    response.sendRedirect("index.jsp");
%>