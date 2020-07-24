<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>

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
			<div class="box">

            <form id="userOwStart" method="post">
            <div class="box-header">
            	<input type="hidden" name="u_id" value="${loginUser.u_id }">
            	<input type="hidden" name="dp_name" value="${loginUser.dp_name }">
				<input type="hidden" name="u_name" value="${loginUser.u_name }">
				<input type="hidden" name="u_position" value="${loginUser.u_position }">
				<input type="hidden" name="ta_id" value="${ta_id }">
              <input type="button" id="owStart" value="퇴근" onclick="confirm('정말 퇴근 하시겠습니까?')"
              class="btn btn-danger">
            </form>
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