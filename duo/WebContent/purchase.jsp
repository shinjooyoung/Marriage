<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html xmlns='http://www.w3.org/1999/xhtml'>

<head>
<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'/>
<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1" />
<meta name="naver-site-verification"
	content="9fab0a0cdc321d5be40004ead9b3f0cf4837c8d0" />
<meta name='Subject' content='결혼정보회사 듀오 - 한국대표결혼정보회사' />
<meta name='Title'
	content='결혼정보회사 듀오 - 한국대표결혼정보회사, 초혼, 재혼, 만혼, 노블레스, 결혼정보회사' />
<meta name='Keywords'
	content='결혼정보회사, 결혼정보, 결혼, 결혼해듀오, 듀오,결혼정보업체, 듀오 결혼' />
<meta name='Description'
	content='결혼정보회사,초혼,재혼,노블레스결혼,무료 이상형찾기,맞선,중매,만남주선,미팅파티,베테랑 커플매니저,깊이있는 무료상담,믿을수있는 듀오,100%신원인증,가입비정찰제,고객만족우선,환불규정준수,2012 소비자가 뽑은 가장 신뢰하는 브랜드대상' />

<title>듀오-한국대표결혼정보회사</title>
<link href="/duo/common/css/common.css" rel="stylesheet" type="text/css" />
<link href="/duo/common/css/sub_layout.css" rel="stylesheet"
	type="text/css" />
<link href="/duo/common/css/sub_top_20151002.css" rel="stylesheet"
	type="text/css" />

<link href="/duo/common/css/service.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="/duo/common/js/jquery-1.11.0.min.js"></script>
<script language="javascript" type="text/javascript"
	src="/duo/com_member/common/isValidType.js"></script>
<script language="javascript" type="text/javascript"
	src="/duo/common/flashshow.js"></script>
	
<script type="text/javascript" src="/duo/common/js/include_ex_script.js"></script>
<script type="text/javascript">
	function check_scroll(now_position) {
		/* var marry_position = $(".marry_fee1")
				.position();

		 var remarry_position = $(".remarry_fee").position();
		 var noble_position = $(".noble_fee1")
				.position();  

		alert(marry_position.top +"/"+ remarry_position.top +"/"+ noble_position.top);

		$(".tab_nav").eq(0).html(marry_position.top +"/"+ remarry_position.top +"/"+ noble_position.top +"/"+now_position); */

		/*  if (now_position > 0 && now_position < (remarry_position.top-100))
		{
			$(".tab_nav").removeClass("on");
			$(".tab_nav").removeClass("other");
			$(".tab_nav").addClass("other");
			$(".tab_nav").eq(0).removeClass("other");
			$(".tab_nav").eq(0).addClass("on");
			return;
		} 

		if (now_position > (marry_position.top - 50)
				&& now_position < (noble_position.top - 100)) {
			$(".tab_nav").removeClass("on");
			$(".tab_nav").removeClass("other");
			$(".tab_nav").addClass("other");

			$(".tab_nav").eq(1).removeClass("other");
			$(".tab_nav").eq(1).addClass("on");
			return;
		}

		  if (now_position > (noble_position.top-100))
		{
			$(".tab_nav").removeClass("on");
			$(".tab_nav").removeClass("other");
			$(".tab_nav").addClass("other");
			
			$(".tab_nav").eq(2).removeClass("other");
			$(".tab_nav").eq(2).addClass("on");	
			return;
		}   */
	}
	
	function purchase_submit(){
		
		var u_id=$("#u_id").val();

		$.ajax({
			type:"POST",
			dataType:"TEXT",  
			url:"/duo/ValControl?cmd=purchase_check",
			data:"u_id="+u_id,
			success:function(data) {
				if (data.trim() == "OK") {
					/*$("#idCheck").append( "이미 결제된 사용자" );*/				
					$("#idCheckFlag").val("Y");
					alert("이미결제된 사용자입니다.")
					
				}else {
					/*$("#idCheck").append( "신규 결제 사용자" );*/
					$("#idCheckFlag").val("N");	
					var formnm = document.getElementById("cell");
			 		formnm.action ="/duo/PurchaseControl?cmd=purchase_insert";
			 		formnm.submit();
				}
				},
			error : function(err){
				alert("에러발생 : "+ err);
	      }
				
		}); 
	}
	
	

 	$(function() {
		$("input#p_price").on("keyup", function() {
			var val = String(this.value.replace(/[^0-9]/g, ""));

			if (val.length < 1)
				return false;

			this.value = number_format(val);
		});
	}); 

	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();

		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	}

	function click_sub(num) {
		
		
		
		
		
		var d = new Date();
		var sysDate = leadingZeros(d.getFullYear(), 4) + '-'
				+ leadingZeros(d.getMonth() + 1, 2) + '-'
				+ leadingZeros(d.getDate(), 2);

		var endDate = leadingZeros(d.getFullYear() + 1, 4) + '-'
				+ leadingZeros(d.getMonth() + 1, 2) + '-'
				+ leadingZeros(d.getDate() - 1, 2);

		if (num == 1) {
			tab_scroll_move('marry_fee1');
			
			$("#sub_1").removeClass("other");
			$("#sub_1").addClass("on");
			$("#sub_2").addClass("other");
			$("#sub_3").addClass("other");

			$(".fee-type1").addClass("fee-type_click");
			$(".fee-type2").removeClass("fee-type_click");

			$("#p_rank").val("클래식");
			
			
			if($("#idCheckFlag").val()=="Y"){
				$("#p_sale").val("20%");
				$("#p_price").val(number_format('1200000'));
			}
			
			else if($("#idCheckFlag").val()=="N"){
			$("#p_sale").val("해당없음");
			$("#p_price").val(number_format('1500000'));
			}
			
			
			$("#p_usingterm").val(sysDate + " ~ " + endDate);

		}

		if (num == 2) {
			tab_scroll_move('marry_fee1');
			$("#sub_2").removeClass("other");
			$("#sub_2").addClass("on");
			$("#sub_1").addClass("other");
			$("#sub_3").addClass("other");

			$(".fee-type1").removeClass("fee-type_click");
			$(".fee-type2").addClass("fee-type_click");

			$("#p_rank").val("노블레스");
			
			if($("#idCheckFlag").val()=="Y"){
				$("#p_sale").val("20%");
				$("#p_price").val(number_format('2160000'));
			}
			
			else if($("#idCheckFlag").val()=="N"){
			$("#p_sale").val("해당없음");
			$("#p_price").val(number_format('2700000'));
			}
			

			$("#p_usingterm").val(sysDate + " ~ " + endDate);
		}

		if (num == 3) {
			tab_scroll_move('purchase');
			$("#sub_3").removeClass("other");
			$("#sub_3").addClass("on");

			$("#sub_1").addClass("other");
			$("#sub_2").addClass("other");
		}
	}

	function tab_scroll_move(obj) {

		var offset = $("." + obj).offset();
		$('html, body').animate({
			scrollTop : offset.top
		}, 400);

		/* var now_position = $("#" + obj).position();
		now_position = now_position.top + 80;

		$("body,html").stop().animate({
			"scrollTop" : now_position + "px"
		}, 500); */
	}

	$(document).ready(function() {

		$(".left_radio").click(function() {
			var now_position = $(".left_radio").index(this);

			$(".left_radio").removeClass("radio_off");
			$(".left_radio").removeClass("radio_on");
			$(".left_radio").addClass("radio_off");

			$(".left_radio").eq(now_position).removeClass("radio_off");
			$(".left_radio").eq(now_position).addClass("radio_on");
		});

		$(window).scroll(function() {
			if ($(this).scrollTop() > 187) {
				$(".fee_tab").css("top", "0");
				$(".fee_tab_sub").css("position", "fixed");
				$(".fee_tab_sub").css("top", "10px");

				$(".tab_nav").removeClass("other");
				$(".tab_nav").removeClass("on");
				$(".tab_nav").addClass("other");
				$(".tab_nav").eq(0).removeClass("other");
				$(".tab_nav").eq(0).addClass("on");
			} else {
				$(".fee_tab").css("top", "187px");
				$(".fee_tab_sub").css("position", "static");
				$(".fee_tab_sub").css("top", "10px");

				$(".tab_nav").removeClass("other");
				$(".tab_nav").removeClass("on");
				$(".tab_nav").eq(0).removeClass("other");
				$(".tab_nav").eq(0).addClass("on");
			}

			check_scroll($(this).scrollTop());
		});

	});
</script>
</head>

<body>
	<jsp:include page="/header.jsp" flush="true" />
		<!--상단영역-->
		<!-- 2016-05-06 | 임시팝업
	<script type="text/javascript">
	function popup20160510_close()
	{
		$("#popup20160510").hide();
	}
	</script>
	
	<div style="position:absolute; left:0; top:98px; width:417px; height:462px; z-index:300;" id="popup20160510">
		<div style="width:417px; height:462px; position:relative;">
			<img src="/Duo/popup/img/pop_img_20161208.jpg" />
			<a href="javascript:popup20160510_close();" style="position:absolute; right:10px; top:10px; display:block; width:18px; height:18px; background:url(/duo/popup/img/close_btn.png) no-repeat left top; font-size:0; line-height:0;">팝업닫기</a>
		</div>
	</div>
	<!-- 2016-05-06 | 임시팝업 - startend-->
		<!--내용영역-->
		<style>
#main_pop_bg {
	opacity: 0.8;
	filter: alpha(opacity : '80');
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 100000;
	background-color: rgb(0, 0, 0);
	display: none;
}

#main_consult_popup {
	opacity: 1;
	position: fixed;
	overflow: hidden;
	z-index: 100001;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	text-align: center;
	display: none;
}

#main_consult_popup .align {
	display: inline-block;
	vertical-align: middle;
	height: 100%;
}

#main_consult_popup .content {
	display: inline-block;
	opacity: 1;
	visibility: visible;
	outline: none;
	text-align: left;
	position: relative;
	vertical-align: middle;
	font-family: Malgun Gothic, 맑은 고딕, Dotum, 돋움, Gulim, 굴림;
}

#main_consult_popup .view-wrapper {
	float: left;
	width: 100%;
	min-width: 1040px;
}

#main_consult_popup .view-wrapper span.close {
	display: block;
	float: left;
	width: 1040px;
	text-align: right;
	margin-bottom: 10px;
}

#main_consult_popup .view-wrapper span.st-1 {
	display: block;
	float: left;
	width: 520px;
	height: 580px;
	background: #5298ee url(/duo/main_img_2016/popup_01.gif) center center
		no-repeat;
}

#main_consult_popup .view-wrapper form {
	display: block;
	float: left;
	margin: 0;
	padding: 0;
	padding: 0 80px;
	width: 360px;
	height: 580px;
	padding-top: 40px;
	height: 540px;
	background-color: #ffffff;
}

#main_consult_popup .view-wrapper form a.confirm {
	display: block;
	clear: both;
	float: left;
	width: 360px;
	height: 54px;
	background: #5298ee url(/Duo/main_img_2016/popup_02.gif) center center
		no-repeat;
	font-size: 0;
	line-height: 0;
}

#main_consult_popup .view-wrapper form table {
	width: 100%;
	font-family: Malgun Gothic, 맑은 고딕, Dotum, 돋움, Gulim, 굴림;
}

#main_consult_popup .view-wrapper form table caption {
	display: block;
	margin-top: -1px;
	height: 0;
	color: transparent;
	line-height: 0;
	overflow: hidden;
}

#main_consult_popup .view-wrapper form table td {
	line-height: 36px;
	padding-bottom: 15px;
}

#main_consult_popup .view-wrapper form table .agree {
	height: 34px;
	vertical-align: middle;
}

#main_consult_popup .view-wrapper form table .submit {
	padding-top: 10px;
	height: 37px;
}

#main_consult_popup .view-wrapper form table input[type=text] {
	height: 43px;
	line-height: 43px;
	color: #535353;
	padding: 0 4px;
	font-family: Malgun Gothic, 맑은 고딕, Dotum, 돋움, Gulim, 굴림;
	font-size: 16px;
	background-color: #ffffff;
	border: 1px solid #dedede;
}

#main_consult_popup .view-wrapper form table select {
	height: 44px;
	font-family: Malgun Gothic, 맑은 고딕, Dotum, 돋움, Gulim, 굴림;
	font-size: 16px;
	color: #535353;
	background-color: #ffffff;
	border: 1px solid #dedede;
	line-height: 31px;
}

#main_consult_popup .view-wrapper form table select {
	height: auto;
	padding: 10px 0;
	\0
	/ie8+9;
}

#main_consult_popup .view-wrapper form table label {
	font-size: 14px;
	color: #535353;
}

#main_consult_popup .view-wrapper form table .field {
	margin-right: 5px;
}

#main_consult_popup .view-wrapper form table input[type=checkbox],
	#main_consult_popup .view-wrapper form table input[type=radio] {
	display: none;
	position: absolute;
	z-index: -1;
}

#main_consult_popup .view-wrapper form table textarea {
	height: 44px;
	line-height: 22px;
	color: #535353;
	padding: 0 4px;
	font-family: Malgun Gothic, 맑은 고딕, Dotum, 돋움, Gulim, 굴림;
	font-size: 14px;
	background-color: #ffffff;
	border: 1px solid #dedede;
}

#main_consult_popup .view-wrapper form table label.sex {
	display: inline-block;
	width: 85px;
	height: 44px;
	position: relative;
	font-size: 0;
	line-height: 100%;
}

#main_consult_popup .view-wrapper form table .man {
	background: url(/duo/main_img_2016/popup_sex_m_off.gif) left top
		no-repeat;
}

#main_consult_popup .view-wrapper form table .man_on {
	background: url(/duo/main_img_2016/popup_sex_m_on.gif) left top
		no-repeat;
}

#main_consult_popup .view-wrapper form table .woman {
	margin-left: -1px;
	background: url(/duo/main_img_2016/popup_sex_w_off.gif) left top
		no-repeat;
}

#main_consult_popup .view-wrapper form table .woman_on {
	margin-left: -1px;
	background: url(/duo/main_img_2016/popup_sex_w_on.gif) left top
		no-repeat;
}

#main_consult_popup .view-wrapper form table label.marry {
	display: inline-block;
	width: 83px;
	height: 42px;
	font-size: 16px;
	text-align: center;
	line-height: 41px;
}

#main_consult_popup .view-wrapper form table .on {
	background: #6f7e91;
	border: 1px solid #6f7e91;
	color: #ffffff;
}

#main_consult_popup .view-wrapper form table .off {
	background: #ffffff;
	border: 1px solid #dbdbdb;
	color: #333333;
}

#main_consult_popup .view-wrapper form table .second {
	margin-left: -1px;
}

#main_consult_popup .view-wrapper form .privacy {
	display: block;
	position: absolute;
	padding: 10px;
	width: 480px;
	height: 104px;
	background: #ffffff;
	top: 0;
	border: 1px solid #e7e7e7;
	left: -520px;
}

#main_consult_popup .view-wrapper form .privacy img.close {
	display: block;
	position: absolute;
	width: 13px;
	height: 13px;
	right: -5px;
	top: -5px;
}

#main_consult_popup .view-wrapper form .privacy span.all {
	display: block;
	float: left;
	width: 100%;
	height: 16px;
	margin-bottom: 10px;
	font-size: 12px;
}

#main_consult_popup .view-wrapper form .privacy span.each {
	display: block;
	float: left;
	width: 100%;
	height: 16px;
	font-size: 12px;
}

#main_consult_popup .view-wrapper form .privacy span.agree-type {
	display: block;
	float: left;
	width: 230px;
	height: 50px;
	font-size: 11px;
	border: 1px solid #e2e2e2;
	overflow-x: auto;
	margin-bottom: 10px;
}
</style>
		<script type="text/javascript">
			function main_consult_popup_view(u_div) {
				$
						.ajax({
							url : "/duo/include/inc_service_consult_html.asp",
							data : "u_div=" + u_div,
							success : function(data) {
								$("#main_consult_popup").html(data);

								$(".mc_sex_input")
										.unbind()
										.bind(
												"click",
												function(e) {
													var now_position = $(
															".mc_sex_input")
															.index(this);

													if (now_position == 0) {
														$(".mc_sex_rd").eq(0)
																.removeClass(
																		"man");
														$(".mc_sex_rd")
																.eq(0)
																.removeClass(
																		"man_on");
														$(".mc_sex_rd")
																.eq(0)
																.addClass(
																		"man_on");

														$(".mc_sex_rd")
																.eq(1)
																.removeClass(
																		"woman");
														$(".mc_sex_rd")
																.eq(1)
																.removeClass(
																		"woman_on");
														$(".mc_sex_rd")
																.eq(1)
																.addClass(
																		"woman");
													} else {
														$(".mc_sex_rd").eq(0)
																.removeClass(
																		"man");
														$(".mc_sex_rd")
																.eq(0)
																.removeClass(
																		"man_on");
														$(".mc_sex_rd")
																.eq(0)
																.addClass("man");

														$(".mc_sex_rd")
																.eq(1)
																.removeClass(
																		"woman");
														$(".mc_sex_rd")
																.eq(1)
																.removeClass(
																		"woman_on");
														$(".mc_sex_rd")
																.eq(1)
																.addClass(
																		"woman_on");
													}

												});

								$(".mc_married_input").unbind().bind(
										"click",
										function(e) {
											check_label_base_radio(
													"mc_married_input", this,
													"mc_married_rd", "on",
													"off");
										});

								$(".mc_tx_content")
										.focus(
												function() {
													if ($(".mc_tx_content")
															.html() == "문의사항 입력") {
														$(".mc_tx_content")
																.html("")
													}
												});

								$("html").css("overflow", "hidden"); // 바닥레이어 스크롤바 숨김

								$("body")
										.on(
												"keydown.disableScroll",
												function(e) {
													var eventKeyArray = [ 32,
															33, 34, 35, 36, 37,
															38, 39, 40 ];
													for (var i = 0; i < eventKeyArray.length; i++) {
														if (e.keyCode === eventKeyArray[i]) {
															e.preventDefault();
															return;
														}
													}
												});

								$("#main_pop_bg").show();
								$("#main_consult_popup").css("top", "0px");
								$("#main_consult_popup").css("left", "-1500px");

								$("#main_consult_popup").show();
								$("#main_consult_popup").animate({
									"left" : "0px"
								}, 600);
							},
							error : function(data) {
								alert("팝업을 불러오지 못했습니다. 다시 시도해 주세요.");
								return;
							}
						});
			}
			function main_consult_popup_close() {
				$("#main_consult_popup").hide();
				$("#main_pop_bg").hide();
				$("body").off(".disableScroll");
				$("html").css("overflow", ""); //바닥레이어 스크롤바 복귀
			}

			function mc_agree_view(v_type) {
				if (v_type == 1) {
					$(".mc_agree_area").eq(0).hide();
				} else {
					$(".mc_agree_area").eq(0).show();
				}
			}

			function check_label_base_radio(c_name, obj, rd_class, on_class,
					off_class) {
				var rd_index = $("." + c_name).index(obj);

				$("." + rd_class).removeClass(off_class);
				$("." + rd_class).removeClass(on_class);
				$("." + rd_class).addClass(off_class);

				$("." + rd_class).eq(rd_index).removeClass(off_class);
				$("." + rd_class).eq(rd_index).addClass(on_class);
			}

			function main_consult_popup_check() {
				var formnm = document.MCForm;
				formnm.action = "/duo/membership/marriage_guide_proc.asp";

				if (formnm.u_name.value == "이름" || formnm.u_name.value == "") {
					alert("이름을 입력하여 주세요.");
					formnm.u_name.focus();
					return;
				}

				if (!isValidType(formnm.u_name, 'text', '이름을 입력하여 주세요.')) {
					return;
				}
				if (checkstring(formnm.u_name.value) == true) {
					alert("이름입력에 특수문자는 입력할수 없습니다.");
					return;
				}
				if (!check_input_byte(formnm.u_name.value, 10)) {
					alert("입력 할 수 있는 문자길이를 초과하였습니다.");
					return;
				}

				if (!isValidType(formnm.u_ident1, 'select', '출생년을 선택해 주세요.')) {
					return;
				}
				if (!isValidType(formnm.u_ident2, 'check', '성별을 선택하여 선택하여 주세요.')) {
					return;
				}
				if (!isValidType(formnm.u_married, 'check', '결혼 경력을 선택하여 주세요.')) {
					return;
				}

				if (!isValidType(formnm.u_work, 'select', '직업종류를 선택하여 주세요.')) {
					return;
				}
				if (!isValidType(formnm.u_edu, 'select', '학력을 선택하여 주세요.')) {
					return;
				}

				if (!isValidType(formnm.u_mtel1, 'select', '핸드폰 앞자리를 선택하여 주세요.')) {
					return;
				}
				if (!isValidType(formnm.u_mtel2, 'number',
						'핸드폰 중간자리를 입력하여 주세요.')) {
					return;
				}
				if (!isValidType(formnm.u_mtel3, 'number', '핸드폰 끝자리를 입력하여 주세요.')) {
					return;
				}

				if (!hp_chck_array(formnm.u_mtel2.value)
						&& !hp_chck_array(formnm.u_mtel3.value)) {
					alert("핸드폰 번호가 올바르지 않습니다.");
					formnm.u_mtel3.focus();
					return;
				}

				if (checkEmail(formnm.u_email, formnm.u_email_domain,
						formnm.u_email_domain_select) == false) {
					return;
				}

				if (!isValidType(formnm.u_dwell, 'select', '거주지역을 선택하여 주세요.')) {
					return;
				}

				if (!agree_check('m_agree_all', 'm_agree1', 'm_agree2')) {
					$(".mc_agree_area").eq(0).show();
					return;
				}

				google_ga("send", "event", "PC상담신청", "버튼클릭", "무료상담전화");

				formnm.submit();
			}
		</script>
		<div id="main_pop_bg"></div>
		<div id="main_consult_popup"></div>

		<div id="membershipfee">
			<div
				style="display: block; margin: 0 auto; width: 1120px; overflow: hidden;">
				<!--왼쪽-->
				<div class="left_box">
					<span class="menu"> <span class="st-1"><a
							href="/duo/service/main.asp">가입안내</a></span>
						<ul>
							<li><a href="/duo/service/know.asp">왜 듀오일까요?</a></li>
							<li><a href="/duo/service/number_duo.asp">숫자로 보는 듀오</a></li>
							<li><a href="/duo/service/program01.asp">서비스 종류</a></li>
							<li style="background: #5a6077; color: #ffffff;"><a
								href="/Duo/service/service.asp">가입비 안내</a></li>
							<li><a href="/duo/service/matching_01.asp">가입 및 활동절차</a></li>
							<li><a href="/duo/service/matching_02.asp">매칭시스템</a></li>
							<li><a href="/duo/service/consult.asp">상담방법</a></li>
							<li><a href="/duo/service/members.asp">멤버스클럽 소개</a></li>
							<li><a href="/duo/service/marriage_consult.asp">자녀결혼 컨설팅</a></li>
							<li><a href="/duo/service/free_service/201611_main_01.asp">서비스
									무료체험</a></li>
							<li><a href="/duo/service/duo_faq.asp">결혼! 궁금해요</a></li>
						</ul>
					</span> <a class="simulation" href="/Duo/service/simulation.asp">회원가입
						시뮬레이션</a> <a class="freeconsult" href="/Duo/service/profile.asp">희망상대
						무료추천</a>
					<form class="freeservice">
						<span class="box"> <span class="st-1">안내자료<br>무료
									서비스</span> <span
							style="display: block; float: left; width: 120px; padding: 10px 20px;">
								<!--클릭시 변경만 되면 됩니다. radio_on radio_off--> <span
								class="left_radio radio_off">초혼</span> <span
								class="left_radio radio_off">재혼</span>
						</span> <a href="/Duo/membership/marriage_guide.asp" class="submit">신청하기</a>
						</span>
					</form>
					<style>
#membershipfee .left_box .network {
	display: block;
	float: left;
	width: 160px;
}

#membershipfee .left_box .network span.st-1 {
	display: block;
	float: left;
	width: 100%;
	height: 18px;
	font-size: 11px;
	color: #262626;
	text-align: center;
	line-height: 15px;
}

#membershipfee .left_box .network {
	display: block;
	float: left;
	width: 160px;
}

#membershipfee .left_box .network ul.jisa {
	display: block;
	float: left;
	width: 160px;
}

#membershipfee .left_box .network ul.jisa .jisa01 {
	display: block;
	float: left;
	width: 160px;
	height: 57px;
	margin: 0 0 15px 0;
	background: url(/duo/include/left/img/jisa_01.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa01:hover {
	display: block;
	float: left;
	width: 160px;
	height: 57px;
	margin: 0 0 15px 0;
	background: url(/duo/include/left/img/jisa_01_on.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa11 {
	display: block;
	float: left;
	width: 80px;
	height: 47px;
	background: url(/duo/include/left/img/jisa_11.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa11:hover {
	display: block;
	float: left;
	width: 80px;
	height: 47px;
	background: url(/duo/include/left/img/jisa_11_on.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa10 {
	display: block;
	float: left;
	width: 80px;
	height: 47px;
	background: url(/duo/include/left/img/jisa_10.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa10:hover {
	display: block;
	float: left;
	width: 80px;
	height: 47px;
	background: url(/duo/include/left/img/jisa_10_on.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa35 {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_35.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa35:hover {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_35_on.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa30 {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_30.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa30:hover {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_30_on.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa51 {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_51.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa51:hover {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_51_on.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa31 {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_31.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa31:hover {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_31_on.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa20 {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_20.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa20:hover {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_20_on.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa12 {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_12.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa12:hover {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_12_on.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa40 {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_40.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa40:hover {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_40_on.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa50 {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_50.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa50:hover {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_50_on.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa75 {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_75.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa75:hover {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_75_on.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa70 {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_70.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa .jisa70:hover {
	display: block;
	float: left;
	width: 80px;
	height: 46px;
	background: url(/duo/include/left/img/jisa_70_on.jpg) left top no-repeat;
}

#membershipfee .left_box .network ul.jisa li a {
	display: block;
	float: left;
	width: 100%;
	height: 100%;
	font-size: 0;
	line-height: 100%;
}
</style>
					<div class="network">
						<span class="st-1" style="margin: 23px 0 0 0;">DUO NETWORK</span>
						<span class="st-1" style="margin: 0 0 13px 0; color: #a4a4a4;">가까운
							곳에 듀오가 있습니다</span>
						<ul class="jisa">
							<li class="jisa01"><a target="_blank"
								href="/Duo/jisa/jisa_main.asp?n_type=01"></a></li>
							<li class="jisa11"><a target="_blank"
								href="/Duo/jisa/jisa_main.asp?n_type=11"></a></li>
							<li class="jisa10"><a target="_blank"
								href="/Duo/jisa/jisa_main.asp?n_type=10"></a></li>
							<li class="jisa35"><a target="_blank"
								href="/Duo/jisa/jisa_main.asp?n_type=35"></a></li>
							<li class="jisa30"><a target="_blank"
								href="/Duo/jisa/jisa_main.asp?n_type=30"></a></li>
							<li class="jisa51"><a target="_blank"
								href="/Duo/jisa/jisa_main.asp?n_type=51"></a></li>
							<li class="jisa31"><a target="_blank"
								href="/Duo/jisa/jisa_main.asp?n_type=31"></a></li>
							<li class="jisa20"><a target="_blank"
								href="/Duo/jisa/jisa_main.asp?n_type=20"></a></li>
							<li class="jisa12"><a target="_blank"
								href="/Duo/jisa/jisa_main.asp?n_type=12"></a></li>
							<li class="jisa40"><a target="_blank"
								href="/Duo/jisa/jisa_main.asp?n_type=40"></a></li>
							<li class="jisa50"><a target="_blank"
								href="/Duo/jisa/jisa_main.asp?n_type=50"></a></li>
							<li class="jisa75"><a target="_blank"
								href="/Duo/jisa/jisa_main.asp?n_type=75"></a></li>
							<li class="jisa70"><a target="_blank"
								href="/Duo/jisa/jisa_main.asp?n_type=70"></a></li>
						</ul>
					</div>
				</div>
				<!--왼쪽-->



				<div class="content_box">
					<div class="fee_tab" style="z-index: 99">
						<div class="fee_tab_sub" >
						<input type="hidden" name="u_id" id="u_id" value="<%=session.getAttribute("userId") %>" />
						<a href="javascript:click_sub('1');" ><span class="on" id="sub_1">클래식서비스</span></a> 
						<a href="javascript:click_sub('2');"><span class="other" id="sub_2">노블레스 서비스</span></a>
						<a href="javascript:click_sub('3');"><span class="other" id="sub_3">결제화면가기</span></a>
						<input type="hidden" name="idCheckFlag" id="idCheckFlag" value="N" />
									
							<!-- <a href="javascript:tab_scroll_move('remarry_fee');"><span class="tab_nav remarry">결제화면 가기</span></a> -->
									
						</div>
						<!--
				초혼 서비스 가입비 안내에서 <span class="on"></span> 
				다른 서비스는 <span class="other"></span> 로 해주세요
				<div class="fee_tab_sub">
					<a href="#s1"><span class="on">초혼서비스</span></a>
					<a href="#s2"><span class="remarry other" style="margin:0 1px;">재혼서비스</span></a>
					<a href="#s3"><span class="other">노블레스 서비스</span></a>
				</div>
				-->
					</div>
					<div class="top_box">
						<span class="txt-type1">HOME / 가입안내 / 가입비 안내</span>
						<h2 class="txt-type1">가입안내</h2>
						<h3 class="txt-type1">가입자격 및 가입비</h3>
						<span class="txt-type2">모든 프로그램의 성혼 사례비는 없습니다.</span>
					</div>
					<div class="marry_fee1">
						<h3 class="txt-type1">서비스 가입비 안내</h3>
						<span
							style="display: block; float: left; width: 918px; margin: 55px 0 0 0;">
							<table>
								<tbody>
									<tr height="50">&nbsp;</tr>
									<tr>
										
										<td width="50">&nbsp;</td>
										<td width="181"><span class="txt-type1">클래식 서비스</span></td>
										<td width="85"><img src="/duo/service/img/st_83.png" /><span
											class="hide">남성</span></td>
										<!-- 								<td width="266"><span class="txt-type2">39세 이하</span><span class="txt-type3">듀오 회원가입 기준에 준하는 학력<br />이상의 안정적인 직업을 갖춘 미혼 고객</span></td>
 -->
										<td width="85"><img src="/duo/service/img/st_84.png" /><span
											class="hide">남성</span></td>
										<!-- 								<td width="251"><span class="txt-type2">35세 이하</span><span class="txt-type3">듀오 회원가입 기준에 준하는 학력<br />이상의 미혼 고객</span></td>-->

										<td width="120">&nbsp;</td>
										<td width="195" valign="top"><span class="txt-type1-1">노블레스
												서비스</span></td>
										<td width="85" valign="top"><img
											src="/duo/service/img/st_102.png" /><span class="hide">남성</span></td>
										<!-- <td width="254" valign="top">
									<span class="txt-type2">ㆍ대기업 공기업 금융권 연구원<br />&nbsp;&nbsp;&nbsp;외국계 회사 근무자</span>
									<span class="txt-type2">ㆍ의사 변호사 회계사 교수 <br />&nbsp;&nbsp;&nbsp;고시합격자 등 전문직 종사자</span>
									<span class="txt-type2">ㆍ경제력 있는 기업의 대표</span>
									<span class="txt-type2">ㆍ기업가, 전문직, 금융기관,<br />&nbsp;&nbsp;&nbsp;임원이상의 자녀로 안정적인<br />&nbsp;&nbsp;&nbsp;직업 종사자</span>
								</td> -->
										<td width="85" valign="top"><img
											src="/duo/service/img/st_103.png" /><span class="hide">여성</span></td>
										<!-- <td width="274" valign="top">
									<span class="txt-type2">ㆍ대기업 공기업 금융권 연구원<br />&nbsp;&nbsp;&nbsp;외국계 회사 근무자</span>
									<span class="txt-type2">ㆍ교사 약사 회계사 의사 변호사 <br />&nbsp;&nbsp;&nbsp;고시합격자</span>
									<span class="txt-type2">ㆍ아나운서, 스튜어디스, 프리랜서, <br />&nbsp;&nbsp;&nbsp;미인대회 출신자</span>
									<span class="txt-type2">ㆍ경제력이 풍부한 기업가, 전문직,<br />&nbsp;&nbsp;&nbsp;금융기관, 임원이상의 자녀 </span>
								</td> -->


									</tr>
								</tbody>
							</table>
						</span> <span class="fee-type1" onclick="click_sub('1')"> <span class="txt-type1">클래식
								서비스 1,400,000원 (vat 별도)</span> <span class="box"> <span
								class="cell"> <span class="term">전문 커플매니저를 통한 1:1
										만남</span> <span class="term">이벤트 신청시, 우선 참석권과 매칭서비스</span> <span
									class="term">멤버스 클럽 회원검색 프로포즈</span> <span class="term">추가
										서비스 만남 제공</span> <span class="term">매칭 상대 사진 제공 </span>
							</span>
						</span>
						</span> <span class="fee-type2" onclick="click_sub('2')"> <span class="txt-type1">노블레스
								서비스 2,700,000원 (vat 별도)</span> <span class="box"> <span
								class="cell"> <span class="term">전문 커플매니저를 통한 1:1
										만남</span> <span class="term">이벤트 신청시, 우선 참석권과 매칭서비스</span> <span
									class="term">멤버스 클럽 회원검색 프로포즈</span> <span class="term"
									style="height: 66px; background: url(/duo/service/img/icon_08.gif) left 10px no-repeat;">회원
										전용 노블레스 파티 참석 가능<br />
									<span style="font-size: 12px;">(별도의 참가비 없이 횟수만 1회 적용)</span>
								</span> <span class="term">노블레스 파티 참석시 : 프로포즈 1명 가능</span> <span
									class="term"
									style="height: 66px; background: url(/duo/service/img/icon_08.gif) left 10px no-repeat;">파티에서
										커플이 안될 경우 참석 회원에게<br />애프터 신청 가능
								</span> <span class="term">추가 서비스 만남 제공</span> <span class="term">매칭
										상대 사진 제공</span> <span class="term blank"></span>
							</span>
						</span> <!-- <span class="txt-type1">클래식 B 서비스 1,200,000원 (vat 별도)</span>
					<span class="box">
						<span class="cell">
							<span class="term">전문 커플매니저를 통한 1:1 만남</span>
							<span class="term">이벤트 신청시, 우선 참석권과 매칭서비스</span>
							<span class="term">멤버스 클럽 회원검색 프로포즈</span>
							<span class="term blank"></span>
							<span class="term blank"></span>
						</span>
					</span> -->
						</span>
						<!-- <span class="fee-type3">
					<span class="txt-type1">클래식 스페셜 서비스 2,000,000원 (vat 별도)</span>
					<span class="box">
						<span class="cell">
							<span class="term">전문 커플매니저를 통한 1:1 만남</span>
							<span class="term">이벤트 신청시, 우선 참석권과 매칭서비스</span>
							<span class="term">멤버스 클럽 회원검색 프로포즈</span>
							<span class="term">추가 서비스 만남 제공</span>
							<span class="term">매칭 상대 사진 제공</span>
							<span class="term">밀착 관리 프로그램</span>
						</span>
					</span>
				</span>   -->
					</div>
					<div class="purchase">

						<span
							style="display: block; float: left; width: 918px; margin: 70px 0 0 0;">
							<table>
								<tbody>
									<tr>
										<td width="64">&nbsp;</td>
										<td width="157"><span class="txt-type1">결제 서비스</span></td>
										<td width="85"><img src="/duo/service/img/st_118.png" />
									</tr>
								</tbody>
							</table>
						</span> <span class="fee-type1"> <span class="txt-type1">결제서비스아이콘 자리</span> 
						
						<span class="box">
							<form id ="cell" class="cell" method='post'>
						
									<span class="term"> <label>상품명</label> <input type='text' id="p_rank" name="p_rank" readonly /> </span>
									<span class="term"> <label>할인율 </label> <input type='text' id="p_sale" name="p_sale"readonly /> </span>
									<span class="term"> <label>결제방식</label> <select name="method" id="p_method" name="p_method"> 
											<option value="cash">무통장 입금</option>
											<option value="card">현금결제</option>
									</select>  </span>
									<span class="term"> <label>이용기간 </label> <input type='text' id="p_usingterm" name="p_usingterm" readonly /> </span>
									<span class="term"> <label>금액</label> <input type='text' id="p_price" name="p_price"readonly /> </span>
									<input type='hidden' id="p_id" name="p_id" value='' />
									<span class="purbtn" id="purbtn" onclick= "purchase_submit();">
									 <label class="txt-purchase" >결제하기</label>
									</span>
						
							</form>
							
							
						
						</span> <!-- <span class="term">매칭 상대 사진 제공</span> -->

						</span> 
					</div>






					<!-- <span style="display:block; float:left; width:918px;">
					<table>
						<tbody>
							<tr>
								<td width="50">&nbsp;</td>
								<td width="181"><span class="txt-type1">하모니 서비스</span></td>
								<td width="85"><img src="/duo/service/img/st_89.png" /><span class="hide">남성</span></td>
								<td width="266"><span class="txt-type2">40세 이상</span><span class="txt-type3">듀오 회원가입 기준에 준하는 학력<br />이상의 안정적인 직업을 갖춘 미혼 고객</span></td>
								<td width="85"><img src="/duo/service/img/st_90.png" /><span class="hide">여성</span></td>
								<td width="251"><span class="txt-type2">36세 이상</span><span class="txt-type3">듀오 회원가입 기준에 준하는 학력<br />이상의 미혼 고객</span></td>
							</tr>
						</tbody>
					</table>
				</span>
				<span class="fee-type1">
					<span class="txt-type1">하모니 서비스 1,600,000원 (vat 별도)</span>
					<span class="box">
						<span class="cell">
							<span class="term">전문 커플매니저를 통한 1:1 만남</span>
							<span class="term">이벤트 신청시, 우선 참석권과 매칭서비스</span>
							<span class="term">멤버스 클럽 회원검색 프로포즈</span>
							<span class="term">추가 서비스 만남 제공</span>
							<span class="term">매칭 상대 사진 제공 </span>
						</span>
					</span>
				</span>
				<span class="fee-type2">
					<span class="txt-type1">하모니 스페셜 서비스 2,000,000원 (vat 별도)</span>
					<span class="box">
						<span class="cell">
							<span class="term">전문 커플매니저를 통한 1:1 만남</span>
							<span class="term">이벤트 신청시, 우선 참석권과 매칭서비스</span>
							<span class="term">멤버스 클럽 회원검색 프로포즈</span>
							<span class="term">추가 서비스 만남 제공</span>
							<span class="term">매칭 상대 사진 제공</span>
							<span class="term">밀착 관리 프로그램</span>
						</span>
					</span>
				</span>
				<span class="fee-type3">
					<span class="txt-type1">하모니 스페셜 서비스 2,000,000원 (vat 별도)</span>
					<span class="box">
						<span class="cell">
							<span class="term">전문 커플매니저를 통한 1:1 만남</span>
							<span class="term">이벤트 신청시, 우선 참석권과 매칭서비스</span>
							<span class="term">멤버스 클럽 회원검색 프로포즈</span>
							<span class="term">추가 서비스 만남 제공</span>
							<span class="term">매칭 상대 사진 제공</span>
							<span class="term">밀착 관리 프로그램</span>
						</span>
					</span>
				</span> -->
				</div>
				<!-- <div class="consult_box" style="height:254px;">
				<span>당신의 결혼을 듀오에서 책임지고 관리해 드리겠습니다.</span>
				<a href="javascript:main_consult_popup_view();" class="marry">초혼서비스 문의</a>
				<a href="/duo/membership/marriage_guide.asp" class="consult">안내자료 요청</a>
			</div>  -->
				<!-- <div class="remarry_fee">
				<h3 class="txt-type1">재혼서비스 가입비 안내</h3>
				<span style="display:block; float:left; width:918px; margin:55px 0 0 0;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="재혼서비스 가입 자격 안내">
						<caption>재혼서비스 가입 자격 안내</caption>
						<tbody>
							<tr>
								<td width="49">&nbsp;</td>
								<td width="216"><span class="txt-type1">재혼 하모니 서비스</span></td>
								<td width="85"><img src="/duo/service/img/st_96.png" /><span class="hide">남성</span></td>
								<td width="260"><span class="txt-type2">사실혼, 사별, 이혼 등<br />결혼 경험이 있으신 분</span></td>
								<td width="85"><img src="/duo/service/img/st_97.png" /><span class="hide">여성</span></td>
								<td width="215"><span class="txt-type2">사실혼, 사별, 이혼 등<br />결혼 경험이 있으신 분</span></td>
							</tr>
						</tbody>
					</table>
				</span>
				기존 재혼가입비span class="fee-type1">
					<span class="txt-type1">하모니 서비스 가입비 1,600,000원 (vat 별도)</span>
					<span class="box">
						<span class="cell">
							<span class="term">전문 커플매니저를 통한 1:1 만남</span>
							<span class="term">이벤트 신청시, 우선 참석권과 매칭서비스</span>
							<span class="term">멤버스 클럽 회원검색 프로포즈</span>
							<span class="term">추가 서비스 만남 제공</span>
							<span class="term">매칭 상대 사진 제공 </span>
						</span>
					</span>
				</span>
				<span class="fee-type2">
					<span class="txt-type1">하모니 B 서비스 가입비 1,400,000원 (vat 별도)</span>
					<span class="box">
						<span class="cell">
							<span class="term">전문 커플매니저를 통한 1:1 만남</span>
							<span class="term">이벤트 신청시, 우선 참석권과 매칭서비스</span>
							<span class="term">멤버스 클럽 회원검색 프로포즈 </span>
							<span class="term blank"></span>
							<span class="term blank"></span>
						</span>
					</span>
				</span
				<span class="fee-type3">
					<span class="txt-type1">하모니 스페셜 서비스 가입비 2,000,000원 (vat 별도)</span>
					<span class="box">
						<span class="cell">
							<span class="term">전문 커플매니저를 통한 1:1 만남</span>
							<span class="term">이벤트 신청시, 우선 참석권과 매칭서비스</span>
							<span class="term">멤버스 클럽 회원검색 프로포즈</span>
							<span class="term">추가 서비스 만남 제공</span>
							<span class="term">매칭 상대 사진 제공</span>
							<span class="term">밀착 관리 프로그램</span>
						</span>
					</span>
				</span>
			</div>
			<div class="consult_box">
				<span>당신의 결혼을 듀오에서 책임지고 관리해 드리겠습니다.</span>
				<a href="javascript:main_consult_popup_view();" class="remarry">재혼서비스 문의</a>
				<a href="/duo/membership/marriage_guide.asp" class="consult">안내자료 요청</a>
			</div> -->
				<!-- <div class="noble_fee1">
				<h3 class="txt-type1">노블레스서비스 가입비 안내</h3>
				<span style="display:block; float:left; width:918px; margin:45px 0 0 0;">
					<table>
						<tbody>
							<tr>
								<td width="25">&nbsp;</td>
								<td width="195" valign="top"><span class="txt-type1">노블레스 서비스</span></td>
								<td width="85" valign="top"><img src="/duo/service/img/st_102.png" /><span class="hide">남성</span></td>
								<td width="254" valign="top">
									<span class="txt-type2">ㆍ대기업 공기업 금융권 연구원<br />&nbsp;&nbsp;&nbsp;외국계 회사 근무자</span>
									<span class="txt-type2">ㆍ의사 변호사 회계사 교수 <br />&nbsp;&nbsp;&nbsp;고시합격자 등 전문직 종사자</span>
									<span class="txt-type2">ㆍ경제력 있는 기업의 대표</span>
									<span class="txt-type2">ㆍ기업가, 전문직, 금융기관,<br />&nbsp;&nbsp;&nbsp;임원이상의 자녀로 안정적인<br />&nbsp;&nbsp;&nbsp;직업 종사자</span>
								</td>
								<td width="85" valign="top"><img src="/duo/service/img/st_103.png" /><span class="hide">여성</span></td>
								<td width="274" valign="top">
									<span class="txt-type2">ㆍ대기업 공기업 금융권 연구원<br />&nbsp;&nbsp;&nbsp;외국계 회사 근무자</span>
									<span class="txt-type2">ㆍ교사 약사 회계사 의사 변호사 <br />&nbsp;&nbsp;&nbsp;고시합격자</span>
									<span class="txt-type2">ㆍ아나운서, 스튜어디스, 프리랜서, <br />&nbsp;&nbsp;&nbsp;미인대회 출신자</span>
									<span class="txt-type2">ㆍ경제력이 풍부한 기업가, 전문직,<br />&nbsp;&nbsp;&nbsp;금융기관, 임원이상의 자녀 </span>
								</td>
							</tr>
						</tbody>
					</table>
				</span>
				<span class="fee-type1">
					<span class="txt-type1">노블레스 서비스 2,700,000원 (vat 별도)</span>
					<span class="box">
						<span class="cell">
							<span class="term">전문 커플매니저를 통한 1:1 만남</span>
							<span class="term">이벤트 신청시, 우선 참석권과 매칭서비스</span>
							<span class="term">멤버스 클럽 회원검색 프로포즈</span>
							<span class="term" style="height:66px; background:url(/duo/service/img/icon_08.gif) left 10px no-repeat;">회원 전용 노블레스 파티 참석 가능<br /><span style="font-size:12px;">(별도의 참가비 없이 횟수만 1회 적용)</span></span>
							<span class="term">노블레스 파티 참석시 : 프로포즈 1명 가능</span>
							<span class="term" style="height:66px; background:url(/duo/service/img/icon_08.gif) left 10px no-repeat;">파티에서 커플이 안될 경우 참석 회원에게<br />애프터 신청 가능</span>
							<span class="term">추가 서비스 만남 제공</span>
							<span class="term">매칭 상대 사진 제공</span>
							<span class="term blank"></span>
						</span>
					</span>
				</span> 
			 <span class="fee-type2">
					<span class="txt-type1">노블레스 스페셜 서비스 3,600,000원 (vat 별도)</span>
					<span class="box">
						<span class="cell">
							<span class="term">전문 커플매니저를 통한 1:1 만남</span>
							<span class="term">이벤트 신청시, 우선 참석권과 매칭서비스</span>
							<span class="term">멤버스 클럽 회원검색 프로포즈</span>
							<span class="term" style="height:66px; background:url(/duo/service/img/icon_08.gif) left 10px no-repeat;">회원 전용 노블레스 파티 참석 가능<br /><span style="font-size:12px;">(별도의 참가비 없이 횟수만 1회 적용)</span></span>
							<span class="term">노블레스 파티 참석시 : 프로포즈 1명 가능</span>
							<span class="term" style="height:66px; background:url(/duo/service/img/icon_08.gif) left 10px no-repeat;">파티에서 커플이 안될 경우 참석 회원에게<br />애프터 신청 가능</span>
							<span class="term">추가 서비스 만남 제공</span>
							<span class="term">매칭 상대 사진 제공</span>
							<span class="term">전문직 포함 만남 제공 가능 </span>
						</span>
					</span>
				</span>  
			</div> -->
				<!-- <div class="noble_fee2">
				<span style="display:block; float:left; width:918px; margin:70px 0 0 0;">
					<table>
						<tbody>
							<tr>
								<td width="64">&nbsp;</td>
								<td width="157"><span class="txt-type1">전문직 서비스</span></td>
								<td width="85"><img src="/Duo/service/img/st_83.png" /><span class="hide">남성</span></td>
								<td width="612"><span class="txt-type2">감평사, 검사, 교수, 변리사, 변호사, 의사, 치과의사<br />한의사, 회계사, 공중보건의, 고시합격자 등 전문직 종사자</span></td>
							</tr>
						</tbody>
					</table>
				</span>
		 	<span class="fee-type1">
					<span class="txt-type1">노블레스 전문직 서비스 1,800,000원 (vat 별도)</span>
					<span class="box">
						<span class="cell">
							<span class="term">전문 커플매니저를 통한 1:1 만남</span>
							<span class="term">이벤트 신청시, 우선 참석권과 매칭서비스</span>
							<span class="term">멤버스 클럽 회원검색 프로포즈</span>
							<span class="term" style="height:66px; background:url(/duo/service/img/icon_08.gif) left 10px no-repeat;">회원 전용 노블레스 파티 참석 가능<br /><span style="font-size:12px;">(별도의 참가비 없이 횟수만 1회 적용)</span></span>
							<span class="term">노블레스 파티 참석시 : 프로포즈 1명 가능</span>
							<span class="term">파티에서 커플이 안될 경우 참석 회원에게 애프터 신청 가능</span>
							<span class="term">추가 서비스 만남 제공</span>
							<span class="term">매칭 상대 사진 제공</span>
						</span>
					</span>
				</span> 
			</div> -->
				<!-- <div class="noble_fee3">
				<h3 class="txt-type1">오블리주, 플래티늄 서비스</h3>
				<span class="fee-type1">
					<span class="txt-type1">오블리주 서비스 5,400,000원 (vat 별도)</span>
					<span class="box">
						<span class="cell">
							<span class="term">오블리주,플래티늄 프로그램 서비스의 가입자격 및 상세한<br />프로그램 내용은 가입 상담시 별도 안내해 드리겠습니다.</span>
						</span>
					</span>
				</span>
				<span class="fee-type2">
					<span class="txt-type1">플래티늄 서비스 9,000,000원 (vat 별도)</span>
					<span class="box">
						<span class="cell">
							<span class="term" style="letter-spacing:-0.7px; margin:0 0 7px 0;">성혼 프로그램으로 미성혼시 미성혼환급금 200만원(VAT 별도)</span>
							<span class="term">오블리주,플래티늄 프로그램 서비스의 가입자격 및 상세한<br />프로그램 내용은 가입 상담시 별도 안내해 드리겠습니다.</span>
						</span>
					</span>
				</span>
			</div> -->
				<!-- <div class="consult_box">
				<span>당신의 결혼을 듀오에서 책임지고 관리해 드리겠습니다.</span>
				<a href="javascript:main_consult_popup_view();" class="noble">노블레스서비스 문의</a>
				<a href="/duo/membership/marriage_guide.asp" class="consult">안내자료 요청</a>
			</div> -->
				<!-- <div class="notice_box">
				<h3 class="txt-type1">가입관련 안내 사항</h3>
				<span style="display:block; float:left; width:900px; margin:55px 0 0 18px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="가입관련 안내 사항">
						<caption>가입관련 안내 사항</caption>
						<tbody>
							<tr>
								<td width="100" valign="top"><img src="/duo/service/img/st_111.png" /></td>
								<td width="300" valign="top" class="cell1">
									<span class="txt-type1">가입시 구비 서류</span>
									<span class="txt-type2">혼인관계증명서</span>
									<span class="txt-type2">가족관계증명서</span>
									<span class="txt-type2">졸업증명서</span>
									<span class="txt-type2">재직증명서(또는 의료보험증 사본)</span>
									<span class="txt-type2">제적등본</span>
									<span class="txt-type2">사진1매(최대 3매까지 등록가능)</span>
								</td>
								<td width="100" valign="top"><img src="/duo/service/img/st_112.png" /></td>
								<td width="400" valign="top" class="cell2">
									<span class="txt-type1">듀오의 신원인증 시스템이란?</span>
									<span class="txt-type2">듀오는 회원들이 안전하고, 편안하게 만날 수 있도록<br />사진,학력,직업,결혼여부 등의 개인정보를 확인합니다.<br />신원인증은 커플매니저가 담당하며, 인증 기간은 7~15일 정도<br />걸립니다.<br />듀오에 가입할 의사가 있는 회원은 사실혼 관계와 같이 서류에<br />나타나지 않는 정보를 솔직하게 얘기해주셔야 하며, 이에 대한 모든 책임은 회원 당사자에게 있습니다.</span>
								</td>
							</tr>
							<tr>
								<td colspan="4" height="55"></td>
							</tr>
							<tr>
								<td width="100" valign="top"><img src="/duo/service/img/st_113.png" /></td>
								<td colspan="3" width="800" valign="top" class="cell3">									
									<span class="txt-type1">서류대행 서비스란?</span>
									<span class="txt-type2">엄격한 회원관리를 위한 신원인증제도. 하지만 회원이 직접 서류를 준비하려면 불편하겠죠?<br />듀오는 이런 회원 여러분의 번거로움을 최소화하기 위해 혼인관계증명서, 가족관계 증명서,졸업증명서를 대신 준비해 드리고<br />있습니다.<br />사내 '신원인증팀'에서 발급하고 관리자의 엄격한 확인 후에 별도의 서고에 보관, 결혼중개업의 관리에 관한 법률에 의거하여<br />개인정보를 보관합니다.<br />보관 기간 경과 후에는 분쇄 또는 소각, 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법으로<br />사용하여 삭제 하오니 안심하고 맡기시기 바랍니다.</span>
								</td>
							</tr>
							<tr>
								<td colspan="4" height="55"></td>
							</tr>
							<tr>
								<td width="100" valign="top"><img src="/duo/service/img/st_114.png" /></td>
								<td colspan="3" width="800" valign="top" class="cell4">
									<span class="txt-type1">계약 해지 및 환불금</span>
									<span class="txt-type2">환불에 대한 사항은 제공되는 [계약의 해지 및 환불금] 자료에 의하여 규정대로 적용됩니다.</span>
								</td>
							</tr>
						</tbody>
					</table>
				</span>
			</div> -->
			</div>
		</div>
	
	<!--내용영역-->
	<!--하단영역-->

	<jsp:include page="/footer.jsp" flush="true" />
</div>
<jsp:include page="/fixRight.jsp" flush="true" />

</body>
</html>