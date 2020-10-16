<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>description1</title>
<style type="text/css">
	body{
	 position: relative;
	}

	.title{
		text-align: center;		
	}
</style>
<script type="text/javascript">
	window.onload = function() {
		var innerHeight = window.outerHeight;
		var table = document.getElementById("tb");

		var margin = (innerHeight - table.offsetHeight) / 3.5;

		table.style.marginTop = margin + "px";
		console.log(table.style.marginTop);

		/* console.log(innerHeight);
		console.log(table.offsetHeight);
		console.log(margin); */
	}
</script>
</head>
<body>
	${work }
	<div class="wrap">
		<table id="tb">
			<tr>
				<td><img src="/resources/images/image1.jpg">${work.work_originalFileName }</td>
				<td>
					<div class="title"><h1>${work.work_name }</h1></div>
			     	<div class="contents">
			     		${work.work_description }
			     	</div>
	        	</td>
			</tr>
		</table>
	</div>
</body>
</html>
