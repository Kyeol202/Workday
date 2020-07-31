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
//아이디 유효성 검사(1 = 중복 / 0 != 중복)
$(function(){
	

	$("#u_email").blur(function() {
		// id = "id_reg" / name = "userId"
		var u_email = $('#u_email').val();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/user/idcheck?u_email='+ u_email,
			type : 'get',
			dataType : 'text',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);	
				
				
				var u_email = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				
				if (u_email == "") {
						
						$("#id_check").text("이메일을 입력해주세요");
						$("#id_check").css("color", "red");
						
					} else if(!u_email.test($("input[id='u_email']").val())){
	
							$('#id_check').text('올바르지않은 이메일 형식입니다');
							$('#id_check').css('color', 'red');
										
							
						} else if(data == '1'){
							
						$('#id_check').text("이미 사용중인 이메일입니다.");
						$('#id_check').css('color', 'red');
						
						} else {
							$('#id_check').text("사용가능한 아이디입니다.");
							$('#id_check').css('color', 'blue');
					}
							
					
					}, error : function() {
							console.log("실패");
				}
			});
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

//	jQuery함수 (출근버튼을 눌렀을 시 TAManagement Insert 되야함)
$(document).ready(function() {
		

$("#userInfoDeleteOk").click(function() {
	if(confirm("정말 삭제 하시겠습니까?")){
	var url = "<%=contextPath%>"+"/admin/userInfoDelete";
	$("#userInfoUpdateDelete").attr("action", url);
	$("#userInfoUpdateDelete").submit();
	}
	else return false;
})	

})//function end



$(document).ready(function() {
	

	$("#userInfoUpdateOk").click(function() {
		if(confirm("수정 하시겠습니까?")){
		var url = "<%=contextPath%>"+"/admin/userInfoUpdateOk";
		$("#userInfoUpdateDelete").attr("action", url);
		$("#userInfoUpdateDelete").submit();
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
			

			
	
		<div class="register-box">
  			<div class="register-logo">
				<p>${userInfo.u_name }님의 정보</p>
			</div>
			
			<div class="register-box-body">
    			<p class="login-box-msg">직원 정보 수정</p>
				<form method="post" id="userInfoUpdateDelete">
					<input type="hidden" name="u_id" value="${userInfo.u_id }">
						<div class="form-group has-feedback">
							<input type="text" id="u_email" name="u_email" class="form-control" value="${userInfo.u_email }"/>
						</div>
						<div class="form-group has-feedback">
							<input type="text" id="u_name" name="u_name" class="form-control" value="${userInfo.u_name}" readonly="readonly"/>
						</div>
						<div class="form-group has-feedback">
							<input type="text" id="u_phone" name="u_phone" class="form-control" value="${userInfo.u_phone}"/>
						</div>
						<div class="form-group has-feedback">
							<input type="text" id="u_position" name="u_position" class="form-control" value="${userInfo.u_position}"/>
							<div id = "nick_check"></div>
						</div>
						<br>
						<button type="button" class="btn btn-block btn-primary" id="userInfoUpdateOk">직원정보수정</button>
						<button type="button" class="btn btn-block btn-primary" id="cancle">취소</button>
						<button type="button" class="withdrawal" id="userInfoDeleteOk" style="margin: 10px">정보 삭제</button>
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