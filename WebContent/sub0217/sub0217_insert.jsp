<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습31 -</title>
	<script>
		function gotry() {
			if(document.iu_form.id.value == ""){
				alert("교과목 코드가 입력되지 않았습니다.");
				document.iu_form.id.focus();
			}else if(document.iu_form.subject_name.value == ""){
				alert("교과목명이 입력되지 않았습니다.");
				document.iu_form.subject_name.focus();
			}else if(document.iu_form.credit.value == ""){
				alert("학점이 입력되지 않았습니다.");
				document.iu_form.credit.focus();
			}else if(document.iu_form.lecturer.value == ""){
				alert("담당강사가 입력되지 않았습니다.");
				document.iu_form.lecturer.focus();
			}else if(document.iu_form.start_hour.value == ""){
				alert("시작시간이 입력되지 않았습니다.");
				document.iu_form.start_hour.focus();
			}else if(document.iu_form.end_hour.value == ""){
				alert("종료시간이 입력되지 않았습니다.");
				document.iu_form.end_hour.focus();
			}else{
				document.iu_form.submit();
			}
		}
		function notry() {
			location.href = "/HRD_0217/sub0217/sub0217_select.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>교과목 추가</h2>
		<form name="iu_form" method="post" action="sub0217_insert_process.jsp">
			<table id="iu_table">
				<tr>
					<th>교과목 코드</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>과목명</th>
					<td><input type="text" name="subject_name"></td>
				</tr>
				<tr>
					<th>학점</th>
					<td><input type="text" name="credit"></td>
				</tr>				
				<tr>
					<th>담당강사</th>
					<td>
						<select name="lecturer">
							<option value="">담당강사 선택</option>
							<%
								try{
									String sql = "select idx,name from lecturer0217 order by idx asc";
									pstmt = conn.prepareStatement(sql);
									rs = pstmt.executeQuery();
									while(rs.next()){
										String idx = rs.getString(1);
										String name = rs.getString(2);
										%>
										<option value="<%=idx %>"><%=name %></option>
										<%
									}
									
								}catch(SQLException e){
									e.printStackTrace();
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<th>요일</th>
					<td>
						<input type="radio" name="week" value="1" checked> 월
						<input type="radio" name="week" value="2"> 화
						<input type="radio" name="week" value="3"> 수
						<input type="radio" name="week" value="4"> 목
						<input type="radio" name="week" value="5"> 금
						<input type="radio" name="week" value="6"> 토
					</td>
				</tr>
				<tr>
					<th>시작</th>
					<td><input type="text" name="start_hour" maxlength="4"></td>
				</tr>
				<tr>
					<th>종료</th>
					<td><input type="text" name="end_hour" maxlength="4"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="notry()">목록</button>
						<button type="button" onclick="gotry()">등록</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>