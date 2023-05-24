<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 class="fw-bolder">임시 강의 내역 조회</h1>
	<main class="flex-shrink-0">
			<section class="bg-light py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 my-3">
                    	<table class="table table-hover">
                    		<thead style="background-color: black; color: white;">
	                    		<tr>
	                    			<th>강의번호</th>
	                    			<th>강의년도</th>
	                    			<th>학기</th>
	                    			<th>학년</th>
	                    			<th>강의이름</th>
	                    			<th>구분</th>
	                    			<th>관리</th>
	                    		</tr>
	                    	</thead>
	                    	<tbody>
	                    		<c:forEach items="${temporary}" var="LectureVO">
	                    			<tr>
	                    				<td>${LectureVO.lectureNum}</td>
	                    					<td>${LectureVO.year}</td>
 											<td>${LectureVO.semester}학기</td>
 											<td>${LectureVO.grade}</td>
 											<td>${LectureVO.lectureName}</td>
 											<td>${LectureVO.category}</td>
 											<td>
 												<button><a href="./update?lectureNum=${LectureVO.lectureNum}" style="color: black;">수정</a></button>
 												<button>삭제</button>
 											</td>
	                    			</tr>
	                    		</c:forEach>
	                    	</tbody>
                    	</table>
                    </div>
                    <button><a href="./list" style="color: black;">뒤로가기</a></button>
                    
                </div>
             </section>
             
            
             
      </main>

</body>
</html>