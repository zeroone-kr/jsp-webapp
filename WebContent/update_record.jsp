<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="boardManager" class="dao.BoardManager" scope="application"/>
<jsp:useBean id="record" class="beans.BoardRecord" scope="page"/>
<jsp:setProperty name="record" property="recordId"/>
<jsp:setProperty name="record" property="userId"/>
<jsp:setProperty name="record" property="subject"/>
<jsp:setProperty name="record" property="content"/>

<%
	if(record.getUserId().equals((String)session.getAttribute("id"))){  //사용자 id변조 확인
		boardManager.updateBoardRecord(record);
		response.sendRedirect("bbs.jsp");
	}else{
		System.out.println("auth fail");	
		request.setAttribute("auth", 0);
		pageContext.forward("/bbs.jsp");
	}
%>
