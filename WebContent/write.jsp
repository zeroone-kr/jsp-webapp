<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>게시판 글쓰기</title>
    <link rel="stylesheet" href="./css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
        <div class="container">
            <a class="navbar-brand" href="/simple_bbs/bbs.jsp">환영합니다 ${sessionScope.id}님!!</a>
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
                        <form action="add_record.jsp" method="post" class="was-validated">
                        
                            <div class="mb-3">
                                <label for="validationTitle" class="form-label">글 제목</label>
                                <input class="form-control is-invalid" id="validationTitle" placeholder="내용을 입력하시오!!"
                                    name="subject" required>
                            </div>

                            <div class="mb-3">
                                <label for="userId" class="form-label">글 작성자</label>
                                <input class="form-control" id="userId" name="userId" value="<%= session.getAttribute("id") %>" readonly>
                            </div>

                            <div class="mb-3">
                                <label for="validationTextarea" class="form-label">글 내용</label>
                                <textarea class="form-control is-invalid" rows="10" id="validationTextarea"
                                    placeholder="내용을 입력하시오!!" name="content" required></textarea>
                            </div>



                            <div class="mb-3 d-flex justify-content-center">
                            	<a href="bbs.jsp" class="btn btn-dark d-flex justify-content-center">목록으로 가기</a>
                                <button class="ml-3 btn btn-dark" type="submit">글쓰기 완료</button>
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