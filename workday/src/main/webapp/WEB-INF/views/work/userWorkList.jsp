<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>
<script>
//jQuery 함수

$(document).ready(function() {
	
	$("#userWorkIn").click(function() {
		var url = "<%=contextPath%>"+"/user/userWorkIn";
		$("#userWorkInCheck").attr("action", url);
		$("#userWorkInCheck").submit();
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
							<form id="userWorkInCheck" method="post">
							<input type="hidden" name="u_id" value="${loginUser.u_id }">
							<input type="hidden" name="d_id" value="${loginUser.d_id }">
							<input type="hidden" name="u_name" value="${loginUser.u_name }">
							<input type="hidden" name="u_position" value="${loginUser.u_position }">
							<input type="button" class="btn btn-success" id="userWorkIn" value="출근">					
							</form>
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