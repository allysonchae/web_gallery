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
</head>
<body>
	<div class="wrap">
		<table>
			<tr>
				<td><img src="/download?work_seq=${work_seq }&id=${id }" style="width: 800px; height: 550px;"></td>
				<td>
			     	<div class="contents" id="con">
			     		<h3 style="text-align: center; width:700px;">${work.work_description }</h3>	
			     	</div>
	        	</td>
			</tr>
		</table>
	</div>
</body>
</html>
