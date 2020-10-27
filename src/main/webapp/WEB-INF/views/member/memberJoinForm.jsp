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
    $(function () {
	    var chk = -1;
	    var data = {"member_id": $("#member_id").val()};
        var authNum = "";
	    
	    $("#auth_btn").click(function () {

	        $.ajax({
				url:"/member/idCheck",
				data:{
					member_id:$("#member_id").val()
					},
				success:function(data){
					if(data==1){
						$("#lab1").text("사용중인 이메일입니다");
						$("#lab1").css("color","red");
					}else{
					    $("#lab1").text("인증번호 전송중");
						$("#lab1").css("color","blue");
					    $.ajax({
					        url : "/member/emailAuth.do",
					        data : {"member_id": $("#member_id").val()},
					        success : function (data) {
					            authNum = data;
					            alert("인증번호 전송완료.");
					            $("#lab1").text("");
					        }
					    });
					}
				},
				error:function(e){
					alert("통신 실패");
					console.log(e);
					}
			});
			
	    });// 이메일 인증 버튼 end
	    
		$("#email_check").click(function(){
			var chk = 0;
	        var user_authNum = document.getElementById("user_authNum").value;

	    	// 인증번호 비교
	        if (authNum == user_authNum) {
	            chk = 1;
	        } else {
	            chk = -1;
	        }

	        if( chk > 0){
                alert("인증완료");
                chk = 1;
                $("#lab1").html("<label>인증완료</label>");
            }else{
                alert("인증실패");
                $("#lab1").html("<label>인증실패</label>");
                $("#lab1").css("color","red");
            }

		});
			
	    // 회원가입
	    
	});

    function join_cancel(){
    	location.href = "/member/memberLoginPage";
    } 

	function join_submit(){
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
		
		document.getElementById("joinForm").submit();
		
	}

	function checkNickname(){
		$.ajax({
			url:"/member/checkNickname",
			data:{
				member_nickname:$("#member_nickname").val()
				},
			success:function(data){
				if(data==1){
					$("#nicknameCheck").text("사용중인 닉네임입니다");
					$("#nicknameCheck").css("color","red");
					$("#join_submit").attr("disabled", true);
				}else{
					if($("#member_nickname").val().length<=2||$("#member_nickname").val().length>=9){
						$("#nicknameCheck").text("닉네임은 3~8글자 입니다");
						$("#nicknameCheck").css("color","red");
						$("#join_submit").attr("disabled", true);
					}else{
						$("#nicknameCheck").text("사용가능한 닉네임입니다");
						$("#nicknameCheck").css("color","green");
						$("#join_submit").attr("disabled", false);
					}
				}
			},
			error:function(e){
				alert("통신 실패");
				console.log(e);
				}
		});
	}
    </script>
    <style type="text/css">
    	
    	.important{
    		color : red;
    	}
    
    	.join_st{
    		width:450px;
    		margin-left: auto;
    		margin-right: auto;
    		margin: 0px auto;
    	}
    	
    	#span{
    		float:right;
    		padding-bottom:10px;
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
                        <h2>JOIN</h2>
                        <h1>Welcome!</h1>
                    </div>
                    <div id="div">
                        <span id="span"><span class="important">(*)</span>부분은 필수 입력사항입니다.</span><br>
						<table border="1" class="table table-bordered">
							<tr>
								<td>아이디<span class="important">(*)</span></td>
								<c:choose>
									<c:when test="${map.email!=null }">
										<td><input type="text" name="member_id" id="member_id" value="${map.email }" readonly="readonly"></td>
									</c:when>
									<c:otherwise>
										<td><input type="text" name="member_id" id="member_id" placeholder="이메일 형식">  <input type="button" id="auth_btn" value="이메일 인증" class="btn btn-outline-secondary"><br>
										<div id="auth_hide"><input type="text" id="user_authNum" name="user_authNum" placeholder="인증번호">  <input type="button" id="email_check" value="확인" class="btn btn-outline-secondary"><div id="lab1"></div></div></td>
									</c:otherwise>
								</c:choose>
								
							</tr>
							
							<tr>
								<td>비밀번호<span class="important">(*)</span></td>
								<td><input type="password" name="member_pw" id="member_pw" placeholder="비밀번호"><div id="pwCheck"></div>	
								</td>
							</tr>
							
							<tr>
								<td>비밀번호 확인<span class="important">(*)</span></td>
								<td><input type="password" id="member_pwck" placeholder="비밀번호 확인">	
								</td>
							</tr>
							
							<tr>
								<td>연락처<span class="important">(*)</span></td>
								<td><input type="text" name="member_phone"  id="member_phone" placeholder="'-'없이 입력"></td>
							</tr>
					
							<tr>
								<td>이름<span class="important">(*)</span></td>
									<c:choose>
										<c:when test="${map.name!=null }">
											<td><input type="text" name="member_name" id="member_name" placeholder="이름" value="${map.name }" readonly="readonly"></td>
										</c:when>
										<c:otherwise>
											<td><input type="text" name="member_name" id="member_name" placeholder="이름"></td>
										</c:otherwise>
									</c:choose>
							</tr>
							
							<tr>
								<td>닉네임<span class="important">(*)</span></td>
								<td><input type="text" name="member_nickname" id="member_nickname" placeholder="닉네임" >
									<button onclick="checkNickname()" class="btn btn-outline-secondary">중복 검사</button><div id="nicknameCheck"></div>
								</td>
							</tr>
						</table><br>
						<div class="join_st" style="text-align:center;">
							<input type="button" value="취소" onclick="join_cancel()" class="btn btn-outline-secondary">
							<input type="button" id="join_submit" onclick="join_submit()" value="가입" class="btn btn-outline-secondary">
						</div>
						<form action="/member/join" method="post" id="joinForm">
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