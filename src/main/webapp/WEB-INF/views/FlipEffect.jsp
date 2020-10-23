<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WORK</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

  <!-- Demo styles -->
  <style>
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
      padding: 50px;
    }

    .swiper-slide {
      background-position: center;
      background-size: cover;
      width: 300px;
      height: 300px;
    }
     
     .header{
		text-align: center;
		padding-top: 50px;
	} 
	
	*, ::after, ::before {
     box-sizing: content-box;
	}
	
	#trash:hover{
		cursor:pointer;
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
	}
	
	
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
  	  	
	      $('#trash').mouseenter(function () {
				$(this).css("color","red");
	      });

	      $('#trash').mouseleave(function () {
				$(this).css("color","black");
	      });

	      $('#trash').click(function () {
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
  </script>
  
  
  
</head>

<body>

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
  <h1 class="overlay-info">
  	<!-- 여기에 메뉴버튼 눌렀을 때 꾸미기 -->
  </h1>
</div>

  <div class="header">
  	<h1>${map.TITLE }</h1>
  </div>
  
  <!-- Swiper -->
  <div class="swiper-container">
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

    <!-- Add Arrows -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
  </div>
  
  <br><br>
  
  <section class="event spad" style="text-align: -webkit-center;">
  	<c:if test="${replylist.isEmpty()!=true }">
	  	<div class="container" style="overflow-x:hidden; overflow-y:scroll; height:200px;">
	  		<table class="type05">
	  			<c:forEach var="reply" items="${replylist}">
				    <tr>
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
				    
				    <tr>
						<!-- 리플 수정 폼이 나타날 위치 -->
						<td class="white" colspan="4"><div id="div${reply.reply_seq}"></div></td>
					</tr>
			    </c:forEach>
			</table>
	  	</div>
  	</c:if>
  	<div style="padding: 15px; width: 1123px;">
  	<table class="container">
   		<!-- 리플 작성 폼 시작 -->
		<c:if test="${loginID != null}">
			<form id="replyform" action="/replyWrite" method="post" onSubmit="return replyFormCheck();" style="text-align:-webkit-left;">
				<tr>
					<th scope="row" class="replyid" style="font-size: x-large;">
						${nickname }
					</th>
						<td scope="row" class="replytext" colspan="2" style="text-align: -webkit-center;">
						<input type="hidden" name="id" value="${gallery_seq}">
						<input type="text" name="reply_text" id="reply_text" style="width:850px; height:100px;" />
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
      effect: 'flip',
      grabCursor: true,
      pagination: {
        el: '.swiper-pagination',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
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