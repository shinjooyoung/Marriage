<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.model.Member"%>   
    
     <% 
// 	// 이전화면에서 넘겨온 값
	String detailage = (String)request.getAttribute("age");
	String detailsal = (String)request.getAttribute("sal");
	String detailedu = (String)request.getAttribute("edu");
	String detailjob = (String)request.getAttribute("job");
	String dgender =(String)request.getAttribute("gender");
	String age = request.getParameter("age");
	String sal = request.getParameter("sal");
	String edu = request.getParameter("edu");
	String job = request.getParameter("job");
	String gender =request.getParameter("gender");
	
	//db검색 값
	
	List<Member> list = (List<Member>)request.getAttribute("list");
	


%>

<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html xmlns='http://www.w3.org/1999/xhtml'>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>
<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
<meta name="naver-site-verification" content="9fab0a0cdc321d5be40004ead9b3f0cf4837c8d0"/>
<meta name='Subject' content='결혼정보회사 듀오 - 한국대표결혼정보회사'>
<meta name='Title' content='결혼정보회사 듀오 - 한국대표결혼정보회사, 초혼, 재혼, 만혼, 노블레스, 결혼정보회사'>
<meta name='Keywords' content='결혼정보회사, 결혼정보, 결혼, 결혼해듀오, 듀오,결혼정보업체, 듀오 결혼'>
<meta name='Description' content='결혼정보회사,초혼,재혼,노블레스결혼,무료 이상형찾기,맞선,중매,만남주선,미팅파티,베테랑 커플매니저,깊이있는 무료상담,믿을수있는 듀오,100%신원인증,가입비정찰제,고객만족우선,환불규정준수,2012 소비자가 뽑은 가장 신뢰하는 브랜드대상'>
<title>듀오-한국대표결혼정보회사</title><link href="/duo/common/css/common.css" rel="stylesheet" type="text/css" />
<link href="/duo/common/css/sub_layout.css" rel="stylesheet" type="text/css" />
<link href="/duo/common/css/sub_top_20151002.css" rel="stylesheet" type="text/css" />

<link href="/duo/common/css/member.css" rel="stylesheet" type="text/css" />
<link href="/duo/common/css/module.css" rel="stylesheet" type="text/css" />




<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript" src="/duo/common/js/jquery-1.11.0.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script language="javascript" type="text/javascript" src="/duo/common/isValidType.js"></script>
<script language="javascript" type="text/javascript" src="/duo/common/flashshow.js"></script>
<script type="text/javascript" src="/duo/common/js/include_ex_script.js"></script>
</head>

<body>
<%! String mPic = "";
	String mName = "";
	String mBirth = "";
	String mJob = "";
	String mEdu = "";
	String mRemarry="";

%>
<%-- <%for(int i =0; i < list.size(); i++){
	mName = list.get(i).getmName();
	
	
}
%> --%>

<%-- 	<% for(int i =0; i<list.size(); i++){
  			
  				mName = list.get(i).getmName();
  				mBirth = list.get(i).getmBirth();
  				mEdu = list.get(i).getmEdu();
  				mJob = list.get(i).getmJob();
  				mRemarry = list.get(i).getmRemarry();
  			
  			
  			%> --%>
<jsp:include page="/header.jsp" flush="true" />
	<!--상단영역-->

	<!--배경영역-->
<!-- 	<link href="/duo/common/css/sub_201611.css" rel="stylesheet" type="text/css" /> -->
<div id="visual-box" class="height_100">
<div class="box member">
	<div class="subtitle">
	<span class="cell">
		<span>DUO MEMBER</span>
		<h2>이성 찾기</h2>
	</span>
	<a href="#" class="tel">무료상담전화 1577-8333</a>
	</div>
</div>
</div>
	<!--배경영역-->	

	<!--내용영역-->
	<div id="subcontentArea" style="overflow:visible;">
		<h2>본문영역</h2>
		<!--왼쪽-->
		
<div style="width:160px;height:150px;float:left;" class="side_space left_side">
	<div style="position:relative;width:100%;height:100px;">
		<div id="left-box">
			<div class="fix-box">
				<span class="menu">
<!-- 					<span class="st-1"><a href="/duo/member/main.asp">회원검색</a></span> -->
					<ul>
<!-- 						<li class="on"><a href="/duo/member/photo_interview.asp">듀오회원인터뷰</a></li> -->
<!-- 						<li ><a href="/duo/member/member_search01.asp">결혼회원검색</a></li> -->
<!-- 						<li ><a href="/duo/member/matching_main.asp">이상형찾기</a></li> -->
<!-- 						<li ><a href="/duo/member/data_marry.asp">듀오회원현황</a></li> -->
<!-- 						<li><a href="/duo/member/customer_voice.asp">회원체험후기</a></li> -->
					</ul>
				</span>
<!-- 				<a class="simulation" href="/duo/service/simulation.asp">회원가입 시뮬레이션</a> -->
<!-- <a class="freeconsult" href="/duo/service/profile.asp">희망상대 무료추천</a> -->
<form class="freeservice">
	<span class="sub-box">
<!-- 		<span class="st-1">안내자료<br>무료 서비스</span> -->
<!-- 		<span style="display:block; float:left; width:120px; padding:10px 20px;"> -->
<!-- 			<span class="left_radio radio_off">초혼</span> -->
<!-- 			<span class="left_radio radio_off">재혼</span> -->
<!-- 		</span> -->
<!-- 		<a href="/duo/membership/marriage_guide.asp" class="submit">신청하기</a> -->
	</span>
</form>
<script type="text/javascript">
$(".left_radio").click(function(){
	var now_position = $(".left_radio").index(this);

	$(".left_radio").removeClass("radio_off");
	$(".left_radio").removeClass("radio_on");
	$(".left_radio").addClass("radio_off");

	$(".left_radio").eq(now_position).removeClass("radio_off");
	$(".left_radio").eq(now_position).addClass("radio_on");
});

$(document).ready(function(){
	var age;
	var sal;
	var edu;
	var job;
	var gender = $("#gender").val();
	$("#detailBtn").click(function(){
		
		var f=document.f;
		if($("input:checkbox[name=choice]:checked").length==0)
		{
			alert("선택된 값이 없습니다.");
			return;
		}
		else
		{			
			var values=document.getElementsByName("choice");
			
			
			for(var i=0;i<values.length;i++)
			{
				if(values[i].checked){
					
					if(i==0)
					{
						age=values[i].value;
					}
					if(i==1)
					{
						sal=values[i].value;
					}
					if(i==2)
					{
						edu=values[i].value;
					}
					if(i==3)
					{
						job=values[i].value;
					}
				}else
				{
					if(i==0)
					{
						age=null;
						alert(age);
					}
					if(i==1)
					{
						sal=null;
					}
					if(i==2)
					{
						edu=null;
					}
					if(i==3)
					{
						job=null;
					}
				}
			}
			
			$.ajax({			
				   type: "post",
		    url: "/duo/search?cmd=search3",
		   dataType : "json",
		   data: {'age':age,'sal':sal,'edu':edu,'job':job,'gender':gender}, // 보낼 파라미터값 입력	  
		   error: function (err) {
			   alert('error:' + err );
				        // 통신에 에러가 있을경우 처리할 내용(생략가능g)
			},
			success: function (data) {
				        // 통신이 정상적으로 완료되면 처리할 내용
				
				        
				        var year = new Date().getFullYear();
				      
				      
				      	var ah=$("#ah");
				    	var tr =  $("<tr/>")   												
						var td_1 = $('<td/>');
						var tlabel = $("<label/>");
						
					
						ah.empty();
				       for (var i = 0; i < data.member.length; i++) {
				    	
			
						var pic = data.member[i].pic;
						var id = data.member[i].id;
						var name =data.member[i].name;
					 
						var age =data.member[i].age;
						
						age = age.substring(0, 4);
						age=Number(age);
						age=year-age+1;
						
						var edu=data.member[i].edu;
						var job =data.member[i].job;
						var remarry =data.member[i].remarry;											
						
						var contents ='';
						contents+='<span class="photo_box f-left"><img src="/duo/upload/'+pic+'" class="img-thumbnail"/></span>'
							+'<span class="info_box f-right">'+'<span class="info_txt">'+'<table id="input" width="100%" border="0" cellspacing="0" cellpadding="0">';
						contents +='<tr><td class="st-4"><span style="font-size:30px;">'+name+'</td></tr>';
						contents+='<tr><td class="st-3"><span style="font-size:20px;">나이:'+age+'</span></td>';
						contents+='<tr><td class="st-3"><span style="font-size:20px;">학력:'+edu+'</td></tr>';
						contents+='<tr><td class="st-3"><span style="font-size:20px;">직업:'+job+'</td></tr>';
						contents+='<tr><td class="st-3"><span style="font-size:20px;">초혼:'+remarry+'</td></tr>';			  
					    contents+='</table></span><span style="display:block; float:left; width:379px;"><a href="/duo/search?cmd=sendHeart" class="propose" style="margin-left:250px">프로포즈</a>'
							+'</span></span>';
					        ah.append(contents);
				
					}
				       
			}
				 
		});
			
// 			
// 			var act='/duo/search?cmd=search2&age='+age+'&sal='+sal+'&edu='+edu+'&job='+job;
// 			f.action=act;
// 			f.submit();

		}
	
	});
	
	
	
});

</script><div class="network">

</div>
			</div>
		</div>
	</div>
</div>
		<!--왼쪽-->


		<div id="photoWrap" style="margin:0 58px 20px 48px;">
			<h3>포토인터뷰 본문영역</h3>
			<div style="float:left; width:918px;">
				<form method="post" name='f' action="/duo/search">
				<input type='hidden' name='cmd' value='search2'/>
				<input id='gender' type='hidden' name ='gender' value="<%=gender %>"></input>
				<table style="width:900px; hight:30px; margin-top:10px; padding:20px;">
				<tr>
					<td style="padding:10px;"><label style ="font-size:20px"><%=detailage%>~<%=Integer.parseInt(detailage)+4 %>
					<input type = "checkbox"checked="checked" class ="detailage"name="choice" value='<%=age%>'/>
					<input type = "hidden" class ="detailage"name="age" value='<%=age%>'/></label></td> 
					<td>&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;</td>
					<td style="padding:10px;"><label style ="font-size:20px"><%=detailsal%>
					<input type = "checkbox"checked="checked" class ="detailsal"name="choice" value='<%=sal%>'/>
					<input type = "hidden" class ="detailsal"name="sal" value='<%=sal%>'/></label></td> 
					<td>&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;</td>
					<td style="padding:10px;"><label style ="font-size:20px"><%=detailedu%>
					<input type = "checkbox"checked="checked" class ="detailedu"name="choice" value='<%=edu%>'/>
					<input type = "hidden" class ="detailedu"name="edu" value='<%=edu%>'/></label></td> 
					<td>&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;</td>
					<td style="padding:10px;"><label style ="font-size:20px"><%=detailjob%>
					<input type = "checkbox"checked="checked" class ="detailjob"name="choice" value='<%=job%>'/>
					<input type = "hidden" class ="detailjob"name="job" value='<%=job%>'/></label></td> 
					<td>&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;</td>
					<td style="padding:10px;"><input type ="button" id="detailBtn" class="btn btn-default" value="검색"/></td>
				</tr>
				</table>
				</form>
				<ul class="memberlist">
				
				<%	if(list==null){
				for(int i = 0; i<list.size(); i++){ %>
					<li class="blue">
						<span class="photo_box f-left"><img src="/duo/img/na.jpg" class="img-thumbnail"/></span>
						<span class="info_box f-right">
							<span class="info_txt">
							<table id='input' width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="st-4"><span style="font-size:30px;"><%=list.get(i).getmName()%></td>
								</tr>
								<tr>
									<td class="st-3"><span style="font-size:20px;"><%=list.get(i).getmBirth().substring(2,4)%>년생</span></td>
								<tr>
									<td class="st-3"><span style="font-size:20px;">학력: <%=list.get(i).getmEdu()%></td>
								</tr>
								<tr>
									<td class="st-3"><span style="font-size:20px;">직업: <%=list.get(i).getmJob()%></td>
								</tr>
								<tr>
									<td class="st-3"><span style="font-size:20px;">초혼: <%=list.get(i).getmRemarry()%></td>
								</tr>
							</table>
							</span>
							<span style="display:block; float:left; width:379px;">
							
								<!-- <span class="line"></span> -->
								<a href="/duo/member/member_propose.asp?idx=7057" class="propose" style="margin-left:250px">프로포즈</a>
							</span>
						</span>
					</li>
				
					<%}} // list for문 %>
							<li id ='ah' class="blue">
						
					</li>
					
				</ul>
			</div>
		</div>
	</div>
	<!--내용영역-->
	<!--하단영역-->
	
<jsp:include page="/footer.jsp" flush="true" />

<jsp:include page="/fixRight.jsp" flush="true" />
</body>

</html>