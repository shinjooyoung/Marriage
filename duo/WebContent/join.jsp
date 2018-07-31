<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html xmlns='http://www.w3.org/1999/xhtml'>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>
<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
<title>듀오 회원가입</title>

<link rel="stylesheet" type="text/css" href="/duo/com_member/css/membership.css" />
<script type="text/javascript" src="/duo/common/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/duo/com_member/common/isValidType.js"></script>
<link href="/duo/common/css/sub_top_20151002.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
var tcounter;
var t1;
var auth_cnt = 0;
var agree_cnt = 4;
var set_num;

function check_join()
{
	var formnm = document.JTForm;
 	var tmp = formnm.u_id.value;

	if(formnm.idCheckFlag.value == "N"){
		alert("아이디가 중복되었거나 입력이 제대로 되지 않았습니다.");
		formnm.u_id.focus();
		return;
	}	
	
	if(formnm.pwdCheckFlag.value == "N"){
		alert("비밀번호 입력이 제대로 되지 않았습니다.");
		formnm.u_pwd.value="";
		formnm.u_pwd.focus();
		return;
	}

	if(formnm.u_name.value == "이름"){alert("이름을 입력해 주세요."); formnm.u_name.focus();}
	if(!isValidType(formnm.u_name, 'text', '이름을 입력하여 주세요.' )){ return; }

	if(checkstring(formnm.u_name.value) == true){alert("이름입력에 특수문자는 입력할수 없습니다."); return;}
	if(!check_input_byte(formnm.u_name.value,10)){alert("입력 할 수 있는 문자길이를 초과하였습니다."); return;}

	if(!isValidType(formnm.u_birth1, 'select', '생년을 선택하여 주세요.' )){ return; }
	if(!isValidType(formnm.u_birth2, 'select', '생월을 선택하여 주세요.' )){ return; }
	if(!isValidType(formnm.u_birth3, 'select', '생일을 선택하여 주세요.' )){ return; }
	if(!isValidType(formnm.u_sex, 'check', '성별을 선택하여 주세요.' )){ return; }

	//if(!isValidType(formnm.u_mtel1, 'select', '핸드폰 앞자리를 선택하여 주세요.' )){ return; }
	//if(!isValidType(formnm.u_mtel2, 'number', '핸드폰 중간자리를 입력하여 주세요.' )){ return; }
	//if(!isValidType(formnm.u_mtel3, 'number', '핸드폰 끝자리를 입력하여 주세요.' )){ return; }

// 	if(formnm.dmt_code.value == ""){
// 		alert("휴대폰 인증이 되지 않았습니다. 휴대폰 인증 버튼을 눌러 인증을 시도하세요.");
// 		return;
// 	}
	
// 	//이메일주소 도메인 선택방식
// 	if(checkEmail(formnm.u_email,formnm.u_email_domain,formnm.u_email_domain_select) == false){ return; }
	
// 	var u_email_full;
// 	var u_email_check;

// 	u_email_check = true;
// 	u_email_full = formnm.u_email.value + "@" + formnm.u_email_domain.value;
	
// 	$.ajax({
// 		url:"/com_member/inc_member_email_check.asp",
// 		type:"post",
// 		data:"u_email=" + encodeURIComponent(u_email_full),
// 		async:false,
// 		success:function(data){
// 			if (data != "")
// 			{
// 				$("body").append(data);
// 				u_email_check = false;
// 			}
// 		},
// 		error:function(data){
// 			alert("이메일 주소를 확인하시고 다시 시도해 주세요." + data);
// 			return;
// 		}
// 	});	

// 	if (u_email_check == false){return;}
	
	
	if(!isValidType(formnm.u_married, 'select', '결혼 경력을 선택하여 주세요.' )){ return; }
	if(!isValidType(formnm.u_edu, 'select', '학력을 선택하여 주세요.' )){ return; }
	if(!isValidType(formnm.u_work, 'select', '직업 종류를 선택하여 주세요.' )){ return; }
	

	if(!isValidType(formnm.u_dwell, 'select', '연봉을 선택하여 주세요.' )){ return; }

// 	var str_pwd;
// 	//var str_mtel2,str_mtel3;
// 	//var str_tel2,str_tel3;
// 	var str_email;

// 	str_pwd = formnm.u_pwd.value;
// 	//str_mtel2 = formnm.u_mtel2.value;
// 	//str_mtel3 = formnm.u_mtel3.value;

// 	str_email = formnm.u_email.value;

// 	$.ajax({
// 		url:"/com_member/inc_member_input_check.asp",
// 		type:"post",
// 		data:"dmt_code=" + $("#dmt_code").val() + "&u_pwd=" + str_pwd + "&u_email=" + str_email,
// 		success:function(data){
// 			if (data != "")
// 			{
// 				$("body").append(data);
// 			}
// 		},
// 		error:function(data){
// 			alert("오류가 발생하였습니다. 다시 시도해 주세요." + data);
// 			return;
// 		}
// 	});


	if($("#u_pic").val()=="")
	{
		alert("프로필 사진을 선택해주세요");
		
		return;
	}

	if(!agree_member_check('join_agree_all','join_agree1','join_agree2','join_agree3')){return;}

	ga("send","event","PC회원가입","버튼클릭","회원가입");

 	formnm.submit();
}

function change_auth_code()
{
	var max_num;
	var auth_img;

	max_num = 5
	set_num = (Math.floor((Math.random()* max_num))) + 1;

	auth_img = "/duo/com_member/img/captcha_0" + set_num + ".png"

	$(".auth_img").attr("src",auth_img);
}

$(document).ready(function(){
	$(".ip_sex").click(function(){
		var now_index = $(".radio_sex").index(this);

		//alert(now_index);
		
		if ($(".radio_sex").eq(now_index).attr("class").indexOf("ip_sex_on") == -1)
		{
			// real value set
			$(":radio[name='u_sex']").prop("checked",false);
			$(":radio[name='u_sex']").eq(now_index).prop("checked",true);

			//radio init
			$(".radio_sex").removeClass("ip_sex_on");
			$(".radio_sex").removeClass("ip_sex");
			$(".radio_sex").addClass("ip_sex");

			//check radio set
			$(".radio_sex").eq(now_index).removeClass("ip_sex");
			$(".radio_sex").eq(now_index).addClass("ip_sex_on");
			
		}
	});

	$("#u_pwd").focus(function(){
		if($("#u_pwd").attr("type") == "text")
		{
			$("#u_pwd").val("");
			$("#u_pwd").attr("type","password");
			$("#pwdCheck").show();
		}
		else
		{
			if($("#u_pwd").val() == "")
			{
				$("#u_pwd").attr("type","text");
				$("#u_pwd").val("비밀번호 영문/숫자/특수문자 조합으로 8자 이상 15자 이하");
				$("#pwdCheck").hide();
			}
		}
	});

	$("#u_pwd").blur(function(){
		if($("#u_pwd").val() == "" || $("#u_pwd").val() == "비밀번호 영문/숫자/특수문자 조합으로 8자 이상 15자 이하")
		{
			$("#u_pwd").attr("type","text");
			$("#u_pwd").val("비밀번호 영문/숫자/특수문자 조합으로 8자 이상 15자 이하");
			$("#pwdCheck").hide();
		}
	});

	$(".agree_chk").click(function(){
		
		if ($(".agree_chk:checked").length == agree_cnt)
		{
			$("#agree_all").prop("checked",true);
		}
		else
		{
			$("#agree_all").prop("checked",false);
		}
	});

	$("#agree_all").click(function(){
	
	if ($("#agree_all").is(":checked"))
	{
		$(".agree_chk").prop("checked",true);
	}
	else
	{
		$(".agree_chk").prop("checked",false);
	}
	});

	change_auth_code();
});
</script>
</head>

<body>

<div style="width:100%;">

	<jsp:include page="/header.jsp" flush="true" />

</div>
	<div id="content" style="background-color:#f5f6f7">
	
	
<!-- 2016-05-06 | 임시팝업 
	<script type="text/javascript">
	function popup20160510_close()
	{
		$("#popup20160510").hide();
	}
	</script>
	
	<div style="position:absolute; left:0; top:98px;  width:417px; height:462px; z-index:300;" id="popup20160510">
		<div style=" width:417px; height:528px; position:relative;">
			<img src="https://www.duo.co.kr/html/popup/img/pop_img_20170209.jpg" />
			<a href="javascript:popup20160510_close();" style="position:absolute; right:10px; top:10px; display:block; width:18px; height:18px; background:url(https://www.duo.co.kr/html/popup/img/close_btn_w.png) no-repeat left top; font-size:0; line-height:0;">팝업닫기</a>
		</div>
	</div>
	
<!-- 2016-05-06  임시팝업 - end-->

	

		<div style="margin:0 auto; width:554px; overflow:hidden;">
			<span class="top-web">
	
				<span class="logo duo"></span>
<!-- 				<span class="st-1">듀오 패밀리 사이트 (듀오, 듀오웨드, 듀오리매리, 텐웨딩홀)는<br /><span>하나의 아이디로 통합 관리 됩니다.</span></span> -->
			</span>
			<div class="box-wrapper">
				<form name="JTForm" method="post" action="/duo/DuoControl?cmd=confirm_join" enctype="multipart/form-data">
				<input type="hidden" name="site" value="duo" />
				<input type="hidden" name="u_div" value="" />
				<input type="hidden" name="dmt_code" id="dmt_code" value="" />
								
				<table cellspacing="0" cellpadding="0" summary="회원가입 폼입니다." style="width:100%;">
					<caption>회원가입 폼</caption>
					<tbody>
						<tr>
							<td>
								<input type="text" placeholder="아이디" title="아이디" 
								value="아이디" onfocus="if(this.value==this.defaultValue)this.value='';"
								onblur="if(this.value=='')this.value=this.defaultValue;" 
								class="ip_id" id="u_id" name="u_id" maxlength="10" onKeyup="checkRegisted()"  />
								<input type="hidden" name="idCheckFlag" id="idCheckFlag" value="N" />
								<span id="idCheck" class="pwcheck"></span>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" placeholder="비밀번호 영문/숫자/특수문자 조합으로 8자 이상 15자 이하" title="비밀번호" value="비밀번호 영문/숫자/특수문자 조합으로 8자 이상 15자 이하" class="ip_pw" name="u_pwd" id="u_pwd" maxlength="15"  onKeyup="checkPassword()"/>
								<!-- 해당 부분은 현재 듀오 회원가입 쪽 노출 부분 처럼 진행한다고 합니다. -->
								<input type="hidden" name="pwdCheckFlag" id="pwdCheckFlag" value="N" />
								<span id="pwdCheck" name="pwdcheck"style="display:none;" class="pwcheck">영문/숫자/특수문자 조합으로 8자 이상 15자 이하 , 사용가능 특수문자 : ~!@#$%^&amp;*()-+=</span>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" placeholder="이름" title="이름" value="이름" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;" class="ip_name" name="u_name" />
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
						<tr>
							<td>	
								<select class="ip_birth1" title="생년 선택" name="u_birth1">
									<option value="">생년 선택</option>
									<option value='1998'>1998년</option><option value='1997'>1997년</option><option value='1996'>1996년</option><option value='1995'>1995년</option><option value='1994'>1994년</option><option value='1993'>1993년</option><option value='1992'>1992년</option><option value='1991'>1991년</option><option value='1990'>1990년</option><option value='1989'>1989년</option><option value='1988'>1988년</option><option value='1987'>1987년</option><option value='1986'>1986년</option><option value='1985'>1985년</option><option value='1984'>1984년</option><option value='1983'>1983년</option><option value='1982'>1982년</option><option value='1981'>1981년</option><option value='1980'>1980년</option><option value='1979'>1979년</option><option value='1978'>1978년</option><option value='1977'>1977년</option><option value='1976'>1976년</option><option value='1975'>1975년</option><option value='1974'>1974년</option><option value='1973'>1973년</option><option value='1972'>1972년</option><option value='1971'>1971년</option><option value='1970'>1970년</option><option value='1969'>1969년</option><option value='1968'>1968년</option><option value='1967'>1967년</option><option value='1966'>1966년</option><option value='1965'>1965년</option><option value='1964'>1964년</option><option value='1963'>1963년</option><option value='1962'>1962년</option><option value='1961'>1961년</option><option value='1960'>1960년</option><option value='1959'>1959년</option><option value='1958'>1958년</option><option value='1957'>1957년</option><option value='1956'>1956년</option><option value='1955'>1955년</option><option value='1954'>1954년</option><option value='1953'>1953년</option><option value='1952'>1952년</option><option value='1951'>1951년</option><option value='1950'>1950년</option><option value='1949'>1949년</option><option value='1948'>1948년</option><option value='1947'>1947년</option><option value='1946'>1946년</option><option value='1945'>1945년</option><option value='1944'>1944년</option><option value='1943'>1943년</option><option value='1942'>1942년</option><option value='1941'>1941년</option><option value='1940'>1940년</option><option value='1939'>1939년</option><option value='1938'>1938년</option><option value='1937'>1937년</option>
								</select>
								<select class="ip_birth2" title="월 선택" name="u_birth2">
									<option value="">월 선택</option>
									<option value='01'>1월</option><option value='02'>2월</option><option value='03'>3월</option><option value='04'>4월</option><option value='05'>5월</option><option value='06'>6월</option><option value='07'>7월</option><option value='08'>8월</option><option value='09'>9월</option><option value='10'>10월</option><option value='11'>11월</option><option value='12'>12월</option>

								</select>
								<select class="ip_birth2" title="일 선택" name="u_birth3">
									<option value="">일 선택</option>
									<option value='01'>1일</option><option value='02'>2일</option><option value='03'>3일</option><option value='04'>4일</option><option value='05'>5일</option><option value='06'>6일</option><option value='07'>7일</option><option value='08'>8일</option><option value='09'>9일</option><option value='10'>10일</option><option value='11'>11일</option><option value='12'>12일</option><option value='13'>13일</option><option value='14'>14일</option><option value='15'>15일</option><option value='16'>16일</option><option value='17'>17일</option><option value='18'>18일</option><option value='19'>19일</option><option value='20'>20일</option><option value='21'>21일</option><option value='22'>22일</option><option value='23'>23일</option><option value='24'>24일</option><option value='25'>25일</option><option value='26'>26일</option><option value='27'>27일</option><option value='28'>28일</option><option value='29'>29일</option><option value='30'>30일</option><option value='31'>31일</option>
								</select>
								<div style="float:right; width:170px;">
									<!-- 클릭시 class ip_sex -> ip_sex_on 변경되게 해주세요.  -->
									<label class="ip_sex radio_sex"><input type="radio" title="남자" name="u_sex" value="남자" />남자</label>
									<label class="ip_sex radio_sex"><input type="radio" title="여자" name="u_sex" value="여자" />여자</label>
								</div>
							</td>
						</tr>
						<tr id="mtel_auth_area">
							<td id="mtel_state" style="padding:0;">
								<div id="mtel_input" style="width:100%;height:36px;padding:10px 0;">
									<select class="ip_hp" title="핸드폰 처음 자리" name="u_mtel1">
										<option value="">핸드폰</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
									<span class="flag">-</span>
									<input type="text" title="핸드폰 가운데 자리" class="ip_hp" name="u_mtel2" maxlength="4" />
									<span class="flag">-</span>
									<input type="text" title="핸드폰 끝 자리" class="ip_hp" name="u_mtel3" maxlength="4"/>				
									<!--<span class="ipsend">
										<label><input type="checkbox" title="SMS 수신거부" name="u_sms" value="1" />&nbsp;SMS 수신거부</label>
									</span>-->
									<!---->
								</div>

								<div id="image_code" style="width:100%;height:36px;padding:10px 0;">
									<input type="text" title="보안문자입력" placeholder="보안문자입력" class="ip_hp" style="width:200px;" name="auth_code" value="보안문자입력" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;"/>
									<img  src="/duo/membership/new_img/ic_num_01.jpg" alt="보안문자" class="auth_img" style="display:block;float:left;margin:0 10px;height:35px;border:1px solid #d9d9d9;"/>	
									<a onclick="change_auth_code()" style="display:block;float:left;"><img src="/duo/membership/new_img/btt_num_01.jpg" alt="새로고침" style="cursor:pointer;display:block;height:35px;background:#f5f6f7;" 
									/></a>
								</div>

							</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td> -->
<!-- 								<input type="text" placeholder="이메일" title="이메일" value="이메일" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;" class="ip_email" name="u_email" /> -->
<!-- 								<span class="flag">@</span> -->
<!-- 								<select class="ip_domain" title="이메일 도메인 selet" name="u_email_domain_select" onChange="chgEmail(this.form, this.options[selectedIndex].value)"> -->
							<!-- 	<option value="">선택</option>
									<option value="naver.com">naver.com</option>-->
<!-- <option value="hanmail.net">hanmail.net</option>
<option value="gmail.com">gmail.com</option>
<option value="empal.com">empal.com</option>
<option value="nate.com">nate.com</option>
<option value="dreamwiz.com">dreamwiz.com</option>
<option value="hotmail.com">hotmail.com</option>
<option value="korea.com">korea.com</option>
<option value="paran.com">paran.com</option>
<option value="hanafos.com">hanafos.com</option>
<option value="freechal.com">freechal.com</option>
<option value="lycos.co.kr">lycos.co.kr</option>
<option value="chol.com">chol.com</option>-->

 <!--                                   <option value="input">직접입력</option>-->
<!-- 								</select> -->
<!-- 								<input type="text" placeholder="직접입력" title="직접입력" value="직접입력" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;" class="ip_email" name="u_email_domain" style="display:none;" />		 -->
<!-- 								<span class="ipsend">
<!-- 									<label><input type="checkbox" title="듀오소식지 수신거부" name="u_refuse" value="1" />&nbsp;듀오소식지 수신거부</label> -->
<!-- 								</span>-->			
<!-- 							</td> -->
<!-- 						</tr> -->
						<tr>
							<td>
								<!--듀오, 듀오리매리 노출항목-->
								
								<select class="ip_duo" title="결혼경력" name="u_married">
									<option value="">결혼경력</option>
									<option value="미혼">미혼</option>
                                    <option value="재혼">재혼</option>
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
						<tr>
							<td class="notice-1">ID/PW 분실 등 본인 여부 확인이 필요할 경우를 위해 주민등록상의 이름, 생년을 입력해 주세요.<br />이름, 생년, 성별 정보는 가입 이후에 수정하실 수 없습니다.</td>
						</tr>
						
						
						<tr>
							<td class="ip_agree-1">
								<label><input type="checkbox" title="이용약관, 개인정보 수집 및 이용, 마케팅 활용, 이벤트안내 메일수신에 모두 동의" name="join_agree_all" value="Y" id="agree_all"/>&nbsp;이용약관, 개인정보 수집 및 이용, 마케팅 활용, 이벤트안내 메일수신에 모두 동의</label>
							</td>
						</tr>
						

						<tr>
							<td class="ip_agree-2">
								<div class="box"><label><input type="checkbox" title="이용약관 동의" name="join_agree1" value="Y"  class="agree_chk"/>&nbsp;이용약관 동의</label></div>
								<div class="ip_textarea">[약   관]
<br>
<br>제 1 조 (목적)
<br>이 약관은 듀오정보㈜(이하 "회사"라 합니다.)와 이용자간에 회사가 운영하는 인터넷 사이트 (www.duo.co.kr 및 동 사이트의 기본 DB를 공유하는 모든 사이트 및 제휴사이트 포함. 이하 "사이트"라 합니다)에서 제공하는 제반 서비스(이하 "서비스"라 합니다)의 가입 및 이용에 관한 제반사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
<br>
<br>제 2 조 (용어의 정의)
<br>이 약관에서 사용하는 주요한 용어의 정의는 다음과 같습니다. 
<br>1) 회원 : 서비스를 제공받기 위하여 이용자 아이디(ID)를 부여 받은 자를 말합니다. 
<br>2) 회원 아이디 (이하  "ID" ) : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 부여하는 문자와 숫자의 조합을 말합니다.
<br>3) 비밀번호 : 회원이 사용하는 ID와 일치된 회원임을 확인하고 회원의 개인정보를 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다. 
<br>4) 핸드폰 인증 : SMS(문자메시지)로 6자리 숫자를 전송하여 핸드폰에 수신된 인증번호를 사이트에 등록하도록 함으로써 회원 인증을 하는 것
<br>
<br>
<br>제 3 조 (약관의 효력 및 변경)
<br>1) 이 약관은 이용자가 회원에 가입함과 동시에 효력을 발생하며, 관계법령에 위배되지 않는 범위 안에서 개정될 수 있습니다. 개정된 약관은 온라인에서 공지함으로써 효력을 발생하며, 이용자의 권리 또는 의무 등 중요한 규정의 개정은 사전에 공지합니다.
<br>2) 이 약관에 동의하는 것은 정기적으로 웹을 방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 이용자의 피해는 회사에서 책임지지 않습니다.
<br>3) 회원은 개정된 약관에 동의하지 않을 경우 회원 탈퇴를 요청할 수 있으며, 서비스를 계속 사용하는 것은 약관의 내용을 수락하고 동의하는 것으로 간주합니다.
<br>
<br>제 4 조 (약관 외 준칙)
<br>1) 이 약관이 해당사이트에서 공지하는 개별서비스 혹은 회사의 정책에 대한 세부적인 안내내용은 서비스안내(헬프데스크 등 도움말 관련 메뉴, 각 메뉴 및 서비스 화면에 고지된 내용, 사이트에 게시하는 공지 등을 포함하며 회사가 온라인에서 제공하는 서비스에 대한 설명 및 사용권한, 회원의 의무, 책임 등을 명시한 내용 이하 "서비스안내"라 합니다)에서 정할 것을 위임하거나, 기타 이 약관에서 명시하지 아니한 사항에 대하여는 서비스안내가 정한 바에 따르기로 합니다.
<br>2) 서비스안내의 변경 및 변경에 관한 동의에 있어서도 제3조 제2항 및 제3항의 규정을 적용합니다.
<br>
<br>제 5 조 (회원가입)
<br>1) 사이트 회원이 되고자 하는 자는 회사가 정한 가입양식에 따라 회원정보를 기입하고 "약관에 동의합니다" 및 "회원가입" 단추를 누르는 방법으로 회원가입을 신청합니다.
<br>2) 회원은 반드시 본인인증서비스를 통해 본인확인을 해야 하며, 회사가 정한 가입양식에 기재하는 모든 정보는 진실한 것으로 간주됩니다. 내용이 허위(차명, 비실명 등 포함)이거나, 그러하다고 의심할만한 합리적인 사유가 발생할 경우 회사는 가입신청을 한 회원의 모든 ID를 삭제하고 본 서비스 제공의 일부 또는 전부를 중지할 수 있으며, 이로 인해 발생하는 모든 불이익에 대하여 책임지지 않습니다. 회사는 이를 위하여 필요한 경우 제증명을 요구할 수 있습니다.
<br>3) 회원이 회사의 사이트 회원으로 가입하는 것은 서비스와 관련된 전화, 이메일(E-MAIL)을 수신하는 데에 동의하는 것으로 간주합니다. 단, 이메일 수신 거부자의 경우 이메일 발송대상에서 제외되며, 이후에도 회원의 의사에 따라 수신여부를 변경할 수 있습니다.
<br>4) 회사는 회원의 등급을 서비스 유료결제 등으로 나눌 수 있으며, 회원은 그 등급에 따라 서비스 이용에 제한을 받을 수 있습니다. 회원 등급에 관한 자세한 사항은 해당 서비스안내에서 정한 바에 따릅니다. 이는 회사의 정책에 의해 변경될 수 있으며, 변경된 사항은 공지 즉시 효력을 발생합니다. 
<br>5) 회사는 제1항과 같은 방법으로 회원가입을 신청한 자가 다음 각 호에 해당되지 않는 한 신청한 자를 회원으로 등록합니다. 그러나 다음 각 호에 해당하는 자에게는 회원가입 승낙을 유보하거나 사이트 이용을 제한할 수 있으며, 가입신청을 거절할 수도 있습니다.
<br>1. 등록내용이 허위(차명, 비실명 등 포함)인 것으로 판명되거나, 그러하다고 의심할 만한 합리적인 사유가 발생할 경우
<br>2. 가입 신청자가 본 약관 및 서비스안내, 기타 관계법령을 위반하여 해당 인터넷 사이트의 회원자격을 상실한 적이 있는 경우
<br>3. 기술상 지장이 있는 경우
<br>4. 사회질서 및 미풍양속에 반할 우려가 있다고 인정되는 경우
<br>5. 영리를 추구한 목적으로 본 서비스를 이용하고자 하는 경우
<br>6. 기타 회사의 사정상 이용승낙이 곤란하거나 회사가 정한 이용신청요건이 미비 되었을 경우
<br>6) 회원가입계약의 성립시기는 회사의 승낙이 가입신청자에게 도달한 시점으로 합니다.
<br>7) 회사가 운영하는 모든 사이트의 회원 DB는 통합되어 운영되므로 본 약관에 동의함은 회사가 운영하는 모든 사이트(www.duo.co.kr, www.duowed.com, www.duoremarry.com 등)의 회원이 됨에 동의함을 의미합니다.
<br>
<br>
<br>제 6 조 (회사의 의무)
<br>1) 회사는 지속적이고, 안정적으로 서비스를 제공하기 위해서 노력합니다.
<br>2) 회사는 서비스 제공과 관련해서 알고 있는 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 본인이 승낙한 경우, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신 윤리 위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 제휴사 또는 외부 마케팅을 통한 보다 나은 서비스를 제공하기 위해 회사가 요청을 하고 이에 회원 스스로 동의를 한 경우, 회원이 당사에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다.
<br>3) 2)항의 범위 내에서 회사는 업무와 관련하여 회원 전체 또는 일부의 개인정보에 관한 통계 자료를 작성하여 이를 사용할 수 있고, 서비스를 통하여 회원의 컴퓨터에 쿠키를 전송할 수 있습니다. 이 경우 회원은 쿠키의 수신을 거부하거나 쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터의 브라우저의 설정을 변경할 수 있습니다.
<br>4) 회사는 회원이 서비스 이용 중 필요가 있다고 인정되는 다양한 정보 및 광고를 전자우편이나 서신 혹은 유/무선 전화등으로 제공합니다.
<br>5) 회사는 회원으로부터 제기되는 불만이 정당하다고 인정할 경우에는 적극적으로 처리함을 원칙으로 합니다.
<br>
<br>제 7 조 (회원의 의무)
<br>1) 회원 가입 시에 요구되는 회원 자신의 정보는 진실하고 정확하여야 합니다. 또한 이미 제공된 회원에 대한 정보가 진실하고, 정확한 정보가 되도록 유지, 갱신하여야 하며 그러하지 아니하여 발생하는 문제의 책임은 회원에게 있으며 회사는 책임을 지지 않습니다. 이름, 아이디, 주민번호 앞자리, 성별 등은 수정할 수 없습니다.
<br>2) 회원이 제공한 정직하지 않은 정보와 기타 이 약관 또는 서비스안내에 위배된 행위로 인한 책임은 회원 본인에게 있으며, 이로 인하여 회사에 손해가 발생한 경우 회사는 회원에게 민,형사상의 책임을 물을 수 있습니다.
<br>3) 회사는 회원의 신원에 대한 보증을 하지 않습니다. 또한 회원 스스로 사이트를 통한 온,오프라인의 만남으로 회원간에 발생한 모든 문제에 대해서는 전적으로 회원본인에게 책임이 있으며, 회사는 책임을 지지 않습니다. 그러므로 어떤 형태의 만남이든 회원본인의 신중한 판단이 필요합니다. 
<br>4) 회원은 회사가 공지 또는 통지하는 내용을 반드시 확인, 준수하여야 하며 그렇지 아니하여 발생한 문제나 회원의 손해에 대해서는 회사가 책임을 지지 않습니다.
<br>5) 회원이 본 서비스를 통하여 게시, 전송, 입수하였거나 전자메일 기타 다른 수단에 의하여 게시, 전송 또는 입수한 모든 형태의 정보에 대하여는 해당회원이 모든 책임을 부담하며 당사는 어떠한 책임도 부담하지 아니합니다.
<br>6) 회원은 다음 각 호에 해당하는 행위를 하지 않아야 한다.
<br>1. 타인의 ID와 비밀번호, 성명을 도용하는 행위 및 자신의 ID와 비밀번호를 누설하는 행위
<br>2. 가입신청 또는 개인정보 변경시 허위 내용을 등록하는 행위
<br>3. 공공질서 및 미풍양속을 저해할 만한 저속, 음란, 모욕적, 위협적이거나 타인의 프라이버시를 침해할 수 있는 내용을 전송, 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위
<br>4. 서비스를 통하여 전송 혹은 게시된 내용의 출처를 위장하는 행위
<br>5. 타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위
<br>6. 회사의 승인을 받지 아니한 불법선거운동, 광고, 판촉물, 정크메일, 스팸, 행운의 편지, 피라미드 조직 기타 다른 형태의 권유를 게시, 게재, 전자메일 또는 기타의 방법으로 전송하거나 사용하는 행위
<br>7. 다른 사용자의 개인정보를 수집 또는 저장하는 행위
<br>8. 서비스의 정상적 운영, 유지 등을 방해하거나 지연시키는 행위
<br>9. 정보통신설비의 오작동이나 정보 등의 파괴를 유발시키는 컴퓨터 바이러스 프로그램 등을 유포하는 행위
<br>10. 회사의 승인 없이 회사 인터넷 사이트의 서비스 정보 또는 개인정보를 복제 또는 유통시키거나 상업적으로 이용 또는 타인에게 제공하는 행위
<br>11. 서비스를 이용하여 불법 상품을 판매하는등 영리 활동을 하는 행위
<br>12. 해킹, 음란사이트를 통한 상업행위, 상용 S/W 불법 배포 등을 하는 행위
<br>13. 범죄와 관련있다고 객관적으로 판단할 수 있는 행위
<br>14. 회사의 운영진, 관리자 또는 관계자를 사칭하는 행위
<br>15. 회사 프로그램상의 버그를 악용하거나 정상적이지 아니한 방법으로 사이버 자산을 취득하는 행위
<br>16 회사로부터 특별한 권리를 부여 받지 않고 회사의 클라이언트 프로그램을 변경하거나, 회사의 서버를 해킹 하거나, 웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하는 행위
<br>17. 본 약관을 포함하여 기타 회사가 정한 정책 및 기타 관계법령을 위반한 행위
<br>18 다른 이용자 또는 제3자를 비방하거나 명예를 훼손하는 행위
<br>7) 회원은 회사가 명시적으로 동의하지 않는 한 서비스 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.
<br>8) 본 약관을 위반하거나 또는 기타의 사유로 타회원으로부터 강제탈퇴 또는 불량회원으로 일반에 공개할 것을 요구 받는 경우, 신고를 당한 회원의 활동은 정지되며, 회사는 사실확인 작업에 들어갑니다. 신고의 내용이 적절했다고 판단되면 사이트 관리자는 유,무선을 통해 원활한 회원활동을 권고하게 되며, 이는 1차 불량회원 경고에 해당합니다. 권고 후에도 이와 같은 일이 3회 이상 계속될 때에는 강제탈퇴 처리함을 원칙으로 합니다.
<br>
<br>제 8 조 (게시물 및 회원간 통신내용의 관리)
<br>1) 회원이 게시한 게시물(회원 본인의 개인정보 포함)의 내용에 대한 권리와 책임은 회원에게 있으며, 단, 회사는 서비스 내에서의 게시권을 가지며 서비스 홍보등의 목적으로 사용할 수 있습니다. 회원이 게재한 모든 정보에 대하여 다음 각 호와 같은 경우나 합리적인 사유 발생시 임의로 이를 편집, 이동, 삭제할 수 있습니다.
<br>1. 게시된 내용이 본 약관에 위배되는 경우
<br>2. 공공질서 및 미풍양속을 위반하는 내용인 경우
<br>3. 다른 회원 또는 제3자를 비방하거나 명예를 훼손하는 내용인 경우
<br>4. 범죄 행위와 관련 있다고 인정되는 내용인 경우
<br>5. 서비스 성격에 부합하지 않은 내용인 경우
<br>6. 회사의 저작권, 제3자 저작권등 기타 권리를 침해하는 내용인 경우
<br>7. 상업용 또는 불법, 음란, 저속하다고 판단되는 내용인 경우
<br>8. 기타 관계법령에 위반된다고 판단되는 경우
<br>2) 회사는 회원의 게시물을 소중하게 생각하며 변조,훼손,삭제되지 않도록 최선을 다하고, 회원간 통신 내용에 대한 보안유지에도 최선을 다합니다. 
<br>3) 사이트(개인 신상자료 등 포함)에 등록된 게시물에 대한 보존의 의무는 회원 개인이 가지며 그 보존의 책임은 회사가 지지 않습니다.
<br>
<br>제 9 조 (서비스 제공의 제한 및 중지)
<br>1) 회사는 다음 각 호에 해당하는 경우 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다.
<br>1. 회원이 제9조에 정해진 회원의 의무를 위반하거나 기타 이 약관 및 서비스안내, 관계법령에 위반한 경우
<br>2. 미풍양속을 저해하는 비속한 ID 및 닉네임사용
<br>3. 타인 또는 제3자나 이용자에게 심한 모욕 또는 불이익을 주거나, 서비스 이용을 방해한 경우
<br>4. 회사의 서비스 운영을 고의로 방해하거나 회사의 운영진, 직원, 관계자를 사칭하는 경우
<br>5. 회원 가입신청 또는 개인정보 변경시 허위 내용을 등록한 경우
<br>6. 회사 서비스 정보를 이용하여 얻은 정보를 회사 사전 승낙없이 복제 또는 유통하거나 상업적으로 이용하는 경우
<br>7. 안정적 서비스 운영을 방해하거나 영리를 목적으로 다량 정보를 전송하거나 광고성 정보를 전송하는 경우
<br>8. 회사, 다른 이용자 또는 제 3자의 지적재산권을 침해하는 경우
<br>9. 서비스 프로그램상의 버그를 악용하여 정상적이지 아니한 방법으로 사이버자산을 취득하거나 사이버자산을 타인과 거래하는 행위를 한 경우
<br>10. 정상적인 서비스 운영에 방해가 될 경우
<br>11. 정보통신 윤리위원회 등 관련 공공기관의 시정 요구가 있는 경우
<br>12. 서비스용 설비의 보수 등 공사로 인한 부득이한 경우 (정기점검, 긴급조치 등)
<br>13. 국가비상사태, 천재지변, 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 때
<br>14. 새로운 서비스로 교체 및 서비스를 제공할 수 없는 사유 발생시
<br>15. 회사의 서비스 개선을 위한 회사 정책 상 불가피한 경우
<br>16. 기타 불가항력적 사유가 있는 경우
<br>2) 위 제11조 제1항에 의하여 회사는 서비스를 이용하는 회원에게 서비스 이용에 대하여 별도 공지 없이 서비스 이용의 일시정지, 초기화, 이용계약 해지 등을 할 수 있다.
<br>
<br>제 10 조 (이용자의 ID, 비밀번호 및 접속종료에 대한 의무)
<br>1) 회원의 ID와 비밀번호에 관한 모든 관리책임은 회원본인에게 있습니다.
<br>2) 회원은 본인의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
<br>3) 회원은 본인의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.
<br>4) 회원은 본 서비스의 매 사용 종료 시마다 정확히 접속을 종료하도록 하여야 하며, 정확히 종료 하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과에 의하여 귀하에게 발생하는 손해 및 손실에 대하여는 회사는 책임을 부담하지 아니합니다. 
<br>
<br>제 11 조 (이용계약의 해지)
<br>1) 회원이 이용계약을 해지하고자 할 경우 회사가 안내하는 방법으로 회원 본인이 회사에게 해지 신청을 하고, 회사는 확인절차를 거쳐 이용계약을 해지합니다. 해지 처리를 하는 과정에서 시스템의 문제나 불량회원 등록 확인 등으로 수일의 시간이 필요하다고 판단될 때는 회원에게 사유를 공지하고 추후에 해지 처리하게 됩니다.
<br>2) 회사는 회원이 본 약관 또는 서비스안내 기타 관계법령에 위배되는 행위를 하였을 경우, 제공 서비스의 일부 또는 전체에 대한 이용권한을 사전 통지 없이 해지 할 수 있습니다.
<br>
<br>제 12 조 (면책조항) 
<br>1) 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.
<br>2) 회사는 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우 책임이 면제됩니다.
<br>3) 회사는 회원의 귀책사유로 인한 서비스 이용 장애에 대하여 책임을 지지 않습니다.
<br>4) 회사는 회원이 회사의 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나, 서비스 자료에 대한 취사 선택 또는 이용으로 인해 발생하는 손해 등에 대해서는 책임이 면제됩니다.
<br>5) 회사는 회원이 사이트에 제공한 개인정보 및 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 그 내용에 관해서 책임이 면제됩니다.
<br>6) 회사는 회원의 게시물 등의 자료유실, 파손 등에 대한 피해에 대해 책임지지 않으며, 따라서 회원은 자료 등에 대하여 항시 별도 보관 조치를 취해야 합니다.
<br>7) 회사는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.
<br>8) 회사는 이용자의 컴퓨터 오류에 의한 손해가 발생한 경우, 또는 회원이 신상정보 및 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다.
<br>9) 회사는 회원이 서비스를 이용하면서 얻은 자료로 인한 손해에 대하여 책임을 지지 않습니다. 
<br>10) 회사는 회원의 신원에 대한 보증을 하지 않습니다. 또한 회사는 회원이 서비스를 이용하며 타회원으로 인해 입게 되는 정신적, 물질적 피해에 대하여 보상할 책임을 지지 않습니다.
<br>11) 회사는 이용자 상호간 및 이용자와 제3자 상호간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없으며, 이로 인한 손해를 배상할 책임도 없습니다.
<br>12) 회사는 회원에게 무료로 제공하는 서비스의 이용과 관련해서는 어떠한 손해도 책임을 지지 않습니다.
<br>13) 본 사이트와 연결되어 제3자에 의하여 유지되는 다른 인터넷 사이트들의 내용들에 대하여 회사는 아무런 통제권한이 없습니다. 따라서 다른 인터넷 사이트에 포함된 정보의 정확도와 신뢰성에 대하여 회사는 아무런 법적 책임을 지지 않습니다.
<br>14) 회사는 회원이 본 약관 규정을 위배하여 발생한 손실에 대하여는 책임을 지지 않습니다.
<br>15) 회원이 공개를 허락한 자료에 대하여 발생된 문제에 대하여서는 책임이 면제됩니다.
<br>16) 회사는 회원이 게재하거나 타인과 통신하는 정보, 자료, 사실에 대한 신뢰도, 정확성 및 그 내용에 대하여 알지 못하며, 그로 인해 사회적, 윤리적, 법적으로 문제가 발생 시 그 책임을 지지 않습니다.
<br>17) 회원이 회사가 제공하는 제휴서비스 이용시 서비스이용의 필요에 의해 제휴사에 제공하는 개인정보에 대해서는 본인의 동의하에 제공된 것으로 간주하고 제공한 개인정보로 인해 발생한 문제에 대해서 회사는 책임을 지지 않습니다.
<br>18) 회사는 당사가 제공한 서비스가 아닌 가입자 또는 기타 제휴사가 제공하는 서비스의 내용상의 정확성, 완전성 및 질에 대하여 보장하지 않습니다. 따라서 회사는 회원이 위 내용을 이용함으로 인하여 입게 된 모든 종류의 손실이나 손해에 대하여 책임을 부담하지 아니합니다.
<br>
<br>제 13 조(회원에 대한 통지 및 정보제공)
<br>1) 회원에 대한 통지 및 예고는 사이트에 게시하거나 서면, 전화, 모사전송 또는 전자우편(e-mail)의 방법으로 할 수 있습니다
<br>2) 회사는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 문자, 음성, 사진, 영상자료에 대해서 사이트게시, 전자우편, 전화, 모바일서비스, 공지사항 등으로 회원에게 제공할 수 있습니다.
<br>3) 회사는 회원들에게 보다 좋은 서비스를 제공하거나 회사의 새로운 상품을 제공하기 위해서 전자우편, 전화, SMS, 서면 등의 방법으로 회원과 영업을 목적으로 한 상담 및 정보제공을 할 수 있습니다.
<br>4) 회사는 서비스 개선 및 회원 대상의 서비스 소개 등의 목적으로 회원의 동의 하에 추가적인 개인정보를 요구할 수 있습니다.
<br>
<br>제 14 조 (광고게재 및 광고주와의 거래)
<br>1) 회사가 회원에게 서비스를 제공할 수 있는 서비스 투자기반의 일부는 광고게재를 통한 수익으로부터 나옵니다. 회원은 서비스 이용시 노출되는 광고게재 및 전송에 대해 동의합니다.
<br>2) 회사는 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를 함으로써 발생하는 손실과 손해에 대해 책임을 지지 않습니다.
<br>
<br>제 15 조 (약관의 해석)
<br>이 약관 및 서비스안내에서 정하지 아니한 사항과 이 약관 및 서비스안내의 해석은 관계법령 및 상관습에 따릅니다.
<br>
<br>제 16 조 (분쟁해결)
<br>1) 회사는 회원으로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리하도록 노력합니다. 
<br>2) 회원의 서비스 이용과 관련하여 당사자 간에 다툼이 발생한 경우 당사자의 협의로 처리하되 신의성실의 원칙에 따라 원만히 해결함을 원칙으로 합니다.
<br>
<br>제 17 조 (관할법원 및 준거법)
<br>1) 서비스 이용과 관련하여 회사와 회원간에 발생한 분쟁에 관한 소송은 당사 본점 소재지를 관할하는 법원을 관할법원으로 합니다.
<br>2) 본 서비스 이용과 관련하여 회사와 회원간에 제기된 소송에는 한국 법을 적용합니다.
<br>
<br>
<br>[부칙]   (시행일) 이 약관은 2002년 07월 01일부터 시행합니다
<br>[부칙]   (시행일) 이 약관은 2002년 09월 09일부터 시행합니다
<br>[부칙]   (시행일) 이 약관은 2003년 09월 01일부터 시행합니다
<br>[부칙]   (시행일) 이 약관은 2004년 10월 18일부터 시행합니다
<br>[부칙]   (시행일) 이 약관은 2006년 02월 01일부터 시행합니다
<br>[부칙]   (시행일) 이 약관은 2007년 04월 27일부터 시행합니다
<br>[부칙]   (시행일) 이 약관은 2013년 02월 18일부터 시행합니다.
<br>
<br>
<br></div>
							</td>
						</tr>
						<tr>
							<td class="ip_agree-3">
								<div style="float:left; width:262px;">									
									<div class="box"><label><input type="checkbox" title="개인정보 수집 및 이용 동의" name="join_agree2" value="Y" class="agree_chk"/>&nbsp;개인정보 수집 및 이용 동의</label></div>
									<div class="ip_textarea" style="width:250px;">
		&lt;개인정보 수집 및 이용동의 &gt;<br/><br/>

		당사는 '개인정보보호법' 에 따라 귀하의 개인정보를 다음과 같이 수집.이용하고자 합니다.<br/><br/>

		개인정보의 수집.이용 목적<br/>
		- 회원관리와 각종 서비스(온라인 컨텐츠, 프로필소개 등 결혼관련 서비스) 이용<br/>
		- 결혼관련 서비스 상담 및 이용 권유, 광고게재 및 각종 서비스 안내, 이벤트 정보 안내, 설문 조사를 위한 정보 확보<br/><br/>

		수집하는 개인정보의 항목<br/>
		- 성명, 아이디, 비밀번호, 생년월일, 성별, 이메일, 연락처 및 휴대폰번호, 주소, 결혼경력, 학력, 직업종류<br/><br/>

		개인정보의 보유 및 이용기간<br/>
		- 결혼중개업법 기준 5년 또는 개인정보 삭제 및 탈회를 요청할 때까지 보유.이용합니다.<br/>
		- 결혼회원 가입의 경우 개인정보에 관한 회사 내부 방침에 따라 개인정보를 보유합니다.<br/> 
		- 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.<br/><br/>
		가. 회사 내부 방침에 의한 정보보유 사유<br/><br/>

		-개인정보 삭제 및 회원탈퇴 신청기록 <br/>
		　보존 이유 : 부정 이용 방지 <br/>
		　보존 기간 : 듀오넷 회원 탈퇴일부터 2년 <br/>
		　보존 항목 : 아이디, 이름, 주민번호 앞자리, 이메일 <br/><br/>

		-채용에 관한 입사지원 기록 <br/>
		　보존 이유 : 상시채용을 위한 보관 <br/>
		　보존기간 : 개인정보 삭제를 요청하기 전까지<br/><br/>

		나. 관련법령에 의한 정보보유 사유 <br/><br/>

		상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.<br/><br/>

		- 계약 또는 청약철회 등에 관한 기록 <br/>
		　보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 <br/>
		　보존 기간 : 5년 <br/><br/>

		- 대금결제 및 재화 등의 공급에 관한 기록<br/> 
		　보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 <br/>
		　보존 기간 : 5년 <br/><br/>

		- 전자금융 거래에 관한 기록 <br/>
		　보존 이유 : 전자금융거래법 <br/>
		　보존 기간 : 5년 <br/><br/>

		- 소비자의 불만 또는 분쟁처리에 관한 기록 <br/>
		　보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 <br/>
		　보존 기간 : 3년 <br/><br/>

		- 본인 확인에 관한 기록 <br/>
		　보존 이유 : 정보통신 이용촉진 및 정보보호 등에 관한 법률 <br/>
		　보존 기간 : 6개월 <br/><br/>

		- 웹사이트 방문기록 <br/>
		　보존 이유 : 통신비밀보호법 <br/>
		　보존 기간 : 3개월<br/><br/>

		※ 정보동의시 가입상담을 위해 최소한의 정보만 수집.이용하게 되며, 본 동의를 거부하시는 경우에는 해당 서비스이용 및 가입상담 등 정상적인 서비스 제공이 불가능 할 수 있습니다. <br/><br/><br/>


		<이전 개인정보 수집 및 이용동의 내용(2013년 1월 7일~2013년 10월 27일)><br/><br/>
		개인정보의 수집.이용 목적<br/>
		- 회원관리와 각종 서비스(온라인 컨텐츠, 프로필소개 등 미팅 및 결혼관련 서비스) 이용 <br/>
		- 결혼관련 서비스 및 웨딩컨설팅 상담, 광고게재 및 각종 서비스 안내, 이벤트 정보 안내, 설문 조사를 위한 정보 확보 <br/><br/>

		수집하는 개인정보의 항목<br/>
		- 성명, 아이디, 비밀번호, 주민번호 앞자리, 성별, 이메일, 메일 수신여부, 전화번호, 주소, 결혼경력유무, 학력, 직장명, 현재상태, 결혼예정일 등<br/><br/>

		개인정보의 보유 및 이용기간<br/>
		- 개인정보 삭제 및 탈회를 요청할 때까지 보유·이용합니다. <br/>
		- 결혼회원 가입의 경우 개인정보에 관한 회사 내부 방침에 따라 개인정보를 보유합니다. <br/>
		- 불량회원 관리 및 소비자보호에 대한 법률 등 타 법률에 의해 보존해야 할 필요가 있는 경우에는 일정기간 보존합니다 <br/><br/><br/>

		<이전 개인정보 수집 및 이용동의 내용(2008년 6월 25일~2013년 1월 6일)><br/><br/>
		개인정보의 수집.이용 목적<br/>
		- 회원관리와 각종 서비스(온라인 컨텐츠, 프로필소개 등 미팅 및 결혼관련 서비스) 이용 <br/>
		- 결혼관련 서비스 및 웨딩컨설팅 상담, 광고게재 및 각종 서비스 안내, 이벤트 정보 안내, 설문 조사를 위한 정보 확보 <br/><br/>

		수집하는 개인정보의 항목<br/>
		- 성명, 아이디, 비밀번호, 주민등록번호, 성별, 이메일, 메일 수신여부, 전화번호, 주소, 결혼경력유무, 학력, 직장명, 현재상태, 결혼예정일 등<br/><br/>

		개인정보의 보유 및 이용기간<br/>
		- 개인정보 삭제 및 탈회를 요청할 때까지 보유·이용합니다. <br/>
		- 결혼회원 가입의 경우 개인정보에 관한 회사 내부 방침에 따라 개인정보를 보유합니다. <br/>
		- 불량회원 관리 및 소비자보호에 대한 법률 등 타 법률에 의해 보존해야 할 필요가 있는 경우에는 일정기간 보존합니다 <br/><br/>


		</div>
								</div>
								<div style="float:right; width:262px;">
									<div class="box"><label><input type="checkbox" title="마케팅 활용 동의" name="join_agree3" value="Y" class="agree_chk"/>&nbsp;마케팅 활용 동의</label></div>
									<div class="ip_textarea" style="width:250px;">
		&lt;개인정보의 제공에 관한 사항&gt;<br/><br/>

		[소비자 권익 보호에 관한 사항]<br/><br/>
		최소한의 정보처리 및 동의거부에 대한 안내 : 정보동의시 가입상담 및 고객관리 등을 위해 최소한의 정보만 수집.이용하게 되며, 본 동의를 거부하시는 경우에는 해당 서비스의 이용 및 가입상담 등 정상적인 서비스 제공이 불가능할 수 있음을 알려 드립니다.<br/><br/>
		개인정보 제공동의 철회 : 개인정보 수집ㆍ이용에 동의한 이후에도 전화[대표번호], 서면, 메일 등을 통해 고객정보 관리 등에 대한 개인정보 처리 중지를 요청할 수 있습니다.<br/><br/>

		상품권유 중지청구(Do-Not Call) : 개인정보 제공 및 이용에 동의한 이후에도 전화[대표번호], 서면 등을 통해 마케팅활동에 대한 중지를 요청할 수 있습니다.<br/><br/>

		[개인정보 제공에 관한 사항]<br/><br/>
		1.	개인정보를 제공받는 자 : 듀오 커플매니저 및 이벤트/마케팅 담담<br/><br/>
		2.	개인정보를 제공받는 자의 이용 목적<br/>
		- 회원관리와 각종 서비스(온라인 컨텐츠, 프로필소개 등 결혼관련 서비스) 이용 <br/>
		- 결혼관련 서비스 상담 및 이용 권유, 광고게재 및 각종 서비스 안내, 이벤트 정보 안내, 설문 조사를 위한 정보 확보<br/><br/>

		3.	제공할 개인정보의 내용<br/>
		- 개인식별정보 (성명, 아이디, 생년월일, 성별, 이메일, 연락처 및 휴대폰번호, 주소, 결혼경력, 학력, 직업종류)<br/><br/>

		4.	제공받는 자의 개인정보 보유 및 이용기간<br/>
		- 결혼중개업법 기준 5년 또는 개인정보 삭제 및 탈회를 요청할 때까지 보유.이용합니다.<br/>
		- 결혼회원 가입의 경우 개인정보에 관한 회사 내부 방침에 따라 개인정보를 보유합니다.<br/>
		- 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.<br/><br/>
		가. 회사 내부 방침에 의한 정보보유 사유<br/><br/>

		-개인정보 삭제 및 회원탈퇴 신청기록 <br/>
		　보존 이유 : 부정 이용 방지 <br/>
		　보존 기간 : 듀오넷 회원 탈퇴일부터 2년 <br/>
		　보존 항목 : 아이디, 이름, 주민번호 앞자리, 이메일 <br/><br/>

		-채용에 관한 입사지원 기록 <br/>
		　보존 이유 : 상시채용을 위한 보관 <br/>
		　보존기간 : 개인정보 삭제를 요청하기 전까지<br/><br/>

		나. 관련법령에 의한 정보보유 사유 <br/><br/>

		상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.<br/><br/>

		- 계약 또는 청약철회 등에 관한 기록 <br/>
		　보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 <br/>
		　보존 기간 : 5년 <br/><br/>

		- 대금결제 및 재화 등의 공급에 관한 기록<br/> 
		　보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 <br/>
		　보존 기간 : 5년 <br/><br/>

		- 전자금융 거래에 관한 기록 <br/>
		　보존 이유 : 전자금융거래법 <br/>
		　보존 기간 : 5년 <br/><br/>

		- 소비자의 불만 또는 분쟁처리에 관한 기록 <br/>
		　보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 <br/>
		　보존 기간 : 3년 <br/><br/>

		- 본인 확인에 관한 기록 <br/>
		　보존 이유 : 정보통신 이용촉진 및 정보보호 등에 관한 법률 <br/>
		　보존 기간 : 6개월 <br/><br/>

		- 웹사이트 방문기록 <br/>
		　보존 이유 : 통신비밀보호법 <br/>
		　보존 기간 : 3개월<br/><br/>

		5. 서비스 안내방법 : SMS, Email, 전화 <br/><br/>
		</div>
								</div>
								

								<!--듀오, 듀오리매리 추가 노출항목 시작 (ppt 참조)-->
								
								<div class="ip_duo_check"><label><input type="checkbox" title="듀오에서 진행중인 각종 미팅파티 공연/경품 이벤트 안내를 이메일 또는 휴대폰 문자로 수신 동의" name="u_agree_event" value="Y" class="agree_chk"/>&nbsp;듀오에서 진행중인 각종 미팅파티 공연/경품 이벤트 안내를 이메일 또는 휴대폰 문자로 수신 동의</label></div>
								<!--듀오, 듀오리매리 추가 노출항목 끝 (ppt 참조)-->
								
							</td>
						</tr>
						<tr>
							<td class="td_submit" align="center">
								<a href="javascript:check_join();" class="start_bt"><img src="/duo/com_member/img/btn_01.png" /></a>
								<a class="ing_bt" style="display:none;"><img src="/com_member/img/loader.gif" /></a>	
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>
	<div id="footer">
	<div style="margin:0 auto; width:554px; padding:40px 0; overflow:hidden;">
		<span class="menu">
			<a href="/com_member/privacy_01.asp?site=duo">이용약관</a><span class="line">|</span>
			<a href="/com_member/privacy_02.asp?site=duo">개인정보처리방침</a><span class="line">|</span>
			<a href="#" onclick="window.open('https://www.duo.co.kr/html/common/notice_content.asp?no=579','message','width=650,height=421');return false;" onkeypress="this.onclick()">손해배상청구절차</a>
		</span>
		<span class="st-footer-1">
			<br />서울 강남구 강남대로 406 (역삼동 820-9 글라스타워) 11,12,16층 (06134)<br />듀오정보(주) / 대표자:박수경 / 사업자등록번호 : 214-86-28824<br />
			통신판매업신고 : 강남 - 3259호 <a href="#">[사업자등록확인]</a>
		</span>
		<span class="st-footer-1" style="padding-top:7px;">copyright 1995~2017 @<span style="color:#ff433c;">duoinfo</span> corp. all right reserved.</span>
	</div>
</div>
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
</body>
</html>