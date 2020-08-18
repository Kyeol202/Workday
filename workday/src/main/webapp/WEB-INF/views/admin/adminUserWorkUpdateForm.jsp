<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<head>
<script type="text/javascript">
	$(document).ready(
			function() {
				$.datepicker.setDefaults($.datepicker.regional['ko']);
				$("#startDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yy-mm-dd",
									maxDate : 14, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									onClose : function(selectedDate) {
										//시작일(startDate) datepicker가 닫힐때
										//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
										$("#endDate").datepicker("option",
												"minDate", selectedDate);
									}

								});
				$("#w_out")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yy-mm-dd 18:00",
									maxDate : 14, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									onClose : function(selectedDate) {
										// 종료일(endDate) datepicker가 닫힐때
										// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
										$("#startDate").datepicker("option",
												"maxDate", selectedDate);
									}

								});
				
				$("#userTimeUpdateOk").click(function() {
					var confirmU = confirm('정말 수정 하시겠습니까?');
					
					if(confirmU == true) {
					var url = "<%=contextPath%>"+"/admin/userTimeUpdateOk";
					$("#userTimeUpdate").attr("action", url);
					$("#userTimeUpdate").submit();
					}
					else false;	
						
				});
				
				
			});
</script>
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
										<h3 class="box-title">출퇴근 수정</h3>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

									</div>
								</div>
							</div>


							<div class="register-box-body">
								<form id="userTimeUpdate" " method="post" name="form">
								<input type="hidden" value="${workRecord.w_id }" name="w_id">
								<input type="hidden" value="${workRecord.u_id }" name="u_id">
									<div class="form-group has-feedback">
										<label>출근 날짜</label> <input type="text" name="w_in" value="${workRecord.w_in }" readonly class="form-control">
									</div>

									<div class="form-group has-feedback">
										<label>퇴근 날짜 : 기본 18시</label> <input type="text" name="w_out"  id="w_out" class="form-control">
									</div>
									<input type="button" id="userTimeUpdateOk" value="최종수정" class="btn btn-info">
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