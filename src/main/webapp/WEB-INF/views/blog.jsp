<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="DJoz Template">
    <meta name="keywords" content="DJoz, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Onex</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nowfont.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/rockville.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    
    <style type="text/css">
    	#member_info{
    		color:white;	
    	}
    
    </style>
    
    <script type="text/javascript">
	    function pagingFormSubmit(currentPage) {
	    	var form = document.getElementById('pagingForm');
	    	var page = document.getElementById('page');
	    	page.value = currentPage;
	    	form.submit();
	    }
    </script>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header header--normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-2">
                    <div class="header__logo">
                        <a href="/"><img src="/resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-10 col-md-10">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="/">Home</a></li>
                                <li><a href="/info">Info</a>
                                	<ul class="dropdown">
                                        <li><a href="/info">공지사항</a></li>
                                        <li><a href="/service">이용안내</a></li>
                                    </ul>
                                </li>
                                <li><a href="/gallery">Gallery</a>
                                	<ul class="dropdown">
                                        <li><a href="/gallery">오픈 갤러리</a></li>
                                        <li><a href="/requestGallery">개인 갤러리 신청</a></li>
                                        <li><a href="/MarketAll">온라인 마켓</a></li>
                                    </ul>
                                </li>
                                <li><a href="/calender">Calender</a></li>
                                <li class="active"><a href="/myPage">My Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="/myPage">내 정보</a></li>
                                        <li><a href="/blog">내 전시회</a></li>
                                        <li><a href="/myWorkMarket">내 작품 마켓</a></li>
										<li><a href="/message/directMessage">쪽지함</a></li>
                                    </ul>
                                </li>
                                <c:choose>
									<c:when test="${sessionScope.loginNickName != null }">
										<li id="member_info">'${sessionScope.loginNickName }'님</li>
										<li><a href="/logout">LOGOUT</a></li>
									</c:when>
									<c:otherwise>
		                                <li><a href="member/memberLoginPage">Login</a></li>
									</c:otherwise>
								</c:choose>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>Blog</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
	
	<!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
            	<div class="col-lg-12">
                    <div class="section-title center-title">
                        <h2>My Gallery</h2>
                        <h1>My Gallery</h1>
                        <h4>내 전시회</h4>
                    </div>
                </div>
            </div>
            
            <div class="row">
            	<c:forEach items="${gallerylist }" var="list" varStatus="status">
	                <div class="col-lg-4 col-md-6 col-sm-6">
	                    <div class="discography__item">
	                        <div class="discography__item__pic">
	                        	<a href="/galleryDetail?gallery_seq=${list.GALLERY_SEQ }" >
		                            <img src="/download?work_seq=${list.WORK_SEQ }&id=${list.GALLERY_SEQ }" style="width: 100px; height: 300px;">
		                    	</a>    
		                    </div>
		                    
	                        <div class="discography__item__text">
	                            <h4>${list.TITLE }</h4>
	                            <h4>${list.start } ~ ${list.end }</h4>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
               
                <!-- 검색폼 -->
							<form id="pagingForm" method="get" action="blog" style="text-align: center; padding-right: 185px;">
								<input type="hidden" name="page" id="page" />
								<input type="text"  name="searchText" value="${searchText}" placeholder="제목"/>
								<input type="button" class="btn btn-outline-secondary" onclick="pagingFormSubmit(1)" value="검색">
							</form>
	               
	                <div class="col-lg-12">
	                    <div class="pagination__links">
	                        <!-- 페이지 이동 부분 -->                      
							<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
							<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;
						
							<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
								<c:if test="${counter == navi.currentPage}"><b></c:if>
									<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
								<c:if test="${counter == navi.currentPage}"></b></c:if>
							</c:forEach>
							&nbsp;&nbsp;
							<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
							<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
						
						<!-- /페이지 이동 끝 -->
						
						<!-- /검색폼 --> 
	                    </div>
	                </div>
    </section>
    <!-- Blog Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer footer--normal spad set-bg" data-setbg="/resources/img/footer-bg.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="footer__address">
                        <ul>
                            <li>
                                <i class="fa fa-phone"></i>
                                <p>Phone</p>
                                <h6>1-677-124-44227</h6>
                            </li>
                            <li>
                                <i class="fa fa-envelope"></i>
                                <p>Email</p>
                                <h6>Onex@gmail.com</h6>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-1 col-md-6">
                    <div class="footer__social">
                        <div class="footer__social__links">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-dribbble"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1 col-md-6">
                    <div class="footer__newslatter">
                        <h4>Contact Us</h4>
                        <form action="#">
                            <input type="text" placeholder="Email">
                            <button type="submit"><i class="fa fa-send-o"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="/resources/js/jquery-3.5.1.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="/resources/js/jquery.nicescroll.min.js"></script>
    <script src="/resources/js/jquery.barfiller.js"></script>
    <script src="/resources/js/jquery.countdown.min.js"></script>
    <script src="/resources/js/jquery.slicknav.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/main.js"></script>

    <!-- Music Plugin -->
    <script src="/resources/js/jquery.jplayer.min.js"></script>
    <script src="/resources/js/jplayerInit.js"></script>
</body>

</html>