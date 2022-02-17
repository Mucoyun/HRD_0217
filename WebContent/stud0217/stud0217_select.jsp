<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습31 -</title>
	<style>
		#s_table tr:FIRST-CHILD{
			height: 40px;
		}#s_table tr{
			height: 20px;
		}#s_table td{
			text-align: center;
		}
		
		p{
			padding: 0 !important;
			display: block;
			margin: 0 auto;
			width: 1300px;
		}#s_table a{
			color: blue;
			font-weight: bold;
		}#s_table a:HOVER{
			color: red;
			font-weight: bold;
		}
		
		#btn{
			display: block;
			width: 150px;
			height: 30px;
			background-color: black;
			color: white;
			margin: 20px auto;
		}
	</style>
	<script>
		function notry() {
			location.href = "/HRD_0217/stud0217/stud0217_insert.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<% 
		int no = 0; 
		try{
			String sql = "select count(*) from stud0217";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				no = rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>학사정보 목록</h2>
		<p>총 <%=no %>명의 학사정보가 있습니다.</p><hr>
		<table id="s_table">
			<tr>
				<th width="100">학번</th>
				<th width="100">성명</th>
				<th width="100">학과</th>
				<th width="100">학년</th>
				<th width="300">주소</th>
				<th width="200">연락처</th>
				<th width="300">취미</th>
				<th width="100">관리</th>
			</tr>
			<% 
				try{
					String sql = "select studno,name,dept,position,address,phone,hobby from stud0217 order by studno asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String studno = rs.getString(1);
						String name = rs.getString(2);
						String dept = rs.getString(3);
						String position = rs.getString(4);
						String address = rs.getString(5);
						String phone = rs.getString(6);
						String hobby = rs.getString(7);
						%>
						<tr>
							<td><%=studno %></td>
							<td><%=name %></td>
							<td><%=dept %></td>
							<td><%=position %></td>
							<td><%=address %></td>
							<td><%=phone %></td>
							<td><%=hobby %></td>
							<td>
								<a href="stud0217_update.jsp?send_studno=<%=studno %>">수정</a>
								<span>/</span>
								<a href="stud0217_delete.jsp?send_studno=<%=studno %>"
								onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false;}">삭제</a>
							</td>
						</tr>
						<%
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
			%>
		</table>
		<button id="btn" type="button" onclick="notry()">학사정보 추가</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>