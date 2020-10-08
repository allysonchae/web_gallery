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
    <title>DJoz | Template</title>

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
    
    <script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
	    function login(){
	    	location.href = "/member/memberLoginPage";
	    } 

    </script>
    
    
    <style type="text/css">
    	#member_info{
    		color:white;	
    	}
    	
    	#tb{
    		margin-left: auto;
    		margin-right: auto;
    		margin: 0px auto;
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
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
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
                                        <li><a href="/gallery">현재 오픈 갤러리</a></li>
                                        <li><a href="/expectedGallery">오픈 예정 갤러리</a></li>
                                        <li><a href="/requestGallery">개인 갤러리 신청</a></li>
                                        <li><a href="/community">커뮤니티</a></li>
                                    </ul>
                                </li>
                                <li><a href="/calender">Calender</a></li>
                                <li><a href="#">My Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="/myPage">내 정보</a></li>
                                        <li><a href="/blog">내 블로그</a></li>
                                        <li><a href="/directMessage">쪽지함</a></li>
                                    </ul>
                                </li>
                                <li class="active"><a href="/member/memberLoginPage">Login</a></li>
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
                        <span>Login</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Video Section Begin -->
    <section class="videos spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title center-title">
                        <h2>Login</h2>
                        <h1>Welcome!</h1>
                    </div>
                    <div>
                    	<table border="1" id="tb">
                    		<tr>
                    			<td>
                    				아이디
                    			</td>
                    			<td>
                    				<input type="text" value="${member_id }" readonly="readonly">
                    			</td>
                    		</tr>
                    	</table>
                    	<br>
                    	<div style="text-align:center;">
	                        <input type="button" onclick="login()" value="로그인">
                    	</div>
                        <!-- 로그인 화면 섹션 -> 이부분 지우고 입력 -->
                        
                    </div>
                    <br><br>
                    <!-- 이 밑은 아직 지우지 말아주세요! -->
                    <div class="row">
                        <div class="videos__slider owl-carousel">
                            <div class="col-lg-3">
                                <div class="videos__item">
                                    <div class="videos__item__pic set-bg" data-setbg="/resources/img/videos/videos-1.jpg">
                                        <a href="https://www.youtube.com/watch?v=yJg-Y5byMMw?autoplay=1" class="play-btn video-popup"><i class="fa fa-play"></i></a>
                                    </div>
                                    <div class="videos__item__text">
                                        <h5>Electric Love Festival 2019 - The Opening Ceremony</h5>
                                        <ul>
                                            <li>02:35:18</li>
                                            <li>Dec 17, 2019</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="videos__item">
                                    <div class="videos__item__pic set-bg" data-setbg="/resources/img/videos/videos-2.jpg">
                                        <a href="https://www.youtube.com/watch?v=K4DyBUG242c?autoplay=1" class="play-btn video-popup"><i class="fa fa-play"></i></a>
                                    </div>
                                    <div class="videos__item__text">
                                        <h5>TiÃ«sto - Live Electric Daisy Carnival Las Vegas 2019</h5>
                                        <ul>
                                            <li>02:35:18</li>
                                            <li>Dec 17, 2019</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="videos__item">
                                    <div class="videos__item__pic set-bg" data-setbg="/resources/img/videos/videos-3.jpg">
                                        <a href="https://www.youtube.com/watch?v=3nQNiWdeH2Q?autoplay=1" class="play-btn video-popup"><i class="fa fa-play"></i></a>
                                    </div>
                                    <div class="videos__item__text">
                                        <h5>Martin Garrix - Live @ Ultra Music Festival Miami 2019</h5>
                                        <ul>
                                            <li>02:35:18</li>
                                            <li>Dec 17, 2019</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="videos__item">
                                    <div class="videos__item__pic set-bg" data-setbg="/resources/img/videos/videos-4.jpg">
                                        <a href="https://www.youtube.com/watch?v=Srqs4CitU2U?autoplay=1" class="play-btn video-popup"><i class="fa fa-play"></i></a>
                                    </div>
                                    <div class="videos__item__text">
                                        <h5>Armin van Buuren live at Tomorrowland 2019</h5>
                                        <ul>
                                            <li>02:35:18</li>
                                            <li>Dec 17, 2019</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="videos__item">
                                    <div class="videos__item__pic set-bg" data-setbg="/resources/img/videos/videos-3.jpg">
                                        <a href="https://www.youtube.com/watch?v=vBGiFtb8Rpw?autoplay=1" class="play-btn video-popup"><i class="fa fa-play"></i></a>
                                    </div>
                                    <div class="videos__item__text">
                                        <h5>Martin Garrix - Live @ Ultra Music Festival Miami 2019</h5>
                                        <ul>
                                            <li>02:35:18</li>
                                            <li>Dec 17, 2019</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Video Section End -->

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
                                <h6>DJ.Music@gmail.com</h6>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-1 col-md-6">
                    <div class="footer__social">
                        <h2>DJoz</h2>
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
                        <h4>Stay With me</h4>
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