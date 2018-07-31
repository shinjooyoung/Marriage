<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybatis.model.*" %>
<%
String user =(String)session.getAttribute("userId");
%>

<script type="text/javascript">
var img_slider_index = 1;
var img_slider_num;
var next_num;
var img_slider_lock;

function img_slider(val) {
	if ( img_slider_lock == true || val == $('.img_slider .paging > span.on').index() ) return;
	img_slider_lock = true;
	
	if (val != undefined) {
		img_slider_index = val;
	}
	next_num = img_slider_index+1;
	$('.img_slider .slides:nth-of-type(' + next_num + ')').addClass('next');
	
	$('.img_slider .current').clearQueue().stop().animate({'width':'0'}, 1000
		, function() {
			$(this).removeClass('current').css('width','');
			$(this).parent().find('.next').addClass('current');
			$(this).parent().find('.next').removeClass('next');
			
			img_slider_index++;
			if(img_slider_index >= $('.img_slider .slides').length ) {
				img_slider_index = 0;
			}
			
			$('.img_slider .paging > span').removeClass();
			$('.img_slider .paging > span:nth-child(' + next_num + ')').addClass('on');
			
			img_slider_lock = false;
		}
	);
}

$(document).ready(function() {
	$('.img_slider .first').addClass('current');
	img_slider_num = $('.img_slider .slides').length;
	for (var i=0; i < img_slider_num; i++) {
		$('.img_slider .paging').append('<span onClick=\"img_slider(' + i + ')\"></span>');
	}
	var img_current_index = $('.img_slider .current').index()+1;
	$('.img_slider .paging > span:nth-child(' + img_current_index + ')').addClass('on');
	
	$('.img_slider .slides .inner').each(function() {
		$(this).width($(document).width());
	});
	$(window).resize(function() {
		$('.img_slider .slides .inner').each(function() {
			$(this).width($(document).width());
		});
	});
	
	//var img_slider_main = setInterval(img_slider, 5000);
	var img_slider_main;
	if(1< img_slider_num){
	   img_slider_main = setInterval(img_slider, 5000);
	}
	
	$('.img_slider').find('.play').on('click', function() {
		if ($(this).hasClass('on'))
		{
			$(this).removeClass('on');
			img_slider_main = setInterval(img_slider, 5000);
		} else {
			$(this).addClass('on');
			clearInterval(img_slider_main);
			img_slider_main = null;
		}
	});
});

</script>
</head>

<body>
<div id="subArea">
    <h1>듀오</h1>
    <!--상단영역-->
    <div id="nw_header">
	<div class="menu-wrapper
	">
		<div class="main-menu">
			<div style="float:left; width:230px; overflow:hidden;">
				<h1 class="logo"><a href="/duo/DuoControl?cmd=main-page"><img src="/duo/include/header/img/sub_logo_new.jpg" alt="듀오" /></a></h1>
				<div style="float:left; margin:47px 0 0 15px; width:120px; font-family:'Malgun Gothic','맑은고딕'; font-size:11px; color:#8d8d8d;">한국대표결혼정보회사<br /><span style="font-size:12px; color:#5d5d5d;">성혼회원수 35,912명</span></div>
			</div>
			
			<ul class="menu-list">
				<li class="menu-01 root_menu" style="margin:0;"><a href="/html/duostory/main.asp">듀오이야기</a></li>
				<li class="menu-02 root_menu"><a href="/html/service/main.asp">가입안내</a></li>
				<li class="menu-03 root_menu"><a href="/html/member/main.asp">회원검색</a></li>
				<li class="menu-04 root_menu"><a href="/html/duo_couple/main.asp">성혼커플</a></li>
				<li class="menu-05 root_menu"><a href="/html/love_test/main.asp">미팅가이드</a></li>
<!-- 				<li class="menu-06 root_menu"><a href="/html/meetguide/main.asp">미팅가이드</a></li> -->
<!-- 				<li class="menu-07 root_menu"><a href="/html/event/main.asp">이벤트</a></li> -->
<!-- 				<li class="menu-08 root_menu"><a href="http://www.duoremarry.com/" target="_blank">재혼</a></li> -->
<!-- 				<li class="menu-09 root_menu"><a href="http://www.duowed.com/" target="_blank">웨딩</a></li> -->
				
			</ul>			
			
			<div class="gnb-menu">
					<ul class="gnb">
						<!--<li><a href="/html/duostory/humanlife.asp">듀오휴먼라이프연구소</a></li>-->
						<%if(user==null){ %>
						<li><a href="/duo/DuoControl?cmd=join"><strong>회원가입</strong></a></li>
							<li><a href="/duo/DuoControl?cmd=login">로그인</a></li>
						<%}else{ %>
						<li><a href="/duo/ListControl?cmd=showHeart"><strong>마이페이지</strong></a></li>
							<li><a href="/duo/DuoControl?cmd=logout">로그아웃</a></li>
						<%} %>
						<li><a href="/html/helpdesk/main.asp">헬프데스크</a></li>
						<li style="color:#000000; font-weight:bold;"><a href="http://english.duo.co.kr/"  target="_blank">DUO USA</a></li>
					</ul>
			</div>
			

		</div>
		<div class="depth-menu">
			<div class="common-wrapper-2 depth2">
				<div class="d-left">
					<h2 class="t-menu" style="position:static; visibility:visible;">新결혼문화창조<br /><span class="menu-01">듀오이야기</span></h2>
					<a href="/html/duostory/main.asp" class="go">바로가기</a>
					<p class="tel">무료상담전화<br /><span>1577-8333</span></p>
				</div>
				<ul class="depth-list">
					<li class="menu-01"><a href="/html/duostory/ceo_greeting.asp">CEO소개</a></li>
					<li class="menu-01"><a href="/html/duostory/manager_intro.asp">커플매니저 소개</a></li>
					<li class="menu-01"><a href="/html/duostory/ad_tv.asp">광고 갤러리</a></li>
					<li class="menu-01"><a href="/html/duostory/media_main.asp">언론에 비친 듀오</a></li>
					<li class="menu-01"><a href="/html/duostory/video.asp">동영상 이야기</a></li>
					<!--<li class="menu-01"><a href="/html/duostory/humanlife.asp">듀오휴먼라이프연구소</a></li>-->
					<li class="menu-01"><a href="/html/duostory/browse.asp">듀오 둘러보기</a></li>
					<li class="menu-01"><a href="/html/duostory/campaign.asp">아름다운 캠페인</a></li>
				</ul>
				<div class="d-right">
					<h3 class="thumb" style="position:static; visibility:visible;"><a href="/html/duostory/video.asp" class="menu-01">왜 나는 듀오하는가_1부] '몰라염'</a></h3>
					<ul class="bn-list">
						<li><a href="/html/service/program01.asp" class="bn-1">듀오 가입안내</a></li>
						<li><a href="/html/member/matching_main.asp" class="bn-2">내 이상형은 어디에?</a></li>
						<li><a href="/html/service/know.asp" class="bn-3">WHY 듀오일까요?</a></li>
					</ul>
				</div>
			</div>
			<div class="common-wrapper-2 depth2">
				<div class="d-left">
					<h2 class="t-menu" style="position:static; visibility:visible;">듀오 서비스<br /><span class="menu-02">가입안내</span></h2>
					<a href="/html/service/main.asp" class="go">바로가기</a>
					<p class="tel">무료상담전화<br /><span>1577-8333</span></p>
				</div>
				<ul class="depth-list" style="float:left;
    margin:21px 0 0 25px;
    width:215px;
    font-size:14px;
    color:#5d5d5d;
    line-height:33px;">
					<li class="menu-02"><a href="/html/service/know.asp">왜 듀오일까요?</a></li>
					<li class="menu-02"><a href="/html/service/number_duo.asp">숫자로 보는 듀오</a></li>
					<li class="menu-02"><a href="/html/service/program01.asp">서비스종류</a></li>
					<li class="menu-02"><a href="/duo/DuoControl?cmd=purchase">가입비 안내</a></li>
					<li class="menu-02"><a href="/html/service/matching_01.asp">가입 및 활동절차</a></li>
					<!--<li class="menu-02"><a href="/html/service/consult.asp">상담방법&자료요청</a></a></li>-->
					<li class="menu-02"><a href="/html/service/matching_02.asp">매칭시스템</a></li>
					<li class="menu-02"><a href="/html/service/free_service/201611_main_01.asp">서비스 무료체험</a></li>
					<li class="menu-02"><a href="/html/service/members.asp">멤버스클럽 알아보기</a></li>
					<li class="menu-02"><a href="/html/service/marriage_consult.asp">자녀결혼 컨설팅</a></li>
				</ul>
				<div class="d-right">
					<h3 class="thumb" style="position:static; visibility:visible;"><a href="/html/service/members.asp" class="menu-02">결혼 확률 높여주는 멤버스클럽의 장점 4가지!</a></h3>
					<ul class="bn-list">
						<li><a href="/html/service/program01.asp" class="bn-1">듀오 가입안내</a></li>
						<li><a href="/html/member/matching_main.asp" class="bn-2">내 이상형은 어디에?</a></li>
						<li><a href="/html/service/know.asp" class="bn-3">WHY 듀오일까요?</a></li>
					</ul>
				</div>
			</div>
			<div class="common-wrapper-2 depth2">
				<div class="d-left">
					<h2 class="t-menu" style="position:static; visibility:visible;">신뢰할 수 있는 듀오<br /><span class="menu-03">회원검색</span></h2>
					<a href="/html/member/main.asp" class="go">바로가기</a>
					<p class="tel">무료상담전화<br /><span>1577-8333</span></p>
				</div>
				<ul class="depth-list">
					<li class="menu-03"><a href="/html/member/photo_interview.asp">듀오회원인터뷰</a></li>
					<li class="menu-03"><a href="/html/member/member_search01.asp">결혼회원검색</a></li>
					<li class="menu-03"><a href="/duo/DuoControl?cmd=main-page">이상형찾기</a></li>
					<li class="menu-03"><a href="/html/member/data_marry.asp">듀오회원현황</a></li>
					<li class="menu-03"><a href="/html/member/customer_voice.asp">회원체험후기</a></li>
				</ul>
				<div class="d-right">
					<h3 class="thumb" style="position:static; visibility:visible;"><a href="/html/member/matching_main.asp" class="menu-03">DUO MATCHING TEST! 나만의 이상형 찾기</a></h3>
					<ul class="bn-list">
						<li><a href="/html/service/program01.asp" class="bn-1">듀오 가입안내</a></li>
						<li><a href="/html/member/matching_main.asp" class="bn-2">내 이상형은 어디에?</a></li>
						<li><a href="/html/service/know.asp" class="bn-3">WHY 듀오일까요?</a></li>
					</ul>
				</div>
			</div>
			<div class="common-wrapper-2 depth2">
				<div class="d-left">
					<h2 class="t-menu" style="position:static; visibility:visible;">국내유일 실시간 성혼회원 공개<br /><span class="menu-04">성혼커플</span></h2>
					<a href="/html/duo_couple/main.asp" class="go">바로가기</a>
					<p class="tel">무료상담전화<br /><span>1577-8333</span></p>
				</div>
				<ul class="depth-list">
					<li class="menu-04"><a href="/html/duo_couple/couple_interview.asp">성혼커플 인터뷰</a></li>
					<li class="menu-04"><a href="/html/duo_couple/couple_story.asp">성혼커플 스토리</a></li>
					<li class="menu-04"><a href="/html/duo_couple/couple_list.asp">성혼커플 리스트</a></li>
					<li class="menu-04"><a href="/html/duo_couple/couple_assay_main.asp">성혼커플 분석</a></li>
				</ul>
				<div class="d-right">
					<h3 class="thumb" style="position:static; visibility:visible;"><a href="/html/duo_couple/couple_assay_main.asp" class="menu-04">4시간마다 1명씩 결혼 듀오의 성혼지상주의</a></h3>
					<ul class="bn-list">
						<li><a href="/html/service/program01.asp" class="bn-1">듀오 가입안내</a></li>
						<li><a href="/html/member/matching_main.asp" class="bn-2">내 이상형은 어디에?</a></li>
						<li><a href="/html/service/know.asp" class="bn-3">WHY 듀오일까요?</a></li>
					</ul>
				</div>
			</div>
<!-- 			<div class="common-wrapper-2 depth2"> -->
<!-- 				<div class="d-left"> -->
<!-- 					<h2 class="t-menu" style="position:static; visibility:visible;">다양한 심리테스트<br /><span class="menu-05">러브테스트</span></h2> -->
<!-- 					<a href="/html/love_test/main.asp" class="go">바로가기</a> -->
<!-- 					<p class="tel">무료상담전화<br /><span>1577-8333</span></p> -->
<!-- 				</div> -->
<!-- 				<ul class="depth-list" style="margin:23px 0 0 25px;"> -->
<!-- 					<li class="menu-05"><a href="/html/love_test/loveclinic/loveclinic_main.asp">연애진단 테스트</a></li>					 -->
<!-- 					<li class="menu-05"><a href="/html/love_test/love_tendency/love_tendency_main.asp">LOVE 성향 테스트</a></li> -->
<!-- 					<li class="menu-05"><a href="/html/love_test/partner_test2/partner_test_main.asp">내 결혼상대 찾기</a></li> -->
<!-- 					<li class="menu-05"><a href="/html/love_test/self_love/self_love_main.asp">연애적성검사</a></li> -->
<!-- 					<li class="menu-05"><a href="/html/fortune2015/fortune_main.asp">무료 연애운 보기</a></li> -->
<!-- 					<li class="menu-05"><a href="/html/love_test/affinity/main.asp">결혼친화도 테스트</a></li> -->
<!-- 					<li class="menu-05"><a href="/html/love_test/color_test/color_test_main.asp">컬러 진단 테스트</a></li> -->
<!-- 					<li class="menu-05"><a href="/html/love_test/love_sense/love_sense.asp">연애감각유형테스트</a></li> -->
<!-- 					<li class="menu-05"><a href="/html/love_test/talisman/main.asp">행운의 연애부적 받기</a></li> -->
<!-- 				</ul> -->
<!-- 				<div class="d-right"> -->
<!-- 					<h3 class="thumb" style="position:static; visibility:visible;"><a href="/html/love_test/affinity/main.asp" class="menu-05">나의 결혼 가능성은 몇 점? 결혼친화도 테스트</a></h3> -->
<!-- 					<ul class="bn-list"> -->
<!-- 						<li><a href="/html/service/program01.asp" class="bn-1">듀오 가입안내</a></li> -->
<!-- 						<li><a href="/html/member/matching_main.asp" class="bn-2">내 이상형은 어디에?</a></li> -->
<!-- 						<li><a href="/html/service/know.asp" class="bn-3">WHY 듀오일까요?</a></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="common-wrapper-2 depth2">
				<div class="d-left">
					<h2 class="t-menu" style="position:static; visibility:visible;">재밌고 유용한 TIP<br /><span class="menu-06">미팅가이드</span></h2>
					<a href="/html/meetguide/main.asp" class="go">바로가기</a>
					<p class="tel">무료상담전화<br /><span>1577-8333</span></p>
				</div>
				<ul class="depth-list" style="float:left;
    margin:21px 0 0 25px;
    width:215px;
    font-size:14px;
    color:#5d5d5d;
    line-height:33px;">
					<li class="menu-06"><a href="/html/news/card_news.asp">카드뉴스</a></li> 
					<li class="menu-06"><a href="/html/meetguide/success_time.asp">미팅성공전략</a></li>
					<li class="menu-06"><a href="/html/meetguide/love_qna_list.asp">연애고민Q&A</a></li>
					<li class="menu-06"><a href="/html/meetguide/love_column_list.asp">연애칼럼</a></li>
					<li class="menu-06"><a href="/html/meetguide/cartoon_list.asp">러브카툰</a></li>
					<li class="menu-06"><a href="/html/meetguide/date_list.asp">추천! 데이트 코스</a></li>
					<li class="menu-06"><a href="/html/meetguide/love_speech_list.asp">연애스피치</a></li>
					<li class="menu-06"><a href="/html/meetguide/love_institute_list.asp">연애연구소</a></li>
					<li class="menu-06"><a href="/html/meetguide/research_list.asp">톡톡! 리서치</a></li>
				</ul>
				<div class="d-right">
					<h3 class="thumb" style="position:static; visibility:visible;"><a href="/html/meetguide/love_column_list.asp" class="menu-06">알쏭달쏭 연애심리 연애컬럼</a></h3>
					<ul class="bn-list">
						<li><a href="/html/service/program01.asp" class="bn-1">듀오 가입안내</a></li>
						<li><a href="/html/member/matching_main.asp" class="bn-2">내 이상형은 어디에?</a></li>
						<li><a href="/html/service/know.asp" class="bn-3">WHY 듀오일까요?</a></li>
					</ul>
				</div>
			</div>
			<div class="common-wrapper-2 depth2">
				<div class="d-left">
					<h2 class="t-menu" style="position:static; visibility:visible;">공연 문화 그리고 미팅파티<br /><span class="menu-07">이벤트</span></h2>
					<a href="/html/event/main.asp" class="go">바로가기</a>
					<p class="tel">무료상담전화<br /><span>1577-8333</span></p>
				</div>
				<ul class="depth-list">
					<li class="menu-07"><a href="/html/event/event_list.asp">이벤트 전체보기</a></li>
					<li class="menu-07"><a href="/html/event/join_party.asp">기업제휴파티</a></li>
					<li class="menu-07"><a href="/html/event/event_sketch_list.asp">파티현장 갤러리</a></li>
					<li class="menu-07"><a href="/html/event/event_spentry_list.asp">후기&자유게시판</a></li>
					<li class="menu-07"><a href="/html/event/event_qna_01.asp">듀오파티 Q&A</a></li>
				</ul>
				<div class="d-right">
					<h3 class="thumb" style="position:static; visibility:visible;"><a href="/html/event/event_list_view.asp?evt_no=4451" class="menu-07">연극 라이어 3탄</a></h3>
					<ul class="bn-list">
						<li><a href="/html/service/program01.asp" class="bn-1">듀오 가입안내</a></li>
						<li><a href="/html/member/matching_main.asp" class="bn-2">내 이상형은 어디에?</a></li>
						<li><a href="/html/service/know.asp" class="bn-3">WHY 듀오일까요?</a></li>
					</ul>
				</div>
			</div>
			<div class="common-wrapper-2 depth2">
				<div class="d-left">
					<h2 class="t-menu" style="position:static; visibility:visible;">재혼도 역시 듀오<br /><span class="menu-08">재혼</span></h2>
					<a href="http://www.duoremarry.com/" class="go" target="_blank">바로가기</a>
					<p class="tel">무료상담전화<br /><span>1577-8333</span></p>
				</div>
				<ul class="depth-list">
					<li class="menu-08"><a href="http://www.duoremarry.com/html/remarry/remarry.asp" target="_blank">듀오재혼소개</a></li>
					<li class="menu-08"><a href="http://www.duoremarry.com/html/service/program.asp" target="_blank">가입안내</a></li>
					<li class="menu-08"><a href="http://www.duoremarry.com/html/member/member_data.asp" target="_blank">재혼회원현황</a></li>
					<li class="menu-08"><a href="/html/member/matching_main.asp" >재혼상대찾기</a></li>
					<li class="menu-08"><a href="http://www.duoremarry.com/html/service/marriage_guide.asp" target="_blank">재혼전문가 상담</a></li>
					<li class="menu-08"><a href="/html/service/free_service/201611_main_01.asp">서비스 무료체험</a></li>
				</ul>
				<div class="d-right">
					<h3 class="thumb" style="position:static; visibility:visible;"><a href="http://www.duoremarry.com/html/member/member_data.asp" class="menu-08" target="_blank">듀오 재혼회원 분석 Report</a></h3>
					<ul class="bn-list">
						<li><a href="http://www.duoremarry.com/html/service/service.asp" class="bn-1" target="_blank">듀오 가입안내</a></li>
						<li><a href="/html/member/matching_main.asp" class="bn-2">내 이상형은 어디에?</a></li>
						<li><a href="/html/service/know.asp" class="bn-3" >WHY 듀오일까요?</a></li>
					</ul>
				</div>
			</div>
			<div class="common-wrapper-2 depth2">
				<div class="d-left">
					<h2 class="t-menu" style="position:static; visibility:visible;">듀오가 만든 웨딩컨설팅<br /><span class="menu-09">웨딩</span></h2>
					<a href="http://www.duowed.com/" class="go" target="_blank">바로가기</a>
					<p class="tel">무료상담전화<br /><span>1577-2229</span></p>
				</div>
				<ul class="depth-list">
					<li class="menu-09"><a href="http://www.duowed.com/html/duowed/main.asp" target="_blank">듀오웨드소개</a></li>
					<li class="menu-09"><a href="http://www.10weddinghall.com/html/search/hall_search.asp" target="_blank">웨딩홀 검색</a></li>
					<li class="menu-09"><a href="http://www.10weddinghall.com/html/event/main.asp" target="_blank">웨딩홀 이벤트</a></li>
					<li class="menu-09"><a href="http://www.duowed.com/html/gallery/gallery_list.asp?pagemode=studio" target="_blank">웨딩갤러리</a></li>
					
				  <li class="menu-09"><a href="http://www.duowed.com/html/couple/after_list.asp" target="_blank">커플스토리</a></li>
					<li class="menu-09"><a href="http://www.duowed.com/html/event/free_diary_consult.asp" target="_blank">웨딩다이어리신청</a></li>
				</ul>
				<div class="d-right">
					<h3 class="thumb" style="position:static; visibility:visible;">
                    <a href="http://www.duowed.com/html/event/fair/fair_170823.asp" class="menu-09" target="_blank">웨딩브랜드 신상 런웨이</a></h3>
					<ul class="bn-list">
						<li><a href="http://www.duowed.com/html/gallery/self.asp" class="w-bn-1" target="_blank">웨딩패키지 셀프견적</a></li>
						<li><a href="http://www.10weddinghall.com/html/estimate/estimate.asp" class="w-bn-2" target="_blank">예식비용 견적내기</a></li>
						<li><a href="http://www.duowed.com/html/guide/dress_choice.asp" class="w-bn-3" target="_blank">드레스 고르기 테스트</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="border"></div>
	</div>
</div>
<script type="text/javascript">
$(document).mousemove(function(e){
	if (e.pageY > 450)
	{
		$(".depth-menu").slideUp(300);
	}
	
});

$(".root_menu").mouseover(function(){
	var now_position = $(".root_menu").index(this);

	$(".depth-menu").slideDown(300);
	$(".depth2").hide();
	$(".depth2").eq(now_position).show();
});

$(".gnb").mouseover(function(){
	$(".depth-menu").slideUp(300);
});

$("#subcontentArea").mouseover(function(){
	$(".depth-menu").slideUp(300);
});	
</script>
