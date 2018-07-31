<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String projectName = "/duo"; %>   
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
<link href="/duo/com_member/css/modify.css" rel="stylesheet" type="text/css" />
<link href="/duo/common/css/membership.css" rel="stylesheet" type="text/css" />
<link href="/duo/common/css/module.css" rel="stylesheet" type="text/css" />
<link href="/duo/common/css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/duo/common/js/jquery-1.11.0.min.js"></script>
<script language="javascript" type="text/javascript" src="/duo/common/isValidType.js"></script>
<script language="javascript" type="text/javascript" src="/duo/common/flashshow.js"></script>
<script type="text/javascript" src="/duo/common/js/include_ex_script.js"></script>

<script type="text/javascript">
function check_submit(){
	var formnm = document.transform;

	if (formnm.mId.value == "" || formnm.mId.value == "아이디")
	{
		alert("아이디를 입력하여 주세요.");
		formnm.mId.focus();
		return;
	}

	if (formnm.mPass.value == "" || formnm.mPass.value == "비밀번호")
	{
		alert("비밀번호를 입력하여 주세요.");
		formnm.mPass.focus();
		return;
	}

	if(!isValidType(formnm.mId, 'text', '아이디를 입력하여 주세요.' )){ return; }
	if(!isValidType(formnm.mPass, 'text', '비밀번호를 입력하여 주세요.' )){ return; }

	displayError('login_error','... 비밀번호 확인 중 ...');
	
	var uid = $('#u_id').val().toLowerCase();
	var upw = $('#u_pwd').val().toLowerCase();
	
	uid = uid.trim();
 	upw = upw.trim();
	
	$.ajax({
		type: 'POST',
		url: '/duo/ValControl?cmd=check_modify',
		data: {
			"u_id": uid,
			"u_pw": upw
		},
		async: false,
        cache: false,
		success: function(data){
			if (data.trim() == "OK") {
				alert("로그인성공!");
				formnm.action ="DuoControl?cmd=confirm_login";
				$('#submitForm').submit();
			} else if (data.trim() == 'NO' ){
				var error_msg = '아이디, 비밀번호를 다시 확인해 주세요';
				displayError('login_error',error_msg);				
			} else {
				alert('예기치 못한 오류가 발생하였습니다. 잠시 후 다시 이용해주세요.');
			}
		},
		dataType: "text"
	});
	function displayError(id, text)
	{
		var prev_msg = $('#' + id).html();
		
			$('#' + id).addClass('err_msg').html(text);
		
	}
	
	
// 	formnm.action ="DuoControl?cmd=confirm_login";
// 	formnm.submit();
}

$(document).ready(function(){
	$("#u_pwd").focus(function(){
		if($("#u_pwd").attr("type") == "text")
		{
			$("#u_pwd").val("");
			$("#u_pwd").attr("type","password");
		}
		else
		{
			if($("#u_pwd").val() == "")
			{
				$("#u_pwd").attr("type","text");
				$("#u_pwd").val("비밀번호");
				$("#pwdCheck").slideUp(300);
			}
		}
	});

	$("#u_pwd").blur(function(){	
		if($("#u_pwd").val() == "" || $("#u_pwd").val() == "비밀번호")
		{
			$("#u_pwd").attr("type","text");
			$("#u_pwd").val("비밀번호");
			$("#pwdCheck").slideUp(300);
		}
	});
});
</script>
</head>

<body>
<jsp:include page="/header.jsp" flush="true" />
	<!--상단영역-->
	<div id="login">
		<div style="margin:0 auto; width:544px; padding-top:70px; overflow:hidden;">
			<span class="st-1">로그인</span>
			<div class="box-wrapper">
				<form id="submitForm" name="transform" method="post" >
				<input type="hidden" name="ret_url" value=""><!-- 리턴페이지 -->
				<input type="hidden" name="n_type" value=""><!-- 지사코드 -->
				<input type="hidden" name="evt_no" value=""> <!-- 이벤트항목 -->
				<input type="hidden" name="evt_stype" value=""><!-- 이벤트항목 -->
				<input type="hidden" name="u_div" value=""> <!-- 2008-11-18 추천회원 로그인 추이 확인용 -->
				<table border="0" cellspacing="0" cellpadding="0" summary="로그인 폼입니다.">
					<caption>로그인 폼</caption>
					<tbody>
						<tr>
							<td colspan="3"><input id="u_id" type="text" placeholder="아이디" title="아이디" value="아이디" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;" style="width:534px;" name="mId" maxlength="10" /></td>
						</tr>
						<tr>
							<td colspan="3"><input id="u_pwd" type="text" placeholder="비밀번호" title="비밀번호" value="비밀번호"  style="width:534px;" name="mPass" maxlength="15" id="u_pwd" /></td>
						</tr>
						<tr>
							<td colspan="3" style="font-family:Dotum, 돋움; font-size:12px; color:#ed1f46; line-height:18px;">
							<span id = 'login_error'></span><span class="pw_wrong"></span>
							</div>
							</td>
						</tr>
						<tr>
							<td colspan="3"><a onclick="check_submit();" style="cursor:pointer;"><img src="/duo/membership/img/login_02.gif" /></a></td>
						</tr>
						<tr>
							<td colspan="3" height="10"></td>
						</tr>
						<tr>
							<td width="33.33%" align="center" style="padding:0; font-size:14px; color:#656565;"><a href="/com_member/member_id_find.asp?site=duo">ID / PW 찾기</a></td>
							<td width="33.33%" align="center" style="padding:0; border-left:1px solid #dddddd; border-right:1px solid #dddddd; font-size:14px; color:#656565;"><a href="/com_member/member_join.asp?site=duo">간편회원가입</a></td>
							<td width="33.33%" align="center" style="padding:0; font-size:14px; color:#656565;"><a href="/">듀오 홈으로</a></td>
						</tr>
						<tr>
							<td colspan="3" height="70"></td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
			<div class="why_con">
				<img src="/html/membership/img/login_03.jpg" />
				
				<a href="/html/service/know.asp?lac=3"><img src="/html/membership/img/login_04.jpg" /></a>				
				<a href="/html/service/know.asp?lac=4"><img src="/html/membership/img/login_05.jpg" /></a>

				<a href="/html/service/know.asp?lac=1"><img src="/html/membership/img/login_06.jpg" /></a>
				<a href="/html/service/know.asp?lac=1"><span style="display:block; float:left; width:544px; background-image:url(/html/membership/img/login_07.jpg);">
					<span style="display:block; margin:0 auto; width:477px; height:136px;">
					<span class="num">
						<span class="st-2">회원수</span>
						<span class="st-3"><span style="font-weight:bold;">31,469</span>명</span>
						<span class="st-4">(2017년 10월 9일 기준)</span>
					</span>
					<span class="line"></span>
					<span class="num">
						<span class="st-2">성혼회원수</span>
						<span class="st-3"><span style="font-weight:bold;">35,918</span>명</span>
						<span class="st-4">(2017년 10월 9일 기준)</span>
					</span>
					</span>
				</span></a>
				<a href="/html/service/know.asp?lac=1"><img src="/html/membership/img/login_08.jpg" /></a>
				<img src="/html/membership/img/login_09.jpg" style="display:block; float:left; width:544px;" usemap="#Map" border="0" />
				<map name="Map" id="Map">
					<area shape="rect" coords="3,4,273,424" href="/html/duo_couple/couple_assay_main.asp" />
					<area shape="rect" coords="275,5,539,425" href="/html/company/company_prize_view.asp?CP_No=60" />
				</map>
			</div>
		</div>
	</div>
	
	<div id="footer">
		<div style="margin:0 auto; width:544px; padding:40px 0; overflow:hidden;">
			<span class="menu">
				<a href="/com_member/privacy_01.asp?site=duo">이용약관</a><span class="line">|</span>
				<a href="/com_member/privacy_02.asp?site=duo">개인정보처리방침</a><span class="line">|</span>
				<a href="#" onclick="window.open('/html/common/notice_content.asp?no=579','message','width=650,height=421');return false;" onkeypress="this.onclick()">손해배상청구절차</a>
			</span>
			<span class="st-footer-1">
				<br />서울 강남구 강남대로 406 (역삼동 820-9 글라스타워) 11,12,16층 (06134)<br />듀오정보(주) / 대표자:박수경 / 사업자등록번호 : 214-86-28824<br />
				통신판매업신고 : 강남 - 3259호 <a href="http://www.ftc.go.kr/info/bizinfo/communicationList.jsp">[사업자등록확인]</a>
			</span>
			<span class="st-footer-1" style="padding-top:7px;">copyright 1995~2017 @<span style="color:#ff433c;">duoinfo</span> corp. all right reserved.</span>
		</div>
	</div>
</div>
</body>
</html>