<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습31 -</title>
	<style>
		*{
			margin: 0; padding: 0;
		}html,body{
			width: 100%; height: 100%;
		}a{
			text-decoration: none;
		}table{
			border: 3px solid black;
			margin: 0 auto;
			border-collapse: collapse;
		}tr,th,td{
			border: 1px solid black;
		}th{
			background-color: #EEEEEE;
		}
		
		header{
			width: 100%; height: 12%;
			color: white; background-color: blue;
			text-align: center; display: table;
		}header > h1{
			display: table-cell;
			vertical-align: middle;
			font-size: 3vw;
		}
		
		nav{
			width: 15%; height: 83%;
			color: white; background-color: black;
			text-align: center; display: table;
			float: left;
		}nav > ul{
			display: table-cell;
			vertical-align: top;
			list-style: none;
		}nav > ul li{
			display: block;
			margin: 20px 0; 
			font-size: 1vw;
		}nav > ul li > a{
			color: white;
			font-weight: bold;
		}nav > ul li > a:HOVER {
			color: red;
			font-weight: bold;
		}
		
		section{
			width: 85%; height: 83%;
			color: black; background-color: white;
			float: left;
		}section > h2{
			text-align: center;
			padding: 20px 0;
		}section > p{
			padding-left: 40px;
			font-weight: bold;
		}section > ol{
			padding-left: 40px;
		}
		
		footer{
			width: 100%; height: 5%;
			color: white; background-color: gray;
			text-align: center; display: table;
			clear: both;
		}footer > h3{
			display: table-cell;
			vertical-align: middle;
			font-size: 1vw;
		}
		
	</style>
	<style>
		#iu_table tr{
			height: 30px;
		}#iu_table th{
			width: 200px;
		}#iu_table tr{
			width: 600px;
		}
		
		#iu_table input[type="text"]{
			height: 25px;
			width: 400px;
		}#iu_table select{
			height: 25px;
			width: 200px;
		}
		
		#btntd{
			text-align: center;
		}#btntd button{
			height: 30px;
			width: 150px;
		}
		
	</style>
</head>
<body>
	<header>
		<h1>수강신청 도우미 사이트</h1>
	</header>
</body>
</html>