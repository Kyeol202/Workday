<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>
<script>

$(document).ready(function() {
	
	// 승인
	$("#workOut").click(function() {
		var confirmWork = confirm('승인 하시겠습니까?');
		
		if(confirmWork == true) {
		var url = "<%=contextPath%>"+"/user/userWorkOut";
		$("#userWorkOutCheck").attr("action", url);
		$("#userWorkOutCheck").submit();
		}
		else false;		
	});
	
	// 반려
	$("#statusReasonUpdate").click(function() {

		

		var url = "<%=contextPath%>"+"/user/userApprovalUpdate"; 
				$("#statusReasonUpdateForm").attr("action", url);
				$("#statusReasonUpdateForm").submit();

		});

	});
</script>


<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="../user/common/user_main_header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="../user/common/user_left_column.jsp"%>

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
										<h3 class="box-title">출근관리</h3>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

									</div>
								</div>
							</div>
							<ol class="breadcrumb">
								<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
								<li><a href="#">내 출퇴근</a></li>
								<li class="active">출근 입력</li>
							</ol>
							
							<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modal-warning">결재</button>

							<div class="modal modal-warning fade" id="modal-warning">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">X</span>
											</button>
											<h4 class="modal-title">결재</h4>
										</div>
										<form id="statusReasonUpdateForm" method="post">
											<div class="modal-body">
												<p class="reasonText" readonly></p>
												<input type="hidden" name="apv_id" value="${approval.apv_id }"> <select class="form-control" name="apv_ok" value=${approval.apv_ok }>
													<option value="Y">승인</option>
													<option value="N">반려</option>
												</select>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-outline pull-left" data-dismiss="modal">닫기</button>
												<button type="button" class="btn btn-default" id="statusReasonUpdate">저장</button>
											</div>
									</div>
									<!-- /.modal-content -->
								</div>
								</form>
								<!-- /.modal-dialog -->

							</div>

							<div class="box-body">
								<div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
									<div class="row">
										<div class="col-sm-6"></div>
										<div class="col-sm-6"></div>
									</div>
									<div class="row">
										<div class="col-sm-12">
											<table id="example2" class="table table-bordered table-hover dataTable" role="grid">
												<thead>
													<tr role="row">
														
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">사번</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">부서코드</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">결재구분</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">승인구분</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">시작날짜</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">종료날짜</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">신청날짜</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">결재날짜</th>
													</tr>

													</tr>
												</thead>

												<tbody>
													<tr role="row">
														<td onclick="javascript:location.href='<c:url value="/"/>
						                                user/StatusRecordSelectOne?apv_id=${approval.apv_id }'">${approval.u_id }</td>
														<c:if test="${approval.d_id eq 1 }">
															<td>경영지원</td>
														</c:if>
														<c:if test="${approval.d_id eq 2 }">
															<td>연구소</td>
														</c:if>
														<td>${approval.apv_div }</td>
														<c:if test="${approval.apv_ok eq 'Y' }">
															<td>승인</td>
														</c:if>
														<c:if test="${approval.apv_ok eq 'E' }">
															<td>반려</td>
														</c:if>
														<c:if test="${approval.apv_ok eq 'W' }">
															<td>대기</td>
														</c:if>
														<td>${approval.apv_start }</td>
														<td>${approval.apv_end }</td>
														<td>${approval.apv_aply }</td>
														<td>${approval.apv_aplydate }</td>

													</tr>

												</tbody>
											</table>
										</div>
									</div>
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
		<%@ include file="../user/common/user_main_footer.jsp"%>
	</div>
	<!-- ./wrapper -->

</body>

</html>