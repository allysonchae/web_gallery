<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Onex</title>
<style type="text/css">
	#con{
		width:300px;	
	}
</style>
<script type="text/javascript">
		$(function(){
			var amount = document.getElementById("amount").value;
			
			for(var i = 0 ; i<=amount ; i++){
				var rowItem = "<option>"+i+"</option>";
				$("#input").append(rowItem);
			}
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

		function sum(){
			var input = document.getElementById("input").value;
			var price = comma(input*document.getElementById("price").value);
			$("#sum_check").val(price+"원");
			$("#sum_check").css("color","red");
		}
</script>

</head>
<body>
	<div class="wrap">
		<table>
			<tr>
				<td><img src="/download?work_seq=${market.work_seq }&id=${market.gallery_seq }" style="width: 800px; height: 550px;"></td>
				<td style="padding-top: 0px; padding-bottom: 200px;">
				    <h1 style="text-align: center; width: 700px; height: 100px;  font-size: 50px;">${market.work_name }</h1>
			     	<div class="contents" id="con">
			     		<table style="margin-left: 100px; width: 520px;">
			     			<tr>
			     				<td style="font-size: 40px; width: 800px;">
			     					<div style="text-align:center;">${market.work_description }</div>
			     				</td>
			     			</tr>
			     		</table>
			     		<table style="width: 550px; font-size: 20px; position: relative; top: 280px; left: 20px;">
			     			<tr>
			     				<td>
			     					구매수량:
			     					<select id="input" onchange="sum()"></select>
			     				</td>
			     				<td>
			     					&nbsp&nbsp
			     					가격:
				     				&#8361; ${market.market_price }/1개
			     				</td>
			     				<td>
									<input type="text" placeholder="총금액" id="sum_check" style="width:110px;">
					     		</td>
			     			</tr>
			     		</table>
			     		<input type="hidden" id="price" value="${market.market_price }">
						<input type="button" value="구매하기" style="width:150px; position:relative; left:550px; top:220px; height:80px;background: #7c4df1;opacity: 70%;color:white;border:none;border-radius:10px;">
			     		<%-- <h3 style="width:700px;">${work.work_description }</h3> --%>	
			     	</div>
	        	</td>
			</tr>
		</table>
	</div>
	<input type="hidden" value="${market.market_amount }" id="amount">
	
</body>
</html>
