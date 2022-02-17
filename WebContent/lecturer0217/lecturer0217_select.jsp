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
			width: 800px;
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
			location.href = "/HRD_0217/lecturer0217/lecturer0217_insert.jsp";
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
			String sql = "select count(*) from lecturer0217";
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
		<h2>강사 리스트</h2>
		<p>총 <%=no %>명의 강사가 있습니다.</p><hr>
		<table id="s_table">
			<tr>
				<th width="100">강사코드</th>
				<th width="200">강사명</th>
				<th width="200">전공</th>
				<th width="200">세부전공</th>
				<th width="100">관리</th>
			</tr>
			<% 
				try{
					String sql = "select idx,name,major,field from lecturer0217 order by idx asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String idx = rs.getString(1);
						String name = rs.getString(2);
						String major = rs.getString(3);
						String field = rs.getString(4);
						%>
						<tr>
							<td><%=idx %></td>
							<td><%=name %></td>
							<td><%=major %></td>
							<td><%=field %></td>
							<td>
								<a href="lecturer0217_update.jsp?send_idx=<%=idx %>">수정</a>
								<span>/</span>
								<a href="lecturer0217_delete.jsp?send_idx=<%=idx %>"
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
		<button id="btn" type="button" onclick="notry()">작성</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>