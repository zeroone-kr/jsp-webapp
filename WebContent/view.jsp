<%@page import="beans.BoardRecord"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<jsp:useBean id="boardManager" class="dao.BoardManager" scope="application"/>
	
<%
request.setCharacterEncoding("utf-8");
Long boardId = Long.parseLong(request.getParameter("no"));
boardManager.updateHit(boardId);
BoardRecord br = boardManager.findBoardRecord(boardId);
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>글 내용</title>
  <link rel="stylesheet" href="./css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    <div class="container">
      <a class="navbar-brand" href="#!">환영합니다 ${sessionScope.id}님!!</a>
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
        <div class="row d-flex justify-content-center">
          <div class="col">
          
            <form method="post">
			  <input type="hidden" name="recordId" value="<%= br.getRecordId() %>"/>

              <div class="mb-3">
                <label for="validationTitle" class="form-label">글 제목</label>
                <input class="form-control" style="background-color:whitesmoke;" name="subject" value="<%= br.getSubject()%>" readonly>
              </div>

              <div class="row">
                <div class="col">
                  <div class="mb-3">
                    <label for="validationTitle" class="form-label">작성자</label>
                    <input class="form-control" style="background-color:whitesmoke;" name="userId" value="<%= br.getUserId() %>" readonly>
                  </div>
                </div>

                <div class="col">
                  <div class="mb-3">
                    <label for="validationTitle" class="form-label">작성 날짜</label>
                    <input class="form-control" style="background-color:whitesmoke;" name="modifiedTime" value="<%= br.getModifiedTime() %>"  readonly>
                  </div>
                </div>
              </div>

              <div class="mb-3">
                <label for="validationTextarea" class="form-label">글 내용</label>
                <textarea class="form-control" style="background-color:whitesmoke;" name="content" rows="10" readonly><%= br.getContent() %></textarea>
              </div>

              <div class="mb-3 d-flex justify-content-center">
                <a href="bbs.jsp" class="btn btn-dark" type="submit">목록으로 가기</a>
                <button formaction="update_view.jsp" formmethod="post" class="ml-3 btn btn-dark" style="width:60px" >수정</button>
                <button formaction="delete_view.jsp" formmethod="post" class="ml-3 btn btn-dark" style="width:60px" >삭제</button>
              </div>
            </form>
            
          </div>
        </div>
      </div>

      <div class="col-1"></div>
    </div>
  </div>


</body>

</html>