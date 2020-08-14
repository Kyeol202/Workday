<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>
<script>

$(document).ready(function() {

	$("#adminUserUpdate").click(function() {
		var confirmUpdate = confirm('수정 하시겠습니까?');
		
		if(confirmUpdate == true) {
		var url = "<%=contextPath%>"+"/admin/adminUserUpdate";
		$("#adminUserUpdateDelete").attr("action", url);
		$("#adminUserUpdateDelete").submit();
		}
		else false;		
	});

	$("#adminUserRun").click(function() {
		var confirmDelete = confirm('퇴사처리 하시겠습니까? 퇴사처리한 인원은 복구가 불가능 합니다');
		
		if(confirmDelete == true) {
		var url = "<%=contextPath%>"+"/admin/adminUserRun";
		$("#adminUserUpdateDelete").attr("action", url);
		$("#adminUserUpdateDelete").submit();
		}
		else false;		
	});
	
	$("#adminUserDelete").click(function() {
		var confirmDelete = confirm('완전 삭제하시겠 습니까? 완전 삭제된 정보는 복구가 불가능 합니다');
		
		if(confirmDelete == true) {
		var url = "<%=contextPath%>"+"/admin/adminUserDelete";
		$("#adminUserUpdateDelete").attr("action", url);
		$("#adminUserUpdateDelete").submit();
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
                              <h3 class="box-title">사용자 정보</h3>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              
                           </div>
                        </div>
                     </div>
         <ol class="breadcrumb">
                 <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
              <li><a href="#">사용자 목록</a></li>
              <li class="active">사용자 수정/삭제</li>
            </ol>
             <form id="adminUserUpdateDelete" method="post">
            <div class="box-header">
               <input type="hidden" name="u_id" value="${userInfo.u_id }">
               <input type="hidden" name="d_id" value="${userInfo.d_id }">
            <input type="hidden" name="u_email" value="${userInfo.u_email }">
            <input type="hidden" name="u_name" value="${userInfo.u_name }">
            <input type="hidden" name="u_position" value="${userInfo.u_position }">
            <input type="hidden" name="u_phone" value="${userInfo.u_phone }">
            <input type="hidden" name="u_status" value="${userInfo.u_status }">
            	<c:if test="${userInfo.u_status eq 'Y' }">
              <input type="button" id="adminUserUpdate" value="사용자 정보수정" class="btn btn-warning">
              <input type="button" id="adminUserRun" value="퇴사" class="btn btn-danger">
              </c:if>
              <c:if test="${userInfo.u_status eq 'N' }">
              <input type="button" id="adminUserDelete" value="사용자 정보삭제" class="btn btn-danger">
              </c:if>
            </form>
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
                    사번   
                </th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" 
                aria-label="Engine version: activate to sort column ascending" style="width:228px;">
                   이름</th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" 
                aria-label="Engine version: activate to sort column ascending" style="width:202px;">
                   부서</th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" 
                aria-label="CSS grade: activate to sort column ascending" style="width:158px;">
                   이메일</th>
                    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" 
                aria-label="CSS grade: activate to sort column ascending" style="width:158px;">
                   직급</th>
                    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" 
                aria-label="CSS grade: activate to sort column ascending" style="width:158px;">
                   핸드폰번호</th>
                    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" 
                aria-label="CSS grade: activate to sort column ascending" style="width:158px;">
                   재직</th>
                </tr>

                </tr>
                </thead>

                <tbody>
                <tr role="row" class="odd">
                  <td class="sorting_1">${userInfo.u_id }</td>
                  <td>${userInfo.u_name }</td>
                  <c:if test="${userInfo.d_id eq 1 }">
						<td>경영지원</td>
						</c:if>
						<c:if test="${userInfo.d_id eq 2 }">
						<td>연구소</td>
						</c:if>
                  <td>${userInfo.u_email }</td>
                  <td>${userInfo.u_position }</td>
                   <td>${userInfo.u_phone }</td>
                   <c:if test="${userInfo.u_status eq 'N' }">
					<td>퇴사</td>
					</c:if>
					<c:if test="${userInfo.u_status eq 'Y' }">
					<td>재직</td>
					</c:if>
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