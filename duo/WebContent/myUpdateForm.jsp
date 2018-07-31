<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%String user =(String)session.getAttribute("userId");
    if(user == null)
    {
    	System.out.print("user "+user);
    	response.sendRedirect("/duo/DuoControl?cmd=main-page");
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
<meta name='Keywords' content='결혼정보회사, 결혼정보, 결혼, 결혼해듀오, 듀오,결혼정보업체, 듀오 결혼'>
<meta name='Description' content='결혼정보회사,초혼,재혼,노블레스결혼,무료 이상형찾기,맞선,중매,만남주선,미팅파티,베테랑 커플매니저,깊이있는 무료상담,믿을수있는 듀오,100%신원인증,가입비정찰제,고객만족우선,환불규정준수,2012 소비자가 뽑은 가장 신뢰하는 브랜드대상'>
<title>듀오-한국대표결혼정보회사</title><link href="/duo/common/css/common.css" rel="stylesheet" type="text/css" />
<link href="/duo/common/css/sub_layout.css" rel="stylesheet" type="text/css" />
<link href="/duo/common/css/sub_top_20151002.css" rel="stylesheet" type="text/css" />
<link href="/duo/com_member/css/membership.css" rel="stylesheet" type="text/css" />

<link href="/duo/com_member/css/modify.css" rel="stylesheet" type="text/css" />
<link href="/duo/common/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/duo/common/js/jquery-1.11.0.min.js"></script>
<script language="javascript" type="text/javascript" src="/duo/common/isValidType.js"></script>
<script language="javascript" type="text/javascript" src="/duo/common/flashshow.js"></script>
<script type="text/javascript" src="/duo/common/js/include_ex_script.js"></script>
<script src="/duo/common/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="/duo/com_member/common/isValidType.js"></script>

<script type="text/javascript">

function reset_auth_img()
{
	var rnd_num;
	rnd_num = Math.floor((Math.random()* 5)) + 1;
	$("#i_num").val(rnd_num);
	$("#auth_img").attr("src","/html/membership/new_img/ic_num_0" + rnd_num +".jpg");
}

// $(document).ready(function(){
// 	$("#u_pwd").focus(function(){
// 		if($("#u_pwd").attr("type") == "text")
// 		{
// 			$("#u_pwd").val("");
// 			$("#u_pwd").attr("type","password");
// 		}
// 		else
// 		{
// 			if($("#u_pwd").val() == "")
// 			{
// 				$("#u_pwd").attr("type","text");
// 				$("#u_pwd").val("(현재사용중인 비밀번호 입력)");
// 			}
// 		}
// 	});

// 	$("#u_pwd").blur(function(){	
// 		if($("#u_pwd").val() == "" || $("#u_pwd").val() == "(현재사용중인 비밀번호 입력)")
// 		{
// 			$("#u_pwd").attr("type","text");
// 			$("#u_pwd").val("(현재사용중인 비밀번호 입력)");
// 		}
// 	});

	
// });
</script>

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




</script>
</head>
<style>
 #table1 {
    width: 60%;
    border: 1px solid #444444;
    border-collapse: collapse;
    margin-left: 150px;
  }
  div#listname{
	font-size:20pt;
	color:hotpink;
}
  
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
	height: 350px;
	width: 500px;
	z-index: 99999;
}

#detailclose{
float:right;
}

</style>

<body>
<jsp:include page="/header.jsp" flush="true" />
	<!--상단영역-->
	<div id="membermain">
		<div style="width:100%; min-width:1120px; height:1000px; background:#ffffff center top no-repeat;">
		
		<div style="display:block; margin:0 auto; width:1120px; height:1120px; position:relative;">
			<!--왼쪽-->
			<%if(user!=null){ %>
 <jsp:include page="/left_box.jsp" flush="true"/> 
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

var loginProcess = 0;
var loginUrl = '';
var loginUrlWin = '';

$(document).ready(function() {
	$('#modifyConfirmBtn').click(function(){
		
		var formnm = document.METForm;

		if (formnm.u_pwd.value == "" || formnm.u_pwd.value == "(현재사용중인 비밀번호 입력)")
		{
			alert("비밀번호를 입력해 주세요.");
			return;
		}

		if(!isValidType(formnm.u_pwd, 'text', '비밀번호를 입력해 주세요.' )){ return; }

		if(!modify_pw_hangul(formnm.u_pwd.value)){
			formnm.u_pwd.focus();
			return;
		}

		
		userCheckProcess();
	});
	
	function userCheckProcess() {
		var formError;

		// 에러 메세지 초기화
		displayError('login_error','... 비밀번호 확인 중 ...');
// 		if (loginProcess == 1) {
// 			return false;
// 		}

		var uid = $('#u_id').val().toLowerCase();
		var upw = $('#u_pwd').val().toLowerCase();
		var uidsave = 0;

	 	uid = uid.trim();
	 	upw = upw.trim();
		// Pw check
		if ( upw == '' ) {
			displayError('login_error','비밀번호를 입력해 주세요');
			formError = 2;
			return false;
		}
		
		// 로그인 진행중
		loginProcess = 1;

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

	}
	function displayError(id, text)
	{
		var prev_msg = $('#' + id).html();
		
			$('#' + id).addClass('err_msg').html(text);
		
	}
	
	
});



</script>
			<div class="content_box type1">
<!-- 				<h3 class="txt1">결제내역<span class="hide">듀오 회원을 소개합니다.</span></h3> 원래는 h3	 -->
				
<!-- 				<div id='outcome' overflow-y:scroll> -->
<div style="width:100%;">
<!-- 	<div id="header"> -->
<!-- 	<ul> -->
<!-- 		<li><a href="https://www.duo.co.kr" target="_blank">듀오</a></li> -->
<!-- 		<li><a href="http://www.duowed.com/" target="_blank">듀오웨드</a></li> -->
<!-- 		<li><a href="http://www.duoremarry.com/" target="_blank">듀오리매리</a></li> -->
<!-- 		<li><a href="http://www.10weddinghall.com/" target="_blank">텐웨딩홀</a></li> -->
<!-- 	</ul> -->
<!-- </div> -->
	<div id="content" style="">

	
		<div style="margin:0 auto; width:554px; overflow:hidden;">

			<div class="box-wrapper">
				<form id="submitForm" name="METForm" method="post" action="/duo/ModifyControl">
				<input type="hidden" name="cmd" id="cmd" value="mypage_modify2" />
				
				
				<input id="u_id" type="hidden" name="u_id" value="<%=user %>" />
								
				<table cellspacing="0" cellpadding="0" summary="비밀번호 입력 폼입니다." class="e-step-2">
					<caption>비밀번호 입력 폼</caption>
					<tbody>
						<tr>
							<td class="notice-1 main_ttl tit_memberinfo" align="center">
								
							</td>
						</tr>
						<tr>
							<td class="ip">
								<table cellspacing="0" cellpadding="0" summary="비밀번호 입력 폼입니다.">
									<caption>비밀번호 입력 폼</caption>
									<tbody id="input_body">
										<tr>
											<td width="100">아이디</td>
											<td value="<%=user %>">:&nbsp;&nbsp;&nbsp; <%=user %></td>
										</tr>
<!-- 										<tr> -->
											<td width="100" style="line-height:37px; vertical-align:top;">비밀번호</td>
											<td>
												<span class="box">
													<span style="float:left; display:block; line-height:37px;">:&nbsp;&nbsp;&nbsp;</span>
													<input type="password" placeholder="(현재사용중인 비밀번호 입력)" title="비밀번호"  
													onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;" class="ip_pw" name="u_pwd" id="u_pwd" />
												</span>
												<span class="box box2">
													<span style="float:left; display:block; line-height:37px;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
													<span id = 'login_error'></span><span class="pw_wrong"></span>
												</span>
											</td>
										</tr>
										
									</tbody>
								</table>
						</tr>
						<tr>
							<td  class="td_submit" align="center"><a id="modifyConfirmBtn"><img src="/duo/common/img/btn_05.png" /></a></td>
						</tr>
					<tbody>
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