<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>
<script>

$(document).ready(function() {

	$("#workOut").click(function() {
		var confirmWork = confirm('퇴근 하시겠습니까?');
		
		if(confirmWork == true) {
		var url = "<%=contextPath%>"+"/user/userWorkOut";
		$("#userWorkOutCheck").attr("action", url);
		$("#userWorkOutCheck").submit();
		}
		else false;		
	});
	

	$("#statusReasonUpdate").click(function() {
		var confirmE = confirm('조퇴 하시겠습니까?');
		
		if(confirmE == true) {
		var url = "<%=contextPath%>"+"/user/userStatusReasonUpdate";
		$("#statusReasonUpdateForm").attr("action", url);
		$("#statusReasonUpdateForm").submit();
		}
		else false;		
	});
	
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
             <form id="userWorkOutCheck" method="post">
            <div class="box-header">
               <input type="hidden" name="u_id" value="${user.u_id }">
               <input type="hidden" name="d_id" value="${user.d_id }">
            <input type="hidden" name="u_name" value="${user.u_name }">
            <input type="hidden" name="u_position" value="${user.u_position }">
            <input type="hidden" name="w_id" value="${workRecord.w_id }">
              <input type="button" id="workOut" value="퇴근" class="btn btn-danger">
            </form>
			<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modal-warning">
                조퇴
              </button>
              
              <div class="modal modal-warning fade" id="modal-warning">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">X</span></button>
                <h4 class="modal-title">조퇴사유 입력</h4>
              </div>
              <form id="statusReasonUpdateForm" method="post">
              <div class="modal-body"> 
                <p class="reasonText" readonly>조퇴사유를 입력하세요</p>
                <input type="text" class="form-control" placeholder="조퇴사유" name="w_reason" value="${ workRecord.w_reason}">
                <input type="hidden" name="w_id" value="${workRecord.w_id }">
                <select class="form-control" name="w_status" value=${workRecord.w_status }>
                    <option value="Y">정상출근</option>
                    <option value="E">조퇴</option>
                  </select>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">닫기</button>
<!--                 <button type="button" class="btn btn-outline" id="reasonText">조퇴사유 입력</button> -->
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
                   근무시간</th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" 
                aria-label="CSS grade: activate to sort column ascending" style="width:158px;">
                   상태</th>
                    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" 
                aria-label="CSS grade: activate to sort column ascending" style="width:158px;">
                   이유</th>
                </tr>

                </tr>
                </thead>

                <tbody>
                <tr role="row" class="odd">
                  <td class="sorting_1">${workRecord.w_in }</td>
                  <td>${workRecord.w_out }</td>
                  <td>${workRecord.w_time }</td>
                  <td>${workRecord.w_status }</td>
                  <td>${workRecord.w_reason }</td>
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