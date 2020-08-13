<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
</head>



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
										<h3 class="box-title">휴가/반차 신청</h3>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

									</div>
								</div>
							</div>


							<div class="register-box-body">
								<form action="<%=contextPath %>/user/userRequest" method="post" name="form">
									<br> <select class="form-control" name="searchSort" id="searchSort">
										<option value="apv_div">휴가</option>
										<option value="apv_div">반차</option>
									</select>



									<div class="form-group has-feedback">
										<label>신청날짜</label> <input type="text" id="datePicker" class="form-control">
									</div>
									<button type="button" id="click-btn">날짜 값 확인용</button>

									<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
									<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js">
										
									</script>
									<script type="text/javascript">
										$('#datePicker').datepicker({
											format : "yyyy-mm-dd", // 달력에서 클릭시 표시할 값 형식
										});

										$('#click-btn').on('click', function() {
											var date = $('#datePicker').val();
											alert(date);
										});
									</script>
									<input type="submit" id="userRequestOk" value="신청">
									</form>
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