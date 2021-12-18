<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    html,
body {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: white;
}

.form-signin {
  width: 100%;
  max-width: 400px;
  padding: 60px 25px 25px 25px;
  margin: auto;
  border: 1px solid #c4c4c4;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

.loginContent{
	margin-left: 10px;
	margin-bottom: 5px;
	float: left;
	color: #c4c4c4;
}

/* .userName-container{
	width: 95%;
	margin: 50px auto 50px auto;
}
.userNickName-container{
	width: 95%;
	margin: 50px auto 50px auto;
}
.pw-container{
	width: 95%;
	margin: 50px auto 50px auto;
}
.pwck-container{
	width: 95%;
	margin: 50px auto 50px auto;
} */

[class*='container'] {
	width: 95%;
	margin: 40px auto 40px auto;
}

.border-right{
	border-right: 1px solid black;
}
.fs_14{
	font-size: 14px;
}
.btn_mint{
	background-color: #94d5de;
	color: white;
}
.pd_5{
	padding-top: 5px;
	padding-bottom: 5px;
}
a {
	text-decoration: none;
	color: black;
}


</style>
<meta charset="UTF-8">
<title>회원가입 기본 정보 페이지</title>
</head>
 <body class="text-center">
    
	<main class="form-signin">
	  <form>
	    
	    <h4 class="h4 fw-normal">
	    로그인하고 지핑에서<br>
	    다양한 경험을 만끽해보세요
	    </h4>
	
	    <div class="userName-container">
	      <input type="text" class="form-control" id="userName" placeholder="이름(실명)을 입력해주세요">
	    </div>
	    <div class="userNickName-container">
	      <input type="text" class="form-control" id="userNickName" placeholder="닉네임을 입력해주세요">
	    </div>
	    <div class="pw-container">
	      <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요">
	      
	    </div>
	    <div class="pwck-container">
	      <input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호를 재입력해주세요">
	      
	    </div>
	
	    <button class="w-100 btn btn-lg btn_mint mb-3" type="submit">다음</button>
		
	  </form>
	</main>
</body>
</html>