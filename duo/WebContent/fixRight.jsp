<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/duo/common/isValidType.js"></script>
<script type="text/javascript">
function right_select_jisa(obj)
{
	if ($(obj).val() == "14" || $(obj).val() == "11" || $(obj).val() == "12")
	{
		$("#transform_sub_right #u_mtel1").hide();
		$("#mtel_text").hide();
		$("#transform_sub_right #u_mtel").show();
	}
	else
	{
		$("#transform_sub_right #u_mtel1").show();
		$("#mtel_text").show();
		$("#transform_sub_right #u_mtel").hide();
	}
}

function check_right_slide()
{
	var formnm = document.RSForm;
	
	formnm.u_name.value = formnm.u_name.value.replace("이름", "");

	if(!isValidType(formnm.u_name, 'text', '이름을 입력하여 주세요.' )){ return; }
	if(checkstring(formnm.u_name.value) == true){alert("이름입력에 특수문자는 입력할수 없습니다."); return;}
	if(!check_input_byte(formnm.u_name.value,10)){alert("입력 할 수 있는 문자길이를 초과하였습니다."); return;}

	formnm.u_birth.value = formnm.u_birth.value.replace("출생년(예1980)", "");
	
	if(!isValidType(formnm.u_birth, 'number', '출생년도를 입력하여 주세요.' )){ return; }

	if(!isValidType(formnm.u_married,'check','초혼 재혼을 선택하여 주세요.')){ return;}

	if(!isValidType(formnm.u_edu, 'select', '학력을 선택하여 주세요.' )){ return; }
	if(!isValidType(formnm.u_jisa, 'select', '지사를 선택하여 주세요.' )){ return; }

	if(!isValidType(formnm.u_sex, 'check', '성별을 선택하여 주세요.' )){ return; }	
	
	var v = $("#transform_sub_right select[name='u_jisa']").val();
	if(v == "11" || v == "12" || v == "14"){
		if (formnm.u_mtel.value == "연락처")
		{
			alert("연락처를 입력해 주세요.");
			formnm.u_mtel.value = "";
			formnm.u_mtel.focus();
			return;
		}

		if(!isValidType(formnm.u_mtel, 'text', '연락처를 입력하여 주세요.' )){ return; }

	}else{
		if(!isValidType(formnm.u_mtel1, 'select', '연락처 앞자리를 선택하여 주세요.' )){ return; }
		if(!isValidType(formnm.u_mtel2, 'number', '연락처 중간자리를 입력하여 주세요.' )){ return; }
		if(!isValidType(formnm.u_mtel3, 'number', '연락처 끝자리를 입력하여 주세요.' )){ return; }
		
		if(!hp_chck_array(formnm.u_mtel2.value) && !hp_chck_array(formnm.u_mtel3.value)){
			alert("핸드폰 번호가 올바르지 않습니다.");
			formnm.u_mtel3.focus();
			return;
		}

		formnm.u_mtel.value = "";
	}
	
	if(!agree_check('r_agree_all','r_agree1','r_agree2')){return;}

	var formdata;

	formdata = ajax_setFormData("RSForm","u_name");

	$.ajax({
		url:"/html/common/right_speed_proc.asp",
		data:formdata,
		type:"POST",
		success:function(data){
			if (data.indexOf("[[proc=success]]") > -1)
			{
				//callbackFlashAction(708, 1335, 0, 0, 0 ); // emforce script run | 2013-08-30 
				setTimeout(function(){
					alert("상담신청이 완료 되었습니다.");
					formnm.reset();
					$("#transform_sub_right #u_mtel1").show();
					$("#mtel_text").show();
					$("#transform_sub_right #u_mtel").hide();

					agree_view(1);
				},500);
			}
			else
			{
				alert("오류가 발생하였습니다. 다시 시도해 주세요." + "\n" + data);
			}
		},
		error:function(data){
			alert("오류가 발생하였습니다. 다시 시도해 주세요." + "\n" + data);
		}
	});
}

function agree_view(viewmode)
{
	if (viewmode == 0)
	{
		$(".box-wrapper").show();
	}
	else
	{
		$(".box-wrapper").hide();
	}
}

function service_consult(viewmode)
{
	if (viewmode == 0)
	{
		$("#main_pop_bg").show();
		$("#main_consult").show();
	}
	else
	{
		$("#main_pop_bg").hide();
		$("#main_consult").hide();
	}
}
function scroll_top()
{
	$(window).scrollTop(0);
}

</script>
<style>
/*fix-right s*/
#fix-right { width:68px; height:100%; position:fixed; top:35%; right:0; z-index:70; }
#fix-right ul.menu-list { font-size:11px; color:#ffffff; text-align:center; line-height:16px; }
#fix-right ul.menu-list .speed { width:68px; height:98px; background:url(/duo/main_img_09/quick_menu_01.gif) no-repeat left top;  font-size:0; text-indent:-99999px; }
#fix-right ul.menu-list .speed a {display:block; width:68px; height:98px; }
#fix-right ul.menu-list .simple { width:68px; height:72px; background:url(/duo/main_img_09/quick_menu_02.gif) no-repeat left top;  font-size:0; text-indent:-99999px;  }
#fix-right ul.menu-list .simple a {display:block; width:68px; height:72px; }
#fix-right ul.menu-list .event { width:68px; height:71px; background:url(/duo/main_img_09/quick_menu_03.gif) no-repeat left top;  font-size:0; text-indent:-99999px;  }
#fix-right ul.menu-list .event a { display:block; width:68px; height:71px; }
#fix-right ul.menu-list .tel { width:68px; height:120px; background:url(/duo/main_img_09/quick_menu_04.gif) no-repeat left top; font-size:0; text-indent:-99999px; }
#fix-right ul.menu-list .tel a { display:block; width:68px; height:120px; }
#fix-right ul.menu-list .top { width:68px; height:67px; background:url(/duo/main_img_09/quick_menu_05.gif) no-repeat left top; font-size:0; text-indent:-99999px;}
#fix-right ul.menu-list .top a { display:block; width:68px; height:67px; }
#fix-right ul.menu-list .fast { width:68px; height:90px; background:url(/duo/main_img_09/quick_menu_07.jpg) no-repeat left top; font-size:0; text-indent:-99999px;}
#fix-right ul.menu-list .fast a { display:block; width:68px; height:90px; }
#fix-right .box-wrapper { position:fixed; width:393px; height:394px; top:35%; right:68px; background:#656161; padding:34px 24px 0 24px; text-align:left; display:none; }
#fix-right .box-wrapper p.title { display:block; margin:0 0 15px 0; font-size:18px; color:#ffea00; line-height:130%; }
#fix-right .box-wrapper p.title span { font-size:14px; color:#ffc000; }
#fix-right table { width:100%; }
#fix-right table td { height:44px; vertical-align:middle; }
#fix-right table input[type=text] { float:left; height:32px; line-height:32px; color:#9f9f9f; padding:0 4px; border:none; font-size:12px; }
#fix-right table select { display:block; float:left; height:32px; color:#9f9f9f; border:none; }
#fix-right table select { height:auto; padding:7px 0;\0/ie8+9; }
#fix-right table label { color:#ffffff; }
#fix-right .radioBtn { float:left; padding:8px 0 0 0; color:#ffffff; }
#fix-right .radioBtn input { vertical-align:middle; margin:0 2px 0 0; }
#fix-right .radioBtn label { margin:0 5px 0 0; font-size:12px; }
#fix-right .longfield { width:120px; margin-right:10px; }
#fix-right .midfield { width:96px; margin-right:10px; }
#fix-right .agreebox { width:100%; clear:both; float:left; margin:8px 0 0 0; }
#fix-right .agreebox .box { float:left; width:163px; margin:0 8px 0 0; }
#fix-right .agreebox .txtarea { width:100%; height:36px; margin-bottom:5px; overflow:auto; color:#c2c2c2; font-size:12px; line-height:140%; padding:2px; background:#837e7e; }
#fix-right input[type=checkbox] { vertical-align:middle; border:none; }
#fix-right tr.last td { padding:14px 0 0 0; }
#fix-right tr.last label { font-size:12px; }
#fix-right tr.last .box label { font-size:12px; }
#fix-right .submit_bt { display:block; width:214px; height:46px; background:#252525; color:#fff600; font-size:12px; text-align:center; line-height:46px; margin:0 auto; margin-top:30px; }
#fix-right input[type=submit] { display:block; width:214px; height:46px; margin:30px auto 0 auto; outline:0; border:0; background:#252525; color:#fff600; font-size:12px; }
#fix-right .box-wrapper a.btn-close { border:none; display:block; width:15px; height:14px; position:absolute; top:10px; left:10px; font-size:0; text-indent:-9999px; background:url(/html/main_img_2015/quickmenu-btn-close.gif) top left no-repeat; }
/*fix-right e*/
</style>
<div id="fix-right">
	<h2 class="hide" style="display:none;">오른쪽 영역</h2>
	<ul class="menu-list">
		<li class="speed"><a href="/duo/DuoControl?cmd=join">회원가입</a></li>
		<li class="fast"><a href="/html/service/duo_faq.asp">빠른전화상담</a></li>
		<!--<a href="javascript:fast_consult_popup_view();">-->
		<li>
			<div class="box-wrapper">
				<p class="title">듀오 서비스에 대해 궁금하신가요?<br><span>듀오에 관한 자세한 안내를 빠르고 친절하게 상담해드립니다.</span></p>
				<form class="speed_Form" name="RSForm" method="post" id="transform_sub_right">
				<input type="hidden" name="pg" value="index_right">
				<table cellspacing="0" cellpadding="0" summary="듀오 스피드 상담신청폼입니다.">
				<caption>듀오 스피드 상담 신청 폼</caption>
				<tbody>
				<tr>
					<td>
						<input type="text" class="longfield" placeholder="이름" name="u_name" title="이름" value="이름" maxlength="5" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;">
						<select class="midfield" name="u_birth">
							<!-- 1996~1920년생으로 노출되게(모바일웹 무료상담의 출생년과 같은 조건으로 노출됨 -->
							<option value="">출생년</option>
							<option value="1998">1998년</option><option value="1997">1997년</option><option value="1996">1996년</option><option value="1995">1995년</option><option value="1994">1994년</option><option value="1993">1993년</option><option value="1992">1992년</option><option value="1991">1991년</option><option value="1990">1990년</option><option value="1989">1989년</option><option value="1988">1988년</option><option value="1987">1987년</option><option value="1986">1986년</option><option value="1985">1985년</option><option value="1984">1984년</option><option value="1983">1983년</option><option value="1982">1982년</option><option value="1981">1981년</option><option value="1980">1980년</option><option value="1979">1979년</option><option value="1978">1978년</option><option value="1977">1977년</option><option value="1976">1976년</option><option value="1975">1975년</option><option value="1974">1974년</option><option value="1973">1973년</option><option value="1972">1972년</option><option value="1971">1971년</option><option value="1970">1970년</option><option value="1969">1969년</option><option value="1968">1968년</option><option value="1967">1967년</option><option value="1966">1966년</option><option value="1965">1965년</option><option value="1964">1964년</option><option value="1963">1963년</option><option value="1962">1962년</option><option value="1961">1961년</option><option value="1960">1960년</option><option value="1959">1959년</option><option value="1958">1958년</option><option value="1957">1957년</option><option value="1956">1956년</option><option value="1955">1955년</option><option value="1954">1954년</option><option value="1953">1953년</option><option value="1952">1952년</option><option value="1951">1951년</option><option value="1950">1950년</option><option value="1949">1949년</option><option value="1948">1948년</option><option value="1947">1947년</option><option value="1946">1946년</option><option value="1945">1945년</option><option value="1944">1944년</option><option value="1943">1943년</option><option value="1942">1942년</option><option value="1941">1941년</option><option value="1940">1940년</option><option value="1939">1939년</option><option value="1938">1938년</option><option value="1937">1937년</option>
						</select>
						<div class="radioBtn">
							<label><input type="radio" name="u_married" value="5">미혼</label>
							<label><input type="radio" name="u_married" value="2">재혼</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<select class="longfield" name="u_edu">
							<option value="">학력</option>
							<option value="02">고등학교 졸업</option>
<option value="05">전문대졸업</option>
<option value="09">대학교졸업</option>
<option value="11">대학원재학</option>
<option value="13">대학원졸업</option>
<option value="14">박사이상</option>
<option value="15">기타</option>

						</select>
						<select class="midfield" name="u_jisa" id="u_jisa" onchange="right_select_jisa(this)">
							<option value="">거주지역</option>
							<option value="01">서울</option>
<option value="02">인천</option>
<option value="03">수원/화성</option>
<option value="13">천안</option>
<option value="04">대전</option>
<option value="05">전주</option>
<option value="06">광주</option>
<option value="07">대구</option>
<option value="08">부산</option>
<option value="09">울산</option>
<option value="10">창원</option>
<option value="15">경기 </option>
<option value="32">평택/오산</option>
<option value="22">경남 </option>
<option value="21">경북 </option>
<option value="16">세종 </option>
<option value="20">전남 </option>
<option value="19">전북 </option>
<option value="18">충남 </option>
<option value="24">제주</option>
<option value="23">강원 </option>
<option value="17">충북 </option>
<option value="14">뉴욕</option>
<option value="11">LA</option>

						</select>
						<div class="radioBtn">
							<label><input type="radio" name="u_sex" value="1">남성</label>
							<label><input type="radio" name="u_sex" value="2">여성</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<select class="longfield" name="u_mtel1" id="u_mtel1">
						<option value="">핸드폰</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						<input type="text" class="midfield" name="u_mtel2" id="u_mtel2" maxlength="4">
						<input type="text" class="midfield" name="u_mtel3" id="u_mtel3" maxlength="4">
						<input type="text" class="midfield" name="u_mtel" id="u_mtel" style="display:none;">
					</td>
				</tr>
				<tr class="last">
					<td>
						<label><input type="checkbox" name="r_agree_all" value="Y" onclick="agree_click('r_agree_all','r_agree1','r_agree2',0);"> 개인정보 수집 및 이용, 마케팅 활용에 모두 동의</label>
						<div class="agreebox">
							<div class="box">
								<div class="txtarea">
		&lt;개인정보 수집 및 이용동의 &gt;<br/><br/>

		당사는 '개인정보보호법'에 따라 귀하의 개인정보를 다음과 같이 수집.이용하고자 합니다.<br/><br/>

		개인정보의 수집.이용 목적<br/>
		- 회원관리 및 결혼서비스에 관한 상담 및 자료요청 의사 확인<br/>
		- 결혼관련 서비스 상담 및 이용 권유, 각종 서비스 및 이벤트 안내<br/>
		- 테스트 결과안내를 위한 정보수집<br/>
		- 이벤트 참가신청, 참가가능여부, 당첨자발표, 진행사항에 대한 정보 전달<br/><br/>

		수집하는 개인정보의 항목<br/>
		- 성명, 주민번호앞자리(또는 출생년월일) 성별, 연락처 및 휴대폰번호, 결혼경력, 이메일, 학력(또는 최종출신학교), 주거주지(또는 주소), 직업종류(또는 직장명)<br/><br/>

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
		
		※ 정보동의시 가입상담을 위해 최소한의 정보만 수집.이용하게 되며, 본 동의를 거부하시는 경우에는 해당 서비스이용 및 가입상담 등 정상적인 서비스 제공이 불가능 할 수 있습니다.<br/><br/>

		
		</div>
								<label><input type="checkbox" name="r_agree1" value="Y" onclick="agree_click('r_agree_all','r_agree1','r_agree2',1);"> 개인정보 수집 및 이용 동의</label>
							</div>
							<div class="box">
								<div class="txtarea">
		&lt;개인정보의 제공에 관한 안내&gt;<br/><br/>

		[소비자 권익 보호에 관한 사항]<br/><br/>
		최소한의 정보처리 및 동의거부에 대한 안내 : 정보동의시 가입상담 및 고객관리 등을 위해 최소한의 정보만 수집.이용하게 되며, 본 동의를 거부하시는 경우에는 해당 서비스의 이용 및 가입상담 등 정상적인 서비스 제공이 불가능할 수 있음을 알려 드립니다.<br/><br/>
		개인정보 제공동의 철회 : 개인정보 수집ㆍ이용에 동의한 이후에도 전화[대표번호], 서면, 메일 등을 통해 고객정보 관리 등에 대한 개인정보 처리 중지를 요청할 수 있습니다.<br/><br/>
		상품권유 중지청구(Do-Not Call) : 개인정보 제공 및 이용에 동의한 이후에도 전화[대표번호], 서면 등을 통해 마케팅활동에 대한 중지를 요청할 수 있습니다.
		<br/><br/>

		개인정보 제공에 관한 사항<br/><br/>
		1. 개인정보를 제공받는 자 : 듀오 커플매니저 및 이벤트/마케팅 담담<br/><br/>
		2. 개인정보를 제공받는 자의 이용 목적<br/>
		- 회원관리 및 결혼서비스에 관한 상담 및 자료요청 의사 확인<br/>
		- 결혼관련 서비스 상담 및 이용 권유, 각종 서비스 및 이벤트 안내<br/>
		- 테스트 결과안내를 위한 정보수집<br/>
		- 이벤트 참가신청, 참가가능여부, 당첨자발표, 진행사항에 대한 정보 전달<br/><br/>

		3. 제공할 개인정보의 내용<br/><br/>
		- 개인식별정보 (성명, 주민번호앞자리(또는 출생년월일) 성별, 연락처 및 휴대폰번호, 결혼경력, 이메일, 학력(또는 최종출신학교), 주거주지(또는 주소), 직업종류(또는 직장명))<br/><br/>

		4. 제공받는 자의 개인정보 보유 및 이용기간<br/><br/>
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
								<label><input type="checkbox" name="r_agree2" value="Y" onclick="agree_click('r_agree_all','r_agree1','r_agree2',2);"> 마케팅 활용에 동의</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td><a href="javascript:check_right_slide();"><div class="submit_bt"><font style="font-size: 18px;">무료상담신청</font></div></a></td>
				</tr>
				</tbody>
				</table>
				</form>
				<a href="javascript:agree_view(1);" class="btn-close">닫기</a>
			</div>
		</li>
		<li class="simple"><a href="javascript:ViewSimpleAppointment();">간편상담예약</a></li>
		<li class="event"><a href="javascript:agree_view(0);">스피드상담신청</a></li>
		<li class="tel"><a href="javascript:main_consult_popup_view();">무료 상담전화 1577-8333</a></li>
		<li class="top"><a href="javascript:scroll_top();">맨위로</a></li>		
	</ul>
</div>