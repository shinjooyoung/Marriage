<%@page import="command.CommandList"%>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="mybatis.model.*"%>
 <%@ page import="mybatis.model.HeartAndMember"%>
 <%@ page import="mybatis.session.*" %>   
<%@ page import="java.util.*" %>


<%

String user =(String)session.getAttribute("userId");
List <HeartAndMember> OutList =null;

List <HeartAndMember> InList =null;
if(user == null)
{    	
	response.sendRedirect("/duo/DuoControl?cmd=main-page");
}else{
OutList = (List <HeartAndMember>)request.getAttribute("paramOut");

InList = (List <HeartAndMember>)request.getAttribute("paramIn");
}
%>

<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html xmlns='http://www.w3.org/1999/xhtml'>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>
<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
<meta name="naver-site-verification" content="9fab0a0cdc321d5be40004ead9b3f0cf4837c8d0"/>
<meta name='Subject' content='결혼정보회사 듀오 - 한국대표결혼정보회사'>
<meta name='Title' content='결혼정보회사 듀오 - 한국대표결혼정보회사, 초혼, 재혼, 만혼, 노블레스, 결혼정보회사'>
<meta name='Keywords' content='결혼정보회사, 결혼정보, 결혼, 결혼해듀오, 듀오,결혼정보업체, 듀오 결혼'>s
<meta name='Description' content='결혼정보회사,초혼,재혼,노블레스결혼,무료 이상형찾기,맞선,중매,만남주선,미팅파티,베테랑 커플매니저,깊이있는 무료상담,믿을수있는 듀오,100%신원인증,가입비정찰제,고객만족우선,환불규정준수,2012 소비자가 뽑은 가장 신뢰하는 브랜드대상'>
<title>듀오-한국대표결혼정보회사</title><link href="/duo/common/css/common.css" rel="stylesheet" type="text/css" />
<link href="/duo/common/css/sub_layout.css" rel="stylesheet" type="text/css" />
<link href="/duo/common/css/sub_top_20151002.css" rel="stylesheet" type="text/css" />

<link href="/duo/common/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/duo/common/js/jquery-1.11.0.min.js"></script>
<script language="javascript" type="text/javascript" src="/duo/common/isValidType.js"></script>
<script language="javascript" type="text/javascript" src="/duo/common/flashshow.js"></script>
<script type="text/javascript" src="/duo/common/js/include_ex_script.js"></script>
<script src="/duo/common/js/jquery.bxslider.min.js"></script>
<style>
.bnt { display: none; }
.wid{width:200pt;}
</style>    
<style>
#okno{

margin-top:13pt;
height:20pt;

}

.choice:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}

#detail{
height:350px;
background-color: #CEE3F6;
margin-top: 20px;
border-bottom-left-radius: 16px;
border-bottom-right-radius: 16px;
}

#detailInfo {
	float:left;
	margin-top:15px;
	margin-left:15px;
	font-style : bold;
	font-size: 20pt;
	color: #369;
}

#profile{
float:left;
margin-left: 50px;
font-size: 10pt;
font-weight: bold;
hight:100pt;
}


.window {
	display: none;
	background-color: #ffffff;
	height: 395px;
	width: 500px;
	z-index: 99999;
	border :5px solid #1f326a;
	border-radius: 20px;
}

#detailclose{
float:right;
margin-right:10px;
margin-top: 10px;
}

#detailclose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}

</style>

<script>
//member fade

function m_fade_auto()
{
	//alert($(".fade_item").eq(0).is(":visible"))
	if ($(".fade_item").eq(0).is(":visible"))
	{
		$(".fade_item").eq(0).fadeOut(500,function(){
			$(".fade_item").eq(1).fadeIn(500);
		});
	}
	else
	{
		$(".fade_item").eq(1).fadeOut(500,function(){
			$(".fade_item").eq(0).fadeIn(500);
		});
	}
}
$(document).ready(function(){
	$(".left_radio").click(function(){
		var now_position = $(".left_radio").index(this);

		$(".left_radio").removeClass("radio_off");
		$(".left_radio").removeClass("radio_on");
		$(".left_radio").addClass("radio_off");

		$(".left_radio").eq(now_position).removeClass("radio_off");
		$(".left_radio").eq(now_position).addClass("radio_on");
	});


	$(".slider").bxSlider({
        auto:true,
        minSlides:3,
        maxSlides:3,
        moveSlides:1,
        slideWidth:306,
        slideMargin:0,
		autoHover:true,
        pager:false
    });
	
	setInterval("m_fade_auto()",2500);	
});
function open_free_service_popup()
{
	window.open('/duo/service/free_service_popup.asp', 'iframe_scroll','width=745, height=527,scrollbars=no,toolbar=no,menubar=no,resizable=no');
}

// $(function() {

	
// 	$('#showdetail').click(function(){

// 		window.open("detailForm.jsp","","width=550, height=500");
// 	});
// })


 function wrapWindowByMask(){
        // 화면의 높이와 너비를 변수로 만듭니다.
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
 
        
        // 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
        $('.mask').css({'width':maskWidth,'height':maskHeight});
 
        // fade 애니메이션 : 1초 동안 검게 됐다가 80%의 불투명으로 변합니다.
        $('.mask').fadeIn(1000);
        $('.mask').fadeTo("slow",0.6);
 
        // 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
        var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
        var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 2 );
 
        // css 스타일을 변경합니다.
        $('.window').css({'left':left,'top':top, 'position':'absolute'});
      
        // 레이어 팝업을 띄웁니다.
        $('.window').show();
        //window.open("detailForm.jsp","","width=550, height=500");
    }
    

    $(document).ready(function(){
        // showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
      
        $('.showMask').click(function(e){
            // preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
            var id =$(this).parent().prev().text();
            var inout=$(this).next().val();
            var stat=$(this).next().next().val();
            var hNo=$(this).next().next().next().val();
            $.ajax({         
             type: "post",
          	 url: "/duo/ListControl?cmd=detail",
             dataType : "json",
       	     data: "detail="+id, // 보낼 파라미터값 입력     
           error: function (err) {
             alert('error:' + err );
                     // 통신에 에러가 있을경우 처리할 내용(생략가능)
          },
          success: function (data) { 	         	  
        	 var realPath= data.member.img;
         	 $("#photo").attr("src","/duo/upload/"+realPath);
        	  $('#name').val(data.member.name);     
        	  $('#age').val(data.member.age);
        	  $('#job').val(data.member.job);
        	  $('#edu').val(data.member.edu);
        	  $('#sal').val(data.member.sal);
        	  $('#tel').val(data.member.tel);
        	  $('.heartNo').val(hNo);
        	  $('.send').val(data.member.id);
        
        	  if(inout=='in')
        	  {
        		  if(stat=='대기중')
        		  {
        			  $("#del").addClass("bnt");
            		  $("#exit").addClass("bnt");
            		  $("#ok").removeClass("bnt");
            		  $("#no").removeClass("bnt");
        			       			  
        		  }
        		  else{
        			  
        			  $("#del").addClass("bnt");
        			  $("#ok").addClass("bnt");
            		  $("#no").addClass("bnt");
        			  $("#exit").removeClass("bnt");
        			  $("#exit").addClass("wid");
        		  }
        		
        	  }
        	  else{
        		  
        		  if(stat=='대기중')
        		  {
        			  $("#ok").addClass("bnt");
            		  $("#no").addClass("bnt");
            		  $("#del").removeClass("bnt");
            		  $("#exit").removeClass("bnt");     			       			  
        		  }else
        		  {
        			  $("#del").addClass("bnt");
        			  $("#ok").addClass("bnt");
            		  $("#no").addClass("bnt");
        			  $("#exit").removeClass("bnt");
        			  $("#exit").addClass("wid");
        			  
        		  }
        		  
        		  
        	  }       	  
        	  e.preventDefault();
              wrapWindowByMask();
          }
        });
        
        });
 
        // 닫기(close)를 눌렀을 때 작동합니다.
        $('.window .close').click(function (e) {
            e.preventDefault();
            $('.mask, .window').hide();
        });
 
        // 뒤 검은 마스크를 클릭시에도 모두 제거하도록 처리합니다.
        $('.mask').click(function () {
            $(this).hide();
            $('.window').hide();
        });
        
        $('#ok').click(function(){
        	
        	var selhno =$(this).next().val();
        	var send=$(this).next().next().val();
        	var hStat= $(this).prev().val();        	
        	var fr= document.fr;
        	
        	$.ajax({         
                type: "post",
             	 url: "/duo/ListControl?cmd=sure",
                dataType :"text",
          	     data:{'selhno':selhno,'hStat':hStat,'send':send}, // 보낼 파라미터값 입력     
              error: function (err) {
                alert('error:' + err );
                        // 통신에 에러가 있을경우 처리할 내용(생략가능)
             },
             success: function (data) { 	         	  
           			alert("수락 되었습니다.");
                 $('.mask, .window').hide();
           			fr.submit();           		  
           	  }       	  
             
           });        	
        });
  		 $('#no').click(function(){
        	
        	var selhno =$(this).next().val();
        	var send=$(this).next().next().val();
        	var hStat= $(this).prev().val();        	
        	var fr= document.fr;
        	$.ajax({         
                type: "post",
             	 url: "/duo/ListControl?cmd=sure",
                dataType :"text",
          	     data:{'selhno':selhno,'hStat':hStat,'send':send}, // 보낼 파라미터값 입력     
              error: function (err) {
                alert('error:' + err );
                        // 통신에 에러가 있을경우 처리할 내용(생략가능)
             },
             success: function (data) { 	         	  
           			alert("거절 되었습니다.");
                 $('.mask, .window').hide();
           			fr.submit();           		  
           	  }       	  
             
           });        	
        });
  		$("#del").click(function(){
  			var selhno =$(this).next().val();
  			var fr= document.fr;
        	$.ajax({         
                type: "post",
             	 url: "/duo/ListControl?cmd=cancel",
                dataType :"text",
          	     data:{'selhno':selhno}, // 보낼 파라미터값 입력     
              error: function (err) {
                alert('error:' + err );
                        // 통신에 에러가 있을경우 처리할 내용(생략가능)
             },
             success: function (data) { 	         	  
           			alert("취소 되었습니다.");
                 $('.mask, .window').hide();
           			fr.submit();           		  
           	  }       	  
             
           });        	
  			
  			
  		});
        
    });
    
    
    
  

</script>
</head>
<style>

.heartlist1, .heartlist2 { 
 	width: 800px; 
 	border: 1px solid #444444; 
 	border-collapse: collapse; 
 	margin-left: 0px; 
 	margin-top: 0px; 
 }

div#listname {
	font-size: 20pt;
	color: #369;
}

/* table { */
/* 	width: 100%; */
/* 	border-top: 1px solid #444444; */
/* 	border-collapse: collapse; */
/* } */

/* th, td { */
/* 	border-bottom: 1px solid #444444; */
/* 	padding: 10px; */
/* 	text-align: center; */
/* } */

/* #firsttr { */
/* 	background-color: #F361A6; */
/* 	color: #ffffff; */
/* } */

/* tbody tr:nth-child(2n) { */
/* 	background-color: #E9E4FF; */
/* } */

/* tbody tr:nth-child(2n+1) { */
/* 	background-color: #D7D2FF; */
/* } */


table.heartlist1, table.heartlist2{
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
   border: 1px solid #ccc;
}

table.heartlist1 td {
    padding: 10px;
    font-weight: bold;
    font-size: 16px;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.heartlist2 td {
    width: 350px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}





.setDiv {
/* 	padding-top: 100px; */
	text-align: center;
}

.mask {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 9999;
	background-color: #000;
	display: none;
}

.window {
	display: none;
	background-color: #ffffff;
	height: 330px;
	width: 500px;
	z-index: 99999;
}

#detailclose{
float:right;
}

#outlist{
margin-top:0px;
width:817px;
height:150px;
}

#inlist{


width:817px;
height:150px;
}

.heartlist1 td:nth-of-type(1) { width: 25%; }
.heartlist1 td:nth-of-type(2) { width: 25%; }
.heartlist1 td:nth-of-type(3) { width: 25%; }
.heartlist1 td:nth-of-type(4) { width: 25%; }

.heartlist2 td:nth-of-type(1) { width: 25%; }
.heartlist2 td:nth-of-type(2) { width: 25%; }
.heartlist2 td:nth-of-type(3) { width: 25%; }
.heartlist2 td:nth-of-type(4) { width: 25%; }

#my{
height:100px;
}

#photo{
width:100pt;
height:110pt;

}

#pic{
margin-top: 10px;

}


</style>
<style>

.first{
width:110pt;
}

.second{
width:110pt;
}


#ok{
width:110pt;
}

#no{
width:110pt;
}

#photo{
width:100pt;
height:110pt;
}

#profile{
float:left;
margin-left: 50px;
font-size: 10pt;
font-weight: bold;
}

#okno{
margin-bottom: 1px;

}

#detail{
background-color: #CEE3F6;
}



</style>

<body>
<jsp:include page="/header.jsp" flush="true" />
	<!--상단영역-->
	<div id="membermain">
	
		<div style="width:100%; min-width:1120px; height:1000px; background:#ffffff center top no-repeat;">
		<div class="setDiv">
   
    <div class="mask"></div>
    <div class="window">
        <input id='detailclose' type="button" href="#" class="close" value="Close"/><br/><br/>
		<div id='detail'>

<h1>상세 프로필</h1>

    
    
<% 
// List <HeartAndMember> OutList = (List <HeartAndMember>)request.getAttribute("param");
// List <Member> mList = (List <Member>)request.getAttribute("param");  
// String id = request.getParameter("aId");
%>  
<div id='profile'>
이 름 : <input type="text" id="name" value="1" /><br/><br/>
나 이 : <input type="text" id="age"  value="2" /><br/><br/>
직 업 : <input type="text" id="job"  value="3" /><br/><br/>
학 력 : <input type="text" id="edu"  value="4" /><br/><br/>
연 봉 : <input type="text" id="sal"  value="5" /><br/><br/>
번 호 : <input type="text" id="tel"  value="6" /><br/><br/>
<br/><br/><br/>
</div>


<div id='pic'>
<img alt="이미지" src="/duo/mypage/member_7020.jpg" id='photo'>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><hr/><div id='okno'><br/><br/>
<form id ='fr' name="fr" action='/duo/ListControl'>
<input type="hidden" name ='cmd' id='cmd' value='showHeart'/>
<input type='button' class="first choice" id='del' value='신청취소' />
<input type="hidden" class="heartNo" value=""/>
<input type='button' class ="second close choice"id='exit' value='나가기'/>

<!-- 받은내역  -->
<input type="hidden" value="수락"/>
<input class="choice" type='button' class="first" id='ok' value='수락' />
<input type="hidden" class="heartNo" value=""/><input type="hidden" class="send" value=""/>

<input type="hidden"  value="거절"/>
<input class="choice" type='button' class="second" id='no' value='거절' />
<input type="hidden" class="heartNo" value=""/><input type="hidden" class="send" value=""/>
</form>
</div>

</div>		
    </div>
</div>		
		<div  style="display:block; margin:0 auto; width:1120px; height:1120px; position:relative;">
			<!--왼쪽-->
			<%if(user!=null){ 
			%>
			<jsp:include page="/left_box.jsp" flush="true" />
			<%} %>
			<!--왼쪽-->
<script>
$(document).ready(function(){
	var slider1 = $('.slider_left').bxSlider({
        auto:true,
		infiniteLoop:true,
        minSlides:1,
        maxSlides:1,
        moveSlides:1,
        slideWidth:306,
        slideMargin:0,
        pager:false,
		controls:false
	});
	var slider2 = $('.slider_right').bxSlider({
        auto:true,
		infiniteLoop:true,
        minSlides:1,
        maxSlides:1,
        moveSlides:1,
        slideWidth:306,
        slideMargin:0,
        pager:false,
		controls:false
	});
// 	slider1.startAuto();
// 	slider2.startAuto();

    $('#next').click(function () {
        slider1.goToNextSlide();
        slider2.goToNextSlide();
    });

    $('#prev').click(function () {
        slider1.goToPrevSlide();
        slider2.goToPrevSlide();
    });
});
</script>

<div class="content_box type1">

<!-- 				<h3 class="txt1"><span class="hide">듀오 회원을 소개합니다.</span></h3> 원래는 h3	 -->
				
<!-- 				<div id='outcome' overflow-y:scroll> -->
 <br/><br/><br/><br/><div id='listname'>신청내역</div>
 <br/><br/><br/><br/>
<!-- <div id='outlist' style=overflow-y:scroll> -->

                                        

<table border = '1'  class="heartlist1">
<tr  class="heartlist">
<td>아 이 디 </td>
<td id="namename" >성     명</td>
<td>나     이</td>
<td>결     과</td>
</tr>
</table>

<div id='outlist' style=overflow-y:scroll>

<table border = '1' visibility="hidden" class="heartlist2">
 
<!--    for(HeartAndMember List : OutList){ -->

<%
if(user!=null){
for(int i=0;i<OutList.size();i++){ %>
 <tr>		
<td><%=OutList.get(i).gethReceiveid()%></td>
<td><a style="cursor:pointer" class="showMask"><%=OutList.get(i).getmName()%></a>
<input type="hidden" value="out"/><input type="hidden" value="<%=OutList.get(i).gethStat() %>"/><input type="hidden" value='<%=OutList.get(i).gethNO()%>'/></td> 
 <td><%=OutList.get(i).getmBirth() %></td>
<td><%=OutList.get(i).gethStat() %></td> 
 	</tr>
<%} }%>
 </table>
</div>	
<br/><br/><br/><br/>
 <br/><br/><br/><br/>
 <div id='listname'>대기중 </div>
  <br/><br/>                                         
<table border = '1' id='table1' class="heartlist1" >
<tr id='firsttr'>
<td>아 이 디 </td>
<td>성     명</td>
<td>나     이</td>
<td>결     과</td>
</tr>
</table>
<div id='inlist' style=overflow-y:scroll>
<table border = '1' id="listTable"  visibility="hidden" class="heartlist2" >

<%for(HeartAndMember List : InList){ 
if(List.gethStat().equals("대기중")){%>
<tr>		
<td><%=List.gethSendid() %></td>
<td><a style="cursor:pointer" class="showMask"><%=List.getmName()%></a>
<input type="hidden" value="in"/><input type="hidden" value="<%=List.gethStat() %>"/><input type="hidden" value='<%=List.gethNO()%>'/></td>
<td><%=List.getmBirth() %></td>
<td><%=List.gethStat() %></td>
	</tr>
<%}} %>
</table>
</div>
 <br/><br/><br/><br/>
 <br/><br/><br/><br/>
 
 <div id='listname'>받은내역</div>
  <br/><br/>                                         
<table border = '1' id='table1' class="heartlist1" >
<tr id='firsttr'>
<td>아 이 디 </td>
<td>성     명</td>
<td>나     이</td>
<td>결     과</td>
</tr>
</table>
<div id='inlist' style=overflow-y:scroll>
<table border = '1' id="listTable"  visibility="hidden" class="heartlist2" >

<%for(HeartAndMember List : InList){ if(!(List.gethStat().equals("대기중"))){ %>
<tr>		
<td><%=List.gethSendid() %></td>
<td><a style="cursor:pointer" class="showMask"><%=List.getmName()%></a>
<input type="hidden" value="in"/><input type="hidden" value="<%=List.gethStat() %>"/><input type="hidden" value='<%=List.gethNO()%>'/></td>
<td><%=List.getmBirth() %></td>
<td><%=List.gethStat() %></td>
	</tr>
<%}} %>
</table>
</div>


	<!--내용영역-->
	<!--하단영역-->
	</div>
</div>
<jsp:include page="/footer.jsp" flush="true" />

<jsp:include page="/fixRight.jsp" flush="true" />
</body>
</html>