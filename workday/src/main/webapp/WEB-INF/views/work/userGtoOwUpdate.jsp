<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>



<script>
//jQuery함수 (출근버튼을 눌렀을 시 TAManagement Insert 되야함)
$(document).ready(function() {
		
$("#userStatusUpdate").click(function() {
	if(confirm("정말 수정 하시겠습니까?")){
	var url = "<%=contextPath%>"+"/user/userStatusUpdate";
	$("#statusUpdate").attr("action", url);
	$("#statusUpdate").submit();
	}
	else return false;
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
										<h3 class="box-title">출근관리</h3>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										
               
                </form>
									</div>
								</div>
							</div>
			<ol class="breadcrumb">
      			  <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    		    <li><a href="#">내 출퇴근</a></li>
     		   <li class="active">출근 입력</li>
    		  </ol>
    		  <form id="statusUpdate" method="post">
            <div class="box-header">
				<input type="hidden" name="ta_id" value="${TADto.ta_id }">
				<input type="hidden" name="status">
               <input type="button" class="btn btn-warning btn-sm" value="최종수정" id="userStatusUpdate">
            </form>
    		  <div class="box-body">
              <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
              <div class="row">
              <div class="col-sm-6">
              </div><div class="col-sm-6">
              </div></div>
              <div class="row">
              <div class="col-sm-12">
              <table id="example2" class="table table-bordered table-hover dataTable" role="grid" >
                <thead>
                <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="example2" 
                rowspan="1" colspan="1" aria-sort="ascending" 
                aria-label="Rendering engine: activate to sort column descending" style="width:185px;">
                 	출근시간	
                </th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" 
                aria-label="Engine version: activate to sort column ascending" style="width:228px;">
                	퇴근시간</th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" 
                aria-label="Engine version: activate to sort column ascending" style="width:202px;">
                	근무시간(단위 : 시간)</th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" 
                aria-label="CSS grade: activate to sort column ascending" style="width:158px;">
             		상태</th>
                </tr>
                </thead>
                

                <tbody>
                <tr role="row" class="odd">
                  <td class="sorting_1">${TADto.gto }</td>
                  <td>${TADto.ow }</td>
                  <td>${TADto.workinghour } 시간</td>
                  <td>
					<select  name="status">
					<option value="Y">정상</option>
					<option value="A">반차</option>
                    <option value="E">조퇴</option>
                   </select>
                  </td>
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
		<%@ include file="../user/common/user_main_footer.jsp" %>
	</div>
	<!-- ./wrapper -->

</body>

</html>