<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
	<style>
		.redResult{
			color: tomato;
		}
	</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Header 적용 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<c:import url="../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
			<c:import url="../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<c:import url="../temp/professor_header.jsp"></c:import>
		</sec:authorize>
			
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<c:import url="../temp/student_header.jsp"></c:import>
		</sec:authorize>
		<!-- Header 끝 -->

		<!-- Main Contents -->
		<div class="container-fluid">
			<div class="content-wrapper">
				<!-- Contents -->
				<div class="col">
					<!-- header start -->
					<div class="row" style="padding-top:10px">
						<div class="col-12">
							<div class="card">
								<h3 class="my-3 mx-3">강의 수정</h3>
							</div>
						</div>
					</div>
					<!-- header end -->
					
					<form action="./update" id="frm" method="post">
	                	<div class="card card-default">
							<div class="card-header">
								<h3 class="card-title" style="color: white;"><input type="hidden" name="lectureNum" value="${update.lectureNum}"></h3>
          					</div>
          					<!-- card-header start -->
          					<div class="card-body">
								<div class="row">
									<div class="col-6">
                						<label>강의 연도</label>
										<input type="text" name="year" class="form-control" id="year" readonly="readonly" value="${update.year}" style="background:white;color:#17a2b8;font-weight:500;">
									</div>
									<div class="col-6">
	                					<label>강의 학기</label>
										<input type="text" name="semester" class="form-control" id="semester" readonly="readonly" value="${update.semester}" style="background:white;color:#17a2b8;font-weight:500;">
									</div>
	              				</div>
	              				<div class="row" style="margin-top: 20px;">
	              					<div class="col-4">
						                <label>단과대</label>&nbsp;<label style="color:#17a2b8;">(필수)</label>
	                					<select class="form-control" id="collegeNum" name="collegeNum"  onchange="updateDepartment()">
											<option name="collegeNum" id="collegeNum" value="">단과대 선택</option>
							                <c:forEach items="${college}" var="col">
						                    	<option for="collegeNum" value="${col.collegeNum}" ${result.collegeName == col.collegeName ?'selected':''}>${col.collegeName}</option>
						                    </c:forEach>
										</select>
										<div class="mt-1 mx-1" id="collegeResult"></div>
									</div>
									<div class="col-4">
						                <label>학과</label>&nbsp;<label style="color:#17a2b8;">(필수)</label>
	                					<select class="form-control" id="deptNum" name="deptNum">
											<option name="deptNum" id="deptNum" value="">학과 선택</option>
											<c:forEach items="${department}" var="dept">
						                    	<option for="deptNum" value="${dept.deptNum}" ${update.deptNum == dept.deptNum ?'selected':''}>${dept.deptName}</option>
						                    </c:forEach>
										</select>
										<div class="mt-1 mx-1" id="deptResult"></div>
									</div>
                					<div class="col-4">
                						<label>구분</label>&nbsp;<label style="color:#17a2b8;">(필수)</label>
										<select class="form-control" id="category" name="category"">
							                <option name="category" id="category" value="">구분 선택</option>
											<option for="category" value="전공 필수" ${update.category eq '전공 필수' ?'selected':''}>전공 필수</option>
											<option for="category" value="전공 선택" ${update.category eq '전공 선택' ?'selected':''}>전공 선택</option>
											<option for="category" value="교양 필수" ${update.category eq '교양 필수' ?'selected':''}>교양 필수</option>
											<option for="category" value="교양 선택" ${update.category eq '교양 선택' ?'selected':''}>교양 선택</option>
										</select>
										<div class="mt-1 mx-1" id="categoryResult"></div>
                  					</div>
            					</div>
            					<div class="row" style="margin-top: 20px;">
									<div class="col-12">
					                  	<label>강의 이름</label>&nbsp;<label style="color:#17a2b8;">(필수)</label>
					                  	<input type="text" name="lectureName" class="form-control" id="lectureName" placeholder="강의 이름 입력" value="${update.lectureName}">
					              		<div class="mt-1 mx-1" id="nameResult"></div>
					              	</div>
					            </div>
					            <div class="row" style="margin-top: 20px;"> 
					              	<div class="col-4">
					              		<label>대상 학년</label>
										<select class="form-control" id="grade" name="grade"">
						                    <option name="grade" id="grade" value="">학년 선택</option>
											<c:forEach begin="1" end="4" step="1" var="i">
						                    	<option for="grade" value="${i}" ${update.grade == i ?'selected':''}>${i}</option>
						                    </c:forEach>
										</select>
									</div>
									<div class="col-4">
						              	<label>수강 인원</label>
										<select class="form-control" id="personal" name="personal"">
						                    <option name="personal" id="personal" value="">수강 인원 선택</option>
						                    <c:forEach begin="10" end="45" step="5" var="i">
						                    	<option for="personal" value="${i}" ${update.personal == i ?'selected':''}>${i}</option>
						                    </c:forEach>
										</select>
									</div>
									<div class="col-4">
						              	<label>학점</label>
										<select class="form-control" id="completionGrade" name="completionGrade";">
						                    <option name="completionGrade" id="completionGrade" value="">학점 선택</option>
						                    <c:forEach begin="1" end="4" step="1" var="i">
						                    	<option for="completionGrade" value="${i}" ${update.completionGrade == i ?'selected':''}>${i}</option>
						                    </c:forEach>
										</select>
									</div>
								</div>
								<div class="row" style="margin-top: 20px;">
									<div class="col-4">
						              	<label>강의 요일</label>
										<select class="form-control" id="weekday" name="weekday">
							            	<option name="weekday" id="weekday" value="">요일 선택</option>
											<option for="weekday" value="월" ${update.weekday eq '월' ?'selected':''}>월</option>
											<option for="weekday" value="화" ${update.weekday eq '화' ?'selected':''}>화</option>
											<option for="weekday" value="수" ${update.weekday eq '수' ?'selected':''}>수</option>
											<option for="weekday" value="목" ${update.weekday eq '목' ?'selected':''}>목</option>
											<option for="weekday" value="금" ${update.weekday eq '금' ?'selected':''}>금</option>
										</select>
									</div>
									<div class="col-4">
						              	<label>시작 시간</label>
										<select class="form-control" id="startTime" name="startTime"">
						                    <option name="startTime" id="startTime" value="">시작시간 선택</option>
						                    <c:forEach begin="1" end="9" step="1" var="i">
						                    	<option for="startTime" value="${i}" ${update.startTime == i ?'selected':''}>${i}</option>
						                    </c:forEach>
										</select>
									</div>
									<div class="col-4">
						              	<label>종료 시간</label>
										<select class="form-control" id="endTime" name="endTime"">
						                    <option name="endTime" id="endTime" value="">종료시간 선택</option>
						                    <c:forEach begin="1" end="9" step="1" var="i">
						                    	<option for="endTime" value="${i}" ${update.endTime == i ?'selected':''}>${i}</option>
						                    </c:forEach>
										</select>
									</div>
								</div>
								<div style="width:auto; float: right; margin-top: 50px">
					            	<button class="btn btn-primary" type="button" id="btn0">임시등록</button>
					                <button class="btn btn-info" type="button" id="btn1">등록</button>
					                <a class="btn btn-danger" href="./list" style="color: white;">뒤로가기</a>
				                </div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->

	</div>
	<!-- ./wrapper -->
	<script src="/js/professor/lectureForm.js"></script>
	
	<script type="text/javascript">
		function updateDepartment() {
			let college = new Array()
			<c:forEach items = "${college}" var="col" >
	         	/*  console.log(${collegeVO.collegeNum})*/
				college.push(${col.collegeNum})
	        	 /* 1,2,3,4,5,6 */
			</c:forEach>
			$("#deptNum option[value='전체']").remove();   
			$("#deptNum").empty();
	      
			for(let i=0; i<college.length; i++) {
				if($("#collegeNum").val() == college[i]) {
					$("#deptNum").append("<option value=''>학과 선택</option>")
					<c:forEach items="${department}" var="dept">
						if(${dept.collegeNum} == college[i]) {
							$("#deptNum").append("<option value='${dept.deptNum}'>${dept.deptName}</option>")
						}
					</c:forEach>
				}
				if($("#collegeNum").val() == "단과대") {
	          	}
	          
			}
	       console.log(department)
	    }
	</script>
	<script>
		const startTimeSelect = document.getElementById("startTime");
		const endTimeSelect = document.getElementById("endTime");
	
		startTimeSelect.addEventListener("change", function() {
		    const selectedStartTime = parseInt(startTimeSelect.value);
		
		    endTimeSelect.innerHTML = '<option name="endTime" id="endTime" value="">종료시간 선택</option>';
		
		    for (let i = selectedStartTime + 1; i <= 9; i++) {
				const option = document.createElement("option");
		      	option.setAttribute("for", "endTime");
		      	option.setAttribute("value", i);
		      	option.textContent = i;
		      	endTimeSelect.appendChild(option);
		    }
	  	});
		
		/* endTimeSelect.addEventListener("change", function() {
		    const selectedEndTime = parseInt(endTimeSelect.value);
		
		    startTimeSelect.innerHTML = '<option name="startTime" id="startTime" value="">시작시간 선택</option>';
		
		    for (let i = 1; i <= selectedEndTime - 1; i++) {
				const option = document.createElement("option");
		      	option.setAttribute("for", "startTime");
		      	option.setAttribute("value", i);
		      	option.textContent = i;
		      	startTimeSelect.appendChild(option);
		    }
	  	}); */
	</script>

</body>
</html>