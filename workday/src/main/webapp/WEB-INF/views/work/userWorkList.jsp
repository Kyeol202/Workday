<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>

<script>
	var searchSort = "";	//변수 초기화
	var searchVal = "";		//변수 초기화

	$(function () {
		// 페이지 처음 접근시 리스트 표시 좌표
		workListAjaxfn(1);	//현재 page =1 ->기본시작, 접근하는 순간 시작
	})

	// 리스트 Ajax 처리
	function workListAjaxfn(cPage) {
		$.ajax({
			url: "<c:url value="/"/>user/userworkListAjax",
			data: {
				"cPage": cPage,
				"searchSort": searchSort,
				"searchVal": searchVal,
			},
			dataType: "html",
			success: function (data) {
				$('#user_workList').html(data);
			}
		})
	}

	//search ----------------------
	function searchBoxFn() {
		searchSort = $('#searchSort').val();
		searchVal = $('#searchVal').val();
		workListAjaxfn(1);
	}

</script>
<script>
//jQuery 함수

$(document).ready(function() {
	
	
	$("#userWorkIn").click(function() {
		var confirmWork = confirm('출근 하시겠습니까?');
		
		if(confirmWork == true) {
		var url = "<%=contextPath%>"+"/user/workInCheck";
		$("#userWorkInCheck").attr("action", url);
		$("#userWorkInCheck").submit();
		}
		else false;
	})


});


</script>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="../user/common/user_main_header.jsp" %> 

		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="../user/common/user_left_column.jsp" %>
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<div class="row">
									<div class="col flexBox" style="justify-content: flex-start; padding: 0 16px;">
										<h3 class="box-title">근태관리</h3>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										
									</div>
								</div>
							</div>
							<div>
							<c:choose>
							<c:when test="${loginUser.u_id eq 1 }">
							<form id="userWorkInCheck" method="post">
							<input type="hidden" name="u_id" value="${loginUser.u_id }">
							<input type="hidden" name="d_id" value="${loginUser.d_id }">
							<input type="hidden" name="u_name" value="${loginUser.u_name }">
							<input type="hidden" name="u_position" value="${loginUser.u_position }">
							<input type="hidden" class="btn btn-success" id="userWorkIn" value="출근">					
							</form>
							</c:when>
							<c:otherwise>
							<form id="userWorkInCheck" method="post">
							<input type="hidden" name="u_id" value="${loginUser.u_id }">
							<input type="hidden" name="d_id" value="${loginUser.d_id }">
							<input type="hidden" name="u_name" value="${loginUser.u_name }">
							<input type="hidden" name="u_position" value="${loginUser.u_position }">
							<input type="button" class="btn btn-success" id="userWorkIn" value="출근">					
							</form>
							</c:otherwise>
							</c:choose>
							</div>
							
							

<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
									<div class="row">
										<div class="col-sm-6"></div>
										<div class="col-sm-6">
											<div id="example1_filter" class="dataTables_filter">

											</div>

										</div>
									</div>

									<div id="user_workList"></div>

								</div>
							</div>
						</div>
					</div>
				</div>

			</section>
			<!-- /.content -->



		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="../user/common/user_main_footer.jsp" %>
	</div>
	<!-- ./wrapper -->

</body>

</html>