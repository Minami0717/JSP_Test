<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="friend.ReplyDao"%>
<%@page import="friend.Reply"%>
<%@page import="friend.PostDao"%>
<%@page import="friend.Post"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	Integer idx = Integer.parseInt(request.getParameter("idx"));
	String nick = request.getParameter("nickname");
	String pw = request.getParameter("pw");
	String text = request.getParameter("text");

	Post post = PostDao.getInstance().select(idx);
	post.setHits(post.getHits()+1);
	PostDao.getInstance().update(post);
	
	if (nick != null) {
		if(nick.isEmpty()) {
			%><script>alert("닉네임을 입력하세요"); history.back()</script><%
			return;
		}
		if(pw.isEmpty()) {
			%><script>alert("비밀번호를 입력하세요"); history.back()</script><%
			return;
		}
		if(text.isEmpty()) {
			%><script>alert("댓글을 입력하세요"); history.back()</script><%
			return;
		}
		
		Reply reply = new Reply();
		reply.setNickname(nick);
		reply.setContents(text);
		reply.setPost_idx(idx);
		String date = LocalDateTime.now().format(
				DateTimeFormatter.ofPattern("MM.dd HH:mm:ss"));
		reply.setDate(date);
		
		ReplyDao.getInstance().insert(reply);
	}
	
	List<Post> list = PostDao.getInstance().selectAll();
	List<Reply> replies = ReplyDao.getInstance().selectAll();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {width: 60%; margin-left: 20%;}
	h2 {color: #29367c}
	#post {width: 100%; height: 500px;
	border-top: 2px solid #3b4890; position: relative;}
	#head {border-bottom: 1px solid gainsboro; padding: 10px 0 5px 10px;}
	#sub {font-size: 13px; display: inline-block;}
	#con {padding: 10px;}
	table {width: 100%; text-align: center;}
	th {border-bottom: 1px solid #3b4890; border-top: 2px solid #3b4890;}
	tr {border: 1px solid black;}
	/* td {border-bottom: 1px solid gainsboro;} */
	a {text-decoration: none; color: black;}
	#rec {border: 1px solid gainsboro; width: 300px;
	height: 100px; text-align: center; position: absolute;
	bottom: 50px; left: 35%;}
	input[type=button] {margin-top: 20px; border-radius: 100px; width: 50px;
	height: 50px; border: none; color: white; cursor: pointer;}
	input[value=추천] {background: #3b4890;}
	input[value=비추] {background: gray;}
	input[type=text],input[type=password] {height: 30px;}
	input[type=text] {margin-bottom: 5px;}
	input[type=submit] {background: #3b4890; color: white; width: 85px; height: 30px;
	border: none; cursor: pointer; border-radius: 2px;}
	#comment {border-top: 2px solid #3b4890; padding: 10px;}
	#np {display: inline-block;}
	#np input {width: 120px;}
	.left {text-align: left;}
	#reply {border-bottom: 2px solid #3b4890;}
	#text {padding: 10px;}
	#text div:last-child {clear: both;}
	#ta {float: right;}
	textarea {width: 950px; height: 100px;}
	#nick {width: 150px;}
	button {width: 82px; height: 35px; background: #3b4890; color: white;
	border: 1px solid #29367c; border-bottom-width: 3px; margin-top: 10px;
	margin-bottom: 40px; font-weight: bold; border-radius: 2px;
	cursor: pointer;}
	#idea {margin-left: 10px; background: white; color: #3b4890;}
	.right {float: right;}
	#edit,#delete {background: #666; border-color: #444;}
	#delete {margin: 10px;}
</style>
</head>
<body>
	<header>
		<h1>Minami.com</h1>
	</header>
	<section>
		<h2>테스트 갤러리</h2>
		<div id=post>
			<div id=head>
				<b><%=post.getTitle() %></b><br>
				<p id=sub><a href=#><%=post.getWriter() %></a>&nbsp;&nbsp;|&nbsp;&nbsp;<%=post.getDate() %></p>
				<p class="right">조회 <%=post.getHits() %> | 추천 <%=post.getRecommend() %> | 댓글 2
			</div>
			<div id=con><%=post.getContent() %></div>
			<div id=rec>
				<%=post.getRecommend() %> <input type=button value=추천>
				<input type=button value=비추> 0
			</div>
		</div>
		<div id=reply>
			<p>전체 댓글
			<div id=comment>
				<%
					for (Reply r : replies) {
						if (r.getPost_idx() == idx) {
							%>
							<div id=table>
								<table>
									<tr>
										<td class=left id=nick><%=r.getNickname() %>
										<td class=left><%=r.getContents() %>
										<td class=right><%=r.getDate() %>
									</tr>
								</table>
							</div>
							<%
						}
					}
				%>
				<div id=text>
					<form action="result.jsp" method=post>
						<div id=np>
							<input type="hidden" name=idx value=<%=idx%>>
							<input type=text placeholder=닉네임 name=nickname><br>
							<input type=password placeholder=비밀번호 name=pw>
						</div>
						<div id=ta>
							<textarea name=text></textarea>
						</div>
						<div align=right><input type=submit value=등록></div>
					</form>
				</div>
			</div>
		</div>
		<button>전체글</button><button id=idea>개념글</button>
		<button class=right onclick="location.href='write.jsp'">글쓰기</button>
		<button class=right id=delete>삭제</button>
		<button class=right id=edit>수정</button>
		<table>
			<tr>
				<th width=50px>번호
				<th>제목
				<th width=50px>글쓴이
				<th width=100px>작성일
				<th width=50px>조회
				<th width=50px>추천
			</tr>
		<%
			for(Post p : list) {
				%><tr>
					<td><%=p.getIdx() %>
					<td class=left><a href="result.jsp?idx=<%=p.getIdx() %>"><%=p.getTitle() %></a>
					<td><%=p.getWriter() %>
					<td><%=p.getDate().substring(11,16) %>
					<td><%=p.getHits() %>
					<td><%=p.getRecommend() %><%
			}
		%>
		</table>
	</section>
</body>
</html>
