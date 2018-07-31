// ==============================================================
// 통합 회원페이지 전용임 다른 페이지에 사용 시 수정요망
// ==============================================================

function isValidType( oInput, oType, oMsg ) {

	switch( oType.toLowerCase() ) {

		case 'select':		// 참고:직업종류/학력/거주지는 첫번째 value 값이 99로 되어 있음...
			if(oInput.selectedIndex == 0){
				alert(oMsg);
				oInput.selectedIndex = 0;
				return false;
			}
			return true;

		case 'number':
			if( !oInput.value ) {
				//alert ("공란입니다.");
				alert(oMsg);
				oInput.focus();
				return false; 
			}
			for( var mXi = 0; mXi < oInput.value.length; mXi++ ) {
				if( oInput.value.charAt( mXi ) != '' + parseInt( oInput.value.charAt( mXi ) ) + '' ) {
					alert ("숫자로만 입력하여 주세요.");
					oInput.select();
					oInput.focus();
					return false;
				}
			}
			return true;

		case 'number_en':
			if( !oInput.value ) {
				//alert ("공란입니다.");
				alert(oMsg);
				oInput.focus();
				return false; 
			}
			for( var mXi = 0; mXi < oInput.value.length; mXi++ ) {
				if( oInput.value.charAt( mXi ) != '' + parseInt( oInput.value.charAt( mXi ) ) + '' ) {
					alert ("Please enter numbers only.");
					oInput.select();
					oInput.focus();
					return false;
				}
			}
			return true;

		case 'email':

			if(oInput.value == ""){
				alert(oMsg);
				oInput.focus();
				return false;
			}
			var mail_num = oInput.value.length;
			for (var l = 0; l <= (mail_num - 1); l++)
			{
				if (oInput.value.indexOf(" ") >= 0 ) 
				{
					alert ("E-Mail 주소에서 공란을 빼주십시오");
					oInput.focus();
					return false;
				}
			}

			var str_mail = oInput.value;

			for (i=0; i < str_mail.length; i++) { 
				if (str_mail.charCodeAt(i) > 127) { 
					alert("이메일은 한글을 사용할 수 없습니다."); 
					oInput.focus();
					return false; 
				} 
			}

			if ((str_mail.indexOf("/")) == -1){
			}else {
				alert("E-Mail형식이 잘못되었습니다.\n  다시한번 확인바랍니다.");
				oInput.focus();
				return false;
			}
			if ((str_mail.indexOf(";")) == -1){
			}else {
				alert("E-Mail형식이 잘못되었습니다.\n  다시한번 확인바랍니다.");
				oInput.focus();
				return false;
			}
			
			if ((oInput.value.length != 0) && (str_mail.search(/(\S+)@(\S+)\.(\S+)/) == -1)) {
				alert("E-Mail형식이 잘못되었습니다.\n  다시한번 확인바랍니다.");
				oInput.focus();
				return false;
			}	
			s_str1 = oInput.value;
			
			if ( s_str1.match(/\S/)==null ) {
				alert("공백만 입력하면 안됩니다. E-Mail을 입력해 주십시요.");
				oInput.focus();
				return false;
			}


			return true;

		case 'jumin1':

			strdate = new Date();
			strdate = strdate.getFullYear();	//2010-10-12 getYear는 타브라우져(ios 사파리) 에선 인식 안됨

			r_age = strdate - parseInt('19'+oInput.value.substring(0,2));
			//2010-10-08 입사지원땜시 임시 차단 했음
			if(r_age < 20){
				alert("20세 미만은 개인정보(회원가입포함)를 입력하실수 없습니다.");
				return false;
			}

			if (int_check(oInput) != true || oInput.value.length != 6) { 
				alert(oMsg); 
				oInput.select();			 
				oInput.focus(); 
				return false; 
			}

			return true;

		case 'jumin2':
			if (int_check(oInput) != true || oInput.value.length != 7 ) { 
				alert(oMsg); 
				oInput.select();			 
				oInput.focus(); 
				return false; 
			}

			return true;

		case 'jumin3':	//2011-10-18 수정, 주민번호 앞자리만 받는걸로 변경

			var identval = oInput.value;
			if (identval.length < 6) {
				alert("주민번호 앞자리는 6자리 입니다.");
				oInput.focus();
				return false;
			}

			for( var mXi = 0; mXi < oInput.value.length; mXi++ ) {
				if( oInput.value.charAt( mXi ) != '' + parseInt( oInput.value.charAt( mXi ) ) + '' ) {
					alert ("숫자로만 입력하여 주세요.");
					oInput.select();
					oInput.focus();
					return false;
				}
			}

			var ident_m = parseInt(identval.substring(2, 4).replace("0", ""));
			var ident_d = parseInt(identval.substring(4, 6).replace("0", ""));

			if(ident_m <= 0 || ident_m > 12){
				alert("주민번호 앞자리(월)가 잘못되었습니다. 생년월일을 정확하게 입력하여 주세요.");
				oInput.focus();
				return false;
			}
			if(ident_d <= 0 || ident_d > 31){
				//alert(ident_d);
				alert("주민번호 앞자리(일)가 잘못되었습니다. 생년월일을 정확하게 입력하여 주세요.");
				oInput.focus();
				return false;
			}

			strdate = new Date();
			strdate = strdate.getFullYear();	//2010-10-12 getYear는 타브라우져(ios 사파리) 에선 인식 안됨

			var chkYear = parseInt(oInput.value.substring(0,2), 10)
			var chkYearLength = chkYear.toString();
			
			if(chkYearLength.length < 2){
				chkYear += 2000;
			}else{
				chkYear += 1900;
			}

			r_age = strdate - (chkYear - 1);

			//2010-10-08 입사지원땜시 임시 차단 했음
			if(r_age < 20){
				alert("20세 미만은 개인정보(회원가입포함)를 입력하실수 없습니다.");
				return false;
			}

			if (int_check(oInput) != true || oInput.value.length != 6) { 
				alert(oMsg); 
				oInput.select();			 
				oInput.focus(); 
				return false; 
			}

			return true;

		case 'text':
			if(oInput.value == "" || $.trim(oInput.value) == ""){
				alert(oMsg);
				oInput.focus();
				return false;
			}
			
			return true;

		case 'password':
			if(oInput.value == ""){
				alert(oMsg);
				oInput.focus();
				return false;
			}

			var pwval = oInput.value;

			if (pwval.length < 4 || pwval.length > 8) {
				alert("비밀번호는 4자이상 8자이하만 가능합니다.");
				oInput.focus();
				return false;
			}
			//for(i=0;i<pwval.length;i++){
			//	if(! ((pwval.charCodeAt(i) >= 97 && pwval.charCodeAt(i) <= 122) || (pwval.charCodeAt(i) >= 65 && pwval.charCodeAt(i) <= 90) || (pwval.charCodeAt(i) >= 48 && pwval.charCodeAt(i) <= 57))){
			//		alert("비밀번호에는 영문과 숫자로만 입력하셔야 합니다. 확인후 다시 입력해주세요");
			//		oInput.focus();
			//		return false;
			//	}
			//}

			return true;

		case 'check':
			var count = 0;
			//alert(oInput.length);
			for(i = 0; i < oInput.length; i++){
				if(oInput[i].checked == true){
					count += 1;
				}
			}
			if(count == 0){
				alert(oMsg);
				oInput[0].focus();
				return false;
			}

			return true;
		
		case 'check_nofocus': // 포커스 없는 버전
			var count = 0;
			//alert(oInput.length);
			for(i = 0; i < oInput.length; i++){
				if(oInput[i].checked == true){
					count += 1;
				}
			}
			if(count == 0){
				alert(oMsg);
				return false;
			}

			return true;

		case 'agree':
			if(oInput.checked == false){
				alert(oMsg);
				oInput.focus();
				return false;
			}
			return true;

		case 'agree_radio':
			if(oInput[0].checked == false){
				alert(oMsg);
				return false;
			}
			return true;

		case 'image':
			var arr = ("file:///"+oInput.value.replace(/ /gi,"%20").replace(/\\/gi,"/")).split("/");
			var fname = arr[arr.length-1];
			var e = fname.length;
			var m = fname.lastIndexOf(".");
			var filename = fname.substring(0,m);	//파일명
            var extname = fname.substring(m+1,e);	//확장자명

            if(extname.toUpperCase()=="JPG" || extname.toUpperCase()=="GIF" || extname.toUpperCase()=="BMP" || extname.toUpperCase()=="PPT" || extname.toUpperCase()=="PSD" || extname.toUpperCase()=="DOC" || extname.toUpperCase()=="AI" || extname.toUpperCase()=="XLS" || extname.toUpperCase()=="HWP" || extname.toUpperCase()=="PPTX" || extname.toUpperCase()=="PDF" || extname.toUpperCase()=="ZIP"){

				var maxSize = 600000;	//600KB

				//alert("현재 사용하는 브라우저: " + navigator.appName + " " + parseFloat(navigator.appVersion) + "."); 

				if(navigator.userAgent.indexOf('MSIE') > 0 && navigator.appVersion.indexOf('MSIE 7.') > 0){
					//IE7.0 이상
					//var fso = new ActiveXObject("Scripting.FileSystemObject");
					//var f = fso.GetFile(oInput.value);
					//var filesize = f.size;
					//f = null;
					//fso = null;
				}else{
					var img = new Image();
					//img.dynsrc = oInput.value;
					//var filesize = img.fileSize;
					//if(filesize > maxSize){
					//	alert("파일용량(600KB 이하)이 초과되었습니다.");
					//	return false;
					//}
				}

				return true;
            }else{
				
				if(oInput.value == ""){
					alert(oMsg);
				}else{
					alert("이미지(JPG/GIF/BMP) 혹은 문서 형식의 파일이 아닙니다.");
				}
				oInput.focus();
				return false;
            }
	}
}

// 아이디 중복 체크(회원가입)
function checkRegisted()
{	
	var u_id = $("#u_id").val();
	var id=$("u_id");
	var idReg =/^[a-z]{1}[a-z0-9-_]{3,11}$/;
    var reg2 = /[a-z]/g;
	var reg3 = /[0-9]/g;

	if(u_id == null || u_id == "")
	{
		$("#idCheck").html("아이디는 4자이상이어야 합니다.");	
		$("#idCheckFlag").val("N");
		id.focus();
		return false;
	}

	
	else if (u_id.charAt(0) == '_' || u_id.charAt(0) == '-') {
		
		$("#idCheck").html("'_'와 '-'는 ID의 첫글자로 사용하실 수 없습니다.");	
		$("#idCheckFlag").val("N");
		u_id = "" ;
		id.focus();
		return false;
	}	
	
	
	else if(!( idReg.test(u_id) && reg2.test(u_id) && reg3.test(u_id))) {
		$("#idCheck").html("영문, 숫자 ,- ,_ 가능,첫글자 영문");	
		$("#idCheckFlag").val("N");
		u_id = "" ;
		id.focus();
		return false;	
	}

	else {

		$.ajax({
			type:"POST",
			dataType:"TEXT",  
			url:"/duo/ValControl?cmd=id_check",
			data:"u_id="+u_id,
			success:function(data) {
				$("#idCheck").empty();
				if (data.trim() == "OK") {
					$("#idCheck").append( "사용 가능 합니다." );
					$("#idCheckFlag").val("Y");
				}else {
					$("#idCheck").append( "사용 불가능 합니다. 이미 등록된 아이디 입니다." );
					$("#idCheckFlag").val("N");
				}
			}
		}); 
	}
}

// 아이디 등록여부 체크(임시비밀번호 신청시 가입여부 체크)
//function checkRegisted_tmp()
//{	
//	var u_id = $("#u_id").val();
//
//	if(u_id == null || u_id == "")
//		return false;
//	
//	for(var i=0;i<u_id.length;i++) {
//		if(! ((u_id.charCodeAt(i) >= 97 && u_id.charCodeAt(i) <= 122) || (u_id.charCodeAt(i) >= 48 && u_id.charCodeAt(i) <= 57))) {
//			$("#idCheckYn").html("<font color='#FF0000'>소문자(대문자 허용안함) 또는 숫자 이외의 다른 문자가 들어있습니다. 다시 입력해주세요.</font>");
//			$("#idCheckFlag").val("N");
//			return false;
//		}
//	}
//
//	if(u_id.length >= 4) {
//
//		$.ajax({
//			type:"POST",
//			dataType:"TEXT",  
//			url:"member_step02_idchk.asp",
//			data:"u_id="+u_id,
//			success:function(data) {
//				$("#idCheckYn").empty();
//				if (data == "OK") {
//					$("#idCheckYn").append( "<font color='#FF0000'>가입이 안된 아이디 입니다.</font>" );
//					$("#idCheckFlag").val("N");
//				}else {
//					$("#idCheckYn").append( "<font color='#FF0000'>가입된 아이디 입니다.</font>" );
//					$("#idCheckFlag").val("Y");
//				}
//			}
//		}); 
//	}else{
//		$("#idCheckYn").html("<font color='#FF0000'></font>");
//	}
//}


//이메일 체크 ( 아이디 +"@"+ 도메인선택 방식)  / 자기발견테스트외 다수 개인정보 입력 페이지에 적용
function checkEmail(oInput1,oInput2,oInput3) {

	if (oInput1.value == "") { 
		alert("이메일 아이디를 입력하십시오 ..");
		oInput1.focus(); 
		return false;
	}
	if (oInput1.value.indexOf("@") != -1 ){		// "@" 문자열이 포함됐을경우
		var s_email = oInput1.value.split("@");
		oInput1.value = s_email[0];				//이메일 아이디만 강제 입력
	}
	
	if(oInput3.selectedIndex == 0){
		alert("이메일 주소의 도메인이 선택되지 않았습니다.");
		oInput3.selectedIndex = 0;
		return false;
	}

	if (oInput3.value == "input") {
		var txt = oInput1.value+"@"+oInput2.value;	// 아이디 + 도메인직접입력
	} else {
		var txt = oInput1.value+"@"+oInput3.value;	// 아이디 + 도메인선택
	}

	for (i = 0; i < txt.length; i++) { 
		if (txt.charCodeAt(i) > 127) { 
			alert("이메일은 한글을 사용할 수 없습니다."); 
			return false; 
		} 
	} 

	if (txt.indexOf("@") < 2){ 
		alert("이메일 형식이 잘못 되었거나 도메인 입력이 안되었습니다.");
		oInput1.focus();
		return false;
	}

	for (var l = 0; l <= (txt.length - 1); l++)
	{
		if (txt.indexOf(" ") >= 0 ) 
		{
			alert ("E-Mail 주소에서 공백을 빼주십시오");
			return false;
		}
	}

	if ((txt.indexOf("/")) == -1){
	}else {
		alert("E-Mail 형식이 잘못 되었거나 도메인 입력이 안되었습니다.");
		return false;
	}
	if ((txt.indexOf(";")) == -1){
	}else {
		alert("E-Mail 형식이 잘못 되었거나 도메인 입력이 안되었습니다.");
		return false;
	}
	
	if ((txt.length != 0) && (txt.search(/(\S+)@(\S+)\.(\S+)/) == -1)) {
		alert("E-Mail 형식이 잘못 되었거나 도메인 입력이 안되었습니다.");
		return false;
	}	

	if ( txt.match(/\S/)==null ) {
		alert("공백만 입력하면 안됩니다. E-Mail을 입력해 주십시요.");
		return false;
	}


	//오르지오, 네띠앙 메일 사용금지-시작 2006-09-28
	/*
	var netian_count = txt.indexOf("netian");
	var orgio_count = txt.indexOf("orgio");

	if (netian_count >-1 || orgio_count >-1) {

		var back_netian_count = txt.indexOf(".com");
		var back_orgio_count = txt.indexOf(".net");

		//alert(txt.substring(netian_count,back_netian_count));

		if (txt.substring(netian_count,back_netian_count)=="netian" || txt.substring(orgio_count,back_orgio_count)=="orgio"){
			alert("네티앙과 오르지오 메일은 서비스가 중지되었으므로 사용하실 수 없습니다. 다른 메일로 등록해 주세요.");
			document.form1.u_email.focus();
			return false;
		}
	}
	*/

	return true;
}

//이메일 영문 경고창
function checkEmail_En(oInput1,oInput2,oInput3) {

	if (oInput1.value == "") { 
		alert("Please enter your email id ..");
		oInput1.focus(); 
		return false;
	}
	if (oInput1.value.indexOf("@") != -1 ){		// "@" 문자열이 포함됐을경우
		var s_email = oInput1.value.split("@");
		oInput1.value = s_email[0];				//이메일 아이디만 강제 입력
	}
	
	if(oInput3.selectedIndex == 0){
		alert("Select the domain of e-mail address is not.");
		oInput3.selectedIndex = 0;
		return false;
	}

	if (oInput3.value == "input") {
		var txt = oInput1.value+"@"+oInput2.value;	// 아이디 + 도메인직접입력
	} else {
		var txt = oInput1.value+"@"+oInput3.value;	// 아이디 + 도메인선택
	}

	for (i = 0; i < txt.length; i++) { 
		if (txt.charCodeAt(i) > 127) { 
			alert("You can not use e-mail Hangul."); 
			return false; 
		} 
	} 

	if (txt.indexOf("@") < 2){ 
		alert("E-Mail in the wrong format or has been out of the domain, enter");
		oInput1.focus();
		return false;
	}

	for (var l = 0; l <= (txt.length - 1); l++)
	{
		if (txt.indexOf(" ") >= 0 ) 
		{
			alert ("E-Mail address, disconnect the spaces in.");
			return false;
		}
	}

	if ((txt.indexOf("/")) == -1){
	}else {
		alert("E-Mail in the wrong format or has been out of the domain, enter");
		return false;
	}
	if ((txt.indexOf(";")) == -1){
	}else {
		alert("E-Mail in the wrong format or has been out of the domain, enter");
		return false;
	}
	
	if ((txt.length != 0) && (txt.search(/(\S+)@(\S+)\.(\S+)/) == -1)) {
		alert("E-Mail in the wrong format or has been out of the domain, enter");
		return false;
	}	

	if ( txt.match(/\S/)==null ) {
		alert("Only spaces should not be entered. Please enter your E-Mail.");
		return false;
	}

	return true;
}

//주민등록번호 체크
function ju_check(ju_text){
	var num = ju_text, num_div =new Array(), mul_num =new Array(2,3,4,5,6,7,8,9,2,3,4,5), sum = 0, sum_div;
	for(var i=0; i < 13; i++){num_div[i] =num.charAt(i)}
	for(var i=0; i < 12; i++){sum += (num_div[i] * mul_num[i])}
	sum_div = (11 - (sum % 11)) % 10;
	             
	if ((sum_div == num_div[12] && (num_div[6]== 1 || num_div[6] == 2 )) ||  ju_text == '7700001000000'){
	 	return true
	}else {
		return false
	}
}

//2011-09-06 추가
//채용사이트 - 주민등록번호 체크, 국내거주 외국인 별도 체크 
function ju_check_fgn(ju_text) { 
	var sum = 0, odd = 0, num_div = new Array(13); 
	for(i = 0; i < 13; i++) { num_div[i] = parseInt(ju_text.charAt(i)); } 
	odd = num_div[7] * 10 + num_div[8]; 
	if((odd % 2) != 0) { 
		return false; 
	} 
	if((num_div[11] != 6) && (num_div[11] != 7) && (num_div[11] != 8) && (num_div[11] != 9)) { 
		return false; 
	} 
	multipliers = [2,3,4,5,6,7,8,9,2,3,4,5]; 
	for(i=0, sum=0; i < 12; i++) { sum += (num_div[i] *= multipliers[i]); } 
	sum = 11 - (sum % 11); 
	if(sum >= 10) { 
		sum -= 10; 
	} 
	sum += 2; 
	if(sum >= 10) { 
		sum -= 10; 
	}
	//alert(sum);
	if(sum != num_div[12]) { 
		return false 
	} 
	return true; 
}

// 숫자 체크   
function int_check(textObj) {	
	var newValue = textObj.value ;
	var newLength = newValue.length ;
	
	for (var i=0; i < newLength; i++) {
		aChar = newValue.substring(i, i + 1);
		bChar = newValue.charAt(0);
	
		if (aChar < "0" || aChar > "9") {
			return false
		}
	}
	return true ;
}

// 숫자 체크 value input
function int_check_value(newValue) {	
	var newLength = newValue.length ;
	
	for (var i=0; i < newLength; i++) {
		aChar = newValue.substring(i, i + 1);
		bChar = newValue.charAt(0);
	
		if (aChar < "0" || aChar > "9") {
			return false
		}
	}
	return true ;
}

// 이메일 도메인 부분 변경 체크
function chgEmail(form,val) {
	if (val=="input") {
		form.u_email_domain.value = "";
		form.u_email_domain_select.style.display = "none";
		form.u_email_domain.style.display = "";
		form.u_email_domain.focus();
	} else {
		form.u_email_domain.value = val;
	}
}

// 이메일 도메인 부분 변경 체크 (2010-08-11 수정 / 듀오라이프컨설팅 상담가이드 페이지에서 이용)
function chgEmail_etc(form,val,param) {
	if (val=="input") {
		eval("form."+param+"_domain").value = "";
		eval("form."+param+"_domain_select").style.display = "none";
		eval("form."+param+"_domain").style.display = "";
		eval("form."+param+"_domain").focus();
	} else {
		eval("form."+param+"_domain").value = val;
	}
}

//숫자체크
function checkNumber(checkNum) {
	t = checkNum.value ;

	for(i = 0; i < t.length; i++) {
	if (t.charAt(i) < '0' || t.charAt(i) > '9') {
		alert("숫자만 입력해주세요.");
		checkNum.value = "";
		checkNum.focus();
	}
	return;
  }
}

// input text 이동
function auto_fs(item, next_item, num)    {
	 bName = navigator.appName;
	 if (bName == "Netscape") return;
	 if (item.value.length == num       )
	 {
		next_item.select();
		next_item.focus();
	}
	return;
}

// ajax 객체 생성 함수
var xmlHttp;
function createXMLHttpRequest(){
	try{
		if(window.ActiveXObject){
			try{
				xmlHttp = new ActiveXObject("Msxml2.XMLHttp");	//IE 5.0 이후버전
			}catch(e){
				try{
					xmlHttp = new ActiveXObject("Microsoft.XMLHttp");	//IE 5.0 이전버전
				}catch(e2){
					xmlHttp = false;
				}
			}
		}else if(window.XMLHttpRequest){
			xmlHttp = new XMLHttpRequest();
		}
	}catch(failed){
		xmlHttp = false;
	}
	if(!xmlHttp)
		alert("Error initializing XMLHttpRequest!");
}

//팝업창 쿠키 기간 설정 함수
function setCookie( name, value, expiredays ){
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

//팝업창 쿠키값 가져오기
function getCookie( name ) {
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length ) {
		var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie ) {
			if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
				endOfCookie = document.cookie.length;

			return unescape( document.cookie.substring( y, endOfCookie ) );
		}
  
		x = document.cookie.indexOf( " ", x ) + 1;
		
		if ( x == 0 ) 
			break;
	}

	return "";
}

//팝업사이즈 자동조절
function popupResize(nWidth, nHeight)
{
	var strAgent = navigator.userAgent.toLowerCase();
	var bIE = (strAgent.indexOf("msie") != -1);
	var bXP = (strAgent.indexOf("nt 5.1") != -1);
	var bIE7 = (strAgent.indexOf("msie 7.0") != -1);
	var bIE8 = (strAgent.indexOf("msie 8.0") != -1);
	var bSafari = (strAgent.indexOf("konqueror") != -1 || strAgent.indexOf("safari") != -1);
	var bFirefox = (strAgent.indexOf("firefox")!= -1);
	window.resizeTo(nWidth, nHeight);
}

//팝업사이즈 자동조절
function popupResize1()
{
    var Dwidth = parseInt(document.body.scrollWidth);
    var Dheight = parseInt(document.body.scrollHeight);
    var divEl = document.createElement("div");
    divEl.style.position = "absolute";
    divEl.style.left = "0px";
    divEl.style.top = "0px";
    divEl.style.width = "100%";
    divEl.style.height = "100%";

    document.body.appendChild(divEl);

    window.resizeBy(Dwidth-divEl.offsetWidth, Dheight-divEl.offsetHeight);
    document.body.removeChild(divEl);
}

//팝업창 센터정렬
function popupCenter(){ 
    var x,y; 
    if (self.innerHeight) { // IE 외 모든 브라우저 
        x = (screen.availWidth - self.innerWidth) / 2; 
        y = (screen.availHeight - self.innerHeight) / 2; 
   }else if (document.documentElement && document.documentElement.clientHeight) { // IE >= 6
        x = (screen.availWidth - document.documentElement.clientWidth) / 2; 
        y = (screen.availHeight - document.documentElement.clientHeight) / 2; 
    }else if (document.body) { // 다른 IE 브라우저( IE < 6) 
        x = (screen.availWidth - document.body.clientWidth) / 2; 
        y = (screen.availHeight - document.body.clientHeight) / 2; 
    } 
    window.moveTo(x,y);                   //창을 움직여라
} 

//팝업창 닫기
function closeWin(idx) { 
	if( eval("document.popup_"+ idx +".notice.checked") ) {
 		setCookie( "popupview_"+idx, "view" , 1); 
		//alert(getCookie("popupview_"+ idx +""));
	}
	self.close(); 
}

// select 박스에서 option 선택하면 페이지 이동
function goto_select(doc, link) {
	var v = document.getElementById(""+doc+"");
	//var i = eval("document.getElementById('"+doc+"')").selectedIndex; // 파폭에서 안먹힘
	if (v.value != null) {
		if(link == "_blank"){
			window.open(v.value);
		}else{
			location.href = v.value;
		}
    }
}

// goto url 호출 / 팝업페이지
function goto_url(linkPage){
	var linkPage;
	window.open(linkPage, '', '');
	this.close();
}

// 자신 페이지 이동 / Layer 팝업페이지
function goto_url_self(linkPage){
	var linkPage;
	location.href=linkPage;
}

// 부모창으로 이동, 없으면 새창열기
function goto_url_opener(linkPage){
	var linkPage;
	try{
		opener.location.href=linkPage;
	}catch(e){
		window.open(linkPage, '', '');
	}
	this.close();
}

//Layer 팝업 방식 호출 함수
function popup_close(onOrOff,idx) {

	//onOrOff 안씀

	var popupid = document.getElementById('popupview_'+idx);
	popupid.style.display="none";

	if ( eval("document.popup_"+ idx +".notice.checked") ){ 
		setCookie("popupview_"+idx, "view" , 1);
	}
} 

//Layer 팝업 방식 호출 함수 // 리뉴얼 하면서 close 방식 변경
function popup_close11(onOrOff,idx) {

	var popupid = document.getElementById('popupview_'+idx);

	if (onOrOff == 1) {
		popupid.mouseIn = 1;
		timer = window.setTimeout("movepopup(1,'"+idx+"');", 0, "JavaScript");
	} else {

		popupid.mouseIn = 0;
		timer = window.setTimeout("movepopup(0,'"+idx+"');", 0, "JavaScript");

		if ( document.popup.notice.checked ){ 
				setCookie( "popupview_"+idx, "view" , 1);
		}
	}
} 


//Layer 팝업 방식 호출 함수
function movepopup(onOrOff,idx) {
	var popupid = document.getElementById("popupview_"+idx);
	if (onOrOff == 1 && popupid.mouseIn == 1) {
			if (popupid.style.posTop < 0) {
			popupid.style.posTop = popupid.style.posTop + 20;
			timer = window.setTimeout("movepopup(1,'"+idx+"');", 0, "JavaScript");
		}
	} else {
			if (popupid.mouseIn == 0 && popupid.style.posTop > -550) {
			popupid.style.posTop = popupid.style.posTop - 20;
			timer = window.setTimeout("movepopup(0,'"+idx+"');", 0, "JavaScript");
		}
	}
}

//DB 이미지 호출후 이미지 사이즈 조절
function img_resize(imgid,nWidth){

	var idvalue = document.getElementById(imgid);
	oWidth = idvalue.width;

	if(oWidth > nWidth){
		idvalue.width = nWidth;
	}
}

//이미지 확대보기
function image_view(img_name,img_folder){
	theURL = "https://www.duo.co.kr/html/common/img_view.asp?img_name="+ img_name +"&img_folder="+img_folder;
	window.open(theURL, '', 'alwaysraised=yes,height=100,width=100,scrollbars=no,top=2,left=2');
}
//이미지 확대보기 - src
function image_view_src(src){
	theURL = "https://www.duo.co.kr/html/common/img_view.asp?src="+ src;
	window.open(theURL, '', 'alwaysraised=yes,height=100,width=100,scrollbars=no,top=2,left=2');
}


// input 박스 클릭시 내용 삭제 - 포토인터뷰신청
var ccc = false;
var cccc = false;

function duo_ac(param,flag) {

	duoMain_setTextBox(param,flag);
	if ( ccc ) return;
	param.value = "" ;
	ccc = true;
}

var duoMain_keystatus = 1; // keysatus 1 : No Input, 2 : Start Input
function duoMain_setTextBox(cname,flag) {
	var textbox = cname;
	var _event;
	switch ( duoMain_getNavigatorType() ) {
		case 1 : // IE
			_event = window.event;
			nodeName = _event.srcElement.nodeName;
			break;
		case 2 : // Netscape
			_event = event;
			nodeName = _event.target.nodeName;
			break;
		default :
			nodeName = "None";
			break;
	}
	key = _event.keyCode;
	if ( duoMain_keystatus == 1 && flag && key != 13) { // keyCode : Enter
		textbox.value = "";
		duoMain_keystatus = 2;
	}
}

function duoMain_getNavigatorType() {
	if ( navigator.appName == "Microsoft Internet Explorer" )
		return 1;
	else if ( navigator.appName == "Netscape" )
		return 2;	
	else
		return 0;
}

// 한글만 입력하게 하는 펑션
function checkKor(){
	if(event.keyCode>=33 && event.keyCode<=126){
		alert("한글만 입력하실수 있습니다.");
		return false;
	}
}

// 글자수 체크
function calculate_byte( sTargetStr ) {
	var sTmpStr, sTmpChar;
	var nOriginLen = 0;
	var nStrLength = 0;
	 
	sTmpStr = new String(sTargetStr);
	nOriginLen = sTmpStr.length;

	for ( var i=0 ; i < nOriginLen ; i++ ) {
		sTmpChar = sTmpStr.charAt(i);

		if (escape(sTmpChar).length > 4) {
			nStrLength += 1;	//한글 : 2

		} else if (sTmpChar!='\r') {
			nStrLength ++;
		}
	}
	
	return nStrLength; 
	
}
// 글자수 체크
function Cut_Str( sTargetStr , nMaxLen ) {
	var sTmpStr, sTmpChar, sDestStr;
	var nOriginLen = 0;
	var nStrLength = 0;
	var sDestStr = "";
	sTmpStr = new String(sTargetStr);
	nOriginLen = sTmpStr.length;

	for ( var i=0 ; i < nOriginLen ; i++ ) {
		sTmpChar = sTmpStr.charAt(i);

		if (escape(sTmpChar).length > 4) {
			nStrLength = nStrLength + 1;	//한글 : 2
		} else if (sTmpChar!='\r') {
			nStrLength ++;
		}

		if (nStrLength <= nMaxLen) {
			sDestStr = sDestStr + sTmpChar;
		} else {
			break;
		}

	}
	
	return sDestStr; 
}


function encodeURL(str){
    var s0, i, s, u;
    s0 = "";                // encoded str
    for (i = 0; i < str.length; i++){   // scan the source
        s = str.charAt(i);
        u = str.charCodeAt(i);          // get unicode of the char
        if (s == " "){s0 += "+";}       // SP should be converted to "+"
        else {
            if ( u == 0x2a || u == 0x2d || u == 0x2e || u == 0x5f || ((u >= 0x30) && (u <= 0x39)) || ((u >= 0x41) && (u <= 0x5a)) || ((u >= 0x61) && (u <= 0x7a))){       // check for escape
                s0 = s0 + s;            // don't escape
            }
            else {                  // escape
                if ((u >= 0x0) && (u <= 0x7f)){     // single byte format
                    s = "0"+u.toString(16);
                    s0 += "%"+ s.substr(s.length-2);
                }
                else if (u > 0x1fffff){     // quaternary byte format (extended)
                    s0 += "%" + (oxf0 + ((u & 0x1c0000) >> 18)).toString(16);
                    s0 += "%" + (0x80 + ((u & 0x3f000) >> 12)).toString(16);
                    s0 += "%" + (0x80 + ((u & 0xfc0) >> 6)).toString(16);
                    s0 += "%" + (0x80 + (u & 0x3f)).toString(16);
                }
                else if (u > 0x7ff){        // triple byte format
                    s0 += "%" + (0xe0 + ((u & 0xf000) >> 12)).toString(16);
                    s0 += "%" + (0x80 + ((u & 0xfc0) >> 6)).toString(16);
                    s0 += "%" + (0x80 + (u & 0x3f)).toString(16);
                }
                else {                      // double byte format
                    s0 += "%" + (0xc0 + ((u & 0x7c0) >> 6)).toString(16);
                    s0 += "%" + (0x80 + (u & 0x3f)).toString(16);
                }
            }
        }
    }
    return s0;
}

//특수문자 체크
function checkstring(strvalue)
{
	var exvalue = "_{}[]()<>?|`~'!@#$%^&*-+=,.;:\"'\\/";
	var findword = false;

	for(var i=0;i< strvalue.length;i++)
	{
		if(exvalue.indexOf(strvalue.charAt(i)) != -1)
		{
			findword = true;
		}
	}

	return findword;
}

//개선된 입력글자 byte 계산
function check_input_byte(strInput,maxlength)
{
	var stringByteLength = (function(s,b,i,c){
		//ansi 한글 2바이트, utf-8 한글3바이트
		//for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
		for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?2:c>>7?2:1);

		return b;
	})(strInput);

	if (stringByteLength > maxlength)
	{
		//alert(stringByteLength);
		return false
	}
	else
	{
		//alert(stringByteLength);
		return true;
	}
}

//입력 글자수 리턴
function get_input_byte(strInput)
{
	var stringByteLength = (function(s,b,i,c){
		//ansi 한글 2바이트, utf-8 한글3바이트
		//for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
		for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?2:c>>7?2:1);

		return b;
	})(strInput);

	return stringByteLength;
}
function checkPassword(){

//	var formnm = document.transform;
//	var password1 = formnm.u_pwd.value;
//	var password2 = formnm.u_pwd_verify.value;
//	var password1_len = password1.length;
//
//	if(password1_len < 8 || password1_len > 15){
//
//		$("#pwcheck").html("<font color='#FF0000'>비밀번호는 8자 이상 15자 이하만 가능합니다. 다시 입력해주세요.</font>");
//		$("#pwcheck").val("N");
//		formnm.u_pwd.focus();
//		return false;
//	}
//	
//	// 비번에 영문 소문자+대문자 와 숫자 이외에 다른 글이 있는지 체크
//	for(i=0;i<password1_len;i++){
//		if(! ((password1.charCodeAt(i) >= 97 && password1.charCodeAt(i) <= 122) || (password1.charCodeAt(i) >= 65 && password1.charCodeAt(i) <= 90) || (password1.charCodeAt(i) >= 48 && password1.charCodeAt(i) <= 57))){
//			alert('비밀번호에는 영문과 숫자로만 입력하셔야 합니다.확인후 다시 입력해주세요');
//			formnm.u_pwd.focus();
//			return false;
//		}
//	}
//	
//	if(password1 != password2){
//		alert('비밀번호와 비밀번호확인이 서로 다릅니다. 정확히 입력해주세요');
//		formnm.u_pwd.focus();
//		return false;
//	}
//
//	return true;	
	var formnm = document.JTForm;
	var result=CheckPassWord(formnm.u_id,formnm.u_pwd);
	
	if(result==true){
		$("#pwdCheck").html("사용가능합니다.");
		$("#pwdCheckFlag").val("Y");
	}
}
function checkPassword2()
{
var fr= document.EMTForm;
//alert(u_pwd.value+"~");
var result = aa(fr.u_id,fr.u_pwd);
//var result =CheckPassWord(fr.u_id,fr.u_pwd);
if(result==true){
	$("#pwdCheck").html("사용가능합니다.");
	$("#pwdCheckFlag").val("Y");
}

}
function aa(id,pw)
{
	
	if(!check_pw_hangul(pw.value)){
		return false;
		alert("1");
	}
	
	if(pw.value.length < 8 || pw.value.length > 15 ) {
	
			$("#pwdCheck").html("비밀번호는 영문, 숫자, 특수문자의 조합으로 8자리이상 15자리 이하로 입력해주세요.");
			$("#pwdCheckFlag").val("N");
			
		return false;
	}

	if(!pw.value.match(/([a-zA-Z].*[0-9])|([0-9].*[a-zA-Z0-9])/))  {
	
			$("#pwdCheck").html("비밀번호는 영문, 숫자, 특수문자의 조합으로 8자리이상 15자리이하로 입력해주세요.-숫자 또는 영문 미포함-");
			$("#pwdCheckFlag").val("N");
			
		return false;
	}

	if (!checkstring(pw.value))
	{
		
			$("#pwdCheck").html("비밀번호는 영문, 숫자, 특수문자의 조합으로 8자리이상 15자리이하로 입력해주세요.- 특수문자 미포함-");
			$("#pwdCheckFlag").val("N");
			
		return false;
	}
	
	var password = pw.value;

	var numberConut = 0;
	var textConut = 0;
	var specialConut = 0;	

	var textRegular = /[a-zA-Z]+/;
	var numberRegular = /[1-9]+/;
	var specialRegular = /[!,@,#,$,%,^,&,*,?,_,~]/;

	if (textRegular.test(password)) textConut = 1;
	if (numberRegular.test(password)) numberConut = 1;
	if (specialRegular.test(password)) specialConut = 1;

	var samCount = 0;
	var continuCount = 0;
	for(var i=0; i < password.length; i++) {
		var forSamCount = 0;
		var forContinuCount = 0;
		var char1 = password.charAt(i);
		var char2 = password.charAt(i+1);
		var char3 = password.charAt(i+2);
		var char4 = password.charAt(i+3);

		if(!char4) {
			break;
		}
		//동일문자 카운트
		if(char1 == char2) {
			forSamCount = 2;
			if(char2 == char3) {
				forSamCount = 3;	
				if(char2 == char4){
					forSamCount = 4;
				}
			}
		}

		if(forSamCount > samCount) {
			samCount = forSamCount;
		}
		
		//4개이상
		if(char1.charCodeAt(0) - char2.charCodeAt(0) == 1 && char2.charCodeAt(0) - char3.charCodeAt(0) == 1 && char3.charCodeAt(0) - char4.charCodeAt(0) == 1) {
			forContinuCount = 4;
		}
		else if(char1.charCodeAt(0) - char2.charCodeAt(0) == -1 && char2.charCodeAt(0) - char3.charCodeAt(0) == -1 && char3.charCodeAt(0) - char4.charCodeAt(0) == -1) {
			forContinuCount = 3;
		}
		else if(char1.charCodeAt(0) - char2.charCodeAt(0) == 1 && char2.charCodeAt(0) - char3.charCodeAt(0) == 1) {
			forContinuCount = 3;
		}
		else if(char1.charCodeAt(0) - char2.charCodeAt(0) == -1 && char2.charCodeAt(0) - char3.charCodeAt(0) == -1) {
			forContinuCount = 3;
		}
		else if(char1.charCodeAt(0) - char2.charCodeAt(0) == 1) {
			forContinuCount = 2;
		}
		else if(char1.charCodeAt(0) - char2.charCodeAt(0) == -1) {
			forContinuCount = 2;
		}

		if(forContinuCount > continuCount) {
			continuCount = forContinuCount;
		}
	}

	if (samCount >= 3)
	{
	
			
			$("#pwdCheck").html("연속으로 같은문자를 3번 이상 사용할 수 없습니다.");
			$("#pwdCheckFlag").val("N");
	
		return false;
	}

	if (continuCount >= 3)
	{
		
			$("#pwdCheck").html("연속된 문자열(123 또는 321, abc, cba 등)을\n 3자 이상 사용 할 수 없습니다.");
			$("#pwdCheckFlag").val("N");
		
		return false;
	}

	return true;

}


//2014-01-20 | 비번체크 - submit 체크 | 2016-01-07 현재사용중 - 통합은 두번째 패스워드 입력이 없음
function CheckPassWord(ObjUserID, ObjUserPassWord) 
{
	
	
	if(!check_pw_hangul(ObjUserPassWord.value)){
		return false;
	}
	
	if(ObjUserPassWord.value.length < 8 || ObjUserPassWord.value.length > 15 ) {
	
			$("#pwdCheck").html("비밀번호는 영문, 숫자, 특수문자의 조합으로 8자리이상 15자리 이하로 입력해주세요.");
			$("#pwdCheckFlag").val("N");
			
		return false;
	}

	if(!ObjUserPassWord.value.match(/([a-zA-Z].*[0-9])|([0-9].*[a-zA-Z0-9])/))  {
	
			$("#pwdCheck").html("비밀번호는 영문, 숫자, 특수문자의 조합으로 8자리이상 15자리이하로 입력해주세요.-숫자 또는 영문 미포함-");
			$("#pwdCheckFlag").val("N");
			
		return false;
	}

	if (!checkstring(ObjUserPassWord.value))
	{
		
			$("#pwdCheck").html("비밀번호는 영문, 숫자, 특수문자의 조합으로 8자리이상 15자리이하로 입력해주세요.- 특수문자 미포함-");
			$("#pwdCheckFlag").val("N");
			
		return false;
	}
	if (ObjUserID)
	{
		if(ObjUserPassWord.value.indexOf(ObjUserID.value) > -1) {
		
				$("#pwdCheck").html("비밀번호에 아이디를 사용할 수 없습니다.");
				$("#pwdCheckFlag").val("N");
				
			return false;
		}
	}

	
	var password = ObjUserPassWord.value;

	var numberConut = 0;
	var textConut = 0;
	var specialConut = 0;	

	var textRegular = /[a-zA-Z]+/;
	var numberRegular = /[1-9]+/;
	var specialRegular = /[!,@,#,$,%,^,&,*,?,_,~]/;

	if (textRegular.test(password)) textConut = 1;
	if (numberRegular.test(password)) numberConut = 1;
	if (specialRegular.test(password)) specialConut = 1;

	var samCount = 0;
	var continuCount = 0;
	for(var i=0; i < password.length; i++) {
		var forSamCount = 0;
		var forContinuCount = 0;
		var char1 = password.charAt(i);
		var char2 = password.charAt(i+1);
		var char3 = password.charAt(i+2);
		var char4 = password.charAt(i+3);

		if(!char4) {
			break;
		}
		//동일문자 카운트
		if(char1 == char2) {
			forSamCount = 2;
			if(char2 == char3) {
				forSamCount = 3;	
				if(char2 == char4){
					forSamCount = 4;
				}
			}
		}

		if(forSamCount > samCount) {
			samCount = forSamCount;
		}
		
		//4개이상
		if(char1.charCodeAt(0) - char2.charCodeAt(0) == 1 && char2.charCodeAt(0) - char3.charCodeAt(0) == 1 && char3.charCodeAt(0) - char4.charCodeAt(0) == 1) {
			forContinuCount = 4;
		}
		else if(char1.charCodeAt(0) - char2.charCodeAt(0) == -1 && char2.charCodeAt(0) - char3.charCodeAt(0) == -1 && char3.charCodeAt(0) - char4.charCodeAt(0) == -1) {
			forContinuCount = 3;
		}
		else if(char1.charCodeAt(0) - char2.charCodeAt(0) == 1 && char2.charCodeAt(0) - char3.charCodeAt(0) == 1) {
			forContinuCount = 3;
		}
		else if(char1.charCodeAt(0) - char2.charCodeAt(0) == -1 && char2.charCodeAt(0) - char3.charCodeAt(0) == -1) {
			forContinuCount = 3;
		}
		else if(char1.charCodeAt(0) - char2.charCodeAt(0) == 1) {
			forContinuCount = 2;
		}
		else if(char1.charCodeAt(0) - char2.charCodeAt(0) == -1) {
			forContinuCount = 2;
		}

		if(forContinuCount > continuCount) {
			continuCount = forContinuCount;
		}
	}

	if (samCount >= 3)
	{
	
			
			$("#pwdCheck").html("연속으로 같은문자를 3번 이상 사용할 수 없습니다.");
			$("#pwdCheckFlag").val("N");
	
		return false;
	}

	if (continuCount >= 3)
	{
		
			$("#pwdCheck").html("연속된 문자열(123 또는 321, abc, cba 등)을\n 3자 이상 사용 할 수 없습니다.");
			$("#pwdCheckFlag").val("N");
		
		return false;
	}

	return true;
}

// ajax input 한글처리
function ajax_setFormData(form_name,u_name)
{
	var formdata;
	var name_tr;
	
	formdata = "";
	name_tr = "";
	
	$("form[name='" + form_name + "'] input:text").each(function(index){
		if (formdata == "")
		{
			if (u_name.indexOf($(this).attr("name")) > -1)
			{
				name_tr = name_tr + "&" + $(this).attr("name") + "=" + escape($(this).val());
			}
			else
			{
				if (getValue(this) != "")
				{
					formdata = formdata + $(this).attr("name") + "=" + getValue(this);
				}
				
			}
		}
		else
		{
			if (u_name.indexOf($(this).attr("name")) > -1)
			{
				name_tr = name_tr + "&" + $(this).attr("name") + "=" + escape($(this).val());
			}
			else
			{
				if (getValue(this) != "")
				{
					formdata = formdata + "&" + $(this).attr("name") + "=" + getValue(this);
				}
				
			}
		}
	});

	$("form[name=" + form_name + "] textarea").each(function(index){
		if (formdata == "")
		{
			if (u_name.indexOf($(this).attr("name")) > -1)
			{
				name_tr = name_tr + "&" + $(this).attr("name") + "=" + escape($(this).val());
			}
			else
			{
				if (getValue(this) != "")
				{
					formdata = formdata + $(this).attr("name") + "=" + getValue(this);
				}
				
			}
		}
		else
		{
			if (u_name.indexOf($(this).attr("name")) > -1)
			{
				name_tr = name_tr + "&" + $(this).attr("name") + "=" + escape($(this).val());
			}
			else
			{
				if (getValue(this) != "")
				{
					formdata = formdata + "&" + $(this).attr("name") + "=" + getValue(this);
				}
				
			}
		}
	});

	
	$("form[name=" + form_name + "] select").each(function(index){
		formdata = formdata + "&" + $(this).attr("name") + "=" + $(this).val();
	});


	$("form[name=" + form_name + "] input:radio").each(function(index){
		if ($(this).is(":checked"))
		{
			formdata = formdata + "&" + $(this).attr("name") + "=" + $(this).val();
		}
		
	});


	$("form[name=" + form_name + "] input:checkbox").each(function(index){
		if ($(this).is(":checked"))
		{
			formdata = formdata + "&" + $(this).attr("name") + "=" + $(this).val();
		}
		
	});


	$("form[name=" + form_name + "] input:password").each(function(index){
		if (formdata == "")
		{
			formdata = $(this).attr("name") + "=" + encodeURIComponent($(this).val());
		}
		else
		{
			formdata = formdata + "&" + $(this).attr("name") + "=" + encodeURIComponent($(this).val());
		}
	});

	
	//alert($("form[name=" + form_name + "] input[type=hidden]").length);

	$("form[name=" + form_name + "] input[type=hidden]").each(function(index){
		if (formdata == "")
		{
			if (u_name.indexOf($(this).attr("name")) > -1)
			{
				name_tr = name_tr + "&" + $(this).attr("name") + "=" + escape($(this).val());
			}
			else
			{
				if (getValue(this) != "")
				{
					formdata = formdata + $(this).attr("name") + "=" + getValue(this);
				}
				
			}
		}
		else
		{
			if (u_name.indexOf($(this).attr("name")) > -1)
			{
				name_tr = name_tr + "&" + $(this).attr("name") + "=" + escape($(this).val());
			}
			else
			{
				if (getValue(this) != "")
				{
					formdata = formdata + "&" + $(this).attr("name") + "=" + getValue(this);
				}
				
			}
		}
	});

	//alert(formdata);

	if (name_tr !="")
	{
		formdata = formdata + name_tr
	}

	//alert(formdata);

	return formdata;
}

function getValue(obj)
{
	var getType;

	getType = $(obj).attr("type");

	if (getType == "text" || getType == "hidden")
	{
		return $(obj).val();
	}

	if (getType == "radio" || getType == "checkbox")
	{
		if ($(obj).is(":checked") == true)
		{
			return $(obj).val();
		}
	}

	return "";
}

function checkpassword_memberinfo(u_pwd,u_mtel2,u_mtel3,u_email)
{
	if (u_pwd.indexOf(u_mtel2) > -1 || u_pwd.indexOf(u_mtel3) > -1)
	{
		alert('비밀번호에 휴대폰번호를 포함할 수 없습니다.');
		return false;
	}

	if (u_pwd.indexOf(u_email) > -1)
	{
		alert('비밀번호에 이메일 아이디를 포함할 수 없습니다.');
		return false;
	}

	return true;
}


// 2014-11-27 | 개인정보 수집동의 체크박스 체크
function agree_check(obj_all,obj_a1,obj_a2)
{
	if (!$("input[name='" + obj_all + "']").is(":checked"))
	{
		if (!$("input[name='" + obj_a1 + "']").is(":checked"))
		{
			alert('개인정보 수집에 동의하여 주세요.\n개인정보에 동의하지 않으면 해당 서비스를 이용하실 수 없습니다.');
			return false;
		}

		if (!$("input[name='" + obj_a2 + "']").is(":checked"))
		{
			alert('마케팅 활용에 동의하여 주세요.\n마케팅 활용에 동의하지 않으면 해당 서비스를 이용하실 수 없습니다.');
			return false;
		}
	}

	return true;
}

// 2014-11-27 | 개인정보 수집동의 체크박스 체크, 마케팅 동의 선택형
function agree_check_test(obj_all,obj_a1,obj_a2)
{
	if (!$("input[name='" + obj_all + "']").is(":checked"))
	{
		if (!$("input[name='" + obj_a1 + "']").is(":checked"))
		{
			alert('개인정보 수집에 동의하여 주세요.\n개인정보에 동의하지 않으면 해당 서비스를 이용하실 수 없습니다.');
			return false;
		}
	}

	return true;
}

// 2014-11-27 | 개인정보 수집동의 체크박스 클릭 시 - prop,attr 혼합 설정 try 처리
function agree_click(obj_all,obj_a1,obj_a2,click_position)
{
	switch(click_position)
	{
		case 0:
			if (!$("input:checkbox[name='" + obj_all + "']").is(":checked"))
			{
				try{
					$("input:checkbox[name='" + obj_a1 + "']").prop("checked",false);
					$("input:checkbox[name='" + obj_a2 + "']").prop("checked",false);
				}
				catch(e){
					$("input:checkbox[name='" + obj_a1 + "']").attr("checked",false);
					$("input:checkbox[name='" + obj_a2 + "']").attr("checked",false);
				}
			}
			
			if ($("input:checkbox[name='" + obj_all + "']").is(":checked"))
			{
				try{
					$("input:checkbox[name='" + obj_a2 + "']").prop("checked",true);
					$("input:checkbox[name='" + obj_a1 + "']").prop("checked",true);
				}
				catch(e){
					$("input:checkbox[name='" + obj_a2 + "']").attr("checked",true);
					$("input:checkbox[name='" + obj_a1 + "']").attr("checked",true);	
				}	
						
				
			}
		break;

		case 1:
			if (!$("input:checkbox[name='" + obj_a1 + "']").is(":checked"))
			{
				try{
					$("input:checkbox[name='" + obj_all + "']").prop("checked",false);
				}
				catch(e){
					$("input:checkbox[name='" + obj_all + "']").attr("checked",false);	
				}
			}
			else
			{
				try{
					if (!$("input:checkbox[name='" + obj_a2 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").prop("checked",false);
					}
					else
					{
						$("input:checkbox[name='" + obj_all + "']").prop("checked",true);	
					}
				}
				catch(e){
					if (!$("input:checkbox[name='" + obj_a2 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").attr("checked",false);
					}
					else
					{
						$("input:checkbox[name='" + obj_all + "']").attr("checked",true);	
					}
				}
			}
		break;

		case 2:
			if (!$("input:checkbox[name='" + obj_a2 + "']").is(":checked"))
			{
				try{
					$("input:checkbox[name='" + obj_all + "']").prop("checked",false);
				}
				catch(e)
				{
					$("input:checkbox[name='" + obj_all + "']").attr("checked",false);	
				}
			}
			else
			{
				try{
					if (!$("input:checkbox[name='" + obj_a1 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").prop("checked",false);
					}
					else
					{
						$("input:checkbox[name='" + obj_all + "']").prop("checked",true);	
					}
				}
				catch(e){
					if (!$("input:checkbox[name='" + obj_a1 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").attr("checked",false);
					}
					else
					{
						$("input:checkbox[name='" + obj_all + "']").attr("checked",true);	
					}				
				}
			}
		break;
	}
}

//2014-12-01 | 회원가입 약관 및 개인정보 수집 및 마케팅 사용동의 체크
function agree_member_check(obj_all,obj_a1,obj_a2,obj_a3,click_position)
{
	if (!$("input[name='" + obj_all + "']").is(":checked"))
	{
		if (!$("input[name='" + obj_a1 + "']").is(":checked"))
		{
			alert('회원 이용약관에 동의해 주세요.');
			return false;
		}
		
		if (!$("input[name='" + obj_a2 + "']").is(":checked"))
		{
			alert('개인정보 수집에 동의하여 주세요.\n개인정보에 동의하지 않으면 해당 서비스를 이용하실 수 없습니다.');
			return false;
		}

		if (!$("input[name='" + obj_a3 + "']").is(":checked"))
		{
			alert('마케팅 활용에 동의하여 주세요.\n마케팅 활용에 동의하지 않으면 해당 서비스를 이용하실 수 없습니다.');
			return false;
		}
	}

	return true;
}

// 2014-12-01 | 회원가입 약관동의, 개인정보 수집동의 체크박스 클릭 시 - prop,attr 혼합 설정 try 처리
function agree_member_click(obj_all,obj_a1,obj_a2,obj_a3,click_position)
{
	switch(click_position)
	{
		case 0:
			if (!$("input:checkbox[name='" + obj_all + "']").is(":checked"))
			{
				try{
					$("input:checkbox[name='" + obj_a1 + "']").prop("checked",false);
					$("input:checkbox[name='" + obj_a2 + "']").prop("checked",false);
					$("input:checkbox[name='" + obj_a3 + "']").prop("checked",false);
				}
				catch(e){
					$("input:checkbox[name='" + obj_a1 + "']").attr("checked",false);
					$("input:checkbox[name='" + obj_a2 + "']").attr("checked",false);
					$("input:checkbox[name='" + obj_a3 + "']").attr("checked",false);
				}
			}
			
			if ($("input:checkbox[name='" + obj_all + "']").is(":checked"))
			{
				try{
					$("input:checkbox[name='" + obj_a2 + "']").prop("checked",true);
					$("input:checkbox[name='" + obj_a1 + "']").prop("checked",true);
					$("input:checkbox[name='" + obj_a3 + "']").prop("checked",true);
				}
				catch(e){
					$("input:checkbox[name='" + obj_a2 + "']").attr("checked",true);
					$("input:checkbox[name='" + obj_a1 + "']").attr("checked",true);	
					$("input:checkbox[name='" + obj_a3 + "']").attr("checked",true);
				}	
						
				
			}
		break;

		case 1:
			if (!$("input:checkbox[name='" + obj_a1 + "']").is(":checked"))
			{
				try{
					$("input:checkbox[name='" + obj_all + "']").prop("checked",false);
				}
				catch(e){
					$("input:checkbox[name='" + obj_all + "']").attr("checked",false);	
				}
			}
			else
			{
				try{
					if (!$("input:checkbox[name='" + obj_a2 + "']").is(":checked") || !$("input:checkbox[name='" + obj_a3 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").prop("checked",false);
					}
					else if ($("input:checkbox[name='" + obj_a2 + "']").is(":checked") && $("input:checkbox[name='" + obj_a3 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").prop("checked",true);	
					}
				}
				catch(e){
					if (!$("input:checkbox[name='" + obj_a2 + "']").is(":checked") || !$("input:checkbox[name='" + obj_a3 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").attr("checked",false);
					}
					else if ($("input:checkbox[name='" + obj_a2 + "']").is(":checked") && $("input:checkbox[name='" + obj_a3 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").attr("checked",true);	
					}
				}
			}
		break;

		case 2:
			if (!$("input:checkbox[name='" + obj_a2 + "']").is(":checked"))
			{
				try{
					$("input:checkbox[name='" + obj_all + "']").prop("checked",false);
				}
				catch(e)
				{
					$("input:checkbox[name='" + obj_all + "']").attr("checked",false);	
				}
			}
			else
			{
				try{
					if (!$("input:checkbox[name='" + obj_a1 + "']").is(":checked") || !$("input:checkbox[name='" + obj_a3 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").prop("checked",false);
					}
					else if ($("input:checkbox[name='" + obj_a1 + "']").is(":checked") && $("input:checkbox[name='" + obj_a3 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").prop("checked",true);	
					}
				}
				catch(e){
					if (!$("input:checkbox[name='" + obj_a1 + "']").is(":checked") || !$("input:checkbox[name='" + obj_a3 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").attr("checked",false);
					}
					else if ($("input:checkbox[name='" + obj_a1 + "']").is(":checked") && $("input:checkbox[name='" + obj_a3 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").attr("checked",true);	
					}				
				}
			}
		break;

		case 3:
			if (!$("input:checkbox[name='" + obj_a3 + "']").is(":checked"))
			{
				try{
					$("input:checkbox[name='" + obj_all + "']").prop("checked",false);
				}
				catch(e)
				{
					$("input:checkbox[name='" + obj_all + "']").attr("checked",false);	
				}
			}
			else
			{
				try{
					if (!$("input:checkbox[name='" + obj_a1 + "']").is(":checked") || !$("input:checkbox[name='" + obj_a2 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").prop("checked",false);
					}
					else if ($("input:checkbox[name='" + obj_a1 + "']").is(":checked") && $("input:checkbox[name='" + obj_a2 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").prop("checked",true);	
					}
				}
				catch(e){
					if (!$("input:checkbox[name='" + obj_a1 + "']").is(":checked") || !$("input:checkbox[name='" + obj_a2 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").attr("checked",false);
					}
					else if ($("input:checkbox[name='" + obj_a1 + "']").is(":checked") && $("input:checkbox[name='" + obj_a2 + "']").is(":checked"))
					{
						$("input:checkbox[name='" + obj_all + "']").attr("checked",true);	
					}				
				}
			}
		break;
	}
}

// 2015-02-06 | 휴대폰 연속문자 체크추가
function hp_chck_array(strnum)
{
	var str_length = strnum.length;
	var match_cnt = 0;
	var str_cursor;

	if (str_length < 3)
	{
		return false;
	}

	for (i=0;i<str_length;i++)
	{
		str_cursor = strnum.substring(i,i+1);
	
		for (j=0;j<str_length ;j++)
		{
			if (i!=j)
			{
				if (str_cursor == strnum.substring(j,j+1))
				{
					match_cnt = match_cnt + 1;
				}
			}
		}
	}
	
	if (match_cnt >= (str_length * (str_length - 1)))
	{
		return false;
	}
	else
	{
		var str_array = "1234,5678,12345678"

		if (str_array.indexOf(strnum) > -1)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
}

//한글입력 체크(패스워드용)
function check_pw_hangul(check_value)
{
	if (check_value != "" || check_value.length > 0)
	{
		for (i = 0; i < check_value.length; i++) { 
			if (check_value.charCodeAt(i) > 127) { 
				$("#pwdCheck").html("영문을 입력해주세요.");
				$("#pwdCheckFlag").val("N");
				$("#u_pwd").val("");
				return false; 
			} 
		} 
	}

	return true;
}
function modify_pw_hangul(check_value)
{
	if (check_value != "" || check_value.length > 0)
	{
		for (i = 0; i < check_value.length; i++) { 
			if (check_value.charCodeAt(i) > 127) { 
				alert("한글입력 x ");
				return false; 
			} 
		} 
	}

	return true;
}

//2017-03-23 | 구글 스크립트 실행
var google_script_state;

google_script_state = true; // script run = true

function google_ga(trans_type,action_type,content_type,action_name,content_name)
{
	if (google_script_state)
	{
		ga(trans_type,action_type,content_type,action_name,content_name);
	}
}
function number_format(data) {
	var tmp = '';
	var number = '';
	var cutlen = 3;
	var comma = ',';
	var i;

	var sign = data.match(/^[\+\-]/);
	if (sign) {
		data = data.replace(/^[\+\-]/, "");
	}

	len = data.length;
	mod = (len % cutlen);
	k = cutlen - mod;
	for (i = 0; i < data.length; i++) {
		number = number + data.charAt(i);

		if (i < data.length - 1) {
			k++;
			if ((k % cutlen) == 0) {
				number = number + comma;
				k = 0;
			}
		}
	}

	if (sign != null)
		number = sign + number;

	return number;
}
