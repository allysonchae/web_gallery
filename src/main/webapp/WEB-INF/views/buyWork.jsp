<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매정보 입력</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<script src="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		var price = document.getElementById("price").value;
		var input_price = comma(price);
		
		$("#selboxDirect").hide();
		$("#buy_price").val(input_price+"원");
		
	});

	function comma(num){
	    var len, point, str; 
	       
	    num = num + ""; 
	    point = num.length % 3 ;
	    len = num.length; 
	   
	    str = num.substring(0, point); 
	    while (point < len) { 
	        if (str != "") str += ","; 
	        str += num.substring(point, point + 3); 
	        point += 3; 
	    } 
	     
	    return str;
	 
	}

	function selbox(){
				
		if($("#selbox").val() == "direct") {
			$("#selboxDirect").show();
		}else{
			$("#selboxDirect").hide();
		}
		
	}

	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";

	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var myForm = document.form;
		var url = "/popup/jusoPopup";
		var pop = window.open("","form","toolbal=no, width=570, height=600, directories=no, status=no, scrollbars=yes, resizable=yes"); 
		myForm.action = url;
		myForm.method = "post";
		myForm.target = "form";
		myForm.testVal = "test";
		myForm.submit();
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}


	function jusoCallBack(roadFullAddr,addrDetail,zipNo){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadFullAddr.value = roadFullAddr;
			document.form.addrDetail.value = addrDetail;
			document.form.zipNo.value = zipNo;
	}

	function buy(){
		var buy_name = document.getElementById("buy_name").value;
		var buy_amount = document.getElementById("buy_amount").value;
		var buy_bank = document.getElementById("selbox").value;
		var buy_account = document.getElementById("buy_account").value;
		var buy_price = document.getElementById("price").value;
		var buy_zipNo = document.getElementById("zipNo").value;
		var roadFullAddr = document.getElementById("roadFullAddr").value;
		var addrDetail = document.getElementById("addrDetail").value;
		var market_seq = document.getElementById("market_seq").value;
		var password = document.getElementById("password").value;
		
		if(buy_bank == "direct"){
			buy_bank = document.getElementById("selboxDirect").value;
		}

		if(buy_bank==""){
			alert("은행을 선택해주세요.");
			return;
		}

		if(buy_account==""){
			alert("계좌번호를 입력해주세요.");
			return;
		}

		if(password==""){
			alert("계좌비밀번호를 입력해주세요.");
			return;
		}

		if(buy_zipNo==""){
			alert("주소를 입력해주세요.");
			return;
		}

		var buy_address = roadFullAddr + addrDetail;

		$.ajax({
	        contentType:'application/json',
	        dataType:'json',
	        url:'/insertBuy',
	        type:'get',
	        data:{
	        		buy_name : buy_name
	        		,buy_amount : buy_amount
	        		,buy_bank : buy_bank
	        		,buy_account : buy_account
	        		,buy_price : buy_price
	        		,buy_zipNo : buy_zipNo
	        		,buy_address : buy_address
	        		,market_seq : market_seq
			},
			async: false,
	        success:function(){

	        }
	    });

	    alert("성공적으로 구매가 완료되었습니다.");

		window.close();

	}
</script>
</head>
<body>
	<input type="hidden" id="price" value="${buy_price }">
	<input type="hidden" id="market_seq" value="${market_seq }">
	<input type="hidden" id="buy_amount" value="${buy_amount }">
	<table class="table table-bordered">
		<tr>
			<td style="width: 300px; height: 60px;">작품명</td>
			<td>
				<input type="text" value="${work_name }" readonly="readonly" id="buy_name">
			</td>
		</tr>
		<tr>
			<td style="width: 300px; height: 60px;">개수</td>
			<td>
				<input type="text" value="${buy_amount }개" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td style="width: 300px; height: 60px;">결제은행</td>
			<td>
				<select id="selbox" onchange="selbox();">
					<option value="신한은행">신한은행</option>
					<option value="국민은행">국민은행</option>
					<option value="우리은행">우리은행</option>
					<option value="하나은행">하나은행</option>
					<option value="direct">기타(직접입력)</option>
				</select>
				&nbsp&nbsp
				<input type="text" id="selboxDirect">
			</td>
		</tr>
		<tr>
			<td style="width: 300px; height: 60px;">계좌번호</td>
			<td>
				<input type="text" id="buy_account">
			</td>
		</tr>
		<tr>
			<td>계좌비밀번호</td>
			<td>
				<input type="text" maxlength="2" style="width: 30px;" id="password">●●
			</td>
		</tr>
		<tr>
			<td style="width: 300px; height: 60px;">주소</td>
			<td>
				<form name="form" id="form">
					<input type="text" readonly="readonly"  style="width:200px; margin-bottom: 10px;" id="zipNo"  name="zipNo" />&nbsp&nbsp<input type="button" onclick="goPopup();" value="주소검색">
					<input type="text" readonly="readonly" style="width:500px; margin-bottom: 10px;" id="roadFullAddr"  name="roadFullAddr" />
					<input type="text" readonly="readonly" style="width:500px; margin-bottom: 10px;" id="addrDetail"  name="addrDetail" />
				</form>
			</td>
		</tr>
		<tr>
			<td style="width: 300px; height: 60px;">결제금액</td>
			<td>
				<input type="text" value="" readonly="readonly" id="buy_price">
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<button class="btn btn-outline-secondary" onclick="buy();">결제하기</button>
			</td>
		</tr>
	</table>
</body>
</html>