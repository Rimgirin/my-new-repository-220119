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

.email-container{
	margin-top: 40px;
	margin-bottom: 40px;
}
.pw-container{
	margin-bottom: 50px;
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
<title>로그인 페이지</title>
</head>
 <body class="text-center">
    
	<main class="form-signin">
	  <form>
	    
	    <h4 class="h4 fw-normal">
	    로그인하고 지핑에서<br>
	    다양한 경험을 만끽해보세요
	    </h4>
	
	    <div class="email-container">
			<span class="loginContent fs_14">이메일</span>
	      <input type="email" class="form-control" id="email" placeholder="이메일 주소를 입력해주세요">
	      
	    </div>
	    <div class="pw-container">
			<span class="loginContent fs_14">비밀번호</span>
	      <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요">
	      
	    </div>
	
	    <button class="w-100 btn btn-lg btn_mint mb-3" type="submit">로그인</button>
		<div class="row fs_14">
		    <div class="col-6 col-md-4 border-right pd_5 likebtn"><a href="">아이디 찾기</a></div>
		    <div class="col-6 col-md-4 border-right pd_5 likebtn"><a href="">비밀번호 찾기</a></div>
		    <div class="col-6 col-md-4 pd_5 likeBtn"><a href="">회원가입</a></div>
		</div>
	  </form>
	</main>
</body>
</html>