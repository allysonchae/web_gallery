<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/galleryStyle.css">
<script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>

<!-- Link Swiper's CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<style type="text/css">
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
	
	#trash{
		position: relative;
		top:730px;
		left:1650px;
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

  //리플 쓰기 폼 체크
	function replyFormCheck() {
		var reply_text = document.getElementById('reply_text');
		if (reply_text.value.length < 5) {
			alert('5자 이상 입력해 주세요');
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
<title>WORK</title>
</head>

<body>

  <form id="deleteForm" action="/deleteGallery" method="get" onsubmit="return deleteCheck();">
	  <input type="hidden" value="${map.ID }" name="gallery_seq">
  </form>
  
  
<%--   <c:if test="${sessionScope.loginID==map.MEMBER_ID }">
	  <svg id="trash" width="50px" height="50px" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="margin-top: 15px;">
			<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
			<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
	  </svg>
 </c:if>
  --%>
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
  </div>
  
   <br><br>
  
  <section class="event spad" style="text-align: -webkit-center;">
  	<div class="container">
  	
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
		    <!-- 리플 작성 폼 시작 -->
			<c:if test="${loginID != null}">
				<form id="replyform" action="/replyWrite" method="post" onSubmit="return replyFormCheck();" style="text-align:-webkit-left;">
					<tr>
						<th scope="row" class="replyid">
							${nickname }
						</th>
						<td scope="row" class="replytext" colspan="2">
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
      effect: 'coverflow',
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: 'auto',
      coverflowEffect: {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows: true,
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
