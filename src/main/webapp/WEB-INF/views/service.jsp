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
                                <li class="active"><a href="/info">Info</a>
                                	<ul class="dropdown">
                                        <li><a href="/info">공지사항</a></li>
                                        <li><a href="/service">이용안내</a></li>
                                    </ul>
                                </li>
                                <li><a href="/gallery">Gallery</a>
                                	<ul class="dropdown">
                                        <li><a href="/gallery">현재 오픈 갤러리</a></li>
                                        <li><a href="/expectedGallery">오픈 예정 갤러리</a></li>
                                        <li><a href="/requestGallery">개인 갤러리 신청</a></li>
                                        <li><a href="/community">커뮤니티</a></li>
                                    </ul>
                                </li>
                                <li><a href="/calender">Calender</a></li>
                                <li><a href="/myPage">My Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="/myPage">내 정보</a></li>
                                        <li><a href="/blog">내 블로그</a></li>
                                        <li><a href="/message/directMessage">쪽지함</a></li>
                                    </ul>
                                </li>
                                <c:choose>
									<c:when test="${sessionScope.loginNickName != null }">
										<li id="member_info">'${sessionScope.loginNickName }'님 환영합니다</li>
										<li><a href="logout">로그아웃</a></li>
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
                        <span>이용안내</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Skills Section Begin -->
    <section class="skills spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 p-0">
                    <div class="skills__content">
                        <div class="section-title" style="font-size: 30px; color: white; font-weight: bold;">
                            	공간의 제약을 받지 않고 <br>
                            	저희가 제공하는 가상공간 <br>
                            	전시관을 이용하여 <br>
                            	자유롭게 자신의 작품을 <br>
                            	소개해보세요
                            <h1>ONEX</h1>
                        </div>
                        <div class="skill__bar__item">
                            <div id="bar1" class="barfiller">
                            </div>
                        </div>
                        <div class="skill__bar__item">
                            <div id="bar2" class="barfiller">
                            </div>
                        </div>
                        <div class="skill__bar__item">
                            <div id="bar3" class="barfiller">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 p-0">
                    <div class="skills__video set-bg" data-setbg="/resources/img/video.PNG">
                        <a href="https://www.https://www.youtube.com/watch?v=HEbSVOl_FqM" class="play-btn video-popup"><i class="fa fa-play"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Skills Section End -->

    <!-- About Section Begin -->
    <section class="about about--page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="about__pic">
                        <img src="/resources/img/about/about.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about__text">
                        <div class="section-title">
                            <h2>ONEX's Ideology</h2>
                        </div>
                        <br>
                        <br>
                        <p style="font-size: 18px;">제공하는 가상공간의 전시관을 이용하여 자유롭게 자신의 작품을 <br>
                        							소개할 수 있는 환경을 제공하는 것을 목표로 하고 있습니다.<br>
                        							또한 프로가 아닌 아마추어를 대상으로 하여 다재다능한 일반인 또는 아마추어 작가에게 자신의 작품을 전시할 수 있는 기회를 주고 자신의 작품을<br>
            									         판매할 수 있는 공간도 마련함으로써 온라인 전시를<br>
            									         활성화하고 많은 사람들이 예술작품을 쉽게 접할 수 있도록 하는 것이<br>
            									    ONEX의 목표입니다.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- About Section End -->

    <!-- About Services Section Begin -->
    <section class="about-services spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title center-title">
                        <h3>이용 방법</h3>
                        <h1>how to use</h1>
                        <br>
                        <br>
                        <br>
                        <br>
                        <img src="/resources/img/gallery_how.jpg" alt="">
                    </div>
                </div>
            </div>
    </section>
    <!-- About Section End -->

    <!-- About Services Section Begin -->
    <section class="about-services spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title center-title">
                        <h4>제공하는 서비스</h4>
                        <h1>Best service</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="about__services__item">
                        <div class="about__services__item__pic set-bg" data-setbg="/resources/img/services/as-1.jpg">
                            <div class="icon">
                                <img src="/resources/img/services/as-icon-1.png" alt="">
                            </div>
                        </div>
                        <div class="about__services__item__text">
                            <h4>Wedding</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="about__services__item">
                        <div class="about__services__item__pic set-bg" data-setbg="/resources/img/services/as-2.jpg">
                            <div class="icon">
                                <img src="/resources/img/services/as-icon-2.png" alt="">
                            </div>
                        </div>
                        <div class="about__services__item__text">
                            <h4>Clubs and bar</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="about__services__item">
                        <div class="about__services__item__pic set-bg" data-setbg="/resources/img/services/as-3.jpg">
                            <div class="icon">
                                <img src="/resources/img/services/as-icon-3.png" alt="">
                            </div>
                        </div>
                        <div class="about__services__item__text">
                            <h4>Corporate events</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- About Services Section End -->
    
    <!-- About Pic Begin -->
    <div class="about-pic">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-4 p-0">
                            <img src="/resources/img/about/ap-11.jpg" alt="">
                            <img src="/resources/img/about/ap-22.jpg" alt="">
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-8 p-0">
                            <img src="/resources/img/about/ap-33.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-8 p-0">
                            <img src="/resources/img/about/ap-44.jpg" alt="">
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 p-0">
                            <img src="/resources/img/about/ap-55.jpg" alt="">
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 p-0">
                            <img src="/resources/img/about/ap-66.jpg" alt="">
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-8 p-0">
                            <img src="/resources/img/about/ap-77.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About Pic End -->

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