<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	Member m=(Member)request.getAttribute("loginMember");
	
	/* 관심분야 */	
		String[] categories;
		categories=m.getMemberCategory().split(",");

	
		/* 관심지역 */
		String[] locations;
		locations=m.getMemberLocation().split(",");		

%>
<%if(m.getMemberGrade().equals("수강생")){ %>

<section id="updateSection">
	<div id="mypage-container" class="flex">
		<div class="inlineblock overflow" id="mypage-menu">          
			<h3>MY PAGE</h3>
			<div class="" id="my-menu" >
				<ul id="menu-list">
					<li><a href="<%=request.getContextPath()%>/member/mypage.do?email=<%=m.getEmail()%>">· 나의정보</a></li>
                    <li><a href="<%=request.getContextPath()%>/member/updateMember.do?email=<%=m.getEmail()%>">· 정보수정</a></li>
                    <nav class="nav-sub">
						<li>· 마이클래스</li>
							<ul id="sub-menu">
                            	<li><a href="<%=request.getContextPath()%>/member/myclassIngOff.do?email=<%=m.getEmail()%>">- 수강중인 클래스</a></li>
                                <li><a href="<%=request.getContextPath()%>/member/myclassEnd.do?email=<%=m.getEmail()%>">- 수강완료 클래스</a></li>
                            </ul>
                    </nav>
                    <li><a href="<%=request.getContextPath()%>/member/dropMember.do?email=<%=m.getEmail()%>">· 회원탈퇴</a></li>
                        </ul>                  
            </div>
		</div>   
		<form name="userUpdateFrm" id="userUpdateFrm" action="<%=request.getContextPath()%>/member/updateMemberEnd.do" method="post">
		<div id="mypage-content" class="inlineblock">
			<div class="">
				<img id="info-icon" src="<%=request.getContextPath() %>/img/setting.png" width="20px" height="20px" class="inlineblock" style="margin-bottom: 10px;">
                <h4 class="inlineblock" style="margin-bottom: 0;">정보수정</h4> 
            </div>
            <div class="line"></div>
            <div style="margin-left: 80px;">
					<div class="menu-margin margin-left" id="tutor-img" >
						<div class="info-title inlineblock">
							<span class="margin-right menu-list-name">사진</span>
						</div>
                        <div class="info-content inlineblock" id="newImg">
                        	<img src="<%=request.getContextPath() %>/upload/<%=m.getProfileImg()%>">
                        </div>
                        <div class="inlineblock" style="margin-left: 10px;"  id="uploadBtn-user">
                            <input type="button" value="기본이미지" onclick="deleteImg();">
                            <input type="file" name="profileImg" id="" value="파일 선택" class="" width="">
                        </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-email" >
                            <div class="info-title inlineblock">
                                <span class="margin-right menu-list-name">이메일</span>
                            </div>
                            <div class="info-content inlineblock">
                                <input type="text" readonly name="email" value="<%=m.getEmail() %>" class="placeholder-center" size="25">
                            </div>
                            <div class="inlineblock">
                                <p class="guide">※ 아이디(이메일)는 변경이 불가능합니다.</p>
                            </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-name">
						<div class="info-title inlineblock">
                        	<span class="margin-right menu-list-name">이름</span>
                        </div>
                        <div class="info-content inlineblock">
                        	<input type="text"  readonly name="" value="<%=m.getMemberName() %>" class="placeholder-center" size="25">
                        </div>
                    </div>					                   
                    <div class="menu-margin margin-left" id="tutor-beforePw">
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">현재 비밀번호</span>
                        </div>
                        <div class="info-content inlineblock">
                            <input type="password" id="oriPw" name="oriPw"  class="placeholder-center " size="25" required>
                        </div>
                        <div class="inlineblock">
                            <p class="guide">※ 현재 비밀번호를 꼭 입력한 뒤 정보수정이 가능합니다.</p>
                        </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-afterPw">
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">새로운 비밀번호</span>
                        </div>
                        <div class="info-content inlineblock">
                            <input type="password" id="newPw" name="newPw"  class="placeholder-center " size="25">
                        </div>
                        <div class="inlineblock">
                            <p class="guide">※ 영문자, 숫자, 특수기호를 포함하여 8글자 이상 입력하세요.</p>
                        </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-pwCheck">
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">새로운 비밀번호 확인</span>
                        </div>
                        <div class="info-content inlineblock">
                            <input type="password" id="newPwCheck" name="newPwCheck" class="placeholder-center " size="25">
                        </div>                       
                        <span id="pwCheckMsg"></span>
                    </div>
                                          
                    <div class="menu-margin margin-left" id="tutor-nick">
                            <div class="info-title inlineblock">
                                <span class="margin-right menu-list-name">닉네임</span>
                            </div>
                            <div class="info-content inlineblock">
                                <input id="newNick" type="text" name="newNick" value="<%=m.getNickname() %>" class="placeholder-center " size="25">
                            </div>
                            <div class="inlineblock">
                                <button id="nickDuplicateBtn" style="margin-left: 10px;">닉네임 중복 확인</button>
                            </div>
                    </div> 
                    <div class="menu-margin margin-left" id="tutor-phone">
                            <div class="info-title inlineblock">
                            	<span class="margin-right menu-list-name">전화번호</span>
                            </div>
                            <div class="info-content inlineblock">
                                <input type="text" id="newPhone" name="newPhone" value="<%=m.getPhone() %>" class="placeholder-center" size="25">
                            </div>
                    </div>
                    <div class="menu-margin margin-left" id="inter-field">
                        <div class="info-title inlineblock" style="vertical-align: top; line-height: 150px">
                            <span class="margin-right menu-list-name">관심 분야</span>
                        </div>
                        <div class="info-content inlineblock">                           
                        <%if(categories.length>0){
                          	int count=0;%>
	                    	<%for(int i=0; i<categories.length; i++) {
	                  			String[] categoryContent=categories[i].split(" ");
	                  			count=i;%>
	                  			<div>
		                       		<input type="text" readonly name="newLCategory<%=i%>" value="<%=categoryContent[0]%>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
		                       		<input type="text" readonly name="newSCategory<%=i%>" value="<%=categoryContent[1]%>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
		                  		<%if(i==2) %><button style="position:inlineblock;" id="updateCategory">관심분야 수정하기</button>    
	                 			</div>
	                  		<%}
	                  	if(count<2){
	                  		for(;count<2;count++){%>
	                  			<div>
			                       <input type="text" readonly name="newLCategory<%=count+1%>" value="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
			                       <input type="text" readonly name="newSCategory<%=count+1%>" value="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
			                  	<%if(count==1) %><button style="position:inlineblock;" id="updateCategory">관심분야 수정하기</button>	   
		                 		</div>
	                  		<%	  }
	                  		}
	                  	}%>	
                        </div>
                    </div> 
                    <div class="menu-margin margin-left" id="tutor-area">
                        <div class="info-title inlineblock" style="vertical-align: top; line-height: 150px">
                            <span class="margin-right menu-list-name">관심 지역</span>
                        </div>
                        <div class="info-content inlineblock">
                        <%if(locations.length>0){
							int count=0; %>                       	
		                    <%for(int i=0; i<locations.length; i++) {
		                    	String[] locationContent=locations[i].split(" ");
		                    	count=i;%>
		                  		<div>
			                       <input type="text" readonly name="newLLocation<%=i%>" value="<%=locationContent[0]%>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
			                       <input type="text" readonly name="newSLocation<%=i%>" value="<%=locationContent[1]%>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
		                 		<%if(i==2) %><button id="updateLocation">관심지역 수정하기</button>
		                 		</div>
		                <%}
		                if(count<2){
		                	for(;count<2;count++){%>
		                 		<div>
			                       <input type="text" readonly name="newLLocation<%=count+1%>" value="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
			                       <input type="text" readonly name="newSLocation<%=count+1%>" value="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
		                 		<%if(count==1) %><button style="position:inlineblock;" id="updateLocation">관심지역 수정하기</button>	   
		                 		</div>
		                  <%	  }
		                    }
                        }%>
                        </div>                        
                	</div>  
                    <div class="menu-margin margin-left" id="tutor-gender">
                        <div class="info-title inlineblock"><span class="margin-right menu-list-name ">성별</span></div>
                        <div class="info-content inlineblock">
                        <%if(m.getGender().equals("남자")) {%>
                          <label>남자<input value="man" type="checkbox" name="gender" class="checkbox1" onclick="checkOnlyOne(this)" disabled checked></label>
                          <label>여자<input value="woman" type="checkbox" name="gender" class="checkbox1" onclick="checkOnlyOne(this)" disabled></label>
                        <%}else{ %>
                          <label>남자<input value="man" type="checkbox" name="gender" class="checkbox1" onclick="checkOnlyOne(this)" disabled></label>
                          <label>여자<input value="woman" type="checkbox" name="gender" class="checkbox1" onclick="checkOnlyOne(this)" disabled checked></label>
                        <%} %>
                        </div>
                    </div> 
                    <div class="menu-margin margin-left" id="tutor-marketing" >
						<div class="info-title inlineblock">
							<span class="margin-right menu-list-name">마케팅 정보수신</span>
                        </div>
                        <div class="info-content inlineblock"></div>
                        <div class="toggle" id="marketingBtn" style="vertical-align: middle;">
                        <%if(m.getMarketing()=='Y'){ %>
                            <input type="checkbox" name="toggle1" id="toggle1" value="on" checked>                              
                            <label for="toggle1"></label>
                        </div>
                        <div id="onOff" style="margin: 0px; width: 20px; display: inline-block; margin-left: 10px;"></div>
                        <%}else{ %>
                          	<input type="checkbox" name="toggle1" id="toggle1" value="off" >
                            <label for="toggle1"></label>
                     </div>
                     <div id="onOff" style="margin: 0px; width: 20px; display: inline-block; margin-left: 10px;"></div>
                         <%} %>
                     <input type="hidden" id="marketing" name="marketing" value="<%=m.getMarketing() %>">
				</div>
			</div>                    
			<div class="line"></div>
            <div id="save-info">
				<button type="submit" id="saveBtn" style="margin-bottom:30px;">저장하기</button>
			</div>
		</form>               
	</div>
</section>
<!-- 비밀번호 스크립트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->                   
<script>
	$("#newPw").blur(e=>{
		const str=/^(?=.*[a-z])(?=.*\d)(?=.*[@$!%*#?&])[a-z\d@$!%*#?&]{8,}$/;
		let password=$("#newPw").val();
		
		if(!str.test(password)){                       				                       		
			alert("영문자, 숫자, 특수기호를 포함하여 8글자 이상 입력하세요.");
			$("#newPw").val('');
		}
	});
	$("#newPwCheck").blur(e=>{
		if($("#newPw").val()==$("#newPwCheck").val()){
			$("#pwCheckMsg").html("새로운 비밀번호 일치").css('color','green');
		
		}else{
			$("#pwCheckMsg").html("새로운 비밀번호 불일치").css('color','red');
		}
	});
</script> 
<!-- 비밀번호 스크립트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->      
<script>
//정보수정
//////마케팅 값 가벼오는 방법!!!!!!!!!!!!!!!!!!!!!!!!
	$("input[type=checkbox]").change(e=>{                    		
		let marketing=$(e.target);
		if(marketing.is(':checked')){
			$("#marketing").val('Y');
		}else{
			$("#marketing").val('N');
		}                    		
	})
</script>
<!-- 튜터	정보수정페이지 -->
<%}else{ %>
<section id="sectionMargin">
    <div id="mypage-container" class="flex">
		<div class="inlineblock overflow" id="mypage-menu">          
			<h3>MY PAGE</h3>
			<div class="" id="my-menu" >
				<ul id="menu-list">
					<li><a href="<%=request.getContextPath()%>/member/mypage.do?email=<%=m.getEmail()%>">· 나의정보</a></li>
					<li><a href="<%=request.getContextPath()%>/member/updateMember.do?email=<%=m.getEmail()%>">· 정보수정</a></li>
						<nav class="nav-sub">
                             <li>· 클래스</li>
              	                <ul id="sub-menu">
                                	<li><a href="<%=request.getContextPath()%>/member/tutorRunClass.do?email=<%=m.getEmail()%>">- 운영중인 클래스</a></li>
                                    <li><a href="<%=request.getContextPath()%>/member/tutorEndClass.do?email=<%=m.getEmail()%>">- 운영종료 클래스</a></li>
                               </ul>
                        </nav>
                    <li><a href="<%=request.getContextPath()%>/member/dropMember.do?email=<%=m.getEmail()%>">· 회원탈퇴</a></li>
				</ul>                  
			</div>
		</div>   
		<div id="mypage-content" class="inlineblock">
			<div class="">
				<img id="info-icon" src="<%=request.getContextPath() %>/img/setting.png" width="20px" height="20px" class="inlineblock" style="margin-bottom: 10px;">
				<h4 class="inlineblock" style="margin-bottom: 0;">정보수정</h4> 
            </div>
            <div class="line"></div>
            <div style="margin-left: 80px;">
            	<form name="userUpdateFrm" id="userUpdateFrm" action="" method="post"></form>	
            	<div class="menu-margin margin-left" id="tutor-img" >
                	<div class="info-title inlineblock">
                		<span class="margin-right menu-list-name">사진</span>
                	</div>
                	<div id="newTutorImg" class="info-content inlineblock">
                		<img src=" <%=request.getContextPath() %>/upload/<%=m.getProfileImg() %>">
                	</div>
                	<div class="inlineblock" style="margin-left: 10px;" id="uploadBtn-tutor">
                        <input type="button" value="기본이미지" onclick="deleteTutorImg();">
                        <input type="file" name="" id="" value="파일 선택" class="" width="">
                    </div>
                </div>
				<div class="menu-margin margin-left" id="tutor-email" >
                    <div class="info-title inlineblock">
                        <span class="margin-right menu-list-name">이메일</span>
                    </div>
                    <div class="info-content inlineblock">
                        <input type="text" readonly name="" placeholder="<%=m.getEmail()%>" class="placeholder-center" size="25">
                    </div>
                    <div class="inlineblock">
                        <p class="guide">※ 아이디는 변경이 불가능합니다.</p>
                    </div>
                </div>
                <div class="menu-margin margin-left" id="tutor-name">
                    <div class="info-title inlineblock">
                    	<span class="margin-right menu-list-name">이름</span>
                    </div>
                    <div class="info-content inlineblock">
                    	<input type="text"  readonly name="" placeholder="<%=m.getMemberName() %>" class="placeholder-center" size="25">
                    </div>
                </div>
                <div class="menu-margin margin-left" id="tutor-beforePw">
                    <div class="info-title inlineblock">
                        <span class="margin-right menu-list-name">현재 비밀번호</span>
                    </div>
                    <div class="info-content inlineblock">
                        <input type="password" name=""  class="placeholder-center " size="25" required>
                    </div>
                    <div class="inlineblock">
                        <p class="guide">※ 현재 비밀번호를 꼭 입력한 뒤 정보수정이 가능합니다.</p>
                    </div>
                </div>
                <div class="menu-margin margin-left" id="tutor-afterPw">
                    <div class="info-title inlineblock">
                        <span class="margin-right menu-list-name">새로운 비밀번호</span>
                    </div>
                    <div class="info-content inlineblock">
                        <input type="password" name="" class="placeholder-center " size="25">
                    </div>
                    <div class="inlineblock">
                        <p class="guide">※ 대/소문자, 숫자, 특수기호를 포함하여 8글자 이상 입력하세요.</p>
                    </div>
                </div>
                <div class="menu-margin margin-left" id="tutor-pwCheck">
                    <div class="info-title inlineblock">
                        <span class="margin-right menu-list-name">새로운 비밀번호 확인</span>
                    </div>
                    <div class="info-content inlineblock">
                        <input type="password" name="" class="placeholder-center " size="25">
                    </div>
                    <span id="pwCheckMsg"></span>
                        <script>
                        	$("#newPw").blur(e=>{
                        		const str=/^(?=.*[a-z])(?=.*\d)(?=.*[@$!%*#?&])[a-z\d@$!%*#?&]{8,}$/;
                        		let password=$("#newPw").val();
                        		
                        		if(!str.test(password)){                       				                       		
                        			alert("영문자, 숫자, 특수기호를 포함하여 8글자 이상 입력하세요.");
                        			$("#newPw").val('');
                        			/* $("#newPw").focus(); */
                        			
                        		}else{
                        			
                        		}
                        	});
                        	$("#newPwCheck").blur(e=>{
                        		if($("#newPw").val()==$("#newPwCheck").val()){
                        			$("#pwCheckMsg").html("새로운 비밀번호 일치").css('color','green');
                        		
                        		}else{
                        			$("#pwCheckMsg").html("새로운 비밀번호 불일치").css('color','red');
                        		
                        		}
                        	});
                        </script>  
                </div> 
                <div class="menu-margin margin-left" id="tutor-nick">
                    <div class="info-title inlineblock">
                        <span class="margin-right menu-list-name">닉네임</span>
                    </div>
                    <div class="info-content inlineblock">
                        <input id="newnickname" type="text" name="newNick" placeholder="<%=m.getNickname() %>" class="placeholder-center " size="25">
                    </div>
                    <div class="inlineblock">
                        <button id="nicknameDuplicate" style="margin-left: 10px;">닉네임 중복확인</button>
                    </div>                        
                </div> 
                <div class="menu-margin margin-left" id="tutor-phone">
                    <div class="info-title inlineblock">
                    	<span class="margin-right menu-list-name">전화번호</span>
                    </div>
                    <div class="info-content inlineblock">
                        <input type="text" name="" placeholder="<%=m.getPhone()%>" class="placeholder-center" size="25">
                    </div>
                </div> 
                <div class="menu-margin margin-left" id="tutor-gender">
                    <div class="info-title inlineblock">
                    	<span class="margin-right menu-list-name ">성별</span>
                    </div>
                    <div class="info-content inlineblock">
                        <label>남자<input value="man" type="checkbox" name="gender" class="checkbox1" onclick="checkOnlyOne(this)" disabled checked></label>
                        <label>여자<input value="woman" type="checkbox" name="gender" class="checkbox1" onclick="checkOnlyOne(this)" disabled></label>
                        <!--DB에서 남자면 여자 disabled 여자면 남자 disabled -->
                    </div>
                </div> 
                <div class="menu-margin margin-left" id="tutor-marketing" >
                    <div class="info-title inlineblock">
                     	<span class="margin-right menu-list-name">마케팅 정보수신</span>
                    </div>
                    <div class="info-content inlineblock"></div>
                    <div class="toggle" id="marketingBtn" style="vertical-align: middle;">
                    <%if(m.getMarketing()=='Y'){ %>
                         <input type="checkbox" name="toggle1" id="toggle1" value="on"  checked>
                         <label for="toggle1"></label>
                    </div>
                    <div id="onOff" style="margin: 0px; width: 20px; display: inline-block; margin-left: 10px;"></div>
                    <%}else{ %>
                      	 <input type="checkbox" name="toggle1" id="toggle1" value="off" >
                         <label for="toggle1"></label>
	                </div>
	                <div id="onOff" style="margin: 0px; width: 20px; display: inline-block; margin-left: 10px;"></div>
                    <%} %>
                </div>
                <div class="line"></div>
                <div id="save-info">
                    <button id="saveBtn">저장하기</button>
                </div>    
			</div>
		</div>
	</div>
</section>
<%} %>
<%@ include file="/views/common/footer.jsp"%>
 <script>
 
 	/* 유저 기본이미지로 변경 */
	const deleteImg=()=>{
		$("#newImg").find("img").attr("src","<%=request.getContextPath()%>/upload/userimg.png");		
	}
	/* 튜터 기본이미지로 변경 */
	const deleteTutorImg=()=>{
		$("#newTutorImg").find("img").attr("src","<%=request.getContextPath()%>/upload/userimg.png");		
	}
	
	/* 닉네임 중복확인 팝업창 - 유저 */
   	$("#nickDuplicateBtn").click(e=>{
   		let newNick=$("#newNick").val();
   		
   		var _left = Math.ceil(( window.screen.width - 500 )/2);
   	    var _top = Math.ceil(( window.screen.height - 150 )/2);

   		open("<%=request.getContextPath()%>/member/nicknameDuplicate.do?newNickname="+newNick,"_blank","width=500, height=150, left="+_left+", top="+_top);                  		
   	});
	
   	/* 닉네임 중복확인 팝업창 - 튜터 */
   	$("#nickDuplicateBtn").click(e=>{
   		let newNick=$("#newNick").val();
   		
   		var _left = Math.ceil(( window.screen.width - 500 )/2);
   	    var _top = Math.ceil(( window.screen.height - 150 )/2);

   		open("<%=request.getContextPath()%>/member/nicknameDuplicate.do?newNickname="+newNick,"_blank","width=500, height=150, left="+_left+", top="+_top);                  		
   	});
	
	/* 로케이션 팝업창 */
   	$("#updateLocation").click(e=>{
   		var _left = Math.ceil(( window.screen.width - 500 )/2);
   	    var _top = Math.ceil(( window.screen.height - 500 )/2);
   	
   		open("<%=request.getContextPath()%>/member/popupLocation.do","_blank","width=500, height=500, left="+_left+", top="+_top);
   	});

   	/* 카테고리 팝업창 */
  	$("#updateCategory").click(e=>{
  		var _left = Math.ceil(( window.screen.width - 500 )/2);
    	var _top = Math.ceil(( window.screen.height - 500 )/2);
  	
  		open("<%=request.getContextPath()%>/member/popupCategory.do","_blank","width=500, height=500, left="+_left+", top="+_top);
  	});
                       	
	// 마이클래스 서브메뉴!!
   $("#sub-menu").hide();
   $(".nav-sub").mouseenter(e=>{
       $("#sub-menu").show();
   })  
   $(".nav-sub").mouseleave(e=>{
       $("#sub-menu").hide();
   });
   
   /* 마케팅정보수신 글씨 띄우기 */
   const check=document.getElementById("toggle1");
	if(check.checked){
	        $("#onOff").html("on").css({"color":"#94D5DE","font-size":"15px", "font-weight":"bold"});
	    }else{
	        $("#onOff").html("off").css({"color":"black","font-size":"15px", "font-weight":"bold"});
	    }
	$("#toggle1").click(e=>{
	    if(check.checked){
	        $("#onOff").html("on").css({"color":"#94D5DE","font-size":"15px", "font-weight":"bold"});
	    }else{
	        $("#onOff").html("off").css({"color":"black","font-size":"15px", "font-weight":"bold"});
	    }
	});    

</script>		