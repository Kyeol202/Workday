<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>
<style>

.withdrawal{

	display: inline-block;
  	margin-bottom: 0;
  	font-weight: normal;
 	text-align: center;
 	vertical-align: middle;
 	touch-action: manipulation;
 	cursor: pointer;
 	background-image: none;
 	border: 1px solid transparent;
 	white-space: nowrap;
 	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	border-radius: 4px;
	-webkit-user-select: none;
  	-moz-user-select: none;
	-ms-user-select: none;
  	user-select: none;
  
	color: #fff;
	background-color: #d9534f;
	border: #d43f3a;
	float: right;
}

</style>

<script>
//패스워드 중복체크
$(function(){ 
	
	$("#pwd_success").hide(); 
	$("#pwd_fail").hide();
	
	$("input").keyup(function(){
		
		var pwd1=$("#u_pwd").val(); 
		var pwd2=$("#u_pwd2").val();
		
		var password = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;
		
			if(!password.test($("input[id='u_pwd']").val())){
			
				$('#pwd_check').text('6~15자 영문/숫자/특수문자 포함 입력해주세요');
				$('#pwd_check').css('color', 'red');
				
				
			} else {
					$("#pwd_check").hide();
					
					if(pwd1 != "" || pwd2 != "") {
					
					
						if(pwd1 == pwd2){
					
							$("#pwd_success").show(); 
							$("#pwd_success").css("color", "blue"); 
							$("#pwd_fail").hide(); 
							
							
						} else {
					
							$("#pwd_success").hide(); 
							$("#pwd_fail").show();
							$("#pwd_fail").css("color", "red");
					} 
				} 
			}
			
			
	}); 
});

$(document).ready(function(){
	// 취소
	$("#cancle").on("click", function(){
		
		location.href = "../userHome";
					    
	})
		
	$("#submit").on("click", function(){
		if($("#u_pwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#u_pwd").focus();
			return false;
		}
		if($("#u_phone").val()==""){
			alert("핸드폰 번호를 입력해주세요.");
			$("#u_phone").focus();
			return false;
		}
				
		alert("계정 정보가 변경되었습니다. 새로 로그인해주세요 :P")
	});
			
})
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
			
				
			
	
		<div class="register-box">
  			<div class="register-logo">
				<p>${loginUser.u_name }님의 정보</p>
			</div>
			
			<div class="register-box-body">
    			<p class="login-box-msg">회원 정보 수정</p>
				<form action="<%=contextPath %>/user/userInfoUpdate" method="post">
					<input type="hidden" name="u_id" value="${loginUser.u_id }">
						<div class="form-group has-feedback">
							<input type="text" id="u_email" name="u_email" class="form-control" value="${loginUser.u_email }" readonly="readonly"/>
						</div>
						<div class="form-group has-feedback">
							<input type="password" id="u_pwd" name="u_pwd" class="form-control" placeholder="PASSWORD"/>
						</div>
						<div class="form-group has-feedback">
							<input type="password" id="u_pwd2" name="u_pwd2" class="form-control" placeholder="CONFIRM PASSWORD"/>
								
							<div id="pwd_check"></div>
							<div id="pwd_success">비밀번호가 일치합니다</div>
							<div id="pwd_fail">비밀번호가  일치하지 않습니다</div>
						</div>
						<div class="form-group has-feedback">
							<input type="text" id="u_name" name="u_name" class="form-control" value="${loginUser.u_name}" readonly="readonly"/>
						</div>
						<div class="form-group has-feedback">
							<input type="text" id="u_phone" name="u_phone" class="form-control" value="${loginUser.u_phone}"/>
						</div>
						<div class="form-group has-feedback">
							<input type="text" id="u_position" name="u_position" class="form-control" value="${loginUser.u_position}"/>
							<div id = "nick_check"></div>
						</div>
						<br>
						<button type="submit" class="btn btn-block btn-primary" id="submit">회원정보수정</button>
						<button type="button" class="btn btn-block btn-primary" id="cancle">취소</button>
				</form>
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