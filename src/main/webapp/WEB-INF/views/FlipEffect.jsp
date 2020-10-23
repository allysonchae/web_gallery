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
<script type="text/javascript">
	//리플 쓰기 폼 체크
	function replyFormCheck() {
		var reply_text = document.getElementById('reply_text');
		if (reply_text.value.length < 5) {
			alert('5자 이상 입력해 주세요');
			return false;
		}
		return true;			
	}

	/* //리플 수정
	function replyEditForm(reply_seq, gallery_seq, reply_text) {
		//해당 리플번호를 붙여 생성한 <div>태그에 접근
		var div = document.getElementById("div"+reply_seq);
		
		var str = '<form name="editForm' + reply_seq + '" action="replyEdit" method="post">';
		str += '<input type="hidden" name="reply_seq" value="'+reply_seq+'">';
		str += '<input type="hidden" name="gallery_seq" value="'+gallery_seq+'">';
		str += '&nbsp;';
		str += '<input type="text" name="reply_text" value="' + reply_text + '" style="width:530px;">';
		str += '&nbsp;';
		str += '<a href="javascript:replyEdit(document.editForm' + reply_seq + ')">[저장]</a>';
		str += '&nbsp;';
		str += '<a href="javascript:replyEditCancle(document.getElementById(\'div' + reply_seq + '\'))">[취소]</a>';
		str += '</form>';
		div.innerHTML = str;
	}

	//리플 삭제
	function replyDelete(reply_seq, gallery_seq) {
		if (confirm('리플을 삭제하시겠습니까?')) {
			location.href='replyDelete?reply_seq=' + reply_seq + '&gallery_seq=' + gallery_seq;
		}
	} */
</script>

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
	
	#trash{
		position: relative;
		top:730px;
		left:1650px;
	}
  </style>
  
  <script type="text/javascript">
  	$(document).ready(function () {
		  var deleteForm = document.getElementById("deleteForm");

		  $('#x').mouseenter(function () {
				$(this).css("color","red");
	      });

		  $('#x').mouseleave(function () {
				$(this).css("color","black");
	      });
	        	  	
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
  </script>
  
</head>

<body>
  
  
  <c:if test="${sessionScope.loginID==map.MEMBER_ID }">
	  <svg id="trash" width="50px" height="50px" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="margin-top: 15px;">
			<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
			<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
	  </svg>
  </c:if>
	
	<a href="/gallery">
	  <svg id="x" width="60px" height="60px" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  		<path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
	  </svg>
	</a>  
 
  <div class="header">
  	<h1>${map.TITLE }</h1>
  	<h4>${map.MEMBER_NICKNAME }</h4>
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
  <section class="event spad">
  	<div class="container">
  		<!-- 리플 목록 출력 시작 -->
		<table class="reply">
		<c:forEach var="reply" items="${replylist}">
			<tr>
				<td class="replyid">
					<b>${reply.member_nickname}</b>
				</td>
				<td class="replytext">
					${reply.reply_text}
				</td>
				<td class="replybutton">
					<c:if test="${loginID == reply.member_id}">
						[<a href="javascript:replyEditForm(${reply.reply_seq}, ${reply.gallery_seq}, '${reply.reply_text}')">수정</a>]
					</c:if>
				</td>
				<td class="replybutton">
					<c:if test="${loginID == reply.member_id}">
						[<a href="javascript:replyDelete(${reply.reply_seq}, ${reply.gallery_seq })">삭제</a>]
					</c:if>
				</td>
			</tr>	
			<tr>
				<!-- 리플 수정 폼이 나타날 위치 -->
				<td class="white" colspan="4"><div id="div${reply.reply_seq}"></div></td>
			</tr>
				 
		</c:forEach>
		</table>
  		<!-- 리플 작성 폼 시작 -->
		<c:if test="${loginID != null}">
		<form id="replyform" action="/replyWrite" method="post" onSubmit="return replyFormCheck();">
		리플내용
			<input type="hidden" name="id" value="${gallery_seq}">
			<input type="text" name="reply_text" id="reply_text" style="width:500px;" />
			<input type="submit" value="확인" />
		</form>
		</c:if>
		<!-- /리플 작성 폼 끝 -->
  	</div>
  </section>
  
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