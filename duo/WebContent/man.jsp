<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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

<link href="/duo/common/css/member.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript" src="/duo/common/js/jquery-1.11.0.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script language="javascript" type="text/javascript" src="/duo/common/isValidType.js"></script>
<script language="javascript" type="text/javascript" src="/duo/common/flashshow.js"></script>
<script type="text/javascript" src="/duo/common/js/include_ex_script.js"></script>
<style>
table.sel {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
	border: 1px solid #ccc;
}

 table.sel .title {
    padding: 10px;
    font-weight: bold;
    font-size: 16px;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}

table.sel td {
    width: 100px;
    hegiht: 40px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
} 
 
</style>

<style>
table.sel {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
	border: 1px solid #ccc;
}

 table.sel .title {
    padding: 10px;
    font-weight: bold;
    font-size: 16px;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}

table.sel td {
    width: 100px;
    hegiht: 40px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
} 
 
</style>

<script type="text/javascript">


function popup_win2(id) { //위치 left=500, top=400 에서 열리는 팝업창
	
	
	window.name = "parentForm"
 	var openWin = window.open("/duo/search?cmd=detailpk&m_id="+id, "childForm", "width=400, height=300, left=500, top=400");
 	}
	




function popup_win() { //위치 left=500, top=400 에서 열리는 팝업창
	window.open("detail_m.jsp", "", "width=400, height=300, left=500, top=400");
	}


var now_step = 0;
function next_step()
{
	//alert($(".step_q").length);
	  /*var age="";
	   $(".u_age:checked").each(function (index){
		 age += $(this).val() + "/";
	  }); */
	var age=$(".u_age:checked").val(); 	
	var sal=$(".u_sal:checked").val();  
	var edu=$(".u_edu:checked").val();
	var job=$(".u_job:checked").val(); 
	
			  
	switch(now_step)
	{
	case 0:
		if ($(".u_age:checked").length < 1)
		{
			alert("만나고 싶은 상대의 나이를 선택해 주세요.");
			return;
		}else if($(".u_age:checked").length > 2){
			
				alert("2개까지만 선택이 가능합니다");
				return;
			
		}
		else
		{
		
			$(".tab_over").removeClass("on");
			$(".box-type1").eq(0).removeClass("w_type" + (now_step + 1));

			now_step = now_step + 1;
			$(".box-type1").eq(0).addClass("w_type" + (now_step + 1));
			$(".step_q").eq(now_step-1).slideUp(500,function(){
				$(".tab_over").eq(now_step).addClass("on");
				$(".step_q").eq(now_step).slideDown(500);
			});
		}
	break;

	case 1:
		if ($(".u_sal:checked").length < 1)
		{
			alert("당신이 찾고 있는 이상형의 연봉을 선택해 주세요.");
			return;
		}
		else
		{
			$(".tab_over").removeClass("on");
			$(".box-type1").eq(0).removeClass("w_type" + (now_step + 1));

			now_step = now_step + 1;
			$(".box-type1").eq(0).addClass("w_type" + (now_step + 1));
			$(".step_q").eq(now_step-1).slideUp(500,function(){
				$(".tab_over").eq(now_step).addClass("on");
				$(".step_q").eq(now_step).slideDown(500);
			});
		}
	break;

	case 2:
		if ($(".u_edu:checked").length < 1)
		{
			alert("당신이 원하는 상대의 학력을 선택해 주세요.");
			return;
		}
		else
		{
			$(".tab_over").removeClass("on");
			$(".box-type1").eq(0).removeClass("w_type" + (now_step + 1));

			now_step = now_step + 1;
			$(".box-type1").eq(0).addClass("w_type" + (now_step + 1));
			$(".step_q").eq(now_step-1).slideUp(500,function(){
				$(".tab_over").eq(now_step).addClass("on");
				$(".step_q").eq(now_step).slideDown(500);
			});
		}
	break;

	case 3:
		if ($(".u_job:checked").length < 1)
		{
			alert("당신이 찾는 이상형의 직업을 선택해 주세요.");
			return;
		}
		else
		{
			
			
			$(".tab_over").removeClass("on");
			$(".box-type1").eq(0).removeClass("w_type" + (now_step + 1));

			now_step = now_step + 1;
			$(".box-type1").eq(0).addClass("w_type" + (now_step + 1));
			$(".step_q").eq(now_step-1).slideUp(500,function(){
// 			document.msForm.submit();
				$(".tab_over").eq(now_step).addClass("on");
				$(".step_q").eq(now_step).slideDown(500);
				
			});
			
			
			$.ajax({			
				   type: "post",
		    url: "/duo/search?cmd=search&gender=여자",
		   dataType : "json",
		   data: {'age':age,'sal':sal,'edu':edu,'job':job}, // 보낼 파라미터값 입력	  
		   error: function (err) {
			   alert('error:' + err );
				        // 통신에 에러가 있을경우 처리할 내용(생략가능g)
			},
			success: function (data) {
				        // 통신이 정상적으로 완료되면 처리할 내용
				
				        var year = new Date().getFullYear();
				      
				      	var tbl=$("#sel");
				    	var tr =  $("<tr/>")   												
						var td_1 = $('<td/>');
						var tlabel = $("<label/>");
				       for (var i = 0; i < data.member.length; i++) {
				    	
			
						var pic = data.member[i].pic;
						var id = data.member[i].id;
						var name =data.member[i].name;
					 
						var age =data.member[i].age;
						
						age = age.substring(0, 4);
						age=Number(age);
						age=year-age+1;
						
						var edu=data.member[i].edu;
						var job =data.member[i].job;
						var remarry =data.member[i].remarry;	
				
						
						var contents ='';
						contents += '<tr class="seltr">';
	

 					       contents +=     '<td width="80" height="55"><img src="/duo/upload/'+pic+'" style="width:80px; height:55px;"/></td>';
					   
					        contents +=     '<td>'+name+'</td>';
					        contents +=     '<td>'+age+' </td>';
					        /* contents +=     '<td width="190" height="55" >직업: '+job+' </td>'; */

					        contents += '<td width="190" height="55"><input type="button" id="selbtn" class="btn btn-default" value="상세" name="'+id+'" onclick="popup_win2($(this).next().val())"/> <input type="hidden" value="'+id+'" /></td>';
						  /*    contents += '<td class="hi"><input type="text" name="id" value='+id+'></td>';
					        contents += '<td class="hi"><label>'+job+'</label></td>';
					        contents += '<td class="hi"><label>'+remarry+'</label></td>';  */
					        contents += '</tr>';
					        tbl.append(contents);
				
					}
				       
			}
				 
		});
			
		}
	break;
	
	}
}

$(document).ready(function(){
	



	$(".u_age").click(function(){
		check_label_base_checkbox("u_age",this,"age_rd","on","");
	});


	$(".u_sal").click(function(){
		check_label_base_checkbox("u_sal",this,"sal_rd","on","");
	});

	$(".u_edu").click(function(){
		check_label_base_checkbox("u_edu",this,"edu_rd","on","");
	});

	$(".u_job").click(function(){
		check_label_base_checkbox("u_job",this,"job_rd","on","");
	});
	
	$("#more").click(function(){
		
	
		
		
		
		
	});
});
</script>


</head>

<body>
<jsp:include page="/header.jsp" flush="true" />
    <!--상단영역-->
    <div id="matching">
		<div class="box-type1 w_type1">
		<div class="box-type2">
			<div style="display:block; float:left; width:1120px; height:452px;">
				<h2>듀오 이상형찾기</h2>
				<div class="step">
						<div class="tab_over on">첫번째 질문</div>
					<div class="tab_over">두번째 질문</div>
					<div class="tab_over">세번째 질문</div>
					<div class="tab_over">네번째 질문</div>
					<div class="tab_over">이상형찾기 완료</div>
				</div>
			
				<h3>당신이 찾고 있는 이상형의 키는?</h3>
				<span> </span>
			</div>
		 	<form name="msForm" method="post" action="/duo/search">
		 		<input type='hidden' name='cmd' value='search2'/>	 
				<input type="hidden" name="u_ident2" value="1" />
				<input type="hidden" name="u_div" value="" />
				<input type="hidden" name ="gender" value="여자"/>
				<input type="hidden" id="m_id" name="m_id" value=""/>
				<div class="step_q">
				<table width="1120" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="9" height="70">&nbsp;</td>
					</tr>
					<tr>
						<td height="55" colspan="9">
							<table width="1120" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>&nbsp;</td>
									<td width="182" height="55"><label for="u_age1" title="24세 이하" class="age_rd" name="24" >20세~24세<input type="checkbox" class="u_age" id="u_age1" name="age" value="20" /></label></td>
									<td width="10">&nbsp;</td>
									<td width="182"><label for="u_age2" title="25세~29세" class="age_rd">25세~29세<input type="checkbox" class="u_age" id="u_age2"  name="age" value="25"/></label></td>
									<td width="10">&nbsp;</td>
									<td width="182"><label for="u_age3" title="30세~34세" class="age_rd">30세~34세<input type="checkbox" class="u_age" id="u_age3" name="age" value="30"/></label></td>
									<td width="10">&nbsp;</td>
									<td width="182"><label for="u_age4" title="35세~39세" class="age_rd">35세~39세<input type="checkbox" class="u_age" id="u_age4" name="age" value="35"/></label></td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="9" height="18">&nbsp;</td>
					</tr>
					<tr>
						<td height="55" colspan="9">
							<table width="1120" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>&nbsp;</td>
									<td width="182" height="55"><label for="u_age5" title="40세~44세" class="age_rd">40세~44세<input type="checkbox" class="u_age" id="u_age5" name="age" value="40"/></label></td>
									<td width="10">&nbsp;</td>
									<td width="182"><label for="u_age6" title="45세~49세" class="age_rd">45세~49세<input type="checkbox" class="u_age" id="u_age6"  name="age" value="45"/></label></td>
									<td width="10">&nbsp;</td>
									<td width="182"><label for="u_age7" title="50세~55세" class="age_rd">50세~55세<input type="checkbox" class="u_age" id="u_age7"  name="age" value="50"/></label></td>
									<td width="10">&nbsp;</td>
									<td width="182"><label for="u_age8" title="56세 이상" class="age_rd">56세~60세<input type="checkbox" class="u_age" id="u_age8"  name="age" value="55"/></label></td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="9" height="45">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="9"><a onclick="next_step()" style="cursor:pointer;" class="next">다음</a></td>
					</tr>
				</table>
				</div>

				<div class="step_q" style="display:none;">
				<table width="1120" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="9" height="70">&nbsp;</td>
					</tr>
					<tr>
						<td height="55" colspan="9">
							<table width="1120" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>&nbsp;</td>
									<td width="182" height="55"><label for="u_height1" title="2500이하" class="sal_rd">2500이하<input type="checkbox" class="u_sal" id="u_height1" name="sal" value="2500이하" /></label></td>
									<td width="10">&nbsp;</td>
									<td width="182"><label for="u_height2" title="2500~3000" class="sal_rd">2500~3000<input type="checkbox" class="u_sal" id="u_height2" name="sal" value="2500~3000" /></label></td>
									<td width="10">&nbsp;</td>
									<td width="182"><label for="u_height3" title="3000~4000" class="sal_rd">3000~4000<input type="checkbox" class="u_sal" id="u_height3" name="sal" value="3000~4000"/></label></td>
									<td width="10">&nbsp;</td>
									<td width="182"><label for="u_height4" title="4000~5000" class="sal_rd">4000~5000<input type="checkbox" class="u_sal" id="u_height4" name="sal" value="4000~5000"/></label></td>
									<td width="10">&nbsp;</td>
									<td width="182"><label for="u_height5" title="5000이상" class="sal_rd">5000이상<input type="checkbox" class="u_sal" id="u_height5" name="sal" value="5000이상"/></label></td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="9" height="45">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="9"><a onclick="next_step()" style="cursor:pointer;" class="next">다음</a></td>
					</tr>
				</table>	
				</div>

				<div class="step_q" style="display:none;">
				<table width="1120" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="9" height="70">&nbsp;</td>
					</tr>
					<tr>
						<td height="55" colspan="9">
							<table width="1120" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>&nbsp;</td>
									<td width="182" height="55"><label for="u_edu1" title="고등학교 졸업" class="edu_rd">고등학교 졸업<input type="checkbox" class="u_edu" id="u_edu1" name="edu" value="고등학교 졸업" /></label></td>
									<td width="10">&nbsp;</td>
									<td width="182"><label for="u_edu2" title="전문대 졸업" class="edu_rd">전문대 졸업<input type="checkbox"   class="u_edu" id="u_edu2"  name="edu" value="전문대 졸업"/></label></td>
									<td width="10">&nbsp;</td>
									<td width="182"><label for="u_edu3" title="대학교 졸업" class="edu_rd">대학교 졸업<input type="checkbox"   class="u_edu" id="u_edu3" name="edu" value="대학교 졸업"/></label></td>
									<td width="10">&nbsp;</td>
									<td width="182"><label for="u_edu4" title="대학원 이상" class="edu_rd">대학원 이상<input type="checkbox" class="u_edu" id="u_edu4" name="edu" value="대학원 이상 "/></label></td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="9" height="18">&nbsp;</td>
					</tr>					
					<tr>
						<td height="55" colspan="9"><td>
					</td>
					</tr>
					<tr>
						<td colspan="9" height="45">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="9"><a onclick="next_step()" style="cursor:pointer;" class="next">다음</a></td>
					</tr>
				</table>
				</div>

				<div class="step_q" style="display:none;">
				<table width="1120" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="9" height="70">&nbsp;</td>
					</tr>
					<tr>
						<td height="55" colspan="9">
							<table width="1120" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>&nbsp;</td>
									<td width="190" height="55"><label for="u_job1" title="무관" class="job_rd">무관<input type="checkbox" class="u_job" id="u_job1" name="job" value="무관" /></label></td>
									<td width="10">&nbsp;</td>
									<td width="190"><label for="u_job2" title="사무직 금융직" class="job_rd">사무직 금융직<input type="checkbox" class="u_job" id="u_job2" name="job" value="사무직 금융직"/></label></td>
									<td width="10">&nbsp;</td>
									<td width="190"><label for="u_job3" title="기술,의료,언론" class="job_rd">기술,의료,언론<input type="checkbox" class="u_job" id="u_job3" name="job" value="기술,의료,언론" /></label></td>
									<td width="10">&nbsp;</td>
									<td width="190"><label for="u_job4" title="교사,강사,공무원,공사" class="job_rd">교사,공무원,강사,공사<input type="checkbox" class="u_job" id="u_job4" name="job" value="교사,공무원,강사,공사" /></label></td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="9" height="18">&nbsp;</td>
					</tr>
					<tr>
						<td height="55" colspan="9">
							<table width="1120" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>&nbsp;</td>
									<td width="190" height="55"><label for="u_job5" title="자영업,사업, 특수직"  class="job_rd">자영업,사업, 특수직<input type="checkbox" class="u_job" id="u_job5" name="job" value="자영업,사업,특수직" /></label></td>
									<td width="10">&nbsp;</td>
									<td width="190"><label for="u_job6" title="예능계,프리랜서,서비스" class="job_rd">예능계,프리랜서,서비스<input type="checkbox" class="u_job" id="u_job6" name="job" value="예능계,프리랜서,서비스" /></label></td>
									<td width="10">&nbsp;</td>
									<td width="190"><label for="u_job7" title="유학생,학생,석/박사" class="job_rd">유학생,학생,석/박사<input type="checkbox" class="u_job" id="u_job7" name="job" value="유학생,학생,석/박사" /></label></td>
									<td width="10">&nbsp;</td>
									<td width="190"><label for="u_job8" title="전문직" class="job_rd">전문직<input type="checkbox"  class="u_job" id="u_job8"  name="job" value="전문직"/></label></td>
									<td>&nbsp;</td>
					</tr>
							</table>
						</td>
					</tr>
					<tr>
					<tr>
						<td colspan="9" height="18">&nbsp;</td>
					</tr>
					<tr>
						<td height="55" colspan="9">
							<table width="1120" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>&nbsp;</td>
									<td width="190"><label for="u_job9" title="기타" class="job_rd">기타<input type="checkbox" class="u_job" id="u_job9"  name="job" value="기타"/></label></td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
						<td colspan="9" height="25">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="9"><a onclick="next_step()" style="cursor:pointer;" id= 'searchgo' class="next">이성선택하기</a></td>
					</tr>
				</table>
				</div>
				<div class="step_q" style="display:none; width:78%; height:375px; overflow-x:hidden; overflow-y:auto;">
				<table width="1120" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="9" height="40">&nbsp;</td>
					</tr> 
					<tr>
						<td height="55" colspan="9">
					
							<table width="420" cellspacing="0" cellpadding="0" class='sel' id="sel" style="float:left;">	
													
								<tr class="title"> <td>사진</td> <td>이름</td> <td>나이</td> <td>상세</td></tr>
								
							</table>
						</td>
					</tr>
						<tr>
						<td colspan="9"><input id="more" type="submit" class="btn btn-default" value="더보기" style="margin-left:530px;"/></td>
					</tr>
				</table>
				</div>
			</form>
		</div>
		</div>
		<div class="box-type1 type2 blue">
		<div class="box-type2">
			<a href="/duo/love_test/love_tendency/love_tendency_main.asp">LOVE 성향 테스트</a>
			<a href="/duo/love_test/self_love/self_love_main.asp">연애적성검사</a>
			<a href="/duo/love_test/loveclinic/loveclinic_main.asp">연애진단테스트</a>
			<a href="/duo/fortune2015/fortune_main.asp?u_div=">무료 연애운 보기</a>
			<a href="/duo/love_test/partner_test2/partner_test_main.asp">결혼상대 알아보기</a>
		</div>
		</div>
    </div>
    <!--하단영역-->    

<jsp:include page="/footer.jsp" flush="true" />
<jsp:include page="/fixRight.jsp" flush="true" />
</body>
</html>