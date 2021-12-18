<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style>

*{
  font-family: "서울남산체";
}

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
	
	margin-bottom: 5px;
	display: block;
	text-align: left;
	color: #c4c4c4;
}

[class*='container'] {
	width: 95%;
	margin: 20px auto 20px auto;
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

input[type='radio'] {
 display: none;
}
input[type='radio'] + label {
	display:block;
    width: 45%;
    margin: 0px 5px 0px 0px;
	padding: 10px;

    
    border-radius: 5px;

    
    background-color: white;

    
    border: 1px solid #000000;

    
    display: inline-block;
} 
input[type='radio'] + label p {
    
    display: table-cell;
    text-align: center;
    vertical-align: middle;

    color: #ffffff;
    font-size: 200%;
    font-weight: bold;
}
input[type='radio']:checked + label {
    
    background: #94d5de;

    
    border: 0cm;

	
	color: white;
}
input[type='radio' ]:checked + label[for="male"] {
    
    background: #94d5de;

    
    border: 0cm;

	
	color: white;
}
input[type='radio' ]:checked + label[for="female"] {
    
    background: #ebc3c3;

    
    border: 0cm;

	
	color: white;
}
.form-select{
	width:45%;
	display: inline;
	margin-right: 5px;
	color: #c4c4c4;
}
.form-select option{
	color: #c4c4c4;
}
</style>
<meta charset="UTF-8">
<title>회원가입 세부 정보 페이지</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
 <body class="text-center">
    
	<main class="form-signin">
	  <form>
	    
	    <h4 class="h4 fw-normal mb-5">
	    추가 정보를 작성하면<br>
	    맞춤 서비스가 제공됩니다.
	    </h4>
	
	    <div class="phone-container">
			<span class="loginContent fs_14">전화번호</span>
	    	<input type="text" class="form-control" id="email" placeholder="-를 제외한 휴대폰 번호를 입력해주세요">
	      
	    </div>
	    <div class="gender-container">
			<span class="loginContent fs_14">성별</span>
			<input type="radio" name="gender" id="male" value="male">
			<label for="male">남성</label>
			<input type="radio" name="gender" id="female" value="female">
			<label for="female">여성</label>
		</div>
		<div class="category-container">
			<span class="loginContent fs_14">관심분야 선택</span>
			<select name="largeCategory" class="form-select" id="largeCategory">
				<option value="0" selected="selected">대분류</option>
				<option value="1">취미/공예</option>
				<option value="2">액티비티</option>
				<option value="3">커리어</option>
				<option value="4">디자인</option>
			</select>
			<select name="smallCategory" class="form-select" id="smallCategory">
				<option value="0" selected="selected">소분류</option>
				<!-- 취미/공예 -->
				<option value="picture" class="sc1">사진/미술</option>
				<option value="drawing" class="sc1">드로잉</option>
				<option value="cooking" class="sc1">요리/베이킹</option>
				<option value="music" class="sc1">음악</option>
				<!-- 액티비티 -->
				<option value="dance" class="sc2">댄스/무용</option>
				<option value="act" class="sc2">연기</option>
				<option value="sports" class="sc2">스포츠/레저</option>
				<option value="exotic_sports" class="sc2">이색 액티비티</option>
				<!-- 커리어 -->
				<option value="competency" class="sc3">업무 역량</option>
				<option value="marketing" class="sc3">마케팅</option>
				<option value="programming" class="sc3">프로그래밍</option>
				<option value="certificate" class="sc3">자격증/시험</option>
				<option value="employment" class="sc3">취업/이직/진로</option>
				<!-- 디자인 -->
				<option value="architecturalD" class="sc4">건축</option>
				<option value="graphicD" class="sc4">그래픽 디자인</option>
				<option value="productD" class="sc4">제품 디자인</option>
				<option value="videoD" class="sc4">영상 편집/제작</option>	
			</select>
			<button class="w-100 btn btn-lg btn_mint mt-2 mb-3" id="categoryinsert">추가</button>
		</div>
		<div class="location-container">
			<span class="loginContent fs_14">관심지역 선택</span>
			<form id="nsdiSearchForm" action="#" class="form_data" onsubmit="return false;search();">
				
				<select id="sido_code" class="form-select">
					<option>선택</option>
				</select>
				<select id="sigoon_code" class="form-select">
					<option>선택</option>
				</select>
			</form>
			<button class="w-100 btn btn-lg btn_mint mt-2 mb-3" id="locationinsert">추가</button>
		</div>
	
	    <button class="w-100 btn btn-lg btn_mint mb-3" type="submit">다음</button>
		
	  </form>
	</main>
	<script>
		var categories = false;

		function update_selected() {
		$("#smallCategory").val(0);
		$("#smallCategory").find("option[value!=0]").detach();

		$("#smallCategory").append(categories.filter(".sc" + $(this).val()));
		}

		$(function() {
		categories = $("#smallCategory").find("option[value!=0]");
		categories.detach();

		$("#largeCategory").change(update_selected);
		$("#largeCategory").trigger("change");
		});

		$(function(){
			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIDO_INFO",
				async: false,
				dataType: 'jsonp',
				success: function(data) {
					let html = "<option>선택</option>";

					data.response.result.featureCollection.features.forEach(function(f){
						console.log(f.properties)
						let 행정구역코드 = f.properties.ctprvn_cd;
						let 행정구역명 = f.properties.ctp_kor_nm;
						
						html +=`<option value="${행정구역코드}">${f.properties.ctp_kor_nm}</option>`
						
					})
					
		            $('#sido_code').html(html);
					
				},
				error: function(xhr, stat, err) {}
			});
			
			
			$(document).on("change","#sido_code",function(){
				let thisVal = $(this).val();		

				$.ajax({
					type: "get",
					url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIGG_INFO",
					data : {attrfilter : 'sig_cd:like:'+thisVal},
					async: false,
					dataType: 'jsonp',
					success: function(data) {
						let html = "<option>선택</option>";

						data.response.result.featureCollection.features.forEach(function(f){
							console.log(f.properties)
							let 행정구역코드 = f.properties.sig_cd;
							let 행정구역명 = f.properties.sig_kor_nm;
							
							html +=`<option value="$(행정구역코드)">$(행정구역명)</option>`
							
						})
			            $('#sigoon_code').html(html);
						
					},
					error: function(xhr, stat, err) {}
				});
			});
			
			$(document).on("change","#sigoon_code",function(){ 
				
				let thisVal = $(this).val();		

				$.ajax({
					type: "get",
					url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADEMD_INFO",
					data : {attrfilter : 'emd_cd:like:'+thisVal},
					async: false,
					dataType: 'jsonp',
					success: function(data) {
						let html = "<option>선택</option>";

						data.response.result.featureCollection.features.forEach(function(f){
							console.log(f.properties)
							let 행정구역코드 = f.properties.emd_cd;
							let 행정구역명 = f.properties.emd_kor_nm;
							html +=`<option value="$(행정구역코드)">$(행정구역명)</option>`
							
						})
			            $('#dong_code').html(html);
						
					},
					error: function(xhr, stat, err) {}
				});

			});
		})	
		
	
	</script>
</body>
</html>