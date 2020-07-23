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
		userGtoAjaxfn(1);	//현재 page =1 ->기본시작, 접근하는 순간 시작
	})

	// 리스트 Ajax 처리
	function userGtoAjaxfn(cPage) {
		$.ajax({
			url: "<c:url value="/"/>userGto/userGtoAjax",
			data: {
				"cPage": cPage,
				"searchSort": searchSort,
				"searchVal": searchVal,
			},
			dataType: "html",
			success: function (data) {
				$('#userGtoId').html(data);
			}
		})
	}

	//search ----------------------
	function searchBoxFn() {
		searchSort = $('#searchSort').val();
		searchVal = $('#searchVal').val();
		userGtoAjaxfn(1);
	}

	
	
	
	 
// 	jQuery함수 (출근버튼을 눌렀을 시 TAManagement Insert 되야함)
	$(document).ready(function() {
			
	$("#gtoStart").click(function() {
		var url = "<%=contextPath%>"+"/user/userGtoCheck";
		$("#userGtoStart").attr("action", url);
		$("#userGtoStart").submit();
	})	
		
		
		
	})//function end

	
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
										<h3 class="box-title">내 출근관리</h3>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										
									</div>
								</div>
							</div>
			<ol class="breadcrumb">
      			  <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    		    <li><a href="#">내 출퇴근</a></li>
     		   <li class="active">출근 입력</li>
    		  </ol>
			<div class="box">
			<form id="userGtoStart" method="post">
            <div class="box-header">
            	<input type="hidden" name="u_id" value="${loginUser.u_id }">
            	<input type="hidden" name="dp_name" value="${loginUser.dp_name }">
				<input type="hidden" name="u_name" value="${loginUser.u_name }">
				<input type="hidden" name="u_position" value="${loginUser.u_position }">
              <input type="button" id="gtoStart" value="출근" onclick="confirm('출근 하시겠습니까?')"
              class="btn btn-success">
            </div>
            </form>
            
            
            <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
									<div class="row">
										<div class="col-sm-6"></div>
										<div class="col-sm-6">
											<div id="example1_filter" class="dataTables_filter">
												<form action="javascript:searchBoxFn()">
													<div class="box-tools">
														<select class="form-control" name="searchSort" id="searchSort">
															<option value="u_id">번호</option>
														</select>
														<div class="input-group input-group-sm" style="width: 150px;">
															<input type="text" name="searchVal" id="searchVal"
																class="form-control pull-right" placeholder="Search">
															<div class="input-group-btn">
																<button type="submit" class="btn btn-default"><i
																		class="fa fa-search"></i></button>
															</div>
														</div>
													</div>
												</form>
											</div>

										</div>
									</div>

									<div id="userGtoId"></div>

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
            
            
            
            
            
            
          