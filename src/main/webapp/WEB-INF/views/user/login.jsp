<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <title>로그인</title>
</head>

<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<script>
Kakao.init('58b7f7f1223b1914b77c46c8f98fc9ca'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
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

<body>

    <div class="container mt-3 text-center">
        <form action="${pageContext.request.contextPath }/user/login" method="POST">
            <h1 class="h3 mb-3 fw-normal">로그인 하세요</h1>
            <div class="row mt-5">
                <div class="col-12 text-danger">
                    ${REDIRECT_ATTR.error }
                </div>
            </div>
            <div class="form-floating">
                <input type="text" class="form-control" name="username" id="username" value="${REDIRECT_ATTR.username }" placeholder="name@example.com" required>
                <label for="username">Username</label>
            </div>
            <div class="form-floating mt-1">
                <input type="password" class="form-control" name="password" id="password" value="" placeholder="Password" required>
                <label for="password">Password</label>
            </div>

            <div class="mb-3">
                <label>
                    <input type="checkbox" value="remember-me"> Remember me
                </label>
            </div>
            <button class="w-100 btn btn-lg btn-primary my-1" type="submit">로그인</button>
            <a class="w-100 btn btn-lg btn-primary my-1" href="${pageContext.request.contextPath}/user/register">회원가입</a>
            <p class="mt-2 mb-3 text-muted">&copy; 2017–2022</p>
            <ul>
				<li onclick="kakaoLogin();">
			      <a href="javascript:void(0)">
			          <span>카카오 로그인</span>
			      </a>
				</li>
				<li onclick="kakaoLogout();">
			      <a href="javascript:void(0)">
			          <span>카카오 로그아웃</span>
			      </a>
			</li>
		</ul>
		<!-- 네이버 로그인 버튼 노출 영역 -->
  		<div id="naver_id_login"></div>
        </form>
    </div>

</body>

</html>