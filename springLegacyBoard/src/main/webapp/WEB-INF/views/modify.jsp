<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

    <div class="container text-center mt-3">
        <div class="col-lg-8 mx-auto">
            <h2 class="p-3 mb-3 shadow bg-light"><mark class="orange">사원정보 수정</mark></h2>
            <form id="memberform" class="text-left mb-3" method="post" action="${root}/modify">
            <input type="hidden" id="eno" name="eno" value="${emp.eno}">
                <div class="form-group">
                    <label for="ename">이름</label>
                    <input type="text" class="form-control" id="ename" name="ename" placeholder="이름입력..." value="${emp.ename}" >
                </div>
                <div class="form-group">
                    <label for="연락처">연락처</label>
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="연락처입력..."value="${emp.phone}">
                </div>
                <div class="form-group">
                    <label for="dept">부서</label>
                    <input type="text" class="form-control" id="dept" name="dept" placeholder="부서입력..."value="${emp.dept}">
                </div>
                <div class="form-group text-center">
                    <button type="submit" id="modifyBtn" class="btn btn-outline-primary">사원정보 수정</button>
                    <button type="reset" class="btn btn-outline-danger">초기화</button>
                </div>
            </form>
        </div>
    </div>
    <div class="form-group text-center">
    <button type="button" id="listBtn" class="btn btn-outline-success">사원목록</button>
	  </div>
</body>
</html>