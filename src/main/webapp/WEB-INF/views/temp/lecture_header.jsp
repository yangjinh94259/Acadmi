<%@page import="com.acadmi.department.DepartmentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Preloader -->
<div class="preloader flex-column justify-content-center align-items-center">
	<img class="animation__shake" src="/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
</div>

<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	<!-- Left navbar links -->
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
		</li>		
	</ul>
	<!-- Header -->
	<sec:authorize access="hasRole('ROLE_PROFESSOR')">
		<a href="/lecture/main?lectureNum=${lecture.lectureNum}" style="font-weight: bold;">${lecture.lectureName}</a>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_STUDENT')">
		<a href="/student/lecture/main?lectureNum=${lecture.lectureNum}" style="font-weight: bold;">${lecture.lectureName}</a>
	</sec:authorize>
	
	<!-- Right navbar links -->
	<ul class="navbar-nav ml-auto">

		<!-- 알림 -->
		<li class="nav-item dropdown">
			<a class="nav-link" data-toggle="dropdown" href="#">
				<i class="far fa-bell"></i>
				<span class="badge badge-warning navbar-badge" id="notification"></span>
			</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<span class="dropdown-item dropdown-header" id="allNotification"></span>
				<div class="dropdown-divider"></div>
					<a href="/notification/list?notificationKind=1" class="dropdown-item">
						<i class="fas fa-envelope mr-2"></i> 
						<span id="noticeNotification"></span>
					</a>
				
				<sec:authorize access="hasRole('ROLE_PROFESSOR')">
					<a href="/notification/list?notificationKind=3" class="dropdown-item">
						<i class="fas fa-users mr-2"></i>
						<span id="qnaReplyNotification"></span>
					</a>
					<a href="/notification/list?notificationKind=5" class="dropdown-item">
						<i class="fas fa-users mr-2"></i>
						<span id="lectureQnaNotification"></span>
					</a>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_STUDENT')">
					<a href="/notification/list?notificationKind=4" class="dropdown-item">
						<i class="fas fa-users mr-2"></i>
						<span id="lectureNoticeNotification"></span>
					</a>
					<a href="/notification/list?notificationKind=3" class="dropdown-item">
						<i class="fas fa-users mr-2"></i>
						<span id="qnaReplyNotification"></span>
					</a>
					<a href="/notification/list?notificationKind=6" class="dropdown-item">
						<i class="fas fa-users mr-2"></i>
						<span id="lectureQnaReplyNotification"></span>
					</a>
				</sec:authorize>
					<div class="dropdown-divider"></div>
				<a href="/notification/list" class="dropdown-item dropdown-footer">알림 전체보기</a>
			</div>
		</li>

		<!-- 채팅 -->
		<li class="nav-item dropdown">
			<a class="nav-link" href="/chat/list">
				<i class="far fa-comments"></i>
				<span class="badge badge-danger navbar-badge" id="chat"></span>
			</a>
		</li>

		<!-- 로그아웃 -->
		<li class="nav-item">
			<a class="nav-link" href="/member/logout" role="button">
				<i class="fas fa-right-to-bracket"></i>
			</a>
		</li>
	</ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-info elevation-4">
	<!-- Brand Logo -->
	<a href="/" class="brand-link">
		<img src="/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">Acadmi!</span>
    </a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<sec:authorize access="hasRole('PROFESSOR')">
					<img src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927" class="img-circle elevation-2" alt="User Image">
					<sec:authentication property="Principal" var="user"/>
					<a href="/member/professorPage?username=${user.username}">PROFESSOR</a>
				</sec:authorize>
				
				<sec:authorize access="hasRole('STUDENT')">
					<img src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927" class="img-circle elevation-2" alt="User Image">
	                <sec:authentication property="Principal" var="user"/>
	                <a href="/member/studentPage?username=${user.username}">STUDENT</a>
				</sec:authorize>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
			<!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
			
				<!-- 내 강의 -->
				<li class="nav-item">
					<a href="#" class="nav-link" id="professorLectureLink">
						<i class="nav-icon fas fa-chalkboard"></i>
						<p>
							내 강의
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="/lecture/list" class="nav-link">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>강의 목록</p>
							</a>
						</li>
					</ul>
				</li>
				
				<!-- 수강 -->
				<li class="nav-item" id="creditItem">
					<a href="#" class="nav-link" id="creditLink">
						<i class="nav-icon fas fa-chalkboard-user"></i>
						<p>
							성적
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="/credit/list" class="nav-link" id="creditManagement">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>성적 관리</p>
							</a>
						</li>
					</ul>
				</li>
	
				<!-- 게시판 -->
				<li class="nav-item" id="boardItem">
					<a href="#" class="nav-link" id="boardLink">
						<i class="nav-icon fas fa-comment-dots"></i>
						<p>
							게시판
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="/notice/list" class="nav-link" id="noticeLink">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>공지사항</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="/qna/list" class="nav-link" id="qnaLink">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>질의응답</p>
							</a>
						</li>
					</ul>
				</li>
				
			</ul>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
			<!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
			
				<!-- 내 강의 -->
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-chalkboard"></i>
						<p>
							내 강의
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="/student/myLectureList" class="nav-link">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>강의 목록</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="/student/myCreditList" class="nav-link">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>성적 조회</p>
							</a>
						</li>
					</ul>
				</li>
				
				<!-- 수강 -->
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-chalkboard-user"></i>
						<p>
							수강
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="#" class="nav-link" onclick="handleAllLectureClick()">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>수강 신청 & 장바구니</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link" onclick="handleMyLectureClick()">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>내 수강 신청</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link" onclick="handleMyFavoriteClick()">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>내 장바구니</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link" onclick="handleTimetableClick()">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>시간표 조회</p>
							</a>
						</li>
					</ul>
				</li>
	
				<!-- 게시판 -->
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-comment-dots"></i>
						<p>
							게시판
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="/notice/list" class="nav-link">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>공지사항</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="/qna/list" class="nav-link">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>질의응답</p>
							</a>
						</li>
					</ul>
				</li>
				
			</ul>
		</sec:authorize>
		
		</nav>
		<!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>

<style>
.fa-circle {
	margin: 0 8px;
}
</style>
<sec:authorize access="hasRole('ROLE_PROFESSOR')">
	<script src="/js/sidebarActive/professorSidebarActive.js"></script>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_STUDENT')">
	<script src="/js/sidebarActive/studentSidebarActive.js"></script>
</sec:authorize>