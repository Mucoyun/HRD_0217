<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습31 -</title>
	<script>
		function gotry() {
			if(document.iu_form.name.value == ""){
				alert("강사명이 입력되지 않았습니다.");
				document.iu_form.name.focus();
			}else if(document.iu_form.major.value == ""){
				alert("전공이 입력되지 않았습니다.");
				document.iu_form.major.focus();
			}else if(document.iu_form.field.value == ""){
				alert("세부전공이 입력되지 않았습니다.");
				document.iu_form.field.focus();
			}else{
				document.iu_form.submit();
			}
		}
		function notry() {
			location.href = "/HRD_0217/lecturer0217/lecturer0217_insert.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<% 
		int idx = 0; 
		try{
			String sql = "select max(idx) from lecturer0217";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				idx = rs.getInt(1);
			}
			idx++;
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>강사 추가</h2>
		<form name="iu_form" method="post" action="lecturer0217_insert_process.jsp">
			<table id="iu_table">
				<tr>
					<th>강사 ID</th>
					<td><input type="text" name="idx" value="<%=idx %>" readonly>자동증가(마지막번호+1)</td>
				</tr>
				<tr>
					<th>강사명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>전공</th>
					<td><input type="text" name="major"></td>
				</tr>
				<tr>
					<th>세부전공</th>
					<td><input type="text" name="field"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="gotry()">등록</button>
						<button type="button" onclick="notry()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>