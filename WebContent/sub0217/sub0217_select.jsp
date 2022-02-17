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
			width: 1200px;
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
			location.href = "/HRD_0217/sub0217/sub0217_insert.jsp";
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
			String sql = "select count(*) from sub0217";
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
		<h2>교과목 목록</h2>
		<p>총 <%=no %>개의 교과목이 있습니다.</p><hr>
		<table id="s_table">
			<tr>
				<th width="100">no</th>
				<th width="100">강사코드</th>
				<th width="100">담당강사</th>
				<th width="100">과목코드</th>
				<th width="300">과목명</th>
				<th width="100">학점</th>
				<th width="100">요일</th>
				<th width="100">시작시간</th>
				<th width="100">종료시간</th>
				<th width="100">관리</th>
			</tr>
			<% 
				no = 0;
				try{
					String sql = "select id,subject_name,credit,name,week,start_hour,end_hour,b.idx from sub0217 a,lecturer0217 b where a.lecturer=b.idx order by b.idx asc,a.id asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						no++;
						String id = rs.getString(1);
						String subject_name = rs.getString(2);
						String credit = rs.getString(3);
						String name = rs.getString(4);
						String week = rs.getString(5);
						String start_hour = rs.getString(6);
						String end_hour = rs.getString(7);
						String idx = rs.getString(8);
						
						switch(week){
							case "1" : week = "월";
							break;
							case "2" : week = "화";
							break;
							case "3" : week = "수";
							break;
							case "4" : week = "목";
							break;
							case "5" : week = "금";
							break;
							case "6" : week = "토";
							break;
							default : week = "";
						}
						
						%>
						<tr>
							<td><%=no %></td>
							<td><%=idx %></td>
							<td><%=name %></td>
							<td><%=id %></td>
							<td><%=subject_name %></td>
							<td><%=credit %></td>
							<td><%=week %></td>
							<td><%=start_hour %></td>
							<td><%=end_hour %></td>
							<td>
								<a href="sub0217_update.jsp?send_id=<%=id %>">수정</a>
								<span>/</span>
								<a href="sub0217_delete.jsp?send_id=<%=id %>"
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