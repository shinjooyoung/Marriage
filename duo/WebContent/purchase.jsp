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
<meta name='Subject' content='��ȥ����ȸ�� ��� - �ѱ���ǥ��ȥ����ȸ��' />
<meta name='Title'
	content='��ȥ����ȸ�� ��� - �ѱ���ǥ��ȥ����ȸ��, ��ȥ, ��ȥ, ��ȥ, �����, ��ȥ����ȸ��' />
<meta name='Keywords'
	content='��ȥ����ȸ��, ��ȥ����, ��ȥ, ��ȥ�ص��, ���,��ȥ������ü, ��� ��ȥ' />
<meta name='Description'
	content='��ȥ����ȸ��,��ȥ,��ȥ,�������ȥ,���� �̻���ã��,�¼�,�߸�,�����ּ�,������Ƽ,���׶� Ŀ�øŴ���,�����ִ� ������,�������ִ� ���,100%�ſ�����,���Ժ�������,�������켱,ȯ�ұ����ؼ�,2012 �Һ��ڰ� ���� ���� �ŷ��ϴ� �귣����' />

<title>���-�ѱ���ǥ��ȥ����ȸ��</title>
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
					/*$("#idCheck").append( "�̹� ������ �����" );*/				
					$("#idCheckFlag").val("Y");
					alert("�̹̰����� ������Դϴ�.")
					
				}else {
					/*$("#idCheck").append( "�ű� ���� �����" );*/
					$("#idCheckFlag").val("N");	
					var formnm = document.getElementById("cell");
			 		formnm.action ="/duo/PurchaseControl?cmd=purchase_insert";
			 		formnm.submit();
				}
				},
			error : function(err){
				alert("�����߻� : "+ err);
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

			$("#p_rank").val("Ŭ����");
			
			
			if($("#idCheckFlag").val()=="Y"){
				$("#p_sale").val("20%");
				$("#p_price").val(number_format('1200000'));
			}
			
			else if($("#idCheckFlag").val()=="N"){
			$("#p_sale").val("�ش����");
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

			$("#p_rank").val("�����");
			
			if($("#idCheckFlag").val()=="Y"){
				$("#p_sale").val("20%");
				$("#p_price").val(number_format('2160000'));
			}
			
			else if($("#idCheckFlag").val()=="N"){
			$("#p_sale").val("�ش����");
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
		<!--��ܿ���-->
		<!-- 2016-05-06 | �ӽ��˾�
	<script type="text/javascript">
	function popup20160510_close()
	{
		$("#popup20160510").hide();
	}
	</script>
	
	<div style="position:absolute; left:0; top:98px; width:417px; height:462px; z-index:300;" id="popup20160510">
		<div style="width:417px; height:462px; position:relative;">
			<img src="/Duo/popup/img/pop_img_20161208.jpg" />
			<a href="javascript:popup20160510_close();" style="position:absolute; right:10px; top:10px; display:block; width:18px; height:18px; background:url(/duo/popup/img/close_btn.png) no-repeat left top; font-size:0; line-height:0;">�˾��ݱ�</a>
		</div>
	</div>
	<!-- 2016-05-06 | �ӽ��˾� - startend-->
		<!--���뿵��-->
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
	font-family: Malgun Gothic, ���� ���, Dotum, ����, Gulim, ����;
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
	font-family: Malgun Gothic, ���� ���, Dotum, ����, Gulim, ����;
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
	font-family: Malgun Gothic, ���� ���, Dotum, ����, Gulim, ����;
	font-size: 16px;
	background-color: #ffffff;
	border: 1px solid #dedede;
}

#main_consult_popup .view-wrapper form table select {
	height: 44px;
	font-family: Malgun Gothic, ���� ���, Dotum, ����, Gulim, ����;
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
	font-family: Malgun Gothic, ���� ���, Dotum, ����, Gulim, ����;
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
															.html() == "���ǻ��� �Է�") {
														$(".mc_tx_content")
																.html("")
													}
												});

								$("html").css("overflow", "hidden"); // �ٴڷ��̾� ��ũ�ѹ� ����

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
								alert("�˾��� �ҷ����� ���߽��ϴ�. �ٽ� �õ��� �ּ���.");
								return;
							}
						});
			}
			function main_consult_popup_close() {
				$("#main_consult_popup").hide();
				$("#main_pop_bg").hide();
				$("body").off(".disableScroll");
				$("html").css("overflow", ""); //�ٴڷ��̾� ��ũ�ѹ� ����
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

				if (formnm.u_name.value == "�̸�" || formnm.u_name.value == "") {
					alert("�̸��� �Է��Ͽ� �ּ���.");
					formnm.u_name.focus();
					return;
				}

				if (!isValidType(formnm.u_name, 'text', '�̸��� �Է��Ͽ� �ּ���.')) {
					return;
				}
				if (checkstring(formnm.u_name.value) == true) {
					alert("�̸��Է¿� Ư�����ڴ� �Է��Ҽ� �����ϴ�.");
					return;
				}
				if (!check_input_byte(formnm.u_name.value, 10)) {
					alert("�Է� �� �� �ִ� ���ڱ��̸� �ʰ��Ͽ����ϴ�.");
					return;
				}

				if (!isValidType(formnm.u_ident1, 'select', '������� ������ �ּ���.')) {
					return;
				}
				if (!isValidType(formnm.u_ident2, 'check', '������ �����Ͽ� �����Ͽ� �ּ���.')) {
					return;
				}
				if (!isValidType(formnm.u_married, 'check', '��ȥ ����� �����Ͽ� �ּ���.')) {
					return;
				}

				if (!isValidType(formnm.u_work, 'select', '���������� �����Ͽ� �ּ���.')) {
					return;
				}
				if (!isValidType(formnm.u_edu, 'select', '�з��� �����Ͽ� �ּ���.')) {
					return;
				}

				if (!isValidType(formnm.u_mtel1, 'select', '�ڵ��� ���ڸ��� �����Ͽ� �ּ���.')) {
					return;
				}
				if (!isValidType(formnm.u_mtel2, 'number',
						'�ڵ��� �߰��ڸ��� �Է��Ͽ� �ּ���.')) {
					return;
				}
				if (!isValidType(formnm.u_mtel3, 'number', '�ڵ��� ���ڸ��� �Է��Ͽ� �ּ���.')) {
					return;
				}

				if (!hp_chck_array(formnm.u_mtel2.value)
						&& !hp_chck_array(formnm.u_mtel3.value)) {
					alert("�ڵ��� ��ȣ�� �ùٸ��� �ʽ��ϴ�.");
					formnm.u_mtel3.focus();
					return;
				}

				if (checkEmail(formnm.u_email, formnm.u_email_domain,
						formnm.u_email_domain_select) == false) {
					return;
				}

				if (!isValidType(formnm.u_dwell, 'select', '���������� �����Ͽ� �ּ���.')) {
					return;
				}

				if (!agree_check('m_agree_all', 'm_agree1', 'm_agree2')) {
					$(".mc_agree_area").eq(0).show();
					return;
				}

				google_ga("send", "event", "PC����û", "��ưŬ��", "��������ȭ");

				formnm.submit();
			}
		</script>
		<div id="main_pop_bg"></div>
		<div id="main_consult_popup"></div>

		<div id="membershipfee">
			<div
				style="display: block; margin: 0 auto; width: 1120px; overflow: hidden;">
				<!--����-->
				<div class="left_box">
					<span class="menu"> <span class="st-1"><a
							href="/duo/service/main.asp">���Ծȳ�</a></span>
						<ul>
							<li><a href="/duo/service/know.asp">�� ����ϱ��?</a></li>
							<li><a href="/duo/service/number_duo.asp">���ڷ� ���� ���</a></li>
							<li><a href="/duo/service/program01.asp">���� ����</a></li>
							<li style="background: #5a6077; color: #ffffff;"><a
								href="/Duo/service/service.asp">���Ժ� �ȳ�</a></li>
							<li><a href="/duo/service/matching_01.asp">���� �� Ȱ������</a></li>
							<li><a href="/duo/service/matching_02.asp">��Ī�ý���</a></li>
							<li><a href="/duo/service/consult.asp">�����</a></li>
							<li><a href="/duo/service/members.asp">�����Ŭ�� �Ұ�</a></li>
							<li><a href="/duo/service/marriage_consult.asp">�ڳ��ȥ ������</a></li>
							<li><a href="/duo/service/free_service/201611_main_01.asp">����
									����ü��</a></li>
							<li><a href="/duo/service/duo_faq.asp">��ȥ! �ñ��ؿ�</a></li>
						</ul>
					</span> <a class="simulation" href="/Duo/service/simulation.asp">ȸ������
						�ùķ��̼�</a> <a class="freeconsult" href="/Duo/service/profile.asp">������
						������õ</a>
					<form class="freeservice">
						<span class="box"> <span class="st-1">�ȳ��ڷ�<br>����
									����</span> <span
							style="display: block; float: left; width: 120px; padding: 10px 20px;">
								<!--Ŭ���� ���游 �Ǹ� �˴ϴ�. radio_on radio_off--> <span
								class="left_radio radio_off">��ȥ</span> <span
								class="left_radio radio_off">��ȥ</span>
						</span> <a href="/Duo/membership/marriage_guide.asp" class="submit">��û�ϱ�</a>
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
						<span class="st-1" style="margin: 0 0 13px 0; color: #a4a4a4;">�����
							���� ����� �ֽ��ϴ�</span>
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
				<!--����-->



				<div class="content_box">
					<div class="fee_tab" style="z-index: 99">
						<div class="fee_tab_sub" >
						<input type="hidden" name="u_id" id="u_id" value="<%=session.getAttribute("userId") %>" />
						<a href="javascript:click_sub('1');" ><span class="on" id="sub_1">Ŭ���ļ���</span></a> 
						<a href="javascript:click_sub('2');"><span class="other" id="sub_2">����� ����</span></a>
						<a href="javascript:click_sub('3');"><span class="other" id="sub_3">����ȭ�鰡��</span></a>
						<input type="hidden" name="idCheckFlag" id="idCheckFlag" value="N" />
									
							<!-- <a href="javascript:tab_scroll_move('remarry_fee');"><span class="tab_nav remarry">����ȭ�� ����</span></a> -->
									
						</div>
						<!--
				��ȥ ���� ���Ժ� �ȳ����� <span class="on"></span> 
				�ٸ� ���񽺴� <span class="other"></span> �� ���ּ���
				<div class="fee_tab_sub">
					<a href="#s1"><span class="on">��ȥ����</span></a>
					<a href="#s2"><span class="remarry other" style="margin:0 1px;">��ȥ����</span></a>
					<a href="#s3"><span class="other">����� ����</span></a>
				</div>
				-->
					</div>
					<div class="top_box">
						<span class="txt-type1">HOME / ���Ծȳ� / ���Ժ� �ȳ�</span>
						<h2 class="txt-type1">���Ծȳ�</h2>
						<h3 class="txt-type1">�����ڰ� �� ���Ժ�</h3>
						<span class="txt-type2">��� ���α׷��� ��ȥ ��ʺ�� �����ϴ�.</span>
					</div>
					<div class="marry_fee1">
						<h3 class="txt-type1">���� ���Ժ� �ȳ�</h3>
						<span
							style="display: block; float: left; width: 918px; margin: 55px 0 0 0;">
							<table>
								<tbody>
									<tr height="50">&nbsp;</tr>
									<tr>
										
										<td width="50">&nbsp;</td>
										<td width="181"><span class="txt-type1">Ŭ���� ����</span></td>
										<td width="85"><img src="/duo/service/img/st_83.png" /><span
											class="hide">����</span></td>
										<!-- 								<td width="266"><span class="txt-type2">39�� ����</span><span class="txt-type3">��� ȸ������ ���ؿ� ���ϴ� �з�<br />�̻��� �������� ������ ���� ��ȥ ��</span></td>
 -->
										<td width="85"><img src="/duo/service/img/st_84.png" /><span
											class="hide">����</span></td>
										<!-- 								<td width="251"><span class="txt-type2">35�� ����</span><span class="txt-type3">��� ȸ������ ���ؿ� ���ϴ� �з�<br />�̻��� ��ȥ ��</span></td>-->

										<td width="120">&nbsp;</td>
										<td width="195" valign="top"><span class="txt-type1-1">�����
												����</span></td>
										<td width="85" valign="top"><img
											src="/duo/service/img/st_102.png" /><span class="hide">����</span></td>
										<!-- <td width="254" valign="top">
									<span class="txt-type2">������ ����� ������ ������<br />&nbsp;&nbsp;&nbsp;�ܱ��� ȸ�� �ٹ���</span>
									<span class="txt-type2">���ǻ� ��ȣ�� ȸ��� ���� <br />&nbsp;&nbsp;&nbsp;����հ��� �� ������ ������</span>
									<span class="txt-type2">�������� �ִ� ����� ��ǥ</span>
									<span class="txt-type2">�������, ������, �������,<br />&nbsp;&nbsp;&nbsp;�ӿ��̻��� �ڳ�� ��������<br />&nbsp;&nbsp;&nbsp;���� ������</span>
								</td> -->
										<td width="85" valign="top"><img
											src="/duo/service/img/st_103.png" /><span class="hide">����</span></td>
										<!-- <td width="274" valign="top">
									<span class="txt-type2">������ ����� ������ ������<br />&nbsp;&nbsp;&nbsp;�ܱ��� ȸ�� �ٹ���</span>
									<span class="txt-type2">������ ��� ȸ��� �ǻ� ��ȣ�� <br />&nbsp;&nbsp;&nbsp;����հ���</span>
									<span class="txt-type2">���Ƴ��, ��Ʃ���, ��������, <br />&nbsp;&nbsp;&nbsp;���δ�ȸ �����</span>
									<span class="txt-type2">���������� ǳ���� �����, ������,<br />&nbsp;&nbsp;&nbsp;�������, �ӿ��̻��� �ڳ� </span>
								</td> -->


									</tr>
								</tbody>
							</table>
						</span> <span class="fee-type1" onclick="click_sub('1')"> <span class="txt-type1">Ŭ����
								���� 1,400,000�� (vat ����)</span> <span class="box"> <span
								class="cell"> <span class="term">���� Ŀ�øŴ����� ���� 1:1
										����</span> <span class="term">�̺�Ʈ ��û��, �켱 �����ǰ� ��Ī����</span> <span
									class="term">����� Ŭ�� ȸ���˻� ��������</span> <span class="term">�߰�
										���� ���� ����</span> <span class="term">��Ī ��� ���� ���� </span>
							</span>
						</span>
						</span> <span class="fee-type2" onclick="click_sub('2')"> <span class="txt-type1">�����
								���� 2,700,000�� (vat ����)</span> <span class="box"> <span
								class="cell"> <span class="term">���� Ŀ�øŴ����� ���� 1:1
										����</span> <span class="term">�̺�Ʈ ��û��, �켱 �����ǰ� ��Ī����</span> <span
									class="term">����� Ŭ�� ȸ���˻� ��������</span> <span class="term"
									style="height: 66px; background: url(/duo/service/img/icon_08.gif) left 10px no-repeat;">ȸ��
										���� ����� ��Ƽ ���� ����<br />
									<span style="font-size: 12px;">(������ ������ ���� Ƚ���� 1ȸ ����)</span>
								</span> <span class="term">����� ��Ƽ ������ : �������� 1�� ����</span> <span
									class="term"
									style="height: 66px; background: url(/duo/service/img/icon_08.gif) left 10px no-repeat;">��Ƽ����
										Ŀ���� �ȵ� ��� ���� ȸ������<br />������ ��û ����
								</span> <span class="term">�߰� ���� ���� ����</span> <span class="term">��Ī
										��� ���� ����</span> <span class="term blank"></span>
							</span>
						</span> <!-- <span class="txt-type1">Ŭ���� B ���� 1,200,000�� (vat ����)</span>
					<span class="box">
						<span class="cell">
							<span class="term">���� Ŀ�øŴ����� ���� 1:1 ����</span>
							<span class="term">�̺�Ʈ ��û��, �켱 �����ǰ� ��Ī����</span>
							<span class="term">����� Ŭ�� ȸ���˻� ��������</span>
							<span class="term blank"></span>
							<span class="term blank"></span>
						</span>
					</span> -->
						</span>
						<!-- <span class="fee-type3">
					<span class="txt-type1">Ŭ���� ����� ���� 2,000,000�� (vat ����)</span>
					<span class="box">
						<span class="cell">
							<span class="term">���� Ŀ�øŴ����� ���� 1:1 ����</span>
							<span class="term">�̺�Ʈ ��û��, �켱 �����ǰ� ��Ī����</span>
							<span class="term">����� Ŭ�� ȸ���˻� ��������</span>
							<span class="term">�߰� ���� ���� ����</span>
							<span class="term">��Ī ��� ���� ����</span>
							<span class="term">���� ���� ���α׷�</span>
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
										<td width="157"><span class="txt-type1">���� ����</span></td>
										<td width="85"><img src="/duo/service/img/st_118.png" />
									</tr>
								</tbody>
							</table>
						</span> <span class="fee-type1"> <span class="txt-type1">�������񽺾����� �ڸ�</span> 
						
						<span class="box">
							<form id ="cell" class="cell" method='post'>
						
									<span class="term"> <label>��ǰ��</label> <input type='text' id="p_rank" name="p_rank" readonly /> </span>
									<span class="term"> <label>������ </label> <input type='text' id="p_sale" name="p_sale"readonly /> </span>
									<span class="term"> <label>�������</label> <select name="method" id="p_method" name="p_method"> 
											<option value="cash">������ �Ա�</option>
											<option value="card">���ݰ���</option>
									</select>  </span>
									<span class="term"> <label>�̿�Ⱓ </label> <input type='text' id="p_usingterm" name="p_usingterm" readonly /> </span>
									<span class="term"> <label>�ݾ�</label> <input type='text' id="p_price" name="p_price"readonly /> </span>
									<input type='hidden' id="p_id" name="p_id" value='' />
									<span class="purbtn" id="purbtn" onclick= "purchase_submit();">
									 <label class="txt-purchase" >�����ϱ�</label>
									</span>
						
							</form>
							
							
						
						</span> <!-- <span class="term">��Ī ��� ���� ����</span> -->

						</span> 
					</div>






					<!-- <span style="display:block; float:left; width:918px;">
					<table>
						<tbody>
							<tr>
								<td width="50">&nbsp;</td>
								<td width="181"><span class="txt-type1">�ϸ�� ����</span></td>
								<td width="85"><img src="/duo/service/img/st_89.png" /><span class="hide">����</span></td>
								<td width="266"><span class="txt-type2">40�� �̻�</span><span class="txt-type3">��� ȸ������ ���ؿ� ���ϴ� �з�<br />�̻��� �������� ������ ���� ��ȥ ��</span></td>
								<td width="85"><img src="/duo/service/img/st_90.png" /><span class="hide">����</span></td>
								<td width="251"><span class="txt-type2">36�� �̻�</span><span class="txt-type3">��� ȸ������ ���ؿ� ���ϴ� �з�<br />�̻��� ��ȥ ��</span></td>
							</tr>
						</tbody>
					</table>
				</span>
				<span class="fee-type1">
					<span class="txt-type1">�ϸ�� ���� 1,600,000�� (vat ����)</span>
					<span class="box">
						<span class="cell">
							<span class="term">���� Ŀ�øŴ����� ���� 1:1 ����</span>
							<span class="term">�̺�Ʈ ��û��, �켱 �����ǰ� ��Ī����</span>
							<span class="term">����� Ŭ�� ȸ���˻� ��������</span>
							<span class="term">�߰� ���� ���� ����</span>
							<span class="term">��Ī ��� ���� ���� </span>
						</span>
					</span>
				</span>
				<span class="fee-type2">
					<span class="txt-type1">�ϸ�� ����� ���� 2,000,000�� (vat ����)</span>
					<span class="box">
						<span class="cell">
							<span class="term">���� Ŀ�øŴ����� ���� 1:1 ����</span>
							<span class="term">�̺�Ʈ ��û��, �켱 �����ǰ� ��Ī����</span>
							<span class="term">����� Ŭ�� ȸ���˻� ��������</span>
							<span class="term">�߰� ���� ���� ����</span>
							<span class="term">��Ī ��� ���� ����</span>
							<span class="term">���� ���� ���α׷�</span>
						</span>
					</span>
				</span>
				<span class="fee-type3">
					<span class="txt-type1">�ϸ�� ����� ���� 2,000,000�� (vat ����)</span>
					<span class="box">
						<span class="cell">
							<span class="term">���� Ŀ�øŴ����� ���� 1:1 ����</span>
							<span class="term">�̺�Ʈ ��û��, �켱 �����ǰ� ��Ī����</span>
							<span class="term">����� Ŭ�� ȸ���˻� ��������</span>
							<span class="term">�߰� ���� ���� ����</span>
							<span class="term">��Ī ��� ���� ����</span>
							<span class="term">���� ���� ���α׷�</span>
						</span>
					</span>
				</span> -->
				</div>
				<!-- <div class="consult_box" style="height:254px;">
				<span>����� ��ȥ�� ������� å������ ������ �帮�ڽ��ϴ�.</span>
				<a href="javascript:main_consult_popup_view();" class="marry">��ȥ���� ����</a>
				<a href="/duo/membership/marriage_guide.asp" class="consult">�ȳ��ڷ� ��û</a>
			</div>  -->
				<!-- <div class="remarry_fee">
				<h3 class="txt-type1">��ȥ���� ���Ժ� �ȳ�</h3>
				<span style="display:block; float:left; width:918px; margin:55px 0 0 0;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="��ȥ���� ���� �ڰ� �ȳ�">
						<caption>��ȥ���� ���� �ڰ� �ȳ�</caption>
						<tbody>
							<tr>
								<td width="49">&nbsp;</td>
								<td width="216"><span class="txt-type1">��ȥ �ϸ�� ����</span></td>
								<td width="85"><img src="/duo/service/img/st_96.png" /><span class="hide">����</span></td>
								<td width="260"><span class="txt-type2">���ȥ, �纰, ��ȥ ��<br />��ȥ ������ ������ ��</span></td>
								<td width="85"><img src="/duo/service/img/st_97.png" /><span class="hide">����</span></td>
								<td width="215"><span class="txt-type2">���ȥ, �纰, ��ȥ ��<br />��ȥ ������ ������ ��</span></td>
							</tr>
						</tbody>
					</table>
				</span>
				���� ��ȥ���Ժ�span class="fee-type1">
					<span class="txt-type1">�ϸ�� ���� ���Ժ� 1,600,000�� (vat ����)</span>
					<span class="box">
						<span class="cell">
							<span class="term">���� Ŀ�øŴ����� ���� 1:1 ����</span>
							<span class="term">�̺�Ʈ ��û��, �켱 �����ǰ� ��Ī����</span>
							<span class="term">����� Ŭ�� ȸ���˻� ��������</span>
							<span class="term">�߰� ���� ���� ����</span>
							<span class="term">��Ī ��� ���� ���� </span>
						</span>
					</span>
				</span>
				<span class="fee-type2">
					<span class="txt-type1">�ϸ�� B ���� ���Ժ� 1,400,000�� (vat ����)</span>
					<span class="box">
						<span class="cell">
							<span class="term">���� Ŀ�øŴ����� ���� 1:1 ����</span>
							<span class="term">�̺�Ʈ ��û��, �켱 �����ǰ� ��Ī����</span>
							<span class="term">����� Ŭ�� ȸ���˻� �������� </span>
							<span class="term blank"></span>
							<span class="term blank"></span>
						</span>
					</span>
				</span
				<span class="fee-type3">
					<span class="txt-type1">�ϸ�� ����� ���� ���Ժ� 2,000,000�� (vat ����)</span>
					<span class="box">
						<span class="cell">
							<span class="term">���� Ŀ�øŴ����� ���� 1:1 ����</span>
							<span class="term">�̺�Ʈ ��û��, �켱 �����ǰ� ��Ī����</span>
							<span class="term">����� Ŭ�� ȸ���˻� ��������</span>
							<span class="term">�߰� ���� ���� ����</span>
							<span class="term">��Ī ��� ���� ����</span>
							<span class="term">���� ���� ���α׷�</span>
						</span>
					</span>
				</span>
			</div>
			<div class="consult_box">
				<span>����� ��ȥ�� ������� å������ ������ �帮�ڽ��ϴ�.</span>
				<a href="javascript:main_consult_popup_view();" class="remarry">��ȥ���� ����</a>
				<a href="/duo/membership/marriage_guide.asp" class="consult">�ȳ��ڷ� ��û</a>
			</div> -->
				<!-- <div class="noble_fee1">
				<h3 class="txt-type1">��������� ���Ժ� �ȳ�</h3>
				<span style="display:block; float:left; width:918px; margin:45px 0 0 0;">
					<table>
						<tbody>
							<tr>
								<td width="25">&nbsp;</td>
								<td width="195" valign="top"><span class="txt-type1">����� ����</span></td>
								<td width="85" valign="top"><img src="/duo/service/img/st_102.png" /><span class="hide">����</span></td>
								<td width="254" valign="top">
									<span class="txt-type2">������ ����� ������ ������<br />&nbsp;&nbsp;&nbsp;�ܱ��� ȸ�� �ٹ���</span>
									<span class="txt-type2">���ǻ� ��ȣ�� ȸ��� ���� <br />&nbsp;&nbsp;&nbsp;����հ��� �� ������ ������</span>
									<span class="txt-type2">�������� �ִ� ����� ��ǥ</span>
									<span class="txt-type2">�������, ������, �������,<br />&nbsp;&nbsp;&nbsp;�ӿ��̻��� �ڳ�� ��������<br />&nbsp;&nbsp;&nbsp;���� ������</span>
								</td>
								<td width="85" valign="top"><img src="/duo/service/img/st_103.png" /><span class="hide">����</span></td>
								<td width="274" valign="top">
									<span class="txt-type2">������ ����� ������ ������<br />&nbsp;&nbsp;&nbsp;�ܱ��� ȸ�� �ٹ���</span>
									<span class="txt-type2">������ ��� ȸ��� �ǻ� ��ȣ�� <br />&nbsp;&nbsp;&nbsp;����հ���</span>
									<span class="txt-type2">���Ƴ��, ��Ʃ���, ��������, <br />&nbsp;&nbsp;&nbsp;���δ�ȸ �����</span>
									<span class="txt-type2">���������� ǳ���� �����, ������,<br />&nbsp;&nbsp;&nbsp;�������, �ӿ��̻��� �ڳ� </span>
								</td>
							</tr>
						</tbody>
					</table>
				</span>
				<span class="fee-type1">
					<span class="txt-type1">����� ���� 2,700,000�� (vat ����)</span>
					<span class="box">
						<span class="cell">
							<span class="term">���� Ŀ�øŴ����� ���� 1:1 ����</span>
							<span class="term">�̺�Ʈ ��û��, �켱 �����ǰ� ��Ī����</span>
							<span class="term">����� Ŭ�� ȸ���˻� ��������</span>
							<span class="term" style="height:66px; background:url(/duo/service/img/icon_08.gif) left 10px no-repeat;">ȸ�� ���� ����� ��Ƽ ���� ����<br /><span style="font-size:12px;">(������ ������ ���� Ƚ���� 1ȸ ����)</span></span>
							<span class="term">����� ��Ƽ ������ : �������� 1�� ����</span>
							<span class="term" style="height:66px; background:url(/duo/service/img/icon_08.gif) left 10px no-repeat;">��Ƽ���� Ŀ���� �ȵ� ��� ���� ȸ������<br />������ ��û ����</span>
							<span class="term">�߰� ���� ���� ����</span>
							<span class="term">��Ī ��� ���� ����</span>
							<span class="term blank"></span>
						</span>
					</span>
				</span> 
			 <span class="fee-type2">
					<span class="txt-type1">����� ����� ���� 3,600,000�� (vat ����)</span>
					<span class="box">
						<span class="cell">
							<span class="term">���� Ŀ�øŴ����� ���� 1:1 ����</span>
							<span class="term">�̺�Ʈ ��û��, �켱 �����ǰ� ��Ī����</span>
							<span class="term">����� Ŭ�� ȸ���˻� ��������</span>
							<span class="term" style="height:66px; background:url(/duo/service/img/icon_08.gif) left 10px no-repeat;">ȸ�� ���� ����� ��Ƽ ���� ����<br /><span style="font-size:12px;">(������ ������ ���� Ƚ���� 1ȸ ����)</span></span>
							<span class="term">����� ��Ƽ ������ : �������� 1�� ����</span>
							<span class="term" style="height:66px; background:url(/duo/service/img/icon_08.gif) left 10px no-repeat;">��Ƽ���� Ŀ���� �ȵ� ��� ���� ȸ������<br />������ ��û ����</span>
							<span class="term">�߰� ���� ���� ����</span>
							<span class="term">��Ī ��� ���� ����</span>
							<span class="term">������ ���� ���� ���� ���� </span>
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
								<td width="157"><span class="txt-type1">������ ����</span></td>
								<td width="85"><img src="/Duo/service/img/st_83.png" /><span class="hide">����</span></td>
								<td width="612"><span class="txt-type2">�����, �˻�, ����, ������, ��ȣ��, �ǻ�, ġ���ǻ�<br />���ǻ�, ȸ���, ���ߺ�����, ����հ��� �� ������ ������</span></td>
							</tr>
						</tbody>
					</table>
				</span>
		 	<span class="fee-type1">
					<span class="txt-type1">����� ������ ���� 1,800,000�� (vat ����)</span>
					<span class="box">
						<span class="cell">
							<span class="term">���� Ŀ�øŴ����� ���� 1:1 ����</span>
							<span class="term">�̺�Ʈ ��û��, �켱 �����ǰ� ��Ī����</span>
							<span class="term">����� Ŭ�� ȸ���˻� ��������</span>
							<span class="term" style="height:66px; background:url(/duo/service/img/icon_08.gif) left 10px no-repeat;">ȸ�� ���� ����� ��Ƽ ���� ����<br /><span style="font-size:12px;">(������ ������ ���� Ƚ���� 1ȸ ����)</span></span>
							<span class="term">����� ��Ƽ ������ : �������� 1�� ����</span>
							<span class="term">��Ƽ���� Ŀ���� �ȵ� ��� ���� ȸ������ ������ ��û ����</span>
							<span class="term">�߰� ���� ���� ����</span>
							<span class="term">��Ī ��� ���� ����</span>
						</span>
					</span>
				</span> 
			</div> -->
				<!-- <div class="noble_fee3">
				<h3 class="txt-type1">������, �÷�Ƽ�� ����</h3>
				<span class="fee-type1">
					<span class="txt-type1">������ ���� 5,400,000�� (vat ����)</span>
					<span class="box">
						<span class="cell">
							<span class="term">������,�÷�Ƽ�� ���α׷� ������ �����ڰ� �� ����<br />���α׷� ������ ���� ���� ���� �ȳ��� �帮�ڽ��ϴ�.</span>
						</span>
					</span>
				</span>
				<span class="fee-type2">
					<span class="txt-type1">�÷�Ƽ�� ���� 9,000,000�� (vat ����)</span>
					<span class="box">
						<span class="cell">
							<span class="term" style="letter-spacing:-0.7px; margin:0 0 7px 0;">��ȥ ���α׷����� �̼�ȥ�� �̼�ȥȯ�ޱ� 200����(VAT ����)</span>
							<span class="term">������,�÷�Ƽ�� ���α׷� ������ �����ڰ� �� ����<br />���α׷� ������ ���� ���� ���� �ȳ��� �帮�ڽ��ϴ�.</span>
						</span>
					</span>
				</span>
			</div> -->
				<!-- <div class="consult_box">
				<span>����� ��ȥ�� ������� å������ ������ �帮�ڽ��ϴ�.</span>
				<a href="javascript:main_consult_popup_view();" class="noble">��������� ����</a>
				<a href="/duo/membership/marriage_guide.asp" class="consult">�ȳ��ڷ� ��û</a>
			</div> -->
				<!-- <div class="notice_box">
				<h3 class="txt-type1">���԰��� �ȳ� ����</h3>
				<span style="display:block; float:left; width:900px; margin:55px 0 0 18px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="���԰��� �ȳ� ����">
						<caption>���԰��� �ȳ� ����</caption>
						<tbody>
							<tr>
								<td width="100" valign="top"><img src="/duo/service/img/st_111.png" /></td>
								<td width="300" valign="top" class="cell1">
									<span class="txt-type1">���Խ� ���� ����</span>
									<span class="txt-type2">ȥ�ΰ�������</span>
									<span class="txt-type2">������������</span>
									<span class="txt-type2">��������</span>
									<span class="txt-type2">��������(�Ǵ� �ǷẸ���� �纻)</span>
									<span class="txt-type2">�����</span>
									<span class="txt-type2">����1��(�ִ� 3�ű��� ��ϰ���)</span>
								</td>
								<td width="100" valign="top"><img src="/duo/service/img/st_112.png" /></td>
								<td width="400" valign="top" class="cell2">
									<span class="txt-type1">����� �ſ����� �ý����̶�?</span>
									<span class="txt-type2">����� ȸ������ �����ϰ�, ����ϰ� ���� �� �ֵ���<br />����,�з�,����,��ȥ���� ���� ���������� Ȯ���մϴ�.<br />�ſ������� Ŀ�øŴ����� ����ϸ�, ���� �Ⱓ�� 7~15�� ����<br />�ɸ��ϴ�.<br />����� ������ �ǻ簡 �ִ� ȸ���� ���ȥ ����� ���� ������<br />��Ÿ���� �ʴ� ������ �����ϰ� ������ּž� �ϸ�, �̿� ���� ��� å���� ȸ�� ����ڿ��� �ֽ��ϴ�.</span>
								</td>
							</tr>
							<tr>
								<td colspan="4" height="55"></td>
							</tr>
							<tr>
								<td width="100" valign="top"><img src="/duo/service/img/st_113.png" /></td>
								<td colspan="3" width="800" valign="top" class="cell3">									
									<span class="txt-type1">�������� ���񽺶�?</span>
									<span class="txt-type2">������ ȸ�������� ���� �ſ���������. ������ ȸ���� ���� ������ �غ��Ϸ��� �����ϰ���?<br />����� �̷� ȸ�� �������� ���ŷο��� �ּ�ȭ�ϱ� ���� ȥ�ΰ�������, �������� ����,���������� ��� �غ��� �帮��<br />�ֽ��ϴ�.<br />�系 '�ſ�������'���� �߱��ϰ� �������� ������ Ȯ�� �Ŀ� ������ ���� ����, ��ȥ�߰����� ������ ���� ������ �ǰ��Ͽ�<br />���������� �����մϴ�.<br />���� �Ⱓ ��� �Ŀ��� �м� �Ǵ� �Ұ�, ������ ���� ���·� ����� ���������� ����� ����� �� ���� ����� �������<br />����Ͽ� ���� �Ͽ��� �Ƚ��ϰ� �ñ�ñ� �ٶ��ϴ�.</span>
								</td>
							</tr>
							<tr>
								<td colspan="4" height="55"></td>
							</tr>
							<tr>
								<td width="100" valign="top"><img src="/duo/service/img/st_114.png" /></td>
								<td colspan="3" width="800" valign="top" class="cell4">
									<span class="txt-type1">��� ���� �� ȯ�ұ�</span>
									<span class="txt-type2">ȯ�ҿ� ���� ������ �����Ǵ� [����� ���� �� ȯ�ұ�] �ڷῡ ���Ͽ� ������� ����˴ϴ�.</span>
								</td>
							</tr>
						</tbody>
					</table>
				</span>
			</div> -->
			</div>
		</div>
	
	<!--���뿵��-->
	<!--�ϴܿ���-->

	<jsp:include page="/footer.jsp" flush="true" />
</div>
<jsp:include page="/fixRight.jsp" flush="true" />

</body>
</html>