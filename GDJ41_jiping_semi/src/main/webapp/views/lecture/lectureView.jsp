<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="com.jiping.lecture.model.vo.Lecture,
				com.jiping.lecture.model.vo.LectureContent,
				com.jiping.lecture.model.vo.LectureSchedule,
				com.jiping.lecture.model.vo.LectureImg,
				com.jiping.tutor.model.vo.Tutor,
				com.jiping.member.model.vo.Member,
				com.jiping.tutor.model.vo.Certificate,
				com.jiping.payment.model.vo.Payment,
				com.jiping.lecture.model.vo.LectureComment,
				com.jiping.lecture.model.vo.VodLecture,
				java.util.List,
				java.time.LocalDate " %>
<%
Lecture le= (Lecture)request.getAttribute("le");
LectureContent content= (LectureContent)request.getAttribute("content");
/* LectureSchedule sc = (LectureSchedule)request.getAttribute("schedule"); */
List<LectureSchedule> list= (List)request.getAttribute("scList");
List<LectureImg> imgList= (List)request.getAttribute("imgList");
Tutor tutor=(Tutor)request.getAttribute("tutor");
Member m=(Member)request.getAttribute("m");
List<Certificate> cList= (List)request.getAttribute("c");
LectureComment lc= (LectureComment)request.getAttribute("lc");
List<LectureComment> lcList= (List)request.getAttribute("lcList");
List<VodLecture> vodList=(List)request.getAttribute("vodList");
List<Payment> payList=(List)request.getAttribute("payList");
boolean flag = false;
LectureImg[] arr= new LectureImg[4];
	for(int i=0; i<imgList.size(); i++) {
		arr[i]= imgList.get(i);
	}
	System.out.println("arr"+ arr[0]);
	 System.out.println("jsp:"+ lcList); 
	 	 
%>

<section>
        <div class="container">
            <div id="mainInfo" class="row">
                <!--보라 1-->
         <div id="left" class="col-7">
             <div id="info_class">
                 <p class="card-text"><small class="text-muted">이 클래스는 <%=le.getLectureType() %>클래스 입니다. </small>
                 </p>
                     <div class="tutor-btn">
                         <h5 class="card-title">
                             <%=le.getLectureTitle() %>
                         </h5>
                 <%if(loginMember!=null&&loginMember.getNickname().equals(tutor.getNickname())) { %>
                         <button type="button" class="btn-tutor btn btn-primary btn-basic">클래스 상세정보 수정</button>
                     <%} %>
                     </div>
                     <!--class="card-title"-->
                     <div class="card">
                         <div class="card-body">
                             <div id="carouselExampleControls" class="carousel slide"
                                 data-bs-ride="carousel">
                                 <div class="carousel-inner">
                                     <div class="carousel-item active">
                                     <% if(arr[0]!=null) { %>
                                         <img src="<%=request.getContextPath()%>/upload/<%=arr[0].getLectureFileName()%>"
                                             class="d-block w-100" alt="...">
                                      <%} %>
                                     </div>
                                     <div class="carousel-item ">
                                     <% if(arr[1]!=null) { %>
                                         <img src="<%=request.getContextPath()%>/upload/<%=arr[1].getLectureFileName()%>"
                                             class="d-block w-100" alt="...">
                                      <%} %>
                                     </div>
                                     <div class="carousel-item ">
                                     <% if(arr[2]!=null) { %>
                                         <img src="<%=request.getContextPath()%>/upload/<%=arr[2].getLectureFileName()%>"
                                             class="d-block w-100" alt="...">
                                      <%} %>
                                     </div>
                                 </div>
                                 <button class="carousel-control-prev" type="button"
                                     data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                     <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                     <span class="visually-hidden">Previous</span>
                                 </button>
                                 <button class="carousel-control-next" type="button"
                                     data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                     <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                     <span class="visually-hidden">Next</span>
                                 </button>
                             </div>
                         </div>
                     </div>
             </div>

             <div id="info_notice">
                 <h5 class="card-title">클래스 상세소개</h5>
                 <div class="card">
                     <div class="card-body">
                         <p class="card-text">
                             <%=content.getLectureIntroduce() %>
                         </p>
                     </div>
                 </div>
             </div>
             <div id="info_basic">
                 <h5 class="card-title">클래스 진행방식</h5>
                 <div class="card">
                     <div class="card-body">
                         <p class="card-text">
                             <%=content.getCurriculum() %>
                         </p>
                     </div>
                 </div>

             </div>
             <div id="info_recommend">
                 <h5 class="card-title">이런사람에게 추천합니다!</h5>
                 <div class="card">
                     <div class="card-body">
                         <p class="card-text">
                             <%=content.getRecommend() %>
                         </p>
                     </div>
                 </div>
             </div>
             <div id="info_extracost">
                 <h5 class="card-title">잠깐! 이 수업은 준비물이 필요합니다.</h5>
                 <div class="card">
                     <div class="card-body">
                         <p class="card-text">
                             <%=content.getLectureNotice() %>
                         </p>
                     </div>
                 </div>
             </div>
         </div>
         <!-- --------------------------------------------------------------------------오른쪽 -->

         <div id="right" class="col">
             <div id="tutor" style="margin-top: 39px;">
                <div class="tutor-btn">
	                <h5 class="card-title">튜터를 소개합니다! </h5>
	                <%if(loginMember!=null&&loginMember.getNickname().equals(tutor.getNickname())) { %>
	                <button type="button" class="btn-tutor btn btn-primary btn-basic">튜터소개 수정</button>
	                <%} %>
              	</div>
                <div class="card">
                     <div class="card-body">
                         <div class="d-flex align-items-center">
                             <div name="flex-shrink-0">
                                 <img src="<%=request.getContextPath() %>/upload/<%=m.getProfileImg() %>"
                                     alt="..." class="img_basic img_tutor">
                             </div>
                             <div class="flex-grow-1 ms-3">
                                 <span>
                                     <%=tutor.getNickname() %>
                                 </span><br>
                                 <span>연락처 : <%=tutor.getPhone() %> </span><br>
                                 <a href="<%=tutor.getInsta() %>"><img
                                         src="https://thedaylightaward.com/wp-content/uploads/2019/12/instagram-icon.png"
                                         alt="instagram" class="socialImg">
                                 </a>
                                 <a href="<%=tutor.getFacebook() %>"><img
                                         src="https://cdn.worldvectorlogo.com/logos/facebook-icon-1.svg"
                                         alt="facebook" class="socialImg">
                                 </a>
                                 <a href="<%=tutor.getBlog() %>"><img
                                         src="https://www.coolstay.co.kr/img/main/naver.png" alt="blog"
                                         class="socialImg">
                                 </a>
                             </div>
                         </div>
                         <br>
                         <div class="flex-grow-1 ms-3">
                             <span>경력</span>
                             <ul>
                                 <%for(Certificate c: cList) { %>
                                     <li>
                                         <%=c.getCertificateText() %>
                                     </li>
                                     <%} %>
                             </ul>
                             <span>튜터의 한마디</span>
                             <p class="tutorbox_info">
                                 <%=tutor.getTutorMsg() %>
                             </p>
                         </div>
                     </div>
                 </div>
             </div>
             
              <div id="class_schedule">
              <div class="tutor-btn">
                <h5 class="card-title">수업일정 </h5>
                <%if(loginMember!=null&&loginMember.getNickname().equals(tutor.getNickname())) { %>
                <button type="button" class="btn-tutor btn btn-primary btn-basic">일정 및 장소
                  수정</button>
                <%} %>
              </div>
<!-- ----------------------------------------------------------------------------   수업일정 -->
<!-- ----------------------------------------------------------------------------   원데이일때 -->
             <%if(le.getLectureType().equals("원데이")) {%>
                     <div class="list-group">
                         <%for(LectureSchedule lesc: list) { %>
                             <label class="list-group-item">
                                 <input id="innerboxcheck" class="form-check-input me-1" type="checkbox"
                                     value="<%=lesc.getScheduleNo()%>">
                                 <div class="schedule-text">
                                     <span class="class-date">
                                         <%=lesc.getLectureDate() %>
                                     </span>
                                     <span style="padding-left:30px">
                                         <%=lesc.getStartDate()+"-"+lesc.getEndDate() %>
                                     </span>
                                     <br>
                                     <span>
                                         <%=lesc.getLectureAddress() %>
                                     </span>
                                 </div>
                                 <span class="class-region">
                                     <%=lesc.getLectureLocation() %>
                                 </span>
                             </label>
                             <%} %>
                         <%if(!(loginMember!=null&&loginMember.getNickname().equals(tutor.getNickname()))) { %>
                         <div id="scheduleBtn" class="d-flex justify-content-center">
                             <button id="wish" type="button" class="btn btn-primary btn-lg btn-pink ">♥ 찜
                                 하
                                 기</button>
                             <button id="apply-oneday" type="button" class="btn btn-primary btn-lg btn-basic">수강 신청</button>
                         </div>
                         <%} %>
                     </div>
                 </div>
                 <div id="class_submit" style="display: none;">
                     <h5 class="card-title">수강신청</h5>
                     <div class="card">
                         <div class="card-body apply">
                             <div id="apply-class">
                                 <div class="card">
                                     <div class="card-body">
                                         <div class="schedule-text">
                                             <span id="apply-title" class="class-date">타이틀</span><br>
                                             <span id="apply-date" class="class-date">날짜 </span>
                                             <span id="apply-time" style="padding-left:30px"> 시작시간-끝시간</span><br>
                                             <span id="apply-adr">주소</span>
                                         </div>
                                     </div>
                                 </div>
                                 <div id="applycount">
                                     <h6>수강신청 현황</h6>
                                     <span>14/15</span>
                                 </div>
                                 <div>
                                     <h6>튜터에게 전하는 말</h6>
                                     <div>
                                         <textarea id="totutor" class="msgbox" cols="43" rows="7"
                                             placeholder="예) 초보니까 쉽게 가르쳐주세요!"></textarea>
                                         <div id="check-word-count" style="float: right;">(0/70)</div>
                                     </div>
                                 </div>
                                 <div>
                                     <p>총 결제금액</p>
                                     <p id="apply-cost" style="float: right;">가격</p>
                                 </div>
                             </div>

                         </div> 

                         <div>
                             <form action="<%=request.getContextPath()%>/lecture/lecturePayment">
                                 <input type="hidden" name="thumbnail"
                                     value="<%=imgList.get(0).getLectureFileName()%>">
                                 <input type="hidden" name="lectureType" value="<%=le.getLectureType() %>">
                                 <input type="hidden" name="lectureTitle" value="<%=le.getLectureTitle() %>">
                                 <input type="hidden" name="tutorImg" value="<%=m.getProfileImg() %>">
                                 <input type="hidden" name="tutorNickName" value="<%=tutor.getNickname() %>">
                                 <input type="hidden" name="lecturePrice" value="<%=le.getPrice() %>">
                                 <input type="hidden" name="lectureDate" value="">
                                 <input type="hidden" name="lectureAddr" value="">
                                 <input type="hidden" name="lectureNo" value="<%=le.getLectureNo() %>">
                                 <input type="hidden" name="scheduleNo" id="paymentScheduleNo">
                                 <button type="submit" class="btn btn-primary btn-lg btn-basic"
                                     style="float: right;">결 제 하 기</button>
                              </form>
                         </div>
                     </div>
                 </div>
                 <%} %>
                 
                 
<!-- ----------------------------------------------------------------------------   다회차일때 -->
				<%if(le.getLectureType().equals("다회차")) {%>
                     <div class="list-group">
                         <%for(int i=0; i<list.size(); i++) { %>
                               <div class="list-group-item">
				                  <span id="innerboxcheck"> <%=i+1 %> 회</span>
				                  <div class="schedule-text">
				                    <span class="class-date"><%=list.get(i).getLectureDate() %> </span> 
				                    <span> <%=list.get(i).getStartDate()+"-"+list.get(i).getEndDate() %></span>
				                    <br>
				                    <span><%=list.get(i).getLectureAddress() %></span>
				                  </div>
				                  	<span class="class-region"><%=list.get(i).getLectureLocation() %></span>
		                		</div>
                             <%} %>
                         <div id="scheduleBtn" class="d-flex justify-content-center">
                             <button id="wish" type="button" class="btn btn-primary btn-lg btn-pink ">♥ 찜하기</button>
                             <button id="apply" type="button" class="btn btn-primary btn-lg btn-basic">수강 신청</button>
                         </div>
                     </div>
                 </div>
                 <div id="class_submit" style="display: none;">
                     <h5 class="card-title">수강신청</h5>
                     <div class="card">
                         <div class="card-body apply">
                             <div id="apply-class">
                                 <div class="card">
                                     <div class="card-body">
                                         <div class="schedule-text">
                                             <span id="apply-title" class="class-date"><%=le.getLectureTitle() %></span><br>
                                            
                                             <%-- ¿<span id="apply-date" class="class-date"><%=list.get(0).getLectureDate() %> </span>
                                              --%><!-- <span id="apply-time" style="padding-left:30px"> 시작시간-끝시간</span><br> -->
                                             <span id="apply-adr">상세주소 : <%=list.get(0).getLectureAddress() %></span>
                                             
                                         </div>
                                     </div>
                                 </div>
                                 <div id="applycount">
                                     <h6>수강신청 현황</h6>
                                     <span>14/15</span>
                                 </div>
                                 <div>
                                     <h6>튜터에게 전하는 말</h6>
                                     <div>
                                         <textarea id="totutor" class="msgbox" cols="43" rows="7"
                                             placeholder="예) 초보니까 쉽게 가르쳐주세요!"></textarea>
                                         <div id="check-word-count" style="float: right;">(0/70)</div>
                                     </div>
                                 </div>
                                 <div>
                                     <p>총 결제금액</p>
                                     <p id="apply-cost" style="float: right;"><%=le.getPrice() %></p>
                                 </div>
                             </div>
                            

                         </div> 

                         <div>
                             <form action="<%=request.getContextPath()%>/lecture/lecturePayment">
                                 <input type="hidden" name="thumbnail"
                                     value="<%=imgList.get(0).getLectureFileName()%>">
                                 <input type="hidden" name="lectureType" value="<%=le.getLectureType() %>">
                                 <input type="hidden" name="lectureTitle" value="<%=le.getLectureTitle() %>">
                                 <input type="hidden" name="tutorImg" value="<%=m.getProfileImg() %>">
                                 <input type="hidden" name="tutorNickName" value="<%=tutor.getNickname() %>">
                                 <input type="hidden" name="lecturePrice" value="<%=le.getPrice() %>">
                                 <input type="hidden" name="lectureDate" value="">
                                 <input type="hidden" name="lectureAddr" value="">
                                 <button type="submit" class="btn btn-primary btn-lg btn-basic"
                                     style="float: right;">결 제 하 기</button>
                                 </form>
                         </div>
                     </div>
                 </div>
            <%} %>
                     
<!-- ----------------------------------------------------------------------------   vod일때 -->
                     <%if(le.getLectureType().equals("VOD")) { %>
                             <div class="list-group">
                           <%for(int i=0; i<vodList.size(); i++) { %>
                              <div class="list-group-item">
                                  <span id="innerboxcheck">
                                      <%=i+1 %>강.
                                  </span>
                                  <div class="schedule-text">
                                      <span class="class-date">
                                          <%=vodList.get(i).getVodTitle() %>
                                      </span> <!-- <span> 19:30-21:00</span> -->
                                  </div>
                              </div>
				        <!-- </div> -->
				        <%} %>
				            <%for(Payment p: payList) {
				                if(loginMember!=null&&loginMember.getEmail().equals(p.getEmail())) {
				                flag=true; }%>
				                <%} %>
				                <% if(flag==false) { %>
			                        <%if(!(loginMember!=null&&loginMember.getNickname().equals(tutor.getNickname()))) { %>
			                         <div id="scheduleBtn" class="d-flex justify-content-center">
			                             <button id="wish" type="button" class="btn btn-primary btn-lg btn-pink ">♥ 찜하기</button>
			                             <button id="apply" type="button" class="btn btn-primary btn-lg btn-basic">수강 신청</button>
			                         </div>
                         				<%} %>
			                        <%} else if(flag==true) {%>
                             </div>
                         </div>
<%--                          <button type="submit" class="btn btn-primary btn-lg btn-basic" style="float: right;"
                             onclick="location.assign('<%=request.getContextPath()%>/lecture/vodroom.do?lectureNo=<%=le.getLectureNo()%>')">강
                             의 실 입 장</button>
                         <% } %> --%>
                         <button type="submit" class="btn btn-primary btn-lg btn-basic" style="float: right;"
                             onclick="goToRoom();">강
                             의 실 입 장</button>
                         <% } %>

                             <div id="class_submit" style="display: none;">
                                 <h5 class="card-title">수강신청</h5>
                                 <div class="card">
                                     <div class="card-body apply">
                                         <div id="apply-class">
                                             <div id="applycount">
                                                 <h6>이 강좌는 무기한으로 수강이 가능합니다.</h6>
                                             </div>
                                             <div>
                                                 <p>총 결제금액</p>
                                                 <p id="apply-cost" style="float: right;">
                                                     <%=vodList.get(0).getVodPrice() %>
                                                 </p>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                                 <div>
                                     <form action="<%=request.getContextPath()%>/lecture/lecturePayment">
                                         <input type="hidden" name="thumbnail"
                                             value="<%=imgList.get(0).getLectureFileName()%>">
                                         <input type="hidden" name="lectureType"
                                             value="<%=le.getLectureType() %>">
                                         <input type="hidden" name="lectureTitle"
                                             value="<%=le.getLectureTitle() %>">
                                         <input type="hidden" name="tutorImg" value="<%=m.getProfileImg() %>">
                                         <input type="hidden" name="tutorNickName"
                                             value="<%=tutor.getNickname() %>">
                                         <input type="hidden" name="lecturePrice"
                                             value="<%=vodList.get(0).getVodPrice() %>">
                                         <input type="hidden" name="lectureNo" value="<%=le.getLectureNo() %>">
                                         <input type="hidden" name="scheduleNo" value="0">
                                         <button type="submit" class="btn btn-primary btn-lg btn-basic"
                                             style="float: right;">결 제 하
                                             기</button>
                                     </form>
                                 </div>
                             </div>
                          </div>
     <%} %>
   
     <%if(loginMember!=null&&loginMember.getNickname().equals(tutor.getNickname())) { %>
     <div id="class_checkTutor">
              <!-- <h5 class="card-title">수강신청11111</h5> -->
              <div class="card">
                <div class="card-body apply">
                  <div id="applycount">
                    <span>현재 수강인원(신청) 현황</span>
                    <span></span>
                  </div>
                  <div class="tutor-btn">
                    <span>수강생 목록</span>
                    <button type="button" class="btn btn-primary btn-basic">확 인 하 기</button>
                  </div>
                </div>
              </div>
            </div>
     <%} %>
     </div> 
<!-- -------------------------------------------------------------------------  vod 끝 -->
          <!-- ------------------- 수강신청 끝 -->

     <script>
         $("#totutor").keyup(e => {
             let length = $(e.target).val().length;
             $("#check-word-count").html("(" + length + "/70)");
         });

         $("#apply").click(e => { //다회차, vod
        	if("<%=loginMember!=null?loginMember.getEmail():""%>"!=""){ 
             $("#class_submit").show();
        	  }else{
        		 alert("로그인 후 수강이 가능합니다.");
        		 $("#loginBtn").click();
        	 } 
         });

     </script>
         <!-- ----------------------------------------------- 공통 스크립트 -->
         <script>
             let scheduleNo=0;
             $("input[type=checkbox]").change(e => {
                 scheduleNo = $(e.target).val();
                 $("#paymentScheduleNo").val(scheduleNo);
                 $("#class_checkTutor").show();
             });

             $("#apply-oneday").click(e => {
            	 if("<%=loginMember!=null?loginMember.getEmail():""%>"!=""){
                 $.ajax({
                     url: "<%=request.getContextPath()%>/lecture/scheduleInfo.do",
                     type: "get",
                     dataType: "json",
                     data: { "scheduleNo": scheduleNo },
                     success: data => {
                             $("input[name=lectureDate]").val(data["lectureDate"]);
                             $("input[name=lectureAddr]").val(data["lectureAddress"]);
                             const title = $("#apply-title").html("<%=le.getLectureTitle() %>");
                             const date = $("#apply-date").html(data["lectureDate"]);
                             const time = $("#apply-time").html(data["startDate"] + "-" + data["endDate"]);
                             const address = $("#apply-adr").html(data["lectureAddress"]);
                             const cost = $("#apply-cost").html(data["lecturePrice"]);
                             $("#applycount").find("span").html(data["lecturePersons"]);
                             $("#class_submit").show();
                             studentCount(data["scheduleNo"]);
                          }  
                 	})
            	 }else {
            		 alert("로그인 후 수강이 가능합니다.");
            		 $("#loginBtn").click();
            	 }
             });
          
             function studentCount(sendData) {
            	 $.ajax({
            		url : "<%= request.getContextPath() %>/checkStudentCount",
            		data : {"scheduleNo":sendData},
            		dataType : "json",
            		success : data => {
            			console.log(data);
            			let text = $("#applycount").find("span").text();
            			$("#applycount").find("span").html(data["count"] + "/" + text);
            		}
            	 });
             }

             $("#totutor").keyup(e => {
                 let length = $(e.target).val().length;
                 if (length > 70) {
                     alert("입력가능한 글자 수를 초과하였습니다.");
                     let temp = $(e.target).val().substring(0, length - 1);
                     $(e.target).val(temp);
                 }
                 $("#check-word-count").html("(" + length + "/70)");
             });

         </script>
     </div>
     
     <!-- -------------------------------------------------------------------------  리뷰등록 시작 -->
     <div id="review" class="row-1">
          	<!--보라 2-->
		   <div class="line"></div>
		   <div class="review-enroll card">
		       <div class="card-body">
		           <!-- -------------------------------------------------- -->
		           <form action="<%=request.getContextPath() %>/lecture/review.do" method="post">
		               <div class="review-head">
		                   <div id="lecture-title">
		                       <%=le.getLectureTitle() %>
		                   </div>
		                   <div id="tutor-review">
		                       <%=le.getNickName() %> 튜터
		                   </div>
		               </div>
		               <%if(loginMember!=null) { %>
		                   <div id="starrate">
		                       <div>
		                           <img class="img_basic img_review"
		                               src="<%=request.getContextPath()%>/upload/<%=loginMember.getProfileImg()%>">
		                           <span>
		                               <%=loginMember.getNickname() %>
		                           </span>
		                       </div>
		                       <div>
		                           <fieldset class="rating">
		                               <span>평점:</span>
		                               <input type="radio" id="star5" name="rating" value="5" /><label
		                                   class="full" for="star5" title="Awesome - 5 stars"></label>
		                               <input type="radio" id="star4half" name="rating" value="4.5" /><label
		                                   class="half" for="star4half"
		                                   title="Pretty good - 4.5 stars"></label>
		                               <input type="radio" id="star4" name="rating" value="4" /><label
		                                   class="full" for="star4" title="Pretty good - 4 stars"></label>
		                               <input type="radio" id="star3half" name="rating" value="3.5" /><label
		                                   class="half" for="star3half" title="Meh - 3.5 stars"></label>
		                               <input type="radio" id="star3" name="rating" value="3" /><label
		                                   class="full" for="star3" title="Meh - 3 stars"></label>
		                               <input type="radio" id="star2half" name="rating" value="2.5" /><label
		                                   class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
		                               <input type="radio" id="star2" name="rating" value="2" /><label
		                                   class="full" for="star2" title="Kinda bad - 2 stars"></label>
		                               <input type="radio" id="star1half" name="rating" value="1.5" /><label
		                                   class="half" for="star1half" title="Meh - 1.5 stars"></label>
		                               <input type="radio" id="star1" name="rating" value="1" /><label
		                                   class="full" for="star1" title="Sucks big time - 1 star"></label>
		                               <input type="radio" id="starhalf" name="rating" value="0.5" /><label
		                                   class="half" for="starhalf"
		                                   title="Sucks big time - 0.5 stars"></label>
		                           </fieldset>
		                       </div>
		                   </div>
		                   <%} %>
		                	<textarea id="input-review" class="card-body msgbox" id="totutor-review"
		                    name="commentContent" cols="43" rows="3"
		                    placeholder="강의에대한 솔직한 평가를 남겨주세요! &#13;&#10;*악의적인 비방은 무통보 삭제가 될 수 있습니다."></textarea>
		                	<input type="hidden" name="level" value="1">
		                <%if(loginMember!=null) {%>
		                  <input type="hidden" name="writer" value="<%=loginMember.getNickname()%>">
		                  <%} %>
		                  <input type="hidden" name="letureNo" value="<%=le.getLectureNo()%>">
		                  <input type="hidden" name="lecutreCommentRef" value="0">
		                  <input type="hidden" name="lectureType"
		                      value="<%=le.getLectureType()%>">
		                  <div>
		                      <span id="review-count" style="float: right;">(0/100)</span> <br>
		                      <button type="submit" class="btn btn-primary btn-lg btn-basic"
		                          style="float: right; ">리뷰
		                          등록하기</button>
		                  </div>	
		           </form>
		       </div>
             </div>
             </div>
             <script>
                 $("#input-review").keyup(e => {
                     let length = $(e.target).val().length;
                     if (length > 100) {
                         alert("입력가능한 글자 수를 초과하였습니다.");
                         let temp = $(e.target).val().substring(0, length - 1);
                         $(e.target).val(temp);
                     }
                     $("#review-count").html("(" + length + "/100)");
                 });

                 $("#input-review").keyup(e => { //focus안되는거 질문
                     $.ajax({
                         url: "<%=request.getContextPath()%>/lecture/lecturePaymentAjax",
                         dataType: "json",
                         data: { "lectureNo": "<%=le.getLectureNo()%>", "paymentEmail": "<%=loginMember!=null?loginMember.getEmail():""%>"},
                         success: data => {
                             if (data == null) {
                                 alert("리뷰등록은 수강생만 가능합니다.");
                                 $("#input-review").val("");

                             }
                         }
                     })
                 })
                 
                 const goToRoom =()=>{
                	 const url="<%=request.getContextPath()%>/lecture/vodroom.do?lectureNo=<%=le.getLectureNo()%>"; 
                	 const style="width=1260, height=880, left=250, top=50";
         			open(url,"_blank",style);
                 }

             </script>


<!-- ------------------------------------------------------------------------------------------------------------- 리뷰출력 시작 --->

             <div id="review-list">
                 <h5 class="card-title ">수강생 리뷰</h5>
                 <div class="card">
                 	<div class="card-body entireReview">
                 	<%if(lcList.isEmpty()) {%>
                 		<p>등록된 리뷰가 없습니다. 첫 수강생이 되어 첫 리뷰의 영광을 가져보세요 ^^</p>
                 		
               		<%} else {%>
                 		
                     <%for(LectureComment co: lcList) { 
                    	 if(co.getCommentLevel()==1) {%>
                         <div class="d-flex card-body mainreview">
                             <div name=" review flex-shrink-0">
                                 <img class="img_basic img_review" src="<%=request.getContextPath()%>/upload/<%=co.getProfileImg()%>
                                             ">
                             </div>
                             <div class=" flex-grow-1 ms-3">
                             	<div>
	                            	<div style="float: right;">
	                                    <span><%=co.getEnrollDate() %></span><span id="report">
	                                    <%if(loginMember!=null) { %>
 											<a href="javascript: reportReview('<%=co.getCommentNo()%>','<%=co.getWriter()%>','<%=le.getLectureTitle()%>');"> 신고</a></span>
	                                    <%} %>
	                                    <!-- 신고사유팝업 연결 -->
	                                </div>
	                                <span class="img-stars">
	                                    <img src="<%=request.getContextPath() %>/img/star/star<%=co.getStarRate() %>.png">
	                                </span><br>
	                                <span>
	                                   <%=co.getWriter() %>
	                                </span><br>
                                 
	                                 <p>
	                              		<%=co.getCommentContent() %>
	                         		<%if(loginMember!=null&&loginMember.getNickname().equals(tutor.getNickname())){ %>
	                                 	<button class="btn btn-enrollReply"
	                                     value="<%=co.getCommentNo() %>" style="float: right;">답글달기</button>
	                                 <%} %>
	                                 <%if(loginMember!=null&&loginMember.getNickname().equals(co.getWriter())){%>
	                                    <button type="button" class="btn deleteReply"
	                                        style="float: right;" value="<%=co.getCommentNo()%>">삭제</button>
	                                  <%} %>
	                                 </p>
								</div>
                             </div>
                         </div> 
                         <div class="tutorReplyDiv" ></div>
                             <%}else if(co.getCommentLevel()==2) {%>
                            <!--  <div class="tutorReplyDiv"> 여기출력ㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ  -->
                             	<div class="d-flex card-body tutorReply">
                             		<div name="review flex-shrink-0">
                                 		<img class="img_basic img_review" src="<%=request.getContextPath()%>/upload/<%=co.getProfileImg()%>
                                             ">
                             		</div>
	                            	<div class="flex-grow-1 ms-3">
	                                	<div style="float: right;">
	                                    <span><%=co.getEnrollDate() %></span><span id="report">
	                                    <%if(loginMember!=null) { %>
	                                    <a href="javascript: reportReview('<%=co.getCommentNo()%>','<%=co.getWriter()%>','<%=le.getLectureTitle()%>');"> 신고</a></span>
	                                    <input type="hidden" class="enrollReport" value="<%=co.getCommentNo() %>">
	                                    <%} %>
	                                    <!-- 신고사유팝업 연결 -->
	                                	</div>
		                                <span>
		                                    <%=co.getWriter() %>
		                                </span><br>
		                                <p>
		                             	<%=co.getCommentContent() %>
		                             	<%if(loginMember!=null&&loginMember.getNickname().equals(co.getWriter())){%>
	                                    <button type="button" class="btn deleteReply"
	                                        style="float: right;" value="<%=co.getCommentNo()%>">삭제</button>
	                                  <%} %>
		                                
	                                	</p>
	                            	</div>			
	                         	</div>
	                         <!-- </div> -->
                             <%} %>
                             <%} %>
                                 <!-- 리뷰끝 -->
                                 <!-- 대댓글 -->
				   	 <div class="review-enroll  enroll-reply" style="display:none"> <!-- ------------------------대댓글 창 -->
				        <form action="<%=request.getContextPath() %>/lecture/review.do" method="post" style="width:90%">
				        <%if(loginMember!=null) { %>
				        	<div id="starrate">
				            <div>
				                <img class="img_basic img_review"
				                    src="<%=request.getContextPath()%>/upload/<%=m.getProfileImg()%>">
				                <span>
				                    <%=tutor.getNickname() %>
				                </span>
				            </div>
				        </div>
				        <%} %>
				        <div class="card">
				        <textarea id="input-rereview" class="card-body msgbox" id="totutor-review"
				            name="commentContent" cols="43" rows="3"
				            placeholder="수강생에게 따뜻한 인사를 보내주세요! &#13;&#10;"></textarea>
				        </div>
				        <input type="hidden" name="level" value="1">
				        <%if(loginMember!=null) {%>
				        <input type="hidden" name="writer"
				            value="<%=loginMember.getNickname()%>">
				        <%} %>
				        <input type="hidden" name="letureNo"
				            value="<%=le.getLectureNo()%>">
				        <input type="hidden" name="lecutreCommentRef" value="0">
				        <input type="hidden" name="lectureType"
				            value="<%=le.getLectureType()%>">
				        <div>
				            <span id="review-count" style="float: right;"></span>
				            <br>
				            <button type="submit" 
				                class="btn btn-primary btn-lg btn-basic"
				                style="float: right; ">답글 등록하기</button>
				                
				        </div>
				    </form>
				    </div>
				<%} %> 
				    <!-- 대댓글 끝 -->
                	<script>
                   $(".btn-enrollReply").click(e => { //답글달기를 누르면 
                    	const form = $(".enroll-reply>form").clone(); //새로 만든 폼태그를 보여줘, 여기서 버튼을 누르면 레벨2로 등록됨
                        form.find("input[name=level]").val("2"); //레벨 2로 
                        form.find("input[name=lecutreCommentRef]").val($(e.target).val()); //누른값의 밸류를 ref로 
                        console.log(form); //답글 내용 전부
                        let div = $("<div>");
                        div.append(form); //내용 전부를 div에 넣어주고 
                        console.log("div:"+div);
                        $(e.target).parent().after(div); //눌렀던 값의 부모중에 이 클래스이름에 div를 넣어줘
//						 $(e.target).parents(".reviewDiv").append(div);
//						$(.tutorReplyDiv).html(div);
                      	$(e.target).off("click") //클릭한번
                    }) 
                    
                    $(".deleteReply").click(e=>{
                    	if (confirm("댓글을 삭제하시겠습니까?") == true){    //확인
	                    	let num=$(e.target).val();
	                     	location.assign("<%=request.getContextPath()%>/deleteLeview?commentNo="+num+"&lectureNo=<%=le.getLectureNo()%>");
                    	}else{   //취소
                    	    return;
                    	}
                      })
                      
                      $("#input-rereview").keyup(e => {
                     let length = $(e.target).val().length;
                     if (length > 100) {
                         alert("입력가능한 글자 수를 초과하였습니다.");
                         let temp = $(e.target).val().substring(0, length - 1);
                         $(e.target).val(temp);
                     }
                     $("#review-count").html("(" + length + "/100)");
                 });
                   
                   const reportReview=(commentNum,writer,title)=>{
                	  /*  const num =$(e.target).next(".enrollReport").val();
                	   console.log(num); */
                	   const url="<%=request.getContextPath()%>/adminReport?commentNo="+commentNum+"&commentWriter="+writer+"&lectureTitle="+title;
                	   const style="width=565, height=400, left=250, top=50";
            			open(url,"_blank",style);
                   }
                </script>								
                </div> 
            </div> 
        </div> 
    </div>
</section>
<script>
<%-- 	report=(e)=> {
		const commentNo = $(e.targer)
		const nickName = 
		const url = "<%= request.getContextPath() %>/report?nickname=";
		const title = "신고하기";
		const style = "width300, height=200";
		open("",title,style)
	} --%>
</script>

<%@ include file="/views/common/footer.jsp" %>