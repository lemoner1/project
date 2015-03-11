<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>

<% String mainUrl = "/Main.jsp"; %>
<HTML>
	<HEAD>
		<TITLE>DUMBOs</TITLE>
		<META http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script src="jquery-1.11.1.min.js"></script>
		<style>	
		</style>
	</HEAD>
	<BODY>
	
		<div>
			<div>
					<!-- 상단 화면 관련 시작 ------------------->
					<jsp:include page="/Top.jsp" flush="true" />
					<!-- 상단 화면 관련 끝 --------------------->
			</div>

			<div width=100% height="1000">
					<!-- Main 화면 관련 시작 ------------------->
					<jsp:include page="<%= mainUrl%>" flush="true" />
					<!-- Main 화면 관련 끝 --------------------->
			</div>

			<div>
					<!-- 밑 관련 시작 ------------------->
					<jsp:include page="/Bottom.jsp" flush="true" />
					<!-- 밑 관련 끝 --------------------->
			</div>
		</div>
	</BODY>
</HTML>