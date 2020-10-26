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
    <header class="header">
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
                                <li class="active"><a href="/">Home</a></li>
                                <li><a href="/info">Info</a>
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

    <!-- Hero Section Begin -->
    <section class="hero spad set-bg" data-setbg="/resources/img/hero-bg.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="hero__text">
                        <span></span>
                        <h1>Onex</h1>
                        <p>Web Portal for ONline EXhibition</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="linear__icon">
            <i class="fa fa-angle-double-down"></i>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Event Section Begin 1-->
    <section class="event spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h4>현재 전시중인 갤러리</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="event__slider owl-carousel">
                    <div class="col-lg-4">
                        <div class="event__item">
                            <div class="event__item__pic set-bg" data-setbg="/resources/img/events/event-1.jpg">
                                <div class="tag-date">
                                    <span>Dec 15, 2019</span>
                                </div>
                            </div>
                            <div class="event__item__text">
                                <h4>David Guetta Miami Ultra</h4>
                                <p><i class="fa fa-map-marker"></i> Funkhaus Berlin, Berlin, Germany</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="event__item">
                            <div class="event__item__pic set-bg" data-setbg="/resources/img/events/event-2.jpg">
                                <div class="tag-date">
                                    <span>Dec 15, 2019</span>
                                </div>
                            </div>
                            <div class="event__item__text">
                                <h4>David Guetta Miami Ultra</h4>
                                <p><i class="fa fa-map-marker"></i> Funkhaus Berlin, Berlin, Germany</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="event__item">
                            <div class="event__item__pic set-bg" data-setbg="/resources/img/events/event-3.jpg">
                                <div class="tag-date">
                                    <span>Dec 15, 2019</span>
                                </div>
                            </div>
                            <div class="event__item__text">
                                <h4>David Guetta Miami Ultra</h4>
                                <p><i class="fa fa-map-marker"></i> Funkhaus Berlin, Berlin, Germany</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="event__item">
                            <div class="event__item__pic set-bg" data-setbg="/resources/img/events/event-2.jpg">
                                <div class="tag-date">
                                    <span>Dec 15, 2019</span>
                                </div>
                            </div>
                            <div class="event__item__text">
                                <h4>David Guetta Miami Ultra</h4>
                                <p><i class="fa fa-map-marker"></i> Funkhaus Berlin, Berlin, Germany</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Event Section End -->

	<!-- Event Section Begin 2-->
    <section class="event spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h4>전시 예정 갤러리</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="event__slider owl-carousel">
                    <div class="col-lg-4">
                        <div class="event__item">
                            <div class="event__item__pic set-bg" data-setbg="/resources/img/events/event-1.jpg">
                                <div class="tag-date">
                                    <span>Dec 15, 2019</span>
                                </div>
                            </div>
                            <div class="event__item__text">
                                <h4>David Guetta Miami Ultra</h4>
                                <p><i class="fa fa-map-marker"></i> Funkhaus Berlin, Berlin, Germany</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="event__item">
                            <div class="event__item__pic set-bg" data-setbg="/resources/img/events/event-2.jpg">
                                <div class="tag-date">
                                    <span>Dec 15, 2019</span>
                                </div>
                            </div>
                            <div class="event__item__text">
                                <h4>David Guetta Miami Ultra</h4>
                                <p><i class="fa fa-map-marker"></i> Funkhaus Berlin, Berlin, Germany</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="event__item">
                            <div class="event__item__pic set-bg" data-setbg="/resources/img/events/event-3.jpg">
                                <div class="tag-date">
                                    <span>Dec 15, 2019</span>
                                </div>
                            </div>
                            <div class="event__item__text">
                                <h4>David Guetta Miami Ultra</h4>
                                <p><i class="fa fa-map-marker"></i> Funkhaus Berlin, Berlin, Germany</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="event__item">
                            <div class="event__item__pic set-bg" data-setbg="/resources/img/events/event-2.jpg">
                                <div class="tag-date">
                                    <span>Dec 15, 2019</span>
                                </div>
                            </div>
                            <div class="event__item__text">
                                <h4>David Guetta Miami Ultra</h4>
                                <p><i class="fa fa-map-marker"></i> Funkhaus Berlin, Berlin, Germany</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Event Section End -->

    <!-- About Pic Begin(하단에 사진 왕창 들어가는곳) -->
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

    <!-- Countdown Section Begin -->
    <section class="countdown spad set-bg" data-setbg="">
        <div class="container">
            
        </div>
    </section>
    <!-- Countdown Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer spad set-bg" data-setbg="/resources/img/footer-bg.png">
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
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			<div class="footer__copyright__text">
				<p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
			</div>
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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