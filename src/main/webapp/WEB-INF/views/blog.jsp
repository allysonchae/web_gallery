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
    
    	#followerButton{
			height:100px; 
			width:200px; 
			font-size: 30px;
    	}
    	
    	#followingButton{
    		height:100px; 
			width:200px; 
			font-size: 30px;
			position: relative;
			left: 230px;
    		bottom: 100px;
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
            
            <div>
	       		<button type="button" id="followerButton" class="btn btn-light" onclick="followerList('${sessionScope.loginID }')">
		            	팔로워<br>
		            	<div id="changeFollower">${followerCnt }</div>
	       		</button>
            </div>
            
            <div>
	       		<button type="button" id="followingButton" class="btn btn-light" onclick="followingList('${sessionScope.loginID }')">
		            	팔로잉<br>
		            	<div id="changeFollowing">${followingCnt }</div>
	       		</button>
            </div>
            
            <!-- Modal -->
	  <div class="modal fade" id="followerModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 id="modal-title"></h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        <div class="modal-body">
	          <h5 id="modal-detail">
	          </h5>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	<!-- Modal end -->
	
	<input type="hidden" value="${sessionScope.loginID }" id="loginId">
	<input type="hidden" value="${sessionScope.loginNickName }" id="loginNickname">
	
	<script type="text/javascript">
		function memberGallery(member_id){
			location.href = "/memberGallery?member_id="+member_id;
		}

		function directMessage(member_nickname){
			location.href = "/message/directMessage?member_nickname="+member_nickname;
		}

		function plusFriend(friend_id,friend_nickname,index){
			var followerCnt;
			var loginNickname = document.getElementById("loginNickname").value;
			var loginId = document.getElementById("loginId").value;
			var indexButton = "#changeButton"+index;
			var minusButton = '<button type="button" class="btn btn-danger" onClick="minusFriend(\'' + friend_id + '\'\,\''+ friend_nickname+'\'\,'+index+')"><i class="fa fa-minus"></i></button>'

			$.ajax({
		        contentType:'application/json',
		        dataType:'json',
		        url:'/insertFollow',
		        type:'get',
		        data:{
		        		member_id : loginId
		        		,member_nickname : loginNickname
		        		,friend_id : friend_id
		        		,friend_nickname : friend_nickname
		        		,follow_type : 1
				},
				async: false,
		        success:function(){
	
		        }
		    });

			$.ajax({
		        contentType:'application/json',
		        dataType:'json',
		        url:'/countFollower',
		        type:'get',
		        data:{
			        	member_id : loginId
		        		,friend_id : friend_id
		        		,friend_nickname : friend_nickname
		        		,follow_type : 1
				},
		        async: false,
		        success:function(resp){
					console.log(resp);
					followerCnt = resp;
		        }
		    });

			$("#changeFollower").html(followerCnt);
			$(indexButton).empty();
			$(indexButton).append(minusButton);

		}

		function minusFriend(friend_id,friend_nickname,index){
			var followerCnt;
			var loginId = document.getElementById("loginId").value;
			var indexButton = "#changeButton"+index;
			var plusButton = '<button type="button" class="btn btn-primary" onClick="plusFriend(\'' + friend_id + '\'\,\''+ friend_nickname + '\'\,' + index + ')"><i class="fa fa-plus"></i></button>';
						
			$.ajax({
		        contentType:'application/json',
		        dataType:'json',
		        url:'/deleteFollower',
		        type:'get',
		        data:{
		        		member_id : loginId
		        		,friend_id : friend_id
		        		,friend_nickname : friend_nickname
		        		,follow_type : 1
				},
				async: false,
		        success:function(){
	
		        }
		    });
		    
		    $.ajax({
		        contentType:'application/json',
		        dataType:'json',
		        url:'/countFollower',
		        type:'get',
		        data:{
			        	member_id : loginId
		        		,friend_id : friend_id
		        		,friend_nickname : friend_nickname
		        		,follow_type : 1
				},
		        async: false,
		        success:function(resp){
					console.log(resp);
					followerCnt = resp;
		        }
		    });

			$("#changeFollower").html(followerCnt);
			$(indexButton).empty();
			$(indexButton).append(plusButton);		    
		}
	
		function followerList(member_id){
			var arr;
			var output = "";

		    $.ajax({
		        contentType:'application/json',
		        dataType:'json',
		        url:'/followerList',
		        type:'get',
		        async: false,
		        data:{
						member_id : member_id
			      	},
		        success:function(resp){
					console.log(resp);
		        	arr = resp;
		        },
		        error:function(){
		            alert('에러가 발생했습니다. 다시 시도해 주세요.');
		        }
		    });

		    $.each(arr, function(index, item){
			    output += "<table>"
			    output += 	"<tr style='height: 50px;'>"
			    output += 		"<td style='width: 260px;'>"+item.friend_nickname+"</td>"
			    output += 		"<td>"
			    output += 			'<button type="button" class="btn btn-outline-info" onClick="directMessage(\'' + item.friend_nickname + '\')">쪽지</button>'
			    output += 		"</td>"
			    output += 		"<td style='width:10px;'>"
			    output += 		"</td>"
			    output += 		"<td>"
			    output += 			'<button type="button" class="btn btn-outline-info" onClick="memberGallery(\'' + item.friend_id + '\')">전시회</button>'
			    output += 		"</td>"
			    output += 		"<td style='width:10px;'>"
			    output += 		"</td>"
			    output += 		"<td id='changeButton"+index+"'>"
			    output += 			'<button type="button" class="btn btn-danger" onClick="minusFriend(\'' + item.friend_id + '\'\,\''+item.friend_nickname+'\'\,'+index+')"><i class="fa fa-minus"></i></button>'
			    output += 		"</td>"
			    output += 	"</tr>"
			    output += "</table>"
		   	});

			$("#modal-title").html("follower");
			$("#modal-detail").html(output);
	        $("#followerModal").modal();
		}
		
		function followingList(member_id){
			var arr;
			var output = "";

		    $.ajax({
		        contentType:'application/json',
		        dataType:'json',
		        url:'/followingList',
		        type:'get',
		        async: false,
		        data:{
						member_id : member_id
			      	},
		        success:function(resp){
					console.log(resp);
		        	arr = resp;
		        },
		        error:function(){
		            alert('에러가 발생했습니다. 다시 시도해 주세요.');
		        }
		    });

		    $.each(arr, function(index, item){
			    output += "<table>"
			    output += 	"<tr style='height: 50px;'>"
			    output += 		"<td style='width: 310px;'>"+item.member_nickname+"</td>"
			    output += 		"<td>"
			    output += 			'<button type="button" class="btn btn-outline-info" onClick="directMessage(\'' + item.member_nickname + '\')">쪽지</button>'
			    output += 		"</td>"
			    output += 		"<td style='width:10px;'>"
			    output += 		"</td>"
			    output += 		"<td>"
			    output += 			'<button type="button" class="btn btn-outline-info" onClick="memberGallery(\'' + item.member_id + '\')">전시회</button>'
			    output += 		"</td>"
			    output += 	"</tr>"
			    output += "</table>"
		   	});

		    $("#modal-title").html("following");
			$("#modal-detail").html(output);
	        $("#followerModal").modal();
		}
	</script>
            
            <div class="row">
            	<c:forEach items="${list }" var="list" varStatus="status">
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
               
                <div class="col-lg-12">
                    <div class="pagination__links">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">Next</a>
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