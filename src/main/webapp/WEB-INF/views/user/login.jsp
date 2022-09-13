<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>로그인</title>
</head>

<body>

	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
	// 58b7f7f1223b1914b77c46c8f98fc9ca
	window.Kakao.init("58b7f7f1223b1914b77c46c8f98fc9ca");
	
	function kakaoLogin(){	// 로그인버튼을 누르면 얘가 실행된다
		window.Kakao.Auth.login({
			scope: 'profile_nickname, profile_image, account_email',
			success: function(authObj){
				console.log(authObj);
				window.Kako.API.request({
					url: '/v2/user/me',
					success: res => {
						const kakao_account = res.kakao_acccount;
						console.log(kakao_account);
					}
				});
			}
		});
	}
	
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }

	  
	
	
</script>


	<div class="container mt-3 text-center">
		<form action="${pageContext.request.contextPath }/user/login"
			method="POST">
			<h1 class="h3 mb-3 fw-normal">로그인 하세요</h1>
			<div class="row mt-5">
				<div class="col-12 text-danger">${REDIRECT_ATTR.error }</div>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" name="username"
					id="username" value="${REDIRECT_ATTR.username }"
					placeholder="name@example.com" required> <label
					for="username">Username</label>
			</div>
			<div class="form-floating mt-1">
				<input type="password" class="form-control" name="password"
					id="password" value="" placeholder="Password" required> <label
					for="password">Password</label>
			</div>	
	
			<br>
			<br>


			<button style="background-color: #483D8B" class="w-100 btn btn-lg my-1 text-white" type="submit">로그인</button>

			<a  style="background-color: #483D8B" class="w-100 btn btn-lg my-1 text-white"
				href="${pageContext.request.contextPath}/user/register">회원가입</a>
			<p class="mt-2 mb-3 text-muted"></p>



		</form>
	</div>

</body>

</html>