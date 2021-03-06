<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
            <div class="main-section">                
                <img src="${path }/resources/images/main1.png" width="100%" height="600px" alt="메인사진">
                <button class="all-product-btn" onclick="location.assign('${path }/product/productList.do?title=All')">All Products</button>
            </div>
            <div class="main-kind">
                <div class="kind-earring">
                    <p>Earrings</p>
                    <a href="${path }/product/productCategoryList.do?title=Earrings">
                        <img src="${path }/resources/images/main-earring.png" alt="메인귀걸이" width="300px" height="250px">
                    </a>
                    </div>
                    <div class="kind-necklace">
                    <p>Necklaces</p>
                    <a href="${path }/product/productCategoryList.do?title=Necklaces">
                        <img src="${path }/resources/images/main-necklace.png" alt="메인목걸이" width="300px" height="250px">
                    </a>    
                </div>
                <div class="kind-bracelet">
                    <p>Bracelets</p>
                    <a href="${path }/product/productCategoryList.do?title=Bracelets">
                        <img src="${path }/resources/images/main-bracelet.png" alt="메인팔찌" width="300px" height="250px">
                    </a>    
                </div>
                <div class="kind-ring">
                    <p>Rings</p>
                    <a href="${path }/product/productCategoryList.do?title=Rings">
                        <img src="${path }/resources/images/main-ring.png" alt="메인반지" width="300px" height="250px">
                    </a>
                </div>
            </div>
            <div class="main-newBest">
                <div class="main-new-arrivals">
                    <img src="${path }/resources/images/main-new.png" alt="메인새상품" width="700px" height="500px">
                    <button class="newArrivals-btn" onclick="location.assign('${path }/product/productNewList.do?title=New')">New Arrivals</button>
                </div>
                <div>
                    <img src="${path }/resources/images/main-best.png" alt="메인베스트" width="700px" height="500px">
                    <button class="best-btn" onclick="location.assign('${path }/product/productBestList.do?title=Best')">Best</button>
                </div>
            </div>
            <div class="container px-4 px-lg-5 mt-5">
                <h1>Sales</h1>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-around">
                <c:forEach begin="1" end="8" step="1" var="p" items="${list }">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="${path }/resources/images/product/${p.PD_IMAGE}" style="height:175px; cursor:pointer;" 
                            		onclick="location.assign('${path}/product/productDetail.do?pdCode=${p.PD_CODE }')"/>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${p.PD_NAME }</h5>
                                    <!-- Product reviews-->
                                    <input type="hidden" id="bb${p.PD_CODE }" value="${p.AVGG }">
                                    <div class="starRev2" style="margin-bottom:10px;">
										<span class="starR2 ${p.PD_CODE }starG1">별1</span>
										<span class="starR2 ${p.PD_CODE }starG2">별2</span>
										<span class="starR2 ${p.PD_CODE }starG3">별3</span>
										<span class="starR2 ${p.PD_CODE }starG4">별4</span>
										<span class="starR2 ${p.PD_CODE }starG5">별5</span>
									</div>
                                    
                                     	<style>
											.starR2{
												background: url('${path}/resources/images/ico_review.png') no-repeat right 0;
												background-size: auto 100%;
												color: #FF9600;
												width: 15px;
												height: 15px;
												display: inline-block;
												text-indent: -9999px;
												
											}
											.starR2.on{background-position:0 0;}
						                </style>
						                <script>
						                $(()=>{
						                	let rv_grade = $("#bb${p.PD_CODE }").val();
						                	console.log(rv_grade);
						                	$(".${p.PD_CODE }starG"+rv_grade).addClass('on').prevAll('span').addClass('on');
						                });
						                </script>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">
                                    	￦<fmt:formatNumber value="${p.PD_PRICE }" pattern="#,###,###" />
                                    </span>
                                    &nbsp; ￦<fmt:formatNumber value="${p.PD_PRICE - p.PD_PRICE*p.PD_DISCOUNTRATE/100 }" pattern="#,###,###" />
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                	<button class="btn btn-outline-dark mt-auto" onclick="listCartBtn${p.PD_CODE}();">Add to cart</button>
                                </div>
                            </div>
                            <script>
	                            const listCartBtn${p.PD_CODE}=()=>{
				                	let size=0;
				            		if(${loginMember==null}){
				            			if(confirm('로그인 후 장바구니 담기가 가능합니다. 로그인 화면으로 가시겠습니까?')){
				            				location.assign('${path}/member/login/login');
				            			}else{
				            				location.assign('${path}');
				            			}
				            		}else{
				            			if('${p.CATEGORY_CODE}' != 'ring'){
				            				location.assign('${path}/product/addCart.do?pdName=${p.PD_NAME}&userId=${loginMember.userId}&amount=1&size='+size);
				            			}else if('${p.CATEGORY_CODE}' == 'ring'){
				            				alert('상품 상세화면에서 사이즈를 선택 후 장바구니에 담아주세요.');
				            				location.assign('${path}/product/productDetail.do?pdCode=${p.PD_CODE}');
				            			}
				            		}
				            	}
                            </script>
                        </div>
                    </div>
                </c:forEach>
                </div>
                <button class="more-btn" onclick="location.assign('${path }/product/productSaleList.do?title=Sales')">More</button>
            </div>
        </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
