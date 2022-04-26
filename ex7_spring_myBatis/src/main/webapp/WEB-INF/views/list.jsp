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
    <script type="text/javascript">
        $(document).ready(function () {
        	
        	if("${key}")
        		$("#skey").val("${key}").prop("selected", true);

        	$("#mvRegisterBtn").click(function () {
                location.href = "${root}/";
            });
        	
        	$("#searchBtn").click(function () {
                var word = $("#sword").val();
                if(word == "") {
                	alert("모든 목록 조회!!!	");
                }
                $("#searchform").attr("action", "${root}/list").submit();
            });	
        });
    </script>
    

    <div class="container text-center mt-3">
        <div class="col-lg-8 mx-auto">
            <h2 class="p-3 mb-3 shadow bg-light"><mark class="sky">사원 목록</mark></h2>
            <div class="m-3 text-right">
                <button type="button" id="mvRegisterBtn" class="btn btn-link">사원 등록</button>
            </div>
            <div class="m-3 row justify-content-end">
            	<form id="searchform" class="form-inline" method="get">
	            	<select id="skey" name="key" class="form-control">
	            		<option value="eno"> 부서번호
	            		<option value="ename"> 이름
	            		<option value="phone"> 연락처
	            		<option value="dept"> 부서명
	            	</select>
	            	<input type="text" class="ml-1 form-control" id="sword" name="word" value="${word}">
	            	<button type="button" id="searchBtn" class="ml-1 btn btn-outline-primary">검색</button>
            	</form>
            </div>
		<c:if test="${!empty emps}">
			<c:forEach var="emp" items="${emps}">
			<table class="table table-active text-left">
				<thead>
					<tr class="table-info">
						<td>부서번호</td>
						<td>이름</td>
						<td>연락처</td>
						<td>부서명</td>
						<td>수정</td>
						<td>삭제</td>
					</tr>
				</thead>				
				<tbody>
						<td>${emp.eno}</td>
						<td>${emp.ename}</td>
						<td>${emp.phone}</td>
						<td>${emp.dept}</td>
						<td><a href="${root}/modify?eno=${emp.eno}">수정</a></td>
						<td><a href="${root}/delete?eno=${emp.eno}">삭제</a></td>
				</tbody>
		
			</table>
			</c:forEach>
			</c:if>
			
		<c:if test="${empty emps}">
			<table class="table table-active text-center">
				<tr class="table-info">
					<td>등록한 사원이 없습니다.</td>
				</tr>
			</table>
		</c:if>
		</div>
    </div>
</body>
</html>