<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습31 -</title>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%
		String idx = request.getParameter("idx");
		String name = request.getParameter("name");
		String major = request.getParameter("major");
		String field = request.getParameter("field");
		
		try{
			String sql = "update lecturer0217 set name=?,major=?,field=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(4, idx);
			pstmt.setString(1, name);
			pstmt.setString(2, major);
			pstmt.setString(3, field);
			pstmt.executeUpdate();
			%><script>
				alert("수정이 완료되었습니다.");
				location.href = "/HRD_0217/lecturer0217/lecturer0217_select.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>