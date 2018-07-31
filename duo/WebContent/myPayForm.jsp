<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="mybatis.model.Purchase" %>
<%@ page import="mybatis.model.Member" %>
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
<script>
<%-- <%System.out.print ("받은값"+request.getParameter("cmd"));%> --%>
<%-- <%System.out.print ("받은값"+request.getParameter("m_id"));%> --%>

<%
// Control에서 param을 넘겨받아 pList 변수에 지정
List <Purchase> pList = (List <Purchase>)request.getAttribute("param");
// System.out.println(pList.size());
%> 

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
  /* #table1 {
    width: 60%;
    border: 1px solid #444444;
    border-collapse: collapse;
    margin-left: 150px;
  } */
  div#listname{
   font-size:20pt;
   font-weight: bold;
   color:#369;
}
  
 /*  table {
   width: 100%;
   border-top: 1px solid #444444;
   border-collapse: collapse;
}

th, td {
   border-bottom: 1px solid #444444;
   padding: 10px;
   text-align: center;
} */

table.paylist {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
   border: 1px solid #ccc;
}
table.paylist thead th {
    padding: 10px;
    font-weight: bold;
    font-size: 16px;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}

table.paylist td {
    width: 350px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
 
/* #firsttr {
   background-color: #F361A6;
   color: #ffffff;
}

tbody tr:nth-child(2n) {
   background-color: #FFD9EC;
}

tbody tr:nth-child(2n+1) {
   background-color: #FFEBFE;
} */

.setDiv {
/*    padding-top: 100px; */
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
       <div style="width:100%; min-width:1000px; height:1120px; background:#ffffff  center top no-repeat;">
      
      <div style="display:block; margin:0 auto; width:1120px; height:700px; position:relative;">
         <!--왼쪽-->
        <jsp:include page="/left_box.jsp" flush="true" />
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
//    slider1.startAuto();
//    slider2.startAuto();

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
<!--             <h3 class="txt1">결제내역<span class="hide">듀오 회원을 소개합니다.</span></h3> 원래는 h3    -->
            
<!--             <div id='outcome' overflow-y:scroll> -->

<br/><br/><br/><br/><div id='listname'>결제내역</div>
 
 <br/><br/><br/>
<!-- <table border='1' id='table1'> -->

<table border='1' id='table1' class='paylist'>
<thead>
<tr id='firsttr'>
<th>아 이 디 </th>
<th>성     명</th>
<th>등     급</th>
<th>결제일자</th>
<th>상     태</th>
</tr>
</thead>
<tbody  id="listTable">
   <%if(pList.size()==0 || pList==null){ //결제이력 없을경우%> 
      
      <tr>
         <td colspan=5>결제이력 없음</td>
         <%-- <td><%= purchase.getmName() %></td>
         <td><%= purchase.getpRank() %></td>
         <td><%= (purchase.getpDate()).substring(0,10) %></td>
         <td><%= purchase.getpStat() %></td>  --%>
      </tr>
         
   <% }//end if %>   
   
   
    <%if(pList!=null) { %>
      <% for( Purchase purchase : pList ) { %>
      <tr>
         <td><%= purchase.getpId() %></td>
         <td><%= purchase.getmName() %></td>
         <td><%= purchase.getpRank() %></td>
         <td><%= (purchase.getpDate()).substring(0,10) %></td>
         <td><%= purchase.getpStat() %></td> 
      </tr>
      <% }//end for %>   
   <% }//end else if %>   
      
</tbody>
</table>
<!-- </table> -->

</div>         
<!--             <div style="display:block; float:left; margin:0 0 65px 0; width:918px; height:265px; position:relative;"> -->
<!--                <h3 class="txt2"><span class="hide">듀오회원 인터뷰<br />DUO PHOTO INTERVIEW </span><a href="/duo/member/photo_interview.asp">바로가기</a></h3> -->
<!--                <div style="display:block; float:left; width:918px; overflow:hidden;position:relative;"> -->
<!--                   <div style="display:block; float:left; width:306px; height:265px;"> -->
<!--                      <ul class="slider_left"> -->
<!--                         <li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7044.jpg" /></a></li> -->
<!--                         <li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7017.jpg" /></a></li> -->
<!--                         <li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7020.jpg" /></a></li> -->
<!--                         <li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7022.jpg" /></a></li> -->
<!--                         <li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7026.jpg" /></a></li> -->
<!--                      </ul> -->
<!--                   </div> -->
<!--                   <div style="display:block; float:right; width:306px; height:265px;"> -->
<!--                      <ul class="slider_right"> -->
<!--                         <li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7017.jpg" /></a></li> -->
<!--                         <li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7020.jpg" /></a></li> -->
<!--                         <li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7022.jpg" /></a></li> -->
<!--                         <li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7026.jpg" /></a></li> -->
<!--                         <li><a href="/duo/member/photo_interview.asp"><img src="/duo/member/photo_img/member_7028.jpg" /></a></li> -->
<!--                      </ul> -->
<!--                   </div> -->
<!--                      <a id="prev" style="cursor:pointer; display:block; position:absolute; bottom:0; left:569px; width:43px; height:43px; background:url(/duo/member/img/prev_01.jpg) left top no-repeat; font-size:0; z-index:2;"></a> -->
<!--                      <a id="next" onClick="next_slider()" style="cursor:pointer; display:block; position:absolute; bottom:0; left:612px; width:43px; height:43px; background:url(/duo/member/img/next_01.jpg) left top no-repeat; font-size:0; z-index:2;"></a> -->
<!--                </div> -->
<!--             </div> -->
<!--             <h3 class="txt3">회원 체험후기</h3> -->
<!--             <ul class="customer_voice"> -->
<!--                <li style="float:left;"> -->
<!--                   <a href="/duo/member/customer_voice.asp" class="first"> -->
<!--                   <div style="display:block; width:100%; height:159px;"> -->
<!--                   <div class="temp"> -->
<!--                      <span class="txt1">듀오를 선택하길 잘했다는 생각이<br />들었습니다.</span> -->
<!--                      <span class="txt2" style="color:#ff3da0;">김미나 여성회원</span> -->
<!--                   </div> -->
<!--                   </div> -->
<!--                   </a> -->
<!--                </li> -->
<!--                <li style="float:right;"> -->
<!--                   <a href="/duo/member/customer_voice.asp" class="second"> -->
<!--                   <div style="display:block; width:100%; height:159px;"> -->
<!--                   <div class="temp"> -->
<!--                      <span class="txt1">이제 그 사랑스러운 분과 결혼을<br />눈앞에 두고 있습니다.</span> -->
<!--                      <span class="txt2" style="color:#91b952;">이성훈&김보경 성혼커플</span> -->
<!--                   </div> -->
<!--                   </div> -->
<!--                   </a> -->
<!--                </li> -->
<!--                <li style="float:left;"> -->
<!--                   <a href="/duo/member/customer_voice.asp" class="third"> -->
<!--                   <div style="display:block; width:100%; height:159px;"> -->
<!--                   <div class="temp"> -->
<!--                      <span class="txt1">대한민국 선남선녀들을 인연으로<br />만드는 창구가 되길 바랍니다.</span> -->
<!--                      <span class="txt2" style="color:#91b952;">박민재&이채민 성혼커플</span> -->
<!--                   </div> -->
<!--                   </div> -->
<!--                   </a> -->
<!--                </li> -->
<!--                <li style="float:right;"> -->
<!--                   <a href="/duo/member/customer_voice.asp" class="fourth"> -->
<!--                   <div style="display:block; width:100%; height:159px;"> -->
<!--                   <div class="temp"> -->
<!--                      <span class="txt1">항상 상냥하게 응대해 주시는<br />매니저님 덕분에 힘이 많이 되었습니다.</span> -->
<!--                      <span class="txt2" style="color:#5286d6;">남지석 남성회원</span> -->
<!--                   </div> -->
<!--                   </div> -->
<!--                   </a> -->
<!--                </li> -->
<!--             </ul> -->
<!--             <a href="/duo/member/customer_voice.asp" class="detail">+더보기</a> -->
         </div>
      </div>
      </div>
      
      <a href="/duo/member/matching_main.asp" class="matching"></a>

<!--       <div style="width:100%; min-width:1120px; height:487px; background:#ffffff;"> -->
<!--       <div style="display:block; margin:0 auto; width:1120px; height:487px;"> -->
<!--          <div class="content_box type2"> -->
<!--             <h3>듀오에는 어떤 회원들이 있을까요?</h3> -->
<!--             <span>3만 4천 여명의 신뢰할 수 있는 회원수</span> -->
<!--             <div style="display:block; float:left; width:918px; height:328px;"> -->
<!--                <div class="fade_item"><a href="/duo/member/data_marry.asp"><img src="/duo/member/img/main_06.jpg" /></a></div> -->
<!--                <div class="fade_item" style="display:none;"><a href="/duo/member/data_marry.asp"><img src="/duo/member/img/main_07.jpg" /></a></div> -->
<!--             </div> -->
<!--          </div> -->
<!--       </div> -->
<!--       </div> -->

      <a href="/duo/member/member_search01.asp" class="search">
<!--       <div style="display:block; margin:0 auto; width:1120px; height:229px;"> -->
<!--          <div class="content_box type3"> -->
<!--             <div style="display:block; width:100%; height:229px;"> -->
<!--             <div style="display:table-cell; height:229px; vertical-align:middle;"> -->
<!--                <span class="txt1">결혼회원검색 </span> -->
<!--                <span class="txt2">만나고 싶은 상대의 조건을 검색하세요.</span> -->
<!--             </div> -->
<!--             </div> -->
<!--          </div> -->
<!--       </div> -->
      </a>
<!--    </div> -->
   <!--내용영역-->
   <!--하단영역-->
   
<jsp:include page="/footer.jsp" flush="true" />

<jsp:include page="/fixRight.jsp" flush="true" />

</body>
</html>