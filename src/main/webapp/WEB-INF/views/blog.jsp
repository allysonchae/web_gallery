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
                                <li class="active"><a href="/myPage">My Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="/myPage">내 정보</a></li>
                                        <li><a href="/blog">내 블로그</a></li>
                                        <li><a href="/message/directMessage">쪽지함</a></li>
                                    </ul>
                                </li>
                                <c:choose>
									<c:when test="${sessionScope.loginID != null }">
										<li id="member_info">'${sessionScope.loginID }'님 환영합니다</li>
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
                <div class="col-lg-8">
                    <div class="section-title">
                        <h2>Latest posts</h2>
                        <h1>Music blog</h1>
                    </div>
                    <div class="blog__large">
                        <div class="blog__large__pic set-bg" data-setbg="/resources/img/blog/large-item.jpg">
                            <a href="#"><i class="fa fa-share-alt"></i></a>
                        </div>
                        <div class="blog__large__text">
                            <span>Music festival</span>
                            <h4>Guidelines for music festival event organisers: music festival harm reduction - December
                                2019</h4>
                            <p>Lorem ipsum dolor consectetur adipiscing eiusmod tempor incididunt ut labore et dolore
                            </p>
                            <div class="blog__large__widget">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <ul>
                                            <li>By <span>Erna OâConner</span></li>
                                            <li>Dec 17, 2019</li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <ul class="right__widget">
                                            <li>230 Views</li>
                                            <li>18 Comments</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="/resources/img/blog/blog-1.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <span>Music festival</span>
                                    <h5>World Music Festival | Free Events & Concerts in Chicago</h5>
                                    <ul>
                                        <li>By <span>Erna OâConner</span></li>
                                        <li>Dec 17, 2019</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="/resources/img/blog/blog-2.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <span>Music festival</span>
                                    <h5>How ROQU Media and The Manual London staged Saudiâ¦</h5>
                                    <ul>
                                        <li>By <span>Erna OâConner</span></li>
                                        <li>Dec 17, 2019</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="/resources/img/blog/blog-3.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <span>Music festival</span>
                                    <h5>2019 Festival of the Sun music event, Port Macquarie</h5>
                                    <ul>
                                        <li>By <span>Erna OâConner</span></li>
                                        <li>Dec 17, 2019</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="/resources/img/blog/blog-4.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <span>Music festival</span>
                                    <h5>Taylor Swift to Headline Glaston Music Festival</h5>
                                    <ul>
                                        <li>By <span>Erna OâConner</span></li>
                                        <li>Dec 17, 2019</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="img/blog/blog-5.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <span>Music festival</span>
                                    <h5>24-hour festival Inner City Electronic returns</h5>
                                    <ul>
                                        <li>By <span>Erna OâConner</span></li>
                                        <li>Dec 17, 2019</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="/resources/img/blog/blog-6.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <span>Music festival</span>
                                    <h5>Lost Paradise festival cancelled amid bushfire danger</h5>
                                    <ul>
                                        <li>By <span>Erna OâConner</span></li>
                                        <li>Dec 17, 2019</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="pagination__links blog__pagination">
                                <a href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#">Next</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__item">
                            <div class="blog__sidebar__title">
                                <h4>Subscribe newsletter</h4>
                            </div>
                            <p>Ipsum dolor sit amet, adipiscing elit, sed eiusmod </p>
                            <form action="#">
                                <input type="text" placeholder="Name">
                                <input type="text" placeholder="Email">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <div class="blog__sidebar__title">
                                <h4>Social media</h4>
                            </div>
                            <div class="blog__sidebar__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-dribbble"></i></a>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <div class="blog__sidebar__title">
                                <h4>Recent posts</h4>
                            </div>
                            <a href="#" class="recent__item">
                                <div class="recent__item__pic">
                                    <img src="/resources/img/blog/br-1.jpg" alt="">
                                </div>
                                <div class="recent__item__text">
                                    <h6>2020 Bendigo Blues and Roots Music Festivalâ¦</h6>
                                    <span>Dec 17, 2019</span>
                                </div>
                            </a>
                            <a href="#" class="recent__item">
                                <div class="recent__item__pic">
                                    <img src="img/blog/br-2.jpg" alt="">
                                </div>
                                <div class="recent__item__text">
                                    <h6>2020 Bendigo Blues and Roots Music Festivalâ¦</h6>
                                    <span>Dec 17, 2019</span>
                                </div>
                            </a>
                            <a href="#" class="recent__item">
                                <div class="recent__item__pic">
                                    <img src="img/blog/br-3.jpg" alt="">
                                </div>
                                <div class="recent__item__text">
                                    <h6>2020 Bendigo Blues and Roots Music Festivalâ¦</h6>
                                    <span>Dec 17, 2019</span>
                                </div>
                            </a>
                            <a href="#" class="recent__item">
                                <div class="recent__item__pic">
                                    <img src="img/blog/br-4.jpg" alt="">
                                </div>
                                <div class="recent__item__text">
                                    <h6>2020 Bendigo Blues and Roots Music Festivalâ¦</h6>
                                    <span>Dec 17, 2019</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
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