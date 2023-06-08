<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.BoardRecord"%>
<%@page import="java.util.Iterator"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<jsp:useBean id="boardManager" class="dao.BoardManager" scope="application"/>
<%
request.setCharacterEncoding("utf-8");

if(session.getAttribute("id") == null){
	response.sendRedirect("login.html");
}

Integer auth = (Integer)request.getAttribute("auth");

if(auth != null){
	if(auth == 0){
%>

<%= "<script>alert(\"권한이 없습니다. 게시글 관리자에게 문의하세요\")</script>"  %>

<% 

	}
}
%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시판</title>
    <link rel="stylesheet" href="./css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
        <div class="container">
            <a class="navbar-brand">환영합니다 ${sessionScope.id}님!!</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="logout.jsp">
                            로그아웃
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Page content-->
    <div class="container ">
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">

                <div class="row mt-5"></div>
                <div class="row mt-3 mb-3 d-flex justify-content-end">

                    <!--  <select name="searchType" style="width:80px" title="검색할 명을 선택해주세요">
                        <option value="s">제목</option>
                        <option value="c">내용</option>
                        <option value="sc">제목+내용</option>
                        <option value="w">작성자</option>
                    </select>

                    <input name="searchStr"  style="width:165px" title="검색어를 입력해주세요" type="text">


                    <button class="btn btn-dark"style="width:55px" type="submit">검색</button>-->
                </div>

                <div class="row d-flex justify-content-center">

                    <table class="table table-sm table-bordered  table-hover overflow-scroll ">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">제목</th>
                                <th scope="col">작성자</th>
                                <th scope="col">조회수</th>
                                <th scope="col">작성일</th>

                            </tr>
                        </thead>
                        <tbody>
                        
<%
List<BoardRecord> list = boardManager.findAllBoardRecord();
if(list != null){
	Iterator<BoardRecord> iter  = list.iterator();
	BoardRecord record;

	while(iter.hasNext()){
		record= iter.next();
%>
                        				
<%= 
"<tr onclick=go(\""+record.getRecordId()+"\")><td>"+record.getRecordId()+"</td><td>"+record.getSubject()+ "</td><td>" 
+record.getUserId()+ "</td><td>"+record.getHit()+"</td><td>"+record.getModifiedTime()+"</td></tr>" 
%>

<%
	}
}
%>
                        </tbody>
                    </table>
                </div>


                <div class="">
                    <div class="row mb-3 d-flex justify-content-end">

                        <a href="write.jsp" class="btn btn-dark" style="width:80px" type="submit">글쓰기</a>
                    </div>

                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-1"></div>
        </div>

    </div>
    <!-- Bootstrap core JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <!-- <script src="js/scripts.js"></script> -->
    <script>
    	function go(no){
    		var url="view.jsp?no="+no;
    		location.href=url;
    	}
    </script>
</body>

</html>