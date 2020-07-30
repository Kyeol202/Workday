<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp" %>
<html>
<style>

.register-box {
    width: 400px;
    margin: 3% auto;
}

.form-control-feedback {
    u_position: absolute;
    top: 0;
    right: 0;
    z-index: 2;
    display: block;
    width: 34px;
    height: 34px;
    line-height: 34px;
    text-align: center;
    pointer-events: none;
}

</style>
<script>

//jQuery함수 (출근버튼을 눌렀을 시 TAManagement Insert 되야함)
$(document).ready(function() {
		
$("#userVacationInsert").click(function() {
	if(confirm("정말 수정 하시겠습니까?")){
	var url = "<%=contextPath%>"+"/admin/userVacation";
	$("#userVacation").attr("action", url);
	$("#userVacation").submit();
	}
	else return false;
})	


})//function end





</script>
<body class="hold-transition register-page skin-blue sidebar-mini">
	
	<!-- Main Header -->
    <%@ include file="../user/common/user_main_header.jsp" %>

    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="../user/common/user_left_column.jsp" %>
    
    <div class="register-box">
	<div class="register-logo">
	<a href="/Workday/userHome">
		<b>Work</b>Day</a>
	</div>
	
	<div class="register-box-body">
	<p class="login-box-msg">휴가관리</p>
	<form id="userVacation" method="post">
		<br>
		<div class="form-group has-feedback">
		<input type="text" class="form-control" value="부서명" readonly="readonly">
        	<select class="form-control" name="dp_name">
                   <option>경영지원</option>
                    <option>연구소</option>
                  </select>
      	</div>
      	<div class="form-group has-feedback">
      	<input type="text" class="form-control" value="사번" readonly="readonly">
        	<select class="form-control" name="u_id">
					<c:forEach var="userList" items="${userList }">
                    <option>${userList.u_id }</option>
                     </c:forEach>
                  </select>
      	</div>
      	<div class="form-group has-feedback">
      	<input type="text" class="form-control" value="이름" readonly="readonly">
        	<select class="form-control" name="u_name">
                    <c:forEach var="userList" items="${userList }">
                    <option>${userList.u_name }</option>
                    </c:forEach>
                  </select>
      	</div>
      	</form>
      	</div>
		<div class="row">
        <div class="col-xs-6">
        </div>
        <!-- /.col -->
        <div class="col-xs-6">
        	<input type="button" class="btn btn-primary" id="userVacationInsert"  value="휴가등록">
        </div>

					
		
	</form>
	
	</div>
	
	
	</div>
	 
</body>

</html>