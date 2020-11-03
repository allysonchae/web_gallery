<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>

  <!-- Demo styles -->
  <style>
    html,
    body {
      position: relative;
      height: 100%;
    }

    body {
      background: #fff;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper-container {
      width: 300px;
      height: 300px;
      position: absolute;
      left: 50%;
      top: 50%;
      margin-left: -150px;
      margin-top: -150px;
    }

    .swiper-slide {
      background-position: center;
      background-size: cover;
    }
    
    #header{
		text-align: center;
		padding-top: 50px;
		font-family: cursive;
	} 
	
	#trash{
		position: relative;
		top:730px;
		left:1650px;
	}
	
	#delete:hover{
		cursor:pointer;
	}
	
	#x:hover{
		cursor:pointer;
	}
	
	#x{
		float: right;
		color:black;
	}
	
	#replyTable{
		margin: 0 auto;
	}
	
	table.type05 {
	    border-collapse: separate;
	    border-spacing: 1px;
	    text-align: left;
	    line-height: 1.5;
	    border-top: 1px solid #ccc;
	    margin: 20px 10px;
	}
	table.type05 th {
	    width: 150px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #efefef;
	}
	table.type05 td {
	    width: 350px;
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
	.replybutton{
		text-align-last:right;
	}
	.container{
		text-align:-webkit-center;
	}
	
	html {
	  margin: 0;
	  padding: 0;
	}
	
	body {
	  margin: 0;
	  padding: 0;
	  font-family: Helvetica Neue, Arial, sans-serif;
	  overflow: hidden;
	}
	
	/* ------------- */
	.menu {
	  position: absolute;
	  top: 20px;
	  left: 20px;
	  height: 46px;
	  width: 46px;
	}
	
	.menu-link {
	  width: 100%;
	  height: 100%;
	  position: absolute;
	  z-index: 1002;
	}
	
	.menu-icon {
	  position: absolute;
	  width: 20px;
	  height: 14px;
	  margin: auto;
	  left: 0;
	  top: 0;
	  right: 0;
	  bottom: 1px;
	}
	
	/* ------------- */
	.menu-line {
	  background-color: #333;
	  height: 2px;
	  width: 100%;
	  border-radius: 2px;
	  position: absolute;
	  left: 0;
	  transition: all 0.25s ease-in-out;
	}
	.menu-line-2 {
	  top: 0;
	  bottom: 0;
	  margin: auto;
	}
	.menu-line-3 {
	  bottom: 0;
	}
	.menu.open .menu-line-1 {
	  transform: translateY(7px) translateY(-50%) rotate(-45deg);
	}
	.menu.open .menu-line-2 {
	  opacity: 0;
	}
	.menu.open .menu-line-3 {
	  transform: translateY(-7px) translateY(50%) rotate(45deg);
	}
	
	/* ------------- */
	.menu-circle {
	  background-color: #fff;
	  width: 100%;
	  height: 100%;
	  position: absolute;
	  border-radius: 50%;
	  transform: scale(1);
	  z-index: 1000;
	  transition: transform 0.3s ease-in-out;
	}
	.menu:hover .menu-circle {
	  transform: scale(1.5);
	}
	.menu.open .menu-circle {
	  transform: scale(60);
	}
	
	/* ------------- */
	.menu-overlay {
	  background-color: #fff;
	  color: #333;
	  height: 100%;
	  width: 100%;
	  position: fixed;
	  text-align: center;
	  transition: opacity 0.2s ease-in-out;
	  z-index: 1001;
	  opacity: 0;
	  visibility: hidden;
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	  align-items: center;
	}
	.menu-overlay.open {
	  opacity: 1;
	  visibility: visible;
	  background: #EEEEEE;
	}
	
	/* ------------- */
	.info {
	  text-align: center;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	}
	.overlay-info {
	  text-align: center;
	  color: #111825;
	
  </style>

  <script type="text/javascript">
	$(function() {
	  
	  $(".menu-link").click(function(e) {
	    e.preventDefault();
	    
	    $(".menu-overlay").toggleClass("open");
	    $(".menu").toggleClass("open");

	  });
	    
	});
  	$(document).ready(function () {
		  var deleteForm = document.getElementById("deleteForm");

		  $('#overMenu1').mouseenter(function () {
				$(this).css("color","white");
	      });

		  $('#overMenu1').mouseleave(function () {
				$(this).css("color","black");
	      });
	      
		  $('#overMenu2').mouseenter(function () {
				$(this).css("color","white");
	      });

		  $('#overMenu2').mouseleave(function () {
				$(this).css("color","black");
	      });

		  $('#x').mouseenter(function () {
				$(this).css("color","red");
	      });

		  $('#x').mouseleave(function () {
				$(this).css("color","black");
	      });
	  		
	      $('#delete').mouseenter(function () {
				$(this).css("color","red");
	      });

	      $('#delete').mouseleave(function () {
				$(this).css("color","black");
	      });

	      $('#delete').click(function () {
	    	  if(confirm("정말 삭제하시겠습니까 ?") == true){
		   	  		deleteForm.submit();				
	    	        alert("성공적으로 삭제되었습니다");
	    	    }
	    	    else{
	    	        return ;
	    	    }
		  });
  	});

  //리플 쓰기 폼 체크
	function replyFormCheck() {
		var reply_text = document.getElementById('reply_text');
		if (reply_text.value.length == 0) {
			alert("댓글을 입력해 주세요");
			return false;
		}
		return true;			
	}
	//리플 수정
	function replyEditForm(reply_seq, gallery_seq, reply_text) {
		//해당 리플번호를 붙여 생성한 <div>태그에 접근
		var div = document.getElementById("div"+reply_seq);
		
		var str = '<form name="editForm' + reply_seq + '" action="replyEdit" method="post">';
		str += '<input type="hidden" name="reply_seq" value="'+reply_seq+'">';
		str += '<input type="hidden" name="id" value="'+gallery_seq+'">';
		str += '&nbsp;';
		str += '<input type="text" name="reply_text" value="' + reply_text + '" style="width:530px;">';
		str += '&nbsp;';
		str += '[<a href="javascript:replyEdit(document.editForm' + reply_seq + ')">수정</a>]';
		str += '&nbsp;';
		str += '[<a href="javascript:replyEditCancle(document.getElementById(\'div' + reply_seq + '\'))">취소</a>]';
		str += '</form>';
		div.innerHTML = str;
	}

	//리플 수정 취소
	function replyEditCancle(div) {
		div.innerHTML = '';
	}

	//리플 수정 정보 저장
	function replyEdit(form) {
		if (confirm('수정된 내용을 저장하시겠습니까?')) {
			form.submit();
		}
	}
	
	//리플 삭제
	function replyDelete(reply_seq, gallery_seq) {
		if (confirm('리플을 삭제하시겠습니까?')) {
			location.href='replyDelete?reply_seq=' + reply_seq + '&id=' + gallery_seq;
		}
	}

	function replylist(){
	    var arr;
	    
	    $.ajax({
	        contentType:'application/json',
	        dataType:'json',
	        url:'/replylist',
	        type:'get',
	        data:{
					gallery_seq : $("#gallery_seq").val()
			},
	        async: false,
	        success:function(resp){
				console.log(resp);
	        	arr = resp;
	        }
	    });
	    
	    return arr;
	}
	


	//스크롤
	$(document).ready(function () {
		
		var list = replylist();
		console.log(list);
		var i=5;

		$('#scroll_div').scroll(function(){
			var rt = $('#reply_tb').height();
			var sd = $('#scroll_div').scrollTop();
			var div = document.getElementById('reply_height');
			
			if((rt-sd)==159){
				if(i!=list.length){
					var member_nickname = list[i].member_nickname;
					var reply_text = list[i].reply_text;
					var reply_indate = list[i].reply_indate;
					var member_id = list[i].member_id;
					var reply_seq = list[i].reply_seq;
					var gallery_seq = document.getElementById('gallery_seq').value;
					var login = document.getElementById('login').value;
					var loginID = '${sessionScope.loginID}';
					i++;
					
					var	rowItem = "<tr id='reply_height'>";
					rowItem += "<th scope='row' class='replyid'>";
					rowItem += "<b>"+member_nickname+"</b>";
					rowItem += "</th>";
					rowItem += "<td scope='row' class='replytext'>";
					rowItem += reply_text;
					rowItem += "</td>";
					rowItem += "<td class='replybutton'>";
					rowItem += reply_indate;
					rowItem += "</td>";
					rowItem += "<td class='replybutton'>";
					if(loginID == member_id){
						rowItem += "[<a href='javascript:replyEditForm("+reply_seq+", "+gallery_seq+", "+reply_text+")'>수정</a>]";
						rowItem += "[<a href='javascript:replyDelete("+reply_seq+", "+gallery_seq+")'>삭제</a>]";
					};
					rowItem += "</td>";
					rowItem += "</tr>";
					rowItem += "<tr id='reply_update'>";
					rowItem += "<td class='white' colspan='4' style='padding-left: 150px; padding-bottom: 0; padding-top: 0;'><div id='div"+reply_seq+"'></div></td>";
					rowItem += "</tr>";
							
					$("#reply_tb").append(rowItem);
				}
			}
		});
	});
  </script>
  
  <title>Onex</title>
</head>

<body>
<input type="hidden" id="login" value="${sessionScope.loginID }">
  <form id="deleteForm" action="/deleteGallery" method="get" onsubmit="return deleteCheck();">
	  <input type="hidden" value="${map.ID }" name="gallery_seq">
  </form>
  
  
	 <%-- <c:if test="${sessionScope.loginID==map.MEMBER_ID }">
		  <svg id="trash" width="50px" height="50px" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="margin-top: 15px;">
				<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
				<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
		  </svg>
	 </c:if> --%>

	<a href="/gallery"> 
		<svg id="x" width="60px" height="60px" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
		</svg>
	</a>
	
	<div class="menu">
  <span class="menu-circle"></span>
  <a href="#" class="menu-link">
    <span class="menu-icon">
      <span class="menu-line menu-line-1"></span>
      <span class="menu-line menu-line-2"></span>
      <span class="menu-line menu-line-3"></span>
    </span>
  </a>
</div>

<div class="menu-overlay">
  <h1 class="overlay-info" style="font-family: monospace;">
  	<!-- 여기에 메뉴버튼 눌렀을 때 꾸미기 -->
  	<div>
	  	<c:if test="${sessionScope.loginID!=null }">
		  	<a href="/message/directMessage?member_nickname=${map.MEMBER_NICKNAME }" id="overMenu1" style="color:black;text-decoration:none;">쪽지보내기</a><br>
	  	</c:if>
	 	<a href="/memberGallery?member_id=${map.MEMBER_ID }" id="overMenu2" style="color:black;text-decoration:none;">${map.MEMBER_NICKNAME }님의 전시회</a><br>
  	</div>
  	<c:if test="${sessionScope.loginID==map.MEMBER_ID }">
  		<div id="delete">삭제하기</div>
  	</c:if>
  </h1>
</div>


  <div id="header">
  	<h1>${map.TITLE }</h1>
  </div>
  
  
  <!-- Swiper -->
  <div class="swiper-container" style="position: relative; top: 250px;">
    <div class="swiper-wrapper">
	    <c:forEach items="${list }" var="list" varStatus="status">
	      <div class="swiper-slide">
	      	<a href="/workDescription?work_seq=${list.WORK_SEQ}&id=${list.ID }" data-toggle="lightbox" data-width="1500" data-title="${list.WORK_NAME }" data-footer="By ${list.MEMBER_NICKNAME }">
      				<img src="/download?work_seq=${list.WORK_SEQ }&id=${list.ID }" style="width:300px; height: 300px" class="img-fluid">
	      	</a>
	      </div>
	    </c:forEach>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
  </div>
  
  <br><br>
  
  <section class="event spad" style="text-align: -webkit-center;">
  	<c:if test="${replylist_5.isEmpty()!=true }">
		<input type="hidden" value="${replylist }" id="replylist">
		<input type="hidden" value="${gallery_seq }" id="gallery_seq">
	  	<div class="container" style="overflow-x:hidden; overflow-y:scroll; height:200px;" id="scroll_div">
	  		<table class="type05" id="reply_tb">
	  			<c:forEach var="reply" items="${replylist_5}">
				    <tr id="reply_height">
				        <th scope="row" class="replyid">
				        	<b>${reply.member_nickname}</b>
				        </th>
		
				        <td scope="row" class="replytext">
							${reply.reply_text}
						</td>
						
						<td class="replybutton">
							${reply.reply_indate }
						</td>
						
						<td class="replybutton">
							<c:if test="${sessionScope.loginID == reply.member_id}">
								[<a href="javascript:replyEditForm(${reply.reply_seq}, ${gallery_seq}, '${reply.reply_text}')">수정</a>]
								[<a href="javascript:replyDelete(${reply.reply_seq}, ${gallery_seq})">삭제</a>]
							</c:if>
						</td>
				    </tr>
					    <tr id="reply_update">
							<!-- 리플 수정 폼이 나타날 위치 -->
							<td class="white" colspan="4" style="padding-left: 150px; padding-bottom: 0; padding-top: 0;"><div id="div${reply.reply_seq}"></div></td>
						</tr>
			    </c:forEach>
			</table>
	  	</div>
  	</c:if>
  	<div style="width: 1140px;">
  	<table class="type05">
   		<!-- 리플 작성 폼 시작 -->
		<c:if test="${loginID != null}">
			<form id="replyform" action="/replyWrite" method="post" onSubmit="return replyFormCheck();" style="text-align:-webkit-left;">
				<tr>
					<th style="font-size: x-large;">
						${nickname }
					</th>
					<td style="text-align: -webkit-center;">
						<input type="hidden" name="id" value="${gallery_seq}">
						<input type="text" name="reply_text" id="reply_text" style="width:600px; height:100px;" />
					</td>
					<td>
						<input type="submit" value="확인" style="width:150px; height:100px;background: #7c4df1;opacity: 70%;color:white;border:none;border-radius:10px;" />
					</td>
				</tr>
			</form>
		</c:if>
		<!-- /리플 작성 폼 끝 -->
		</table>
	</div>
  		
	</section>
  <br><br><br>
  

  <!-- Swiper JS -->
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      effect: 'cube',
      grabCursor: true,
      cubeEffect: {
        shadow: true,
        slideShadows: true,
        shadowOffset: 20,
        shadowScale: 0.94,
      },
      pagination: {
        el: '.swiper-pagination',
      },
    });
  </script>
  
  <script type="text/javascript">
	  $(document).on('click', '[data-toggle="lightbox"]', function(event) {
	      event.preventDefault();
	      $(this).ekkoLightbox();
	  });
  </script>
</body>
</html>