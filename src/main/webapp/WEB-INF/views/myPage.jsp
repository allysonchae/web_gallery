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
    
    <script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
	    function update_cancel(){
	    	location.href = "/member/memberLoginPage";
	    }

	    function update_submit(){
			var member_id = document.getElementById("member_id").value;
			var member_pw = document.getElementById("member_pw").value;
			var member_pwck = document.getElementById("member_pwck").value;
			var member_phone = document.getElementById("member_phone").value;
			var member_name = document.getElementById("member_name").value;
			var member_nickname = document.getElementById("member_nickname").value;

			document.getElementById("user_id").value = member_id;
			document.getElementById("user_pw").value = member_pw;
			document.getElementById("user_phone").value = member_phone;
			document.getElementById("user_name").value = member_name;
			document.getElementById("user_nickname").value = member_nickname;
			
			if(member_pw==''||member_pw.length==0){
				alert("비밀번호를 입력해 주세요");
				return false;
			}else if(member_pw.length<=2||member_pw.length>=11){
				alert("비밀번호는 3~10글자 입니다");
				return false;
			}
			
			if(member_pw!=member_pwck){
				alert("동일한 비밀번호를 입력해 주세요");
				return false;
				}
			
			if(member_phone==''||member_phone.length==0){
				alert("전화번호를 입력해 주세요");
				return false;
				}

			if(member_name==''||member_name.length==0){
				alert("이름을 입력해 주세요");
				return false;
				}

			if(member_nickname==''||member_nickname.length==0){
				alert("닉네임을 입력해 주세요");
				return false;
			}else if(member_nickname.length<=2||member_nickname.length>=9){
				alert("닉네임은 3~8글자 입니다");
				return false;
			}
			
			document.getElementById("updateForm").submit();
			
		}

	    function checkNickname(){
			$.ajax({
				url:"/member/checkNickname",
				data:{
					member_nickname:$("#member_nickname").val()
					},
				success:function(data){
					if(data==1){
						$("#nicknameCheck").text("사용중인 아이디입니다");
						$("#nicknameCheck").css("color","red");
						$("#join_submit").attr("disabled", true);
					}else{
						$("#nicknameCheck").text("사용가능한 아이디입니다");
						$("#nicknameCheck").css("color","green");
						$("#join_submit").attr("disabled", false);
					}
				},
				error:function(e){
					alert("통신 실패");
					console.log(e);
					}
			});
		}

	    $(function(){
	    	$("#check_bt").attr("disabled", true);
			
			$("#member_nickname").on("keyup", function(e){
				var txt = $(this).val();
				var txt2= $("#loginNickName").val();
				if(txt==txt2){
					$("#check_bt").attr("disabled", true);
				}else{
					$("#check_bt").attr("disabled", false);
				}
				
			});
	
		});
    </script>
    
    <style type="text/css">
    	#member_info{
    		color:white;	
    	}
    	
    	.join_st{
    		width:450px;
    		margin-left: auto;
    		margin-right: auto;
    		margin: 0px auto;
    	}
    	
    	#div{
    		width:550px;
    		margin:0 auto;
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
										<li><a href="">온라인 마켓</a></li>
                                    </ul>
                                </li>
                                <li><a href="/calender">Calender</a></li>
                                <li><a href="/myPage">My Pages</a>
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
                        <span>Contact</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Contact Section Begin -->
    <section class="videos spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title center-title">
			        	<h2>Member</h2>
			            <h1>Welcome!</h1>
			        </div>
			        <div id="div">
						<table border="1" class="table table-bordered">
							<tr>
								<td>
									아이디
								</td>
								<td>
									<input type="text" name="member_id" id="member_id" value="${hash.MEMBER_ID }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td>
									비밀번호
								</td>
								<td>
									<input type="password" name="member_pw" id="member_pw" placeholder="비밀번호"><div id="pwCheck"></div>	
								</td>
							</tr>
							<tr>
								<td>
									비밀번호 확인
								</td>
								<td>
									<input type="password" id="member_pwck" placeholder="비밀번호 확인">	
								</td>
							</tr>
							<tr>
								<td>
									연락처
								</td>
								<td>
									<input type="text" name="member_phone"  id="member_phone" value="${hash.MEMBER_PHONE }" placeholder="'-'없이 입력">
								</td>
							</tr>
							<tr>
								<td>
									이름
								</td>
								<td>
									<input type="text" name="member_name" id="member_name" placeholder="이름" value="${hash.MEMBER_NAME }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td>
									닉네임
								</td>
								<td>
									<input type="text" name="member_nickname" id="member_nickname" value="${hash.MEMBER_NICKNAME }" placeholder="닉네임" >
									<input type="hidden" id="loginNickName" value="${hash.MEMBER_NICKNAME }">
									<button onclick="checkNickname()" id="check_bt" class="btn btn-outline-secondary">중복 검사</button><div id="nicknameCheck"></div>
								</td>
							</tr>
						</table><br>
						<div class="join_st" style="text-align:center;">
							<input type="button" value="취소" onclick="update_cancel()" class="btn btn-outline-secondary">
							<input type="button" id="update_submit" onclick="update_submit()" value="수정" class="btn btn-outline-secondary">
						</div>
						<form action="/member/memberUpdate" method="post" id="updateForm">
							<input type="hidden" name="member_id" id="user_id">
							<input type="hidden" name="member_pw" id="user_pw">
							<input type="hidden" name="member_phone" id="user_phone">
							<input type="hidden" name="member_name" id="user_name">
							<input type="hidden" name="member_nickname" id="user_nickname">
						</form>
						<br><br>
					</div>
	        	</div>
        	</div>
        </div>
    </section>
    <!-- Contact Section End -->
    

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