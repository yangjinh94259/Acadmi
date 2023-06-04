<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<!-- Header 적용 -->
		<c:import url="../temp/header.jsp"></c:import>
		<!-- Header 끝 -->
		<div class="container-fluid">
			<div class="row">
				<!-- 2레벨 Sidebar 적용 -->
				<div class="content-wrapper">
				</div>
				<!-- 2레벨 Sidebar 끝 -->
					
				<!-- Contents -->
				<div class="col">
					<section class="content">
						<!-- 알림의 종류의 네비바 -->					
						<div class="btn-group w-100 mb-2">
							
									<a class="btn btn-info" href="./list?notificationKind=1" id="noticeButton">공지사항</a>
								
								<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
									
										<a class="btn btn-info" href="./list?notificationKind=2" id="qnaButton">질의응답</a>
									
										<a class="btn btn-info" href="./list?notificationKind=7" id="lectureButton">강의등록</a>
									
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_PROFESSOR')">
									
										<a class="btn btn-info" href="./list?notificationKind=3" id="qnaReplyButton">질의응답 답글</a>
									
										<a class="btn btn-info" href="./list?notificationKind=5" id="lectureQnaButton">강의 질의응답</a>
									
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_STUDENT')">
									
										<a class="btn btn-info" href="./list?notificationKind=3" id="qnaReplyButton">질의응답 답글</a>
									
										<a class="btn btn-info" href="./list?notificationKind=4" id="lectureNoticeButton">강의공지사항</a>
									
										<a class="btn btn-info" href="./list?notificationKind=6" id="lectureQnaReplyButton">강의질의응답 답글</a>
									
								</sec:authorize>
							
						</div>
					
						<!-- 알림 내용 -->
						<div class="card">
							<div class="card-header">
								<h3 class="card-title" id="cardTitle"></h3>
								<div class="card-tools">
									<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
										<i class="fas fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="card-body p-0" id="allLectureList">
								<table class="table table-hover text-nowrap">
									 <thead>
									 	<tr>
									 		<th style="width: 8%">번호</th>
									 		<th style="width: 8%">알림</th>
									 		<th style="width: 8%">날짜</th>
									 		<th style="width: 8%"></th>
									 	</tr>
									 </thead>
									 <tbody>
									 	<c:forEach items="${list}" var="notificationVO">
									 		<tr>
									 			<td>${notificationVO.notificationNum}</td>
									 			<td>
									 				<!-- 나중에 a링크 경로 바꿔야한다 -->
									 				<c:if test="${notificationVO.notificationKind eq 1}">
									 					<a href="../notice/detail?num=${notificationVO.num}&notificationNum=${notificationVO.notificationNum}">
									 				</c:if>
									 				<c:if test="${notificationVO.notificationKind eq 2}">
									 					<a href="../qna/detail?num=${notificationVO.num}">
									 				</c:if>
									 				<c:if test="${notificationVO.notificationKind eq 3}">
									 					<a href="../qna/detail?num=${notificationVO.num}">
									 				</c:if>
									 				<c:if test="${notificationVO.notificationKind eq 4}">
									 					<a href="../lecture/notice/detail?num=${notificationVO.num}">
									 				</c:if>
									 				<c:if test="${notificationVO.notificationKind eq 5}">
									 					<a href="../lecture/qna/detail?num=${notificationVO.num}">
									 				</c:if>
									 				<c:if test="${notificationVO.notificationKind eq 6}">
									 					<a href="../lecture/qna/detail?num=${notificationVO.num}">
									 				</c:if>
									 				<c:if test="${notificationVO.notificationKind eq 7}">
									 					<a href="../lecture/detail?num=${notificationVO.lectureNum}">
									 				</c:if>
									 						${notificationVO.notificationMsg}
									 					</a>
												</td>
												<td>${notificationVO.notificationDate}</td>
												<c:if test="${notificationVO.notificationStatus == 0 or notificationVO.notificationStatus == 1}">
													<td><button type="button" class="float-right btn btn-info saveNotification" data-notification-num="${notificationVO.notificationNum}" data-notification-kind="${notificationVO.notificationKind}">알림저장</button></td>
												</c:if>
												<c:if test="${notificationVO.notificationStatus eq 2}">
													<td><button type="button" class="float-right btn btn-danger cancleNotification" data-notification-num="${notificationVO.notificationNum}" data-notification-kind="${notificationVO.notificationKind}">저장취소</button></td>
												</c:if>
									 		</tr>
									 	</c:forEach>
									 </tbody>
								</table>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
		
		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->
		<script src="../js/notification/notificationList.js"></script>
	</div>
<!-- ./wrapper -->
</body>
</html>