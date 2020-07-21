<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>

	<script>
	<!-- jQuery함수 (출근버튼을 눌렀을 시 TAManagement Insert 되야함) -->
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
            	<input type="hidden" name="u_id" value="${UserInfo.u_id }">
              <input type="button" id="gtoStart" value="출근" onclick="confirm('출근 하시겠습니까?')"
              class="btn btn-success">
            </div>
            </form>
            <!-- /.box-header -->
            <div class="box-body">
              <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap"><div class="row"><div class="col-sm-6"></div><div class="col-sm-6"></div></div><div class="row"><div class="col-sm-12"><table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                <thead>
                <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">
                 	부서이름	
                </th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">
                	사원 이름</th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
                	출근 시간
                </th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                	퇴근 시간</th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">
                	근무 시간</th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">
             		상태</th>
                </tr>
                </thead>
                <tbody>

                <tr role="row" class="odd">
                  <td class="sorting_1">Gecko</td>
                  <td>Firefox 1.0</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.7</td>
                  <td>A</td>
                  <td>B</td>
                </tr></tbody>
              </table></div></div>
              <div class="row"><div class="col-sm-5">
              <div class="dataTables_info" id="example2_info" role="status" aria-live="polite">
              Showing 1 to 10 of 57 entries</div></div>
              <div class="col-sm-7">
              <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
              <ul class="pagination">
              <li class="paginate_button previous disabled" id="example2_previous">
              <a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0">
              Previous</a></li>
              <li class="paginate_button active">
              <a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0">1</a></li>
              
              <li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0">2</a></li><li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0">3</a></li><li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0">4</a></li><li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0">5</a></li><li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0">6</a></li><li class="paginate_button next" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a></li></ul></div></div></div></div>
            </div>
            <!-- /.box-body -->
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