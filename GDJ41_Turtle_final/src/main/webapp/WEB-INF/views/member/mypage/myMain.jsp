<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path }/resources/css/service.css" rel="stylesheet" type="text/css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="header-line"></div>
  <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sidebars/">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <script src="https://kit.fontawesome.com/e3bf9144bc.js" crossorigin="anonymous"></script>
    



    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="mypage.css" rel="stylesheet">
  </head>
  <body>
    
    <style>

      

     /* ----------------- 페이지 내용 부분 ------------------ */
     #deliveryCheck {
         text-align: center;
         padding: 10px;
         
     }

     .card-body {
         text-align: center;
         height: 150px;
     }
     
     a {
     text-decoration:none;
     color:black;
     }
     
     #mypage1:hover{
     color: white;
     background-color:tan;
     transition: 0.3s;
     }
     #mypage2:hover{
     color: white;
     background-color:tan;
     transition: 0.3s;
     }
     #mypage3:hover{
     color: white;
     background-color:tan;
     transition: 0.3s;
     }
     #mypage4:hover{
     color: white;
     background-color:tan;
     transition: 0.3s;
     }

    </style>

<!-- 헤더들어갈자리 -->







  <!-- 페이지내용 -->
  
  




      <!-- 페이지본문 -->
      <div class="csTitle"><h1>마이페이지</h1></div>
      <%-- ${stList } --%>
		<%-- <c:if test="${not empty param}">
          	<c:forEach items="${param }" var="p">
				<c:out value="${p.a }"/>
			</c:forEach>
		</c:if>	 --%>				
      <c:set var="orderNo" value=""/>
      <c:forEach var="o" items="${oDList }" varStatus="status">
      	<input type="hidden" name="orderNo" class="orderNo" value="${o.orderNo }"/>
      </c:forEach>
	      
      <!-- <input type="hidden" name="orderNoList" id="orderNoList" value=""/> -->
      <input type="hidden" name="userId" id="userId" value="${loginMember.userId}"/>
      
      
      <script>
      	$(()=>{
      		console.log($(".orderNo"));
      		let orderList = "";
      		for(let i=0;i<$(".orderNo").length;i++) {
      			orderList += $(".orderNo")[i].value;
      			orderList += ",";
      		}
      		orderList = orderList.replace(/,$/, '');
      		console.log(orderList);
      		$("#orderNoList").val(orderList);
      	})
      </script>
      <div class="container">
        <div class="row" style="margin-bottom: 30px;">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="container">
                            <div class="row row-cols-5" id="deliveryCheck">
                                <div class="col">
                                    <h4>배송현황</h4>
                                    <div>
                                        <i class="fas fa-truck fa-4x"></i>
                                    </div>
                                </div>
                                <c:if test="${not empty stList}">
        							<c:forEach items="${stList }" var="st">
		                                <div class="col" style="border-right:lightgray 1px solid;">
		                                    <h4>결제완료</h4>
		                                    <div style="margin-top:20px;">  
		                                        <h3><c:out value="${st.A}"/></h3>
		                                    </div>
		                                </div>
		                                <div class="col" style="border-right:lightgray 1px solid;">
		                                    <h4>배송준비중</h4>
		                                    <div style="margin-top:20px;">  
		                                        <h3><c:out value="${st.B}"/></h3>
		                                    </div>
		                                </div>
		                                <div class="col" style="border-right:lightgray 1px solid;">
		                                    <h4>배송중</h4>
		                                    <div style="margin-top:20px;">  
		                                        <h3><c:out value="${st.C}"/></h3>
		                                    </div>
		                                </div>
		                                <div class="col">
		                                    <h4>배송완료</h4>
		                                    <div style="margin-top:20px;">  
		                                        <h3><c:out value="${st.D}"/></h3>
		                                    </div>
		                                </div>
	                                </c:forEach>
                                </c:if>
                            </div>
                          </div>
                    </div>
                  </div>
            </div>
        </div>
        <div class="row">
            <div class="col"  style="margin-right: 10px;">
                <a href="${path }/member/mypage/myInfo"><div class="card" id="mypage1">
                    <div class="card-body">
                        <h4>내 정보</h4>
                        <div>
                            <i class="far fa-address-card fa-4x"></i>
                        </div>
                    </div>
                  </div></a>
            </div>
            <div class="col" style="margin-right: 10px;">
            <!-- ${path }/member/mypage/delivery?userId=${loginMember.userId} -->
                <a href="javascript:fn_orderList();"><div class="card" id="mypage2">
                    <div class="card-body">
                        <h4>주문내역</h4>
                        <div>
                            <i class="fas fa-receipt fa-4x"></i>
                        </div>
                    </div>
                  </div></a>
                  <script type="text/javascript">
                  function fn_orderList() {
                	  //let orderNoList = $("#orderNoList").val();
                	  //console.log(orderNoList);
                	  //+"&orderNoList="+orderNoList
                	  let userId = $("#userId").val();
                	  console.log(userId);
                	  location.assign("${path}/member/mypage/delivery?userId="+userId);
                  }
                  </script>
            </div>
            <div class="col" style="margin-right: 10px;">
                <a href="${path }/member/mypage/reviews?userId=${loginMember.userId}"><div class="card" id="mypage3">
                    <div class="card-body">
                        <h4>마이리뷰</h4>
                        <div>
                            <i class="fas fa-pencil-alt fa-4x"></i>
                        </div>
                    </div>
                  </div></a>
            </div>
            <div class="col">
                <a href="${path }/member/service/faq"><div class="card" id="mypage4">
                    <div class="card-body">
                        <h4>고객센터</h4>
                        <div>
                            <i class="fas fa-headset fa-4x"></i>
                        </div>
                    </div>
                  </div></a>
            </div>
        </div>
      </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
