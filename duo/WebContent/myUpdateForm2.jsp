<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="mybatis.model.*" %>
<%String user =(String)session.getAttribute("userId");
    if(user == null)
    {    	
    	response.sendRedirect("/duo/DuoControl?cmd=main-page");
    }
     
    Member member =(Member)request.getAttribute("left_box");  
    
    
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
<link href="/duo/com_member/css/membership.css" rel="stylesheet" type="text/css" />
<link href="/duo/common/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/duo/common/js/jquery-1.11.0.min.js"></script>
<script language="javascript" type="text/javascript" src="/duo/common/isValidType.js"></script>
<script language="javascript" type="text/javascript" src="/duo/com_member/common/isValidType.js"></script>
<script language="javascript" type="text/javascript" src="/duo/common/flashshow.js"></script>
<script type="text/javascript" src="/duo/common/js/include_ex_script.js"></script>
<script src="/duo/common/js/jquery.bxslider.min.js"></script>
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
// function check_edit_first()
// {
// 	var formnm = document.EMTForm;

// 	if (formnm.u_pwd.value == "" || formnm.u_pwd.value == "비밀번호")
// 	{
// 		alert("비밀번호를 입력해 주세요.");
// 		formnm.u_pwd.focus();
// 		return;
// 	}

// // 	if (formnm.u_pwd_verify.value == "" || formnm.u_pwd_verify.value == "비밀번호 확인")
// // 	{
// // 		alert("비밀번호 한번 더 입력해 주세요.");
// // 		formnm.u_pwd_verify.focus();
// // 		return;
// // 	}

// // 	if (formnm.u_pwd.value != formnm.u_pwd_verify.value)
// // 	{
// // 		alert("입력하신 비밀번호가 서로 같지 않습니다.");
// // 		formnm.u_pwd_verify.focus();
// // 		return;	
// // 	}
	
// 	if(!CheckPassWord(formnm.u_id,formnm.u_pwd,formnm.u_pwd_verify))
// 	{
// 		return;
// 	}


// 	$.ajax({
// 		url:"/com_member/inc_member_info_edit_check.asp",
// 		type:"post",
// 		data:"u_id=" + formnm.u_id.value + "&u_pwd=" + formnm.u_pwd.value,
// 		success:function(data){
// 			$("body").append(data);
// 			return;
// 		},
// 		error:function(data){
// 			alert("정상적으로 처리되지 않았습니다.\n " + data);
// 			return;
// 		}
// 	});
// }

function check_edit_second()
{
	var formnm = document.EMTForm;

	if(!isValidType(formnm.u_email, 'email', '이메일 주소를 입력하여 주세요.' )){ return; }
				
	//if(!isValidType(formnm.u_solo, 'check', '솔로/커플 여부를 선택하여 주세요.' )){ return; }

	//if(!isValidType(formnm.u_zip, 'text', '우편번호를 검색해주세요.' )){ return; }
	//if(!isValidType(formnm.u_addr1, 'text', '주소를 입력하여 주세요.' )){ return; }
	//if(!isValidType(formnm.u_addr2, 'text', '상세주소를 입력하여 주세요.' )){ return; }

	
	if(!isValidType(formnm.u_married, 'select', '결혼 경력을 선택하여 주세요.' )){ return; }
	if(!isValidType(formnm.u_edu, 'select', '학력을 선택하여 주세요.' )){ return; }
	if(!isValidType(formnm.u_work, 'select', '직업 종류를 선택하여 주세요.' )){ return; }
	
	if(!isValidType(formnm.u_dwell, 'select', '주거주지역을 선택하여 주세요.' )){ return; }
			
	formnm.action = '/com_member/member_info_edit_proc.asp';
	//formnm.target = "iframe_content";
	formnm.submit();
}

function withdraw_submit()
{
	document.wdForm.submit();
}

$(document).ready(function(){
	$("#u_pwd").focus(function(){
		if ($("#u_pwd").attr("type") == "text")
		{
			$("#u_pwd").val("");
			$("#u_pwd").attr("type","password");
			$(".pwcheck").eq(0).slideDown(300);
		}
	});

	$("#u_pwd").blur(function(){
		if ($("#u_pwd").val()=="" || $("#u_pwd").val()=="비밀번호")
		{
			$("#u_pwd").attr("type","text");
			$("#u_pwd").val("비밀번호");
			$(".pwcheck").eq(0).slideUp(300);
		}		
	});

	$("#u_pwd_verify").focus(function(){
		if ($("#u_pwd_verify").attr("type") == "text")
		{
			$("#u_pwd_verify").val("");
			$("#u_pwd_verify").attr("type","password");
			$(".pwcheck").eq(1).slideDown(300);
		}
	});

	$("#u_pwd_verify").blur(function(){
		if ($("#u_pwd_verify").val()=="" || $("#u_pwd_verify").val()=="비밀번호 확인")
		{
			$("#u_pwd_verify").attr("type","text");
			$("#u_pwd_verify").val("비밀번호 확인");
			$(".pwcheck").eq(1).slideUp(300);
		}		
	});
});



</script>
</head>
<style>
 #table1 {
    width: 60%;
    border: 1px solid #444444;
    border-collapse: collapse;
    margin-left: 150px;
  }
/*   div#listname{ */
/* 	font-size:20pt; */
/* 	color:hotpink; */
/* } */
  
/*   table { */
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
/* 	background-color: #FFD9EC; */
/* } */

/* tbody tr:nth-child(2n+1) { */
/* 	background-color: #FFEBFE; */
/* } */

/* .setDiv { */
/* /* 	padding-top: 100px; */ */
/* 	text-align: center; */
/* } */

/* .mask { */
/* 	position: absolute; */
/* 	left: 0; */
/* 	top: 0; */
/* 	z-index: 9999; */
/* 	background-color: #000; */
/* 	display: none; */
/* } */

/* .window { */
/* 	display: none; */
/* 	background-color: #ffffff; */
/* 	height: 350px; */
/* 	width: 500px; */
/* 	z-index: 99999; */
/* } */

/* #detailclose{ */
/* float:right; */
/* } */

</style>
<body>
<jsp:include page="/header.jsp" flush="true" />
	<!--상단영역-->
	<div id="membermain">
		<div style="width:100%; min-width:1120px; height:1000px; background:#ffffff center top no-repeat;">
		
		<div style="display:block; margin:0 auto; width:1120px; height:1120px; position:relative;">
			<!--왼쪽-->
	<%if(user!=null){ %>
<jsp:include page="/left_box.jsp" flush="true" />
<%} %>
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
			
			<div id="run_result" style="display:none;"></div>
<form name="wdForm" method="post" action="/com_member/withdraw_step_01.asp">
<%-- <input type="hidden" name="u_id" value="<%=user %>" /> --%>
<input type="hidden" name="site" value="duo" />
</form>
<div style="width:100%;">

	<div id="content">
		<div style="margin:0 auto; width:554px; overflow:hidden;">
 			<span class="top-web" id="top"> 
					<span class="modify mimg"></span>
<!-- 				<span class="st-1">듀오 패밀리 사이트 (듀오, 듀오웨드, 듀오리매리, 텐웨딩홀)는<br /><span>하나의 아이디로 통합 관리 됩니다.</span></span> -->
 			</span> 
			<div class="box-wrapper">
				<form name="EMTForm" method="post" >
				<input type="hidden" name="u_id" value="<%=user %>" />
				<input type="hidden" name="site" value="duo" />
				<!-- 2009-05-14 이벤트용
				<input type="hidden" name="o_mtel1" value="016">
				<input type="hidden" name="o_mtel2" value="1726">
				<input type="hidden" name="o_mtel3" value="5057">
				<!-- 2009-05-14 이벤트용 끝
				<input type="hidden" name="o_email" value="pe046v@naver.com"-->
				<table cellspacing="0" cellpadding="0" summary="회원정보 수정 폼입니다." class="e-step-3">
					<caption>회원정보 수정 폼</caption>
					<tbody>
						<tr>
							<td class="info-1">
								아이디&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c9c9c9;">:</span>&nbsp;&nbsp;&nbsp;&nbsp;<%=user %>
							</td>
						</tr>
					
						<tr>
							<td>
								<input type="text" placeholder="비밀번호" title="비밀번호" value="비밀번호" class="ip_pw" id="u_pwd" name="u_pwd" maxlength="15" onKeyup="checkPassword2()" />
								<input type="hidden" name="pwdCheckFlag" id="pwdCheckFlag" value="N" />
								<span id="pwdCheck" name="pwdcheck"style="display:none;" class="pwcheck">영문/숫자/특수문자 조합으로 8자 이상 15자 이하 , 사용가능 특수문자 : ~!@#$%^&amp;*()-+=</span>
							</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td> -->
<!-- 								<input type="text" placeholder="비밀번호 확인" title="비밀번호 확인" value="비밀번호 확인" class="ip_pw" id="u_pwd_verify" name="u_pwd_verify" maxlength="15"/> -->
<!-- 								<span class="pwcheck" style="display:none;">영문/숫자/특수문자 조합으로 8자 이상 15자 이하, 사용가능 특수문자 : ~!@#$%^&amp;*()-+=</span> -->
<!-- 							</td> -->
<!-- 						</tr> -->
						<tr>
							<td class="info-2">
								이름&nbsp;&nbsp;<span style="color:#c9c9c9;">:</span>&nbsp;&nbsp;<%=member.getmName() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								출생년월일&nbsp;&nbsp;<span style="color:#c9c9c9;">:</span>&nbsp;&nbsp;<%=member.getmBirth() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								성별&nbsp;&nbsp;<span style="color:#c9c9c9;">:</span>&nbsp;&nbsp;<%=member.getmGender() %>
							</td>
						</tr>
						<tr>
							<td>
								<span class="hp-info">
									핸드폰&nbsp;&nbsp;<span style="color:#c9c9c9;">:</span>&nbsp;&nbsp;&nbsp;&nbsp;010-4748-9912&nbsp;&nbsp;&nbsp;&nbsp;
								</span>
								<input type="text" placeholder="이메일" title="이메일" value="kjm831@naver.com" class="ip_email" name="u_email"/>
							</td>
						</tr>
						<tr>
							<td>
								프로필 사진 
							</td>
						</tr>
						<tr>
							<td>
								<input type="file" accept=".gif, .jpg, .png" placeholder="프로필용 사진" title="프로필" value="프로필" class="ip_pic" name="u_pic" id="u_pic" />
							</td>
						</tr>
						
						<!--<tr>
							<td>
								<span class="hp-info">
									핸드폰&nbsp;&nbsp;<span style="color:#c9c9c9;">:</span>&nbsp;&nbsp;&nbsp;&nbsp;010-4748-9912&nbsp;&nbsp;&nbsp;&nbsp;
								</span>
								<span class="ipsend">
									<label><input type="checkbox" title="SMS 수신거부" name="u_sms" value="1"  />&nbsp;SMS 수신거부</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" placeholder="이메일" title="이메일" value="kjm831@naver.com" class="ip_email" name="u_email"/>
								<span class="ipsend" >
									<label><input type="checkbox" title="듀오소식지 수신거부" name="u_refuse" value="1" />&nbsp;듀오소식지 수신거부</label>
								</span>								
							</td>
						</tr>-->
						<tr>
							<td style="padding-bottom:35px;">
								
								<!--듀오, 듀오리매리 노출항목-->
								<select class="ip_duo" title="결혼경력" name="u_married">
									<option value="">결혼경력</option>
									<option value="미혼">미혼</option>
                                    <option value="재혼" >재혼</option>
								</select>
									<select class="ip_duo" title="학력" name="u_edu">
									<option value="">학력</option>
									<option value="고등학교 졸업">고등학교 졸업</option>
									<option value="전문대 졸업">전문대졸업</option>
									<option value="대학교 졸업">대학교졸업</option>
									<option value="대학원 이상">대학원재학</option>
									<option value="기타">기타</option>

								</select>
								<select class="ip_birth" title="직업종류" name="u_work">
									<option value="">직업종류</option>
									<option value="무관">무관</option>
									<option value="사무직 금융직">사무직,금융직</option>
									<option value="기술,의료,언론">기술,의료,언론</option>
									<option value="교사,공무원,강사,공사">교사,공무원,강사,공사</option>
									<option value="자영업,사업,특수직">자영업,사업,특수직</option>
									<option value="예능계,프리랜서,서비스">예능계,프리랜서,서비스</option>
									<option value="유학생,학생,석/박사">유학생,학생,석/박사</option>
									<option value="전문직">전문직</option>
									<option value="기타">기타</option>
									</select>
								
								
								<!--듀오웨드 텐웨딩홀 노출항목-->
								

								<select class="ip_area" title="연봉선택" name="u_dwell">
									<option value="">연봉선택</option>
									<option value="2500이하">2500이하</option>
									<option value="2500~3000">2500~3000</option>
									<option value="3000~4000">3000~4000</option>
									<option value="4000~5000">4000~5000</option>
									<option value="5000이상">5000이상</option>
								</select>
							</td>
						</tr>
						
						
						<!--추가2016-07-11-->
<!-- 						<tr> -->
<!-- 							<td style="padding:0; border:0; border-top:1px solid #d8d8da; padding-top:35px; padding-bottom:0; color:#252525; font-size:14px; font-weight:bold;">고객 서비스 수신신청</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td style="padding:10px 0 0; color:#252525; font-size:14px;">듀오 결혼 or 웨딩 서비스에 대한 안내를 받으시겠습니까?</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td style="padding:10px 0 0; color:#252525; font-size:14px;"> -->
<!-- 								<label><input type="checkbox" title="SMS" name="u_sms_refuse" value="Y"  />&nbsp;SMS</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 								<label><input type="checkbox" title="Email" name="u_email_refuse" value="Y" checked/>&nbsp;Email</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 								<label><input type="checkbox" title="전화" name="u_mtel_refuse" value="Y" checked/>&nbsp;전화</label> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td style="padding:10px 0 5px; color:#aeaeae; font-size:12px;">서비스 안내에 대한 수신동의와 상관없이 주요 공지사항, ID/PW 찾기 등에 대한 내용은 발송됩니다. </td> -->
<!-- 						</tr> -->
						<!--추가2016-07-11-->


						
						<!--추가2016-06-09 듀오, 리매리 노출 항목-->
<!-- 						<tr> -->
<!-- 							<td class="ip_agree-3" style="border:0; padding:0;"> -->
<!-- 								<div class="ip_duo_check" style="padding:10px 0;"><label><input type="checkbox" title="듀오에서 진행중인 각종 미팅파티 공연/경품 이벤트 안내를 이메일 또는 휴대폰 문자로 수신 동의" name="u_agree_event" value="Y" class="agree_chk" checked/>&nbsp;듀오에서 진행중인 각종 미팅파티 공연/경품 이벤트 안내를 이메일 또는 휴대폰 문자로 수신 동의</label></div> -->
<!-- 							</td> -->
<!-- 						</tr> -->
						<!--추가2016-06-09 듀오, 리매리 노출 항목-->
						
						<tr>
							<td class="notice-1">ID/PW 분실 등 본인 여부 확인이 필요할 경우를 위해 주민등록상의 이름, 생년을 입력해 주세요.<br />이름, 생년, 성별 정보는 가입 이후에 수정하실 수 없습니다.</td>
						</tr>
						<tr>
							<td class="info-3">
								<span style="font-size:14px; color:#000000; line-height:25px;" class="box">
									<span style="font-weight:bold;">온라인 회원가입일</span> : 2017년 9월 26일
									
									<br />
									<!--<span style="font-weight:bold;">최종 개인정보수정일</span> <span style="font-size:11px; color:#606060;">(고객서비스 수신신청 등록일)</span> : 년 월 일
									-->
								</span>
								<span style="margin-top:15px; color:#777676; font-size:12px; line-height:20px;" class="box">
									<span style="font-size:14px;">고객 서비스 수신신청 상태를 다시 한번 확인해 주세요.<br />개인정보 변경일은 고객서비스 수신신청 확인일과 동일하게 처리됩니다.</span>
								</span>
							</td>
						</tr>
						<tr>
							<td class="td_submit" align="center">
								<span>
									<a onclick="check_edit_first();" style="cursor:pointer;"><img src="/duo/common/img/btn_06.png" /></a>
									<a onclick="withdraw_submit()" style="cursor:pointer;" class="secession">온라인 회원탈퇴 ▶</a>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>
<!-- 	<div id="footer"> -->
<!-- 	<div style="margin:0 auto; width:554px; padding:40px 0; overflow:hidden;"> -->
<!-- 		<span class="menu"> -->
<!-- 			<a href="/com_member/privacy_01.asp?site=duo">이용약관</a><span class="line">|</span> -->
<!-- 			<a href="/com_member/privacy_02.asp?site=duo">개인정보처리방침</a><span class="line">|</span> -->
<!-- 			<a href="#" onclick="window.open('https://www.duo.co.kr/html/common/notice_content.asp?no=579','message','width=650,height=421');return false;" onkeypress="this.onclick()">손해배상청구절차</a> -->
<!-- 		</span> -->
<!-- 		<span class="st-footer-1"> -->
<!-- 			<br />서울 강남구 강남대로 406 (역삼동 820-9 글라스타워) 11,12,16층 (06134)<br />듀오정보(주) / 대표자:박수경 / 사업자등록번호 : 214-86-28824<br /> -->
<!-- 			통신판매업신고 : 강남 - 3259호 <a href="#">[사업자등록확인]</a> -->
<!-- 		</span> -->
<!-- 		<span class="st-footer-1" style="padding-top:7px;">copyright 1995~2017 @<span style="color:#ff433c;">duoinfo</span> corp. all right reserved.</span> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- 2014-10-29 | google ga start -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-55116372-1', 'auto');
  ga('send', 'pageview');

</script>
<!-- 2014-10-29 google ga end -->


</div>
<!-- 				<h3 class="txt1">결제내역<span class="hide">듀오 회원을 소개합니다.</span></h3> 원래는 h3	 -->
				
<!-- 				<div id='outcome' overflow-y:scroll> -->

<!-- <br/><br/><br/><br/><div id='listname'>결제내역</div> -->
 
<!--  <br/><br/><br/> -->
<!-- <table border='1' id='table1'> -->

<!-- <tr id='firsttr'> -->
<!-- <th>아 이 디 </th> -->
<!-- <th>성     명</th> -->
<!-- <th>등     급</th> -->
<!-- <th>결제일자</th> -->
<!-- <th>상     태</th> -->
<!-- </tr> -->

<!-- <tr> -->
<!-- <td></td> -->
<!-- <td></td> -->
<!-- <td></td> -->
<!-- <td></td> -->
<!-- <td></td> -->
<!-- </tr> -->
<!-- </table> -->

</div>			
<!-- 				<div style="display:block; float:left; margin:0 0 65px 0; width:918px; height:265px; position:relative;"> -->
<!-- 					<h3 class="txt2"><span class="hide">듀오회원 인터뷰<br />DUO PHOTO INTERVIEW </span><a href="/duo/member/photo_interview.asp">바로가기</a></h3> -->
<!-- 					<div style="display:block; float:left; width:918px; overflow:hidden;position:relative;"> -->
<!-- 						<div style="display:block; float:left; width:306px; height:265px;"> -->
<!-- 							<ul class="slider_left"> -->
<!-- 								<li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7044.jpg" /></a></li> -->
<!-- 								<li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7017.jpg" /></a></li> -->
<!-- 								<li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7020.jpg" /></a></li> -->
<!-- 								<li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7022.jpg" /></a></li> -->
<!-- 								<li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7026.jpg" /></a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						<div style="display:block; float:right; width:306px; height:265px;"> -->
<!-- 							<ul class="slider_right"> -->
<!-- 								<li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7017.jpg" /></a></li> -->
<!-- 								<li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7020.jpg" /></a></li> -->
<!-- 								<li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7022.jpg" /></a></li> -->
<!-- 								<li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7026.jpg" /></a></li> -->
<!-- 								<li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7028.jpg" /></a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 							<a id="prev" style="cursor:pointer; display:block; position:absolute; bottom:0; left:569px; width:43px; height:43px; background:url(/duo/member/img/prev_01.jpg) left top no-repeat; font-size:0; z-index:2;"></a> -->
<!-- 							<a id="next" onClick="next_slider()" style="cursor:pointer; display:block; position:absolute; bottom:0; left:612px; width:43px; height:43px; background:url(/duo/member/img/next_01.jpg) left top no-repeat; font-size:0; z-index:2;"></a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<h3 class="txt3">회원 체험후기</h3> -->
<!-- 				<ul class="customer_voice"> -->
<!-- 					<li style="float:left;"> -->
<!-- 						<a href="/duo/member/customer_voice.asp" class="first"> -->
<!-- 						<div style="display:block; width:100%; height:159px;"> -->
<!-- 						<div class="temp"> -->
<!-- 							<span class="txt1">듀오를 선택하길 잘했다는 생각이<br />들었습니다.</span> -->
<!-- 							<span class="txt2" style="color:#ff3da0;">김미나 여성회원</span> -->
<!-- 						</div> -->
<!-- 						</div> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li style="float:right;"> -->
<!-- 						<a href="/duo/member/customer_voice.asp" class="second"> -->
<!-- 						<div style="display:block; width:100%; height:159px;"> -->
<!-- 						<div class="temp"> -->
<!-- 							<span class="txt1">이제 그 사랑스러운 분과 결혼을<br />눈앞에 두고 있습니다.</span> -->
<!-- 							<span class="txt2" style="color:#91b952;">이성훈&김보경 성혼커플</span> -->
<!-- 						</div> -->
<!-- 						</div> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li style="float:left;"> -->
<!-- 						<a href="/duo/member/customer_voice.asp" class="third"> -->
<!-- 						<div style="display:block; width:100%; height:159px;"> -->
<!-- 						<div class="temp"> -->
<!-- 							<span class="txt1">대한민국 선남선녀들을 인연으로<br />만드는 창구가 되길 바랍니다.</span> -->
<!-- 							<span class="txt2" style="color:#91b952;">박민재&이채민 성혼커플</span> -->
<!-- 						</div> -->
<!-- 						</div> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li style="float:right;"> -->
<!-- 						<a href="/duo/member/customer_voice.asp" class="fourth"> -->
<!-- 						<div style="display:block; width:100%; height:159px;"> -->
<!-- 						<div class="temp"> -->
<!-- 							<span class="txt1">항상 상냥하게 응대해 주시는<br />매니저님 덕분에 힘이 많이 되었습니다.</span> -->
<!-- 							<span class="txt2" style="color:#5286d6;">남지석 남성회원</span> -->
<!-- 						</div> -->
<!-- 						</div> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 				<a href="/duo/member/customer_voice.asp" class="detail">+더보기</a> -->
			</div>
		</div>
		</div>
		
		<a href="/duo/member/matching_main.asp" class="matching"></a>

<!-- 		<div style="width:100%; min-width:1120px; height:487px; background:#ffffff;"> -->
<!-- 		<div style="display:block; margin:0 auto; width:1120px; height:487px;"> -->
<!-- 			<div class="content_box type2"> -->
<!-- 				<h3>듀오에는 어떤 회원들이 있을까요?</h3> -->
<!-- 				<span>3만 4천 여명의 신뢰할 수 있는 회원수</span> -->
<!-- 				<div style="display:block; float:left; width:918px; height:328px;"> -->
<!-- 					<div class="fade_item"><a href="/duo/member/data_marry.asp"><img src="/duo/member/img/main_06.jpg" /></a></div> -->
<!-- 					<div class="fade_item" style="display:none;"><a href="/duo/member/data_marry.asp"><img src="/duo/member/img/main_07.jpg" /></a></div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		</div> -->

		<a href="/duo/member/member_search01.asp" class="search">
<!-- 		<div style="display:block; margin:0 auto; width:1120px; height:229px;"> -->
<!-- 			<div class="content_box type3"> -->
<!-- 				<div style="display:block; width:100%; height:229px;"> -->
<!-- 				<div style="display:table-cell; height:229px; vertical-align:middle;"> -->
<!-- 					<span class="txt1">결혼회원검색 </span> -->
<!-- 					<span class="txt2">만나고 싶은 상대의 조건을 검색하세요.</span> -->
<!-- 				</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		</a>
	
	<!--내용영역-->
	<!--하단영역-->
	<jsp:include page="/footer.jsp" flush="true" />
</div>
<jsp:include page="/fixRight.jsp" flush="true" />

</body>
</html>