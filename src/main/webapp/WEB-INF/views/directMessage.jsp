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
                                <li><a href="/index">Home</a></li>
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
                                        <li><a href="/community">커뮤니티</a></li>
                                    </ul>
                                </li>
                                <li><a href="/calender">Calender</a></li>
                                <li class="active"><a href="/myPage">My Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="/myPage">내 정보</a></li>
                                        <li><a href="/blog">내 전시회</a></li>
                                        <li><a href="/directMessage">쪽지함</a></li>
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
                        <a href="#">Blog</a>
                        <span>Guidelines for music festival event organisers: music festival harm reduction - December
                            2019</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="blog__details__content">
                        <div class="blog__details__item">
                            <div class="blog__details__item__pic set-bg" data-setbg="/resources/img/blog/details/details-pic.jpg">
                                <a href="#"><i class="fa fa-share-alt"></i></a>
                            </div>
                            <div class="blog__details__item__text">
                                <span>Music festival</span>
                                <h3>Guidelines for music festival event organisers: music festival harm reduction -
                                    December 2019</h3>
                                <div class="blog__details__item__widget">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <ul>
                                                <li>By <span>Erna OâConner</span></li>
                                                <li>Dec 17, 2019</li>
                                            </ul>
                                        </div>
                                        <div class="col-lg-6">
                                            <ul>
                                                <li>230 Views</li>
                                                <li>18 Comments</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="blog__details__desc">
                            <p>I feel as though a lot of people who read my articles are under the impression that I am
                                suggesting eventually someone is going to come into their life and every puzzle piece
                                will simply pop into place. Doves will fly out from behind you, a chorus will follow you
                                around on every date, you will find a bag with 10 million dollars in the street, which
                                you will use to move to Pleasantville, USA.</p>
                            <p>You need mutual respect, compromise, sacrifice, understanding, the willingness to work at
                                it and stand by him or her when times get rough. You need to be willing to be by their
                                side not only during the bright days but also during the dark ones that Love is not all
                                you need.</p>
                        </div>
                        <div class="blog__details__quote">
                            <p>None of them will tell you that they will stay together forever because itâs easy. None
                                of them will tell you that they pledged their life.</p>
                            <h6>OSCAR HUDSPETH</h6>
                            <i class="fa fa-quote-right"></i>
                        </div>
                        <div class="blog__details__desc">
                            <p>You are committing to someoneâs whole self. You are not just committing to them under the
                                condition that they stay young and beautiful â because they will not. And neither will
                                you. You are not just committing to them until someone better comes along while neither
                                they nor your relationship is perfect.</p>
                            <p>This is the person you want to be with. You are committing to their very being. To the
                                idea that the two of you are</p>
                        </div>
                        <div class="blog__details__tags">
                            <a href="#">Music</a>
                            <a href="#">Festival</a>
                            <a href="#">Tinternational</a>
                            <a href="#">Event</a>
                        </div>
                        <div class="blog__details__option">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <a href="#" class="blog__option__btn">
                                        <h6 class="option__btn__name"><i class="fa fa-angle-left"></i> Previous posts
                                        </h6>
                                        <div class="blog__option__btn__item">
                                            <div class="blog__option__btn__pic">
                                                <img src="/resources/img/blog/details/blog-change.jpg" alt="">
                                            </div>
                                            <div class="blog__option__btn__text">
                                                <h6>2020 Bendigo Blues and Roots Music Festivalâ¦</h6>
                                                <span>Dec 17, 2019</span>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <a href="#" class="blog__option__btn blog__option__btn--next">
                                        <h6 class="option__btn__name">Next posts <i class="fa fa-angle-right"></i></h6>
                                        <div class="blog__option__btn__item">
                                            <div class="blog__option__btn__pic">
                                                <img src="/resources/img/blog/details/blog-change.jpg" alt="">
                                            </div>
                                            <div class="blog__option__btn__text">
                                                <h6>2020 Bendigo Blues and Roots Music Festivalâ¦</h6>
                                                <span>Dec 17, 2019</span>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="blog__details__services">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="blog__details__services__title">
                                        <h4>You may also like</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="blog__details__services__item">
                                        <div class="blog__details__services__item__pic">
                                            <img src="/resources/img/blog/details/bs-1.jpg" alt="">
                                        </div>
                                        <div class="blog__details__services__item__text">
                                            <h6><a href="#">The Best Performances At The EFG Londonâ¦</a></h6>
                                            <span>Dec 06, 2019</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="blog__details__services__item">
                                        <div class="blog__details__services__item__pic">
                                            <img src="/resources/img/blog/details/bs-2.jpg" alt="">
                                        </div>
                                        <div class="blog__details__services__item__text">
                                            <h6><a href="#">Indigo Girls to Headline 2020 Amplify Decaturâ¦</a></h6>
                                            <span>Dec 06, 2019</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="blog__details__services__item">
                                        <div class="blog__details__services__item__pic">
                                            <img src="/resources/img/blog/details/bs-3.jpg" alt="">
                                        </div>
                                        <div class="blog__details__services__item__text">
                                            <h6><a href="#">Hereâs All The Highlights From This Yearâsâ¦</a></h6>
                                            <span>Dec 06, 2019</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="blog__details__form">
                            <div class="blog__details__form__title">
                                <h4>Leave a comment</h4>
                            </div>
                            <form action="#">
                                <div class="input__list">
                                    <input type="text" placeholder="Name">
                                    <input type="text" placeholder="Email">
                                    <input type="text" placeholder="Website">
                                </div>
                                <textarea placeholder="Comment"></textarea>
                                <button type="submit" class="site-btn">SEND MESSAGE</button>
                            </form>
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
                                    <img src="/resources/img/blog/br-2.jpg" alt="">
                                </div>
                                <div class="recent__item__text">
                                    <h6>2020 Bendigo Blues and Roots Music Festivalâ¦</h6>
                                    <span>Dec 17, 2019</span>
                                </div>
                            </a>
                            <a href="#" class="recent__item">
                                <div class="recent__item__pic">
                                    <img src="/resources/img/blog/br-3.jpg" alt="">
                                </div>
                                <div class="recent__item__text">
                                    <h6>2020 Bendigo Blues and Roots Music Festivalâ¦</h6>
                                    <span>Dec 17, 2019</span>
                                </div>
                            </a>
                            <a href="#" class="recent__item">
                                <div class="recent__item__pic">
                                    <img src="/resources/img/blog/br-4.jpg" alt="">
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
    <!-- Blog Details Section End -->

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