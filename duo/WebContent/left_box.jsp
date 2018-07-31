<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="mybatis.model.*" %>
   <%    
   Member member =(Member)request.getAttribute("left_box");  %>
    <link href="/duo/com_member/css/left_box.css" rel="stylesheet" type="text/css" />
<div class="left_box">
				<span class="menu">
<!-- 					<span class="st-1"><a href="/duo/member/main.asp">회원검색</a></span> -->
					<ul>
						<li><a href="/duo/ListControl?cmd=showHeart">하트내역 보기  <img src="/duo/mypage/like.png" width=15px; height=15px; alt="" align="center"/></a></li>
						<li><a href="/duo/ListControl?cmd=showPay">결제내역 보기  <img src="/duo/mypage/cash.png" width=15px; height=15px; alt="" align="center"/></a></li>
						<li><a href="/duo/ModifyControl?cmd=mypage_modify">회원정보 수정  <img src="/duo/mypage/rotate.png" width=15px; height=15px; alt="" align="center"/></a></li>
<!-- 						<li><a href="/duo/member/data_marry.asp">사용X</a></li> -->
<!-- 						<li><a href="/duo/member/customer_voice.asp">사용X</a></li> -->
					</ul>
				</span>
<!-- 				<a class="simulation" href="/duo/service/simulation.asp">회원가입 시뮬레이션</a> -->
<!-- 				<a class="freeconsult" href="/duo/service/profile.asp">희망상대 무료추천</a> -->
				<span class = 'my'><img src="/duo/upload/<%=member.getmPic()%>" width=100px height=144px></img>
							<table><tr><td>하트 :<%=member.getmHeart() %></td></tr><tr><td>클래스 :<%=member.getmRank()%> </td></tr></table>
										
					
				</span>
	
<!-- 				<form class="freeservice"> -->
<!-- 					<span class="box"> -->
<!-- <!-- 						<span class="st-1">안내자료<br>무료 서비스</span> --> 
<!-- <!-- 						<span style="display:block; float:left; width:120px; padding:10px 20px;"> -->
<!-- <!-- 							<span class="left_radio radio_off">초혼</span> --> 
<!-- <!-- 							<span class="left_radio radio_off">재혼</span> --> 
<!-- <!-- 						</span> -->
<!-- <!-- 						<a href="/duo/membership/marriage_guide.asp" class="submit">신청하기</a> --> 
<!-- 					</span> -->
<!-- 				</form> -->
<!-- 			<div class="network"> -->
<!-- 	<span class="st-1" style="margin:23px 0 0 0;">DUO NETWORK</span> -->
<!-- 	<span class="st-1" style="margin:0 0 13px 0; color:#a4a4a4;">가까운 곳에 듀오가 있습니다</span> -->
<!-- 	<ul class="jisa"> -->
<!-- 		<li class="jisa01"><a target="_blank" href="/duo/jisa/jisa_main.asp?n_type=01"></a></li> -->
<!-- 		<li class="jisa11"><a target="_blank" href="/duo/jisa/jisa_main.asp?n_type=11"></a></li> -->
<!-- 		<li class="jisa10"><a target="_blank" href="/duo/jisa/jisa_main.asp?n_type=10"></a></li>								 -->
<!-- 		<li class="jisa35"><a target="_blank" href="/duo/jisa/jisa_main.asp?n_type=35"></a></li> -->
<!-- 		<li class="jisa30"><a target="_blank" href="/duo/jisa/jisa_main.asp?n_type=30"></a></li> -->
<!-- 		<li class="jisa51"><a target="_blank" href="/duo/jisa/jisa_main.asp?n_type=51"></a></li> -->
<!-- 		<li class="jisa31"><a target="_blank" href="/duo/jisa/jisa_main.asp?n_type=31"></a></li> -->
<!-- 		<li class="jisa20"><a target="_blank" href="/duo/jisa/jisa_main.asp?n_type=20"></a></li> -->
<!-- 		<li class="jisa12"><a target="_blank" href="/duo/jisa/jisa_main.asp?n_type=12"></a></li> -->
<!-- 		<li class="jisa40"><a target="_blank" href="/duo/jisa/jisa_main.asp?n_type=40"></a></li> -->
<!-- 		<li class="jisa50"><a target="_blank" href="/duo/jisa/jisa_main.asp?n_type=50"></a></li> -->
<!-- 		<li class="jisa75"><a target="_blank" href="/duo/jisa/jisa_main.asp?n_type=75"></a></li> -->
<!-- 		<li class="jisa70"><a target="_blank" href="/duo/jisa/jisa_main.asp?n_type=70"></a></li> -->
<!-- 	</ul> -->
<!-- </div> -->
			</div>
			<!--왼쪽-->