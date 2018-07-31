// ==============================================================
// �� üũ 2007-09-18 ���ؿ� �븮 ���� / ��� Ȯ����
// ==============================================================

function isValidType( oInput, oType, oMsg ) {

	switch( oType.toLowerCase() ) {

		case 'select':		// ����:��������/�з�/�������� ù��° value ���� 99�� �Ǿ� ����...
			if(oInput.selectedIndex == 0){
				alert(oMsg);
				oInput.selectedIndex = 0;
				return false;
			}
			return true;

		case 'number':
			if( !oInput.value ) {
				//alert ("�����Դϴ�.");
				alert(oMsg);
				oInput.focus();
				return false; 
			}
			
			oInput.value = $.trim(oInput.value); //�Ƴ� ��ĭ�ְ� �𸣴� �е��� ���� trim

			for( var mXi = 0; mXi < oInput.value.length; mXi++ ) {
				if( oInput.value.charAt( mXi ) != '' + parseInt( oInput.value.charAt( mXi ) ) + '' ) {
					alert ("���ڷθ� �Է��Ͽ� �ּ���.");
					oInput.select();
					oInput.focus();
					return false;
				}
			}
			return true;

		case 'number_en':
			if( !oInput.value ) {
				//alert ("�����Դϴ�.");
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
					alert ("E-Mail �ּҿ��� ������ ���ֽʽÿ�");
					oInput.focus();
					return false;
				}
			}

			var str_mail = oInput.value;

			for (i=0; i < str_mail.length; i++) { 
				if (str_mail.charCodeAt(i) > 127) { 
					alert("�̸����� �ѱ��� ����� �� �����ϴ�."); 
					oInput.focus();
					return false; 
				} 
			}

			if ((str_mail.indexOf("/")) == -1){
			}else {
				alert("E-Mail������ �߸��Ǿ����ϴ�.\n  �ٽ��ѹ� Ȯ�ιٶ��ϴ�.");
				oInput.focus();
				return false;
			}
			if ((str_mail.indexOf(";")) == -1){
			}else {
				alert("E-Mail������ �߸��Ǿ����ϴ�.\n  �ٽ��ѹ� Ȯ�ιٶ��ϴ�.");
				oInput.focus();
				return false;
			}
			
			if ((oInput.value.length != 0) && (str_mail.search(/(\S+)@(\S+)\.(\S+)/) == -1)) {
				alert("E-Mail������ �߸��Ǿ����ϴ�.\n  �ٽ��ѹ� Ȯ�ιٶ��ϴ�.");
				oInput.focus();
				return false;
			}	
			s_str1 = oInput.value;
			
			if ( s_str1.match(/\S/)==null ) {
				alert("���鸸 �Է��ϸ� �ȵ˴ϴ�. E-Mail�� �Է��� �ֽʽÿ�.");
				oInput.focus();
				return false;
			}


			return true;

		case 'jumin1':

			strdate = new Date();
			strdate = strdate.getFullYear();	//2010-10-12 getYear�� Ÿ������(ios ���ĸ�) ���� �ν� �ȵ�

			r_age = strdate - parseInt('19'+oInput.value.substring(0,2));
			//2010-10-08 �Ի��������� �ӽ� ���� ����
			if(r_age < 20){
				alert("20�� �̸��� ��������(ȸ����������)�� �Է��ϽǼ� �����ϴ�.");
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

		case 'jumin3':	//2011-10-18 ����, �ֹι�ȣ ���ڸ��� �޴°ɷ� ����

			var identval = oInput.value;
			if (identval.length < 6) {
				alert("�ֹι�ȣ ���ڸ��� 6�ڸ� �Դϴ�.");
				oInput.focus();
				return false;
			}

			for( var mXi = 0; mXi < oInput.value.length; mXi++ ) {
				if( oInput.value.charAt( mXi ) != '' + parseInt( oInput.value.charAt( mXi ) ) + '' ) {
					alert ("���ڷθ� �Է��Ͽ� �ּ���.");
					oInput.select();
					oInput.focus();
					return false;
				}
			}

			var ident_m = parseInt(identval.substring(2, 4).replace("0", ""));
			var ident_d = parseInt(identval.substring(4, 6).replace("0", ""));

			if(ident_m <= 0 || ident_m > 12){
				alert("�ֹι�ȣ ���ڸ�(��)�� �߸��Ǿ����ϴ�. ��������� ��Ȯ�ϰ� �Է��Ͽ� �ּ���.");
				oInput.focus();
				return false;
			}
			if(ident_d <= 0 || ident_d > 31){
				//alert(ident_d);
				alert("�ֹι�ȣ ���ڸ�(��)�� �߸��Ǿ����ϴ�. ��������� ��Ȯ�ϰ� �Է��Ͽ� �ּ���.");
				oInput.focus();
				return false;
			}

			strdate = new Date();
			strdate = strdate.getFullYear();	//2010-10-12 getYear�� Ÿ������(ios ���ĸ�) ���� �ν� �ȵ�

			var chkYear = parseInt(oInput.value.substring(0,2), 10)
			var chkYearLength = chkYear.toString();
			
			if(chkYearLength.length < 2){
				chkYear += 2000;
			}else{
				chkYear += 1900;
			}

			r_age = strdate - (chkYear - 1);

			//2010-10-08 �Ի��������� �ӽ� ���� ����
			if(r_age < 20){
				alert("20�� �̸��� ��������(ȸ����������)�� �Է��ϽǼ� �����ϴ�.");
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
				alert("��й�ȣ�� 4���̻� 8�����ϸ� �����մϴ�.");
				oInput.focus();
				return false;
			}
		

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
		
		case 'check_nofocus': // ��Ŀ�� ���� ����
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
			var filename = fname.substring(0,m);	//���ϸ�
            var extname = fname.substring(m+1,e);	//Ȯ���ڸ�

            if(extname.toUpperCase()=="JPG" || extname.toUpperCase()=="GIF" || extname.toUpperCase()=="BMP" || extname.toUpperCase()=="PPT" || extname.toUpperCase()=="PSD" || extname.toUpperCase()=="DOC" || extname.toUpperCase()=="AI" || extname.toUpperCase()=="XLS" || extname.toUpperCase()=="HWP" || extname.toUpperCase()=="PPTX" || extname.toUpperCase()=="PDF" || extname.toUpperCase()=="ZIP"){

				var maxSize = 600000;	//600KB

				//alert("���� ����ϴ� ������: " + navigator.appName + " " + parseFloat(navigator.appVersion) + "."); 

				if(navigator.userAgent.indexOf('MSIE') > 0 && navigator.appVersion.indexOf('MSIE 7.') > 0){
					//IE7.0 �̻�
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
					//	alert("���Ͽ뷮(600KB ����)�� �ʰ��Ǿ����ϴ�.");
					//	return false;
					//}
				}

				return true;
            }else{
				
				if(oInput.value == ""){
					alert(oMsg);
				}else{
					alert("�̹���(JPG/GIF/BMP) Ȥ�� ���� ������ ������ �ƴմϴ�.");
				}
				oInput.focus();
				return false;
            }
	}
}

// ���̵� �ߺ� üũ(ȸ������)
function checkRegisted()
{	
	var u_id = $("#u_id").val();

	if(u_id == null || u_id == "")
		return false;
	
	for(var i=0;i<u_id.length;i++) {
		if(! ((u_id.charCodeAt(i) >= 97 && u_id.charCodeAt(i) <= 122) || (u_id.charCodeAt(i) >= 48 && u_id.charCodeAt(i) <= 57))) {
			$("#idCheckYn").html("<font color='#FF0000'>�ҹ���(�빮�� ������) �Ǵ� ���� �̿��� �ٸ� ���ڰ� ����ֽ��ϴ�. �ٽ� �Է����ּ���.</font>");
			$("#idCheckFlag").val("N");
			return false;
		}
	}

	if(u_id.length >= 4) {

		$.ajax({
			type:"POST",
			dataType:"TEXT",  
			url:"member_step02_idchk.asp",
			data:"u_id="+u_id,
			success:function(data) {
				$("#idCheckYn").empty();
				if (data == "OK") {
					$("#idCheckYn").append( "<font color='#FF0000'>��� ���� �մϴ�.</font>" );
					$("#idCheckFlag").val("Y");
				}else {
					$("#idCheckYn").append( "<font color='#FF0000'>��� �Ұ��� �մϴ�. �̹� ��ϵ� ���̵� �Դϴ�.</font>" );
					$("#idCheckFlag").val("N");
				}
			}
		}); 
	}else{
		$("#idCheckYn").html("<font color='#FF0000'>���̵�� 4���̻��̾�� �մϴ�.</font>");
	}
}

// ���̵� ��Ͽ��� üũ(�ӽú�й�ȣ ��û�� ���Կ��� üũ)
function checkRegisted_tmp()
{	
	var u_id = $("#u_id").val();

	if(u_id == null || u_id == "")
		return false;
	
	for(var i=0;i<u_id.length;i++) {
		if(! ((u_id.charCodeAt(i) >= 97 && u_id.charCodeAt(i) <= 122) || (u_id.charCodeAt(i) >= 48 && u_id.charCodeAt(i) <= 57))) {
			$("#idCheckYn").html("<font color='#FF0000'>�ҹ���(�빮�� ������) �Ǵ� ���� �̿��� �ٸ� ���ڰ� ����ֽ��ϴ�. �ٽ� �Է����ּ���.</font>");
			$("#idCheckFlag").val("N");
			return false;
		}
	}

	if(u_id.length >= 4) {

		$.ajax({
			type:"POST",
			dataType:"TEXT",  
			url:"member_step02_idchk.asp",
			data:"u_id="+u_id,
			success:function(data) {
				$("#idCheckYn").empty();
				if (data == "OK") {
					$("#idCheckYn").append( "<font color='#FF0000'>������ �ȵ� ���̵� �Դϴ�.</font>" );
					$("#idCheckFlag").val("N");
				}else {
					$("#idCheckYn").append( "<font color='#FF0000'>���Ե� ���̵� �Դϴ�.</font>" );
					$("#idCheckFlag").val("Y");
				}
			}
		}); 
	}else{
		$("#idCheckYn").html("<font color='#FF0000'></font>");
	}
}

//���üũ
function checkPassword(){

	var formnm = document.transform;
	var password1 = formnm.u_pwd.value;
	var password2 = formnm.u_pwd_verify.value;
	var password1_len = password1.length;

	if(password1_len < 8 || password1_len > 15){
		alert('��й�ȣ�� 8�� �̻� 15�� ���ϸ� �����մϴ�. �ٽ� �Է����ּ���.');
		formnm.u_pwd.focus();
		return false;
	}
	
	// ����� ���� �ҹ���+�빮�� �� ���� �̿ܿ� �ٸ� ���� �ִ��� üũ
	for(i=0;i<password1_len;i++){
		if(! ((password1.charCodeAt(i) >= 97 && password1.charCodeAt(i) <= 122) || (password1.charCodeAt(i) >= 65 && password1.charCodeAt(i) <= 90) || (password1.charCodeAt(i) >= 48 && password1.charCodeAt(i) <= 57))){
			alert('��й�ȣ���� ������ ���ڷθ� �Է��ϼž� �մϴ�.Ȯ���� �ٽ� �Է����ּ���');
			formnm.u_pwd.focus();
			return false;
		}
	}
	
	if(password1 != password2){
		alert('��й�ȣ�� ��й�ȣȮ���� ���� �ٸ��ϴ�. ��Ȯ�� �Է����ּ���');
		formnm.u_pwd.focus();
		return false;
	}

	return true;		
}


//�̸��� üũ ( ���̵� +"@"+ �����μ��� ���)  / �ڱ�߰��׽�Ʈ�� �ټ� �������� �Է� �������� ����
function checkEmail(oInput1,oInput2,oInput3) {

	if (oInput1.value == "") { 
		alert("�̸��� ���̵� �Է��Ͻʽÿ� ..");
		oInput1.focus(); 
		return false;
	}
	if (oInput1.value.indexOf("@") != -1 ){		// "@" ���ڿ��� ���Ե������
		var s_email = oInput1.value.split("@");
		oInput1.value = s_email[0];				//�̸��� ���̵� ���� �Է�
	}
	
	if(oInput3.selectedIndex == 0){
		alert("�̸��� �ּ��� �������� ���õ��� �ʾҽ��ϴ�.");
		oInput3.selectedIndex = 0;
		return false;
	}

	if (oInput3.value == "input") {
		var txt = oInput1.value+"@"+oInput2.value;	// ���̵� + �����������Է�
	} else {
		var txt = oInput1.value+"@"+oInput3.value;	// ���̵� + �����μ���
	}

	for (i = 0; i < txt.length; i++) { 
		if (txt.charCodeAt(i) > 127) { 
			alert("�̸����� �ѱ��� ����� �� �����ϴ�."); 
			return false; 
		} 
	} 

	if (txt.indexOf("@") < 2){ 
		alert("�̸��� ������ �߸� �Ǿ��ų� ������ �Է��� �ȵǾ����ϴ�.");
		oInput1.focus();
		return false;
	}

	for (var l = 0; l <= (txt.length - 1); l++)
	{
		if (txt.indexOf(" ") >= 0 ) 
		{
			alert ("E-Mail �ּҿ��� ������ ���ֽʽÿ�");
			return false;
		}
	}

	if ((txt.indexOf("/")) == -1){
	}else {
		alert("E-Mail ������ �߸� �Ǿ��ų� ������ �Է��� �ȵǾ����ϴ�.");
		return false;
	}
	if ((txt.indexOf(";")) == -1){
	}else {
		alert("E-Mail ������ �߸� �Ǿ��ų� ������ �Է��� �ȵǾ����ϴ�.");
		return false;
	}
	
	if ((txt.length != 0) && (txt.search(/(\S+)@(\S+)\.(\S+)/) == -1)) {
		alert("E-Mail ������ �߸� �Ǿ��ų� ������ �Է��� �ȵǾ����ϴ�.");
		return false;
	}	

	if ( txt.match(/\S/)==null ) {
		alert("���鸸 �Է��ϸ� �ȵ˴ϴ�. E-Mail�� �Է��� �ֽʽÿ�.");
		return false;
	}



	return true;
}

function single_input_email_check(u_email)
{
	var txt = u_email;

	for (i = 0; i < txt.length; i++) { 
		if (txt.charCodeAt(i) > 127) { 
			alert("�̸����� �ѱ��� ����� �� �����ϴ�."); 
			return false; 
		} 
	} 

	if (txt.indexOf("@") < 2){ 
		alert("�̸��� ������ �߸� �Ǿ��ų� ������ �Է��� �ȵǾ����ϴ�.");
		oInput1.focus();
		return false;
	}

	for (var l = 0; l <= (txt.length - 1); l++)
	{
		if (txt.indexOf(" ") >= 0 ) 
		{
			alert ("E-Mail �ּҿ��� ������ ���ֽʽÿ�");
			return false;
		}
	}

	if ((txt.indexOf("/")) == -1){
	}else {
		alert("E-Mail ������ �߸� �Ǿ��ų� ������ �Է��� �ȵǾ����ϴ�.");
		return false;
	}
	if ((txt.indexOf(";")) == -1){
	}else {
		alert("E-Mail ������ �߸� �Ǿ��ų� ������ �Է��� �ȵǾ����ϴ�.");
		return false;
	}
	
	if ((txt.length != 0) && (txt.search(/(\S+)@(\S+)\.(\S+)/) == -1)) {
		alert("E-Mail ������ �߸� �Ǿ��ų� ������ �Է��� �ȵǾ����ϴ�.");
		return false;
	}	

	if ( txt.match(/\S/)==null ) {
		alert("���鸸 �Է��ϸ� �ȵ˴ϴ�. E-Mail�� �Է��� �ֽʽÿ�.");
		return false;
	}
}

//�̸��� ���� ���â
function checkEmail_En(oInput1,oInput2,oInput3) {

	if (oInput1.value == "") { 
		alert("Please enter your email id ..");
		oInput1.focus(); 
		return false;
	}
	if (oInput1.value.indexOf("@") != -1 ){		// "@" ���ڿ��� ���Ե������
		var s_email = oInput1.value.split("@");
		oInput1.value = s_email[0];				//�̸��� ���̵� ���� �Է�
	}
	
	if(oInput3.selectedIndex == 0){
		alert("Select the domain of e-mail address is not.");
		oInput3.selectedIndex = 0;
		return false;
	}

	if (oInput3.value == "input") {
		var txt = oInput1.value+"@"+oInput2.value;	// ���̵� + �����������Է�
	} else {
		var txt = oInput1.value+"@"+oInput3.value;	// ���̵� + �����μ���
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

//�ֹε�Ϲ�ȣ üũ
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

//2011-09-06 �߰�
//ä�����Ʈ - �ֹε�Ϲ�ȣ üũ, �������� �ܱ��� ���� üũ 
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

//2011-11-21 �߰�
//���ǽ����(���� ���޴���) - �ְ������� �ؿ�����(LA, ����, ��������) Ŭ���� ����ó ���ڸ��� input �±׷� ���� / �ٸ� ������ u_jisa �ߺ� ����
//
function checkJisaOption1(f){
	var v = $("form#"+f+" [name='u_jisa']").val();
	if(v == "11" || v == "12" || v == "14"){
		//alert(v);
		$("#phoneTypeChk").html('<input type="textbox" name="u_mtel1" maxlength="3" class="right" style="width:29px; border:1px solid #b8b8b8; background-repeat:no-repeat;" />');
	}else{
		$("#phoneTypeChk").html('<select name="u_mtel1" style="width:55px;" class="rightselect"><option value="">����</option><option value="010">010</option><option value="011">011</option><option value="016">016</option><option value="017">017</option><option value="018">018</option><option value="019">019</option></select>');
	}
}

//���ǽ����(���� ��������) ���� Ÿ���� select, radio �� ���
function checkJisaOption2(f, c){
	var v
	if(c == "select"){
		var v = $("form#"+f+" [name='u_jisa']").val();
	}else{
		v = $("form#"+f+" input:radio[name=u_jisa]:checked").val();
	}
	if(v == "11" || v == "12" || v == "14"){
		//$("#phoneTypeChk").html('<input name="u_mtel1" maxlength="3" type="text" class="login" style="width:40px; background-repeat:no-repeat;" /> ');
		$("#in_hp").hide();
		$("#out_hp").show();
	}else{
		//$("#phoneTypeChk").html('<select name="u_mtel1" class="select"><option value="">����</option><option value="010">010</option><option value="011">011</option><option value="016">016</option><option value="017">017</option><option value="018">018</option><option value="019">019</option></select> ');
		$("#in_hp").show();
		$("#out_hp").hide();
	}
	
	//���޴���
	//if(v == "11" || v == "12" || v == "14"){
	//	$("form#"+f+" [name='u_mtel1']").attr("class", "right").attr("style", "width:29px; border:1px solid #b8b8b8; background-repeat:no-repeat;");
	//}else{
	//	$("form#"+f+" select[name='u_mtel1']").attr("class", "rightselect").attr("style", "width:55px;");
	//}

}

// ���� üũ   
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

// ���� üũ value input
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

// �̸��� ������ �κ� ���� üũ
function chgEmail(form,val) {
	if (val=="input") {
		form.u_email_domain.value = "";
		//form.u_email_domain_select.style.display = "none";	//������select ���̰�
		form.u_email_domain.style.display = "";
		form.u_email_domain.focus();
	} else {
		form.u_email_domain.value = val;
	}
}

// �̸��� ������ �κ� ���� üũ
function chgEmail_hide(form,val) {
	if (val=="input") {
		form.u_email_domain.value = "";
		form.u_email_domain_select.style.display = "none";	//������select ����
		form.u_email_domain.style.display = "";
		form.u_email_domain.focus();
	} else {
		form.u_email_domain.value = val;
	}
}

// �̸��� ������ �κ� ���� üũ (2010-08-11 ���� / ��������������� ��㰡�̵� ���������� �̿�)
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

//����üũ
function checkNumber(checkNum) {
	t = checkNum.value ;

	for(i = 0; i < t.length; i++) {
	if (t.charAt(i) < '0' || t.charAt(i) > '9') {
		alert("���ڸ� �Է����ּ���.");
		checkNum.value = "";
		checkNum.focus();
	}
	return;
  }
}

// input text �̵�
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

// ajax ��ü ���� �Լ�
var xmlHttp;
function createXMLHttpRequest(){
	try{
		if(window.ActiveXObject){
			try{
				xmlHttp = new ActiveXObject("Msxml2.XMLHttp");	//IE 5.0 ���Ĺ���
			}catch(e){
				try{
					xmlHttp = new ActiveXObject("Microsoft.XMLHttp");	//IE 5.0 ��������
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

//�˾�â ��Ű �Ⱓ ���� �Լ�
function setCookie( name, value, expiredays ){
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

//�˾�â ��Ű�� ��������
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

//�˾������� �ڵ�����
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

//�˾������� �ڵ�����
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

//�˾�â ��������
function popupCenter(){ 
    var x,y; 
    if (self.innerHeight) { // IE �� ��� ������ 
        x = (screen.availWidth - self.innerWidth) / 2; 
        y = (screen.availHeight - self.innerHeight) / 2; 
   }else if (document.documentElement && document.documentElement.clientHeight) { // IE >= 6
        x = (screen.availWidth - document.documentElement.clientWidth) / 2; 
        y = (screen.availHeight - document.documentElement.clientHeight) / 2; 
    }else if (document.body) { // �ٸ� IE ������( IE < 6) 
        x = (screen.availWidth - document.body.clientWidth) / 2; 
        y = (screen.availHeight - document.body.clientHeight) / 2; 
    } 
    window.moveTo(x,y);                   //â�� ��������
} 

//�˾�â �ݱ�
function closeWin(idx) { 
	if( eval("document.popup_"+ idx +".notice.checked") ) {
 		setCookie( "popupview_"+idx, "view" , 1); 
		//alert(getCookie("popupview_"+ idx +""));
	}
	self.close(); 
}

// select �ڽ����� option �����ϸ� ������ �̵�
function goto_select(doc, link) {
	var v = document.getElementById(""+doc+"");
	//var i = eval("document.getElementById('"+doc+"')").selectedIndex; // �������� �ȸ���
	if (v.value != null) {
		if(link == "_blank"){
			window.open(v.value);
		}else{
			location.href = v.value;
		}
    }
}

// goto url ȣ�� / �˾�������
function goto_url(linkPage){
	var linkPage;
	window.open(linkPage, '', '');
	this.close();
}

// �ڽ� ������ �̵� / Layer �˾�������
function goto_url_self(linkPage){
	var linkPage;
	location.href=linkPage;
}

// �θ�â���� �̵�, ������ ��â����
function goto_url_opener(linkPage){
	var linkPage;
	try{
		opener.location.href=linkPage;
	}catch(e){
		window.open(linkPage, '', '');
	}
	this.close();
}

// �������� �˾� ����
function goto_url_poll(no){

	window.open('https://common.duo.co.kr:4432/pollManager/research.asp?ctl_id='+no,'poll','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=600,height=600,top=10,left=10');
	//self.close();
}


//���� ��������� ��ħ 2008-03-20
//function MM_openBrWindow(theURL,winName,features) { //v2.0
//	window.open(theURL,winName,features);
//	self.close();
//}

//Layer �˾� ��� ȣ�� �Լ�
function popup_close(onOrOff,idx) {

	//onOrOff �Ⱦ�

	var popupid = document.getElementById('popupview_'+idx);
	popupid.style.display="none";

	if ( eval("document.popup_"+ idx +".notice.checked") ){ 
		setCookie("popupview_"+idx, "view" , 1);
	}
} 

//Layer �˾� ��� ȣ�� �Լ� // ������ �ϸ鼭 close ��� ����
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


//Layer �˾� ��� ȣ�� �Լ�
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

//DB �̹��� ȣ���� �̹��� ������ ����
function img_resize(imgid,nWidth){

	var idvalue = document.getElementById(imgid);
	oWidth = idvalue.width;

	if(oWidth > nWidth){
		idvalue.width = nWidth;
	}
}

//�̹��� Ȯ�뺸��
function image_view(img_name,img_folder){
	theURL = "https://www.duo.co.kr/html/common/img_view.asp?img_name="+ img_name +"&img_folder="+img_folder;
	window.open(theURL, '', 'alwaysraised=yes,height=100,width=100,scrollbars=no,top=2,left=2');
}
//�̹��� Ȯ�뺸�� - src
function image_view_src(src){
	theURL = "https://www.duo.co.kr/html/common/img_view.asp?src="+ src;
	window.open(theURL, '', 'alwaysraised=yes,height=100,width=100,scrollbars=no,top=2,left=2');
}


// input �ڽ� Ŭ���� ���� ���� - �������ͺ��û
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

// �ѱ۸� �Է��ϰ� �ϴ� ���
function checkKor(){
	if(event.keyCode>=33 && event.keyCode<=126){
		alert("�ѱ۸� �Է��ϽǼ� �ֽ��ϴ�.");
		return false;
	}
}

//����ȭ ǥ�� �Լ�
//function checkValue(theObj,regExp,errSpan,errMsg){
//	if(theObj.search(regExp) == -1){
//		errSpan.innerHTML = errMsg;
//		return false;
//	}else{
//		return true;
//	}
//}

//����ȭ ǥ�� �Լ� ȣ��
//if(!checkValue(formnm.u_pwd.value, /^([1-9a-zA-Z]{4,12})$/, errpwd, "��й�ȣ�� ������ ���� 4~8 ���ڷ� �Է��ϼ���.")){
//	return;
//}

// ���ڼ� üũ
function check_length(txtname,txtlen,msglen)	//2010-04-15 recruit ä�� ���� �Է´�
{	
	var tmpStr, nStrLen, reserve;

	sInputStr = txtname.value;
	nStrLen = calculate_byte(sInputStr);

	if ( nStrLen > txtlen ) {
		tmpStr = Cut_Str(sInputStr,txtlen);
		reserve = nStrLen - txtlen;

		alert("�ۼ��Ͻ� ������ "+ reserve +" ���ڰ� �ʰ��Ǿ����ϴ�.");	//(�ִ� "+txtlen+"��)

		// 80byte�� �°� �Է³��� ����
		txtname.value = tmpStr;
		nStrLen = calculate_byte(tmpStr);
		msglen.value = nStrLen;
	} else {
		msglen.value = nStrLen;
	}

	return;
}
// ���ڼ� üũ
function calculate_byte( sTargetStr ) {
	var sTmpStr, sTmpChar;
	var nOriginLen = 0;
	var nStrLength = 0;
	 
	sTmpStr = new String(sTargetStr);
	nOriginLen = sTmpStr.length;

	for ( var i=0 ; i < nOriginLen ; i++ ) {
		sTmpChar = sTmpStr.charAt(i);

		if (escape(sTmpChar).length > 4) {
			nStrLength += 1;	//�ѱ� : 2

		} else if (sTmpChar!='\r') {
			nStrLength ++;
		}
	}
	
	return nStrLength; 
	
}
// ���ڼ� üũ
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
			nStrLength = nStrLength + 1;	//�ѱ� : 2
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

// �̴Ϻ� �޷�
function OpenMiniCalendar(Obj){
	window.showModelessDialog("/html/common/calendar.asp", Obj,
	  "dialogWidth:145px;dialogHeight:200px;dialogLeft:" + (event.clientX + window.screenLeft) + "px;dialogTop:" + (event.clientY + window.screenTop) + "px;help:0;resizable:0;scroll:0;status:0");
}

// iframe ��������
function resize_frame(frm) {
	//alert("");
	var pFrame = eval(frm + ".document.body;");
	var iFrame = eval("document.all." + frm + ";");

	iFrame.style.height = pFrame.scrollHeight + (pFrame.offsetHeight - pFrame.clientHeight);
}

//����������ȣ��å �̴Ϻ� ���̱�
function showMainMenu(form, obj) {
	if(eval("document."+form+"").agree.checked == false){
		document.getElementById(obj).style.display = 'block';
	}
}
//����������ȣ��å �̴Ϻ� �����
function hideSubMenu(obj) {
	document.getElementById(obj).style.display = 'none';
}







// ���� ���������� �����ȣ ������ ȣ��
function findpost_wed(){
	document.domain = "duowed.com"  
	window.open("http://common.duowed.com/address/popup_address.asp?form_name=transform&data_zip=u_zip&data_addr1=u_addr1&data_addr2=u_addr2&site=duowed","","width=388,height=286,resizable=no,scrollbars=yes");
}

function findpost_wed_new(){
	//document.domain = "duowed.com"  
	window.open("/html/common/pop_zip.asp?form_name=form1&data_zip=u_zip&data_addr1=u_addr1&data_addr2=u_addr2&site=duowed","","width=452,height=333,resizable=no");
}

function findpost_wed_partner(){
	//document.domain = "duowed.com"  
	window.open("/html/common/pop_zip.asp?form_name=partner_form&data_zip=p_zip&data_addr1=p_addr_01&data_addr2=p_addr_02&site=duowed","","width=452,height=333,resizable=no");
}

function findpost_wed_event(){
	//document.domain = "duowed.com"  
	window.open("/html/common/pop_zip.asp?form_name=eventform&data_zip=u_zip&data_addr1=u_addr_01&data_addr2=u_addr_02&site=duowed","","width=452,height=333,resizable=no");
}

function findpost_remarry(){
	//window.open("popup_address.asp","","width=500,height=286,scrollbars=no");
	window.open("/membership/adress_popup.asp?form_name=form1&data_zip=u_zip&data_addr1=u_addr1&data_addr2=u_addr2&site=duoremarry","","width=417,height=243,resizable=no,scrollbars=yes");
}

function findpost_remarry2(form){
	//window.open("popup_address.asp","","width=500,height=286,scrollbars=no");
	window.open("/html/membership/popup_address.asp?nform="+form+"&nzip=u_zip&naddr1=u_addr1&naddr2=u_addr2&focus=no&site=duoremarry","","width=427,height=292,resizable=no,scrollbars=yes");
}

function findpost_re_nofocus(){
	//window.open("popup_address.asp","","width=500,height=286,scrollbars=no");
	//2010-06-09 ����
	//document.domain="duoremarry.com";
	window.open("/common/popup_state.asp?form_name=form1&data_zip=u_zip&data_addr1=u_addr1&data_addr2=u_addr2&site=duoremarry","","width=388,height=286,resizable=no,scrollbars=yes");
}

//2011-01-26 ���� ���� ��� ���ּ� �ִ°�, u_addr2 ����
function findpost_focus(form){
	//window.open("popup_address.asp","","width=500,height=286,scrollbars=no");
	//document.domain="duo.co.kr"
	window.open("/html/common/popup_address.asp?nform="+form+"&nzip=u_zip&naddr1=u_addr1&naddr2=u_addr2&focus=yes","zipcode","width=426,height=292,resizable=no,scrollbars=yes");
}

// u_addr2 ����
function findpost_focus_no(form){
	window.open("/html/common/popup_address.asp?nform="+form+"&nzip=u_zip&naddr1=u_addr1&naddr2=u_addr2&focus=no","zipcode","width=426,height=292,resizable=no,scrollbars=yes");
}


function popupWindow(url, w, h) {
	//var posX = (screen.width - w) / 2;
	//var posY = (screen.height - h) / 2;
	//var option = ",resizable=no,scrollbars=no,status=no";
	window.open(url, "popupwindow","width="+w+",height="+h+",left=10,top=10,resizable=no,scrollbars=no,status=no");
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

//Ư������ üũ
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

//������ �Է±��� byte ���
function check_input_byte(strInput,maxlength)
{
	var stringByteLength = (function(s,b,i,c){
		//ansi �ѱ� 2����Ʈ, utf-8 �ѱ�3����Ʈ
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

//�Է� ���ڼ� ����
function get_input_byte(strInput)
{
	var stringByteLength = (function(s,b,i,c){
		//ansi �ѱ� 2����Ʈ, utf-8 �ѱ�3����Ʈ
		//for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
		for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?2:c>>7?2:1);

		return b;
	})(strInput);

	return stringByteLength;
}

//2014-01-20 | ���üũ - submit üũ | 2016-01-07 ��������
function CheckPassWord(ObjUserID, ObjUserPassWord, ObjUserPassWord_verify) 
{
	if(ObjUserPassWord.value != ObjUserPassWord_verify.value) {
		alert("��й�ȣ�� ��й�ȣ Ȯ���� �ٸ��ϴ�.");
		return false;
	}

	if(ObjUserPassWord.value.length < 8 || ObjUserPassWord.value.length > 15 ) {
		alert("��й�ȣ�� ����, ����, Ư�������� �������� 8�ڸ��̻� 15�ڸ� ���Ϸ� �Է����ּ���.");
		return false;
	}

	if(!ObjUserPassWord.value.match(/([a-zA-Z].*[0-9])|([0-9].*[a-zA-Z0-9])/))  {
		alert("��й�ȣ�� ����, ����, Ư�������� �������� 8�ڸ��̻� 15�ڸ����Ϸ� �Է����ּ���.-���� �Ǵ� ���� ������-");
		return false;
	}

	if (!checkstring(ObjUserPassWord.value))
	{
		alert("��й�ȣ�� ����, ����, Ư�������� �������� 8�ڸ��̻� 15�ڸ����Ϸ� �Է����ּ���.- Ư������ ������-");
		return false;
	}


	if (ObjUserID)
	{
		if(ObjUserPassWord.value.indexOf(ObjUserID.value) > -1) {
			alert("��й�ȣ�� ���̵� ����� �� �����ϴ�.");
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
		//���Ϲ��� ī��Ʈ
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
		
		//4���̻�
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
		alert("�������� �������ڸ� 3�� �̻� ����� �� �����ϴ�.");
		return false;
	}

	if (continuCount >= 3)
	{
		alert("���ӵ� ���ڿ�(123 �Ǵ� 321, abc, cba ��)��\n 3�� �̻� ��� �� �� �����ϴ�.");
		return false;
	}

	return true;
}

// ajax input �ѱ�ó��
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
		formdata = formdata + "&" + $(this).attr("name") + "=" + $(this).val();
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

// ajax input �ѱ�ó�� - encodeURIComponent
function ajax_setFormData_encode(form_name,u_name)
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
				name_tr = name_tr + "&" + $(this).attr("name") + "=" + escape($(this).val()).replace(/\+/g, '+');
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
					formdata = formdata + "&" + $(this).attr("name") + "=" + getValue(this).replace(/\+/g, '+');
				}
				
			}
		}
	});

	$("form[name=" + form_name + "] textarea").each(function(index){
		if (formdata == "")
		{
			if (u_name.indexOf($(this).attr("name")) > -1)
			{
				name_tr = name_tr + "&" + $(this).attr("name") + "=" + escape($(this).val()).replace(/\+/g, '+');
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
				name_tr = name_tr + "&" + $(this).attr("name") + "=" + escape($(this).val()).replace(/\+/g, '+');
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
		formdata = formdata + "&" + $(this).attr("name") + "=" + $(this).val();
	});

	
	//alert($("form[name=" + form_name + "] input[type=hidden]").length);

	$("form[name=" + form_name + "] input[type=hidden]").each(function(index){
		if (formdata == "")
		{
			if (u_name.indexOf($(this).attr("name")) > -1)
			{
				name_tr = name_tr + "&" + $(this).attr("name") + "=" + escape($(this).val()).replace(/\+/g, '+');
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
				name_tr = name_tr + "&" + $(this).attr("name") + "=" + escape($(this).val()).replace(/\+/g, '+');
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

function checkpassword_memberinfo(u_pwd,u_mtel2,u_mtel3,u_tel2,u_tel3,u_email)
{
	if (u_pwd.indexOf(u_mtel2) > -1 || u_pwd.indexOf(u_mtel3) > -1)
	{
		alert('��й�ȣ�� �޴�����ȣ�� ������ �� �����ϴ�.');
		return false;
	}

	if (u_tel2 !='' && u_tel3 !='')
	{
		if (u_pwd.indexOf(u_tel2) > -1 || u_pwd.indexOf(u_tel3) > -1)
		{
			alert('��й�ȣ�� ��ȭ��ȣ�� ������ �� �����ϴ�.');
			return false;
		}
	}

	if (u_pwd.indexOf(u_email) > -1)
	{
		alert('��й�ȣ�� �̸��� ���̵� ������ �� �����ϴ�.');
		return false;
	}

	return true;
}

//�ؿ����� ���� �� ����ó �Է� ����üũ
function mtel_check_value(newValue) {	
	var newLength = newValue.length ;
	
	for (var i=0; i < newLength; i++) {
		aChar = newValue.substring(i, i + 1);
		bChar = newValue.charAt(0);
	
		if (aChar < "0" || aChar > "9") {
			if (aChar !="-")
			{
				return false;
			}
			
		}
	}
	return true ;
}

// 2014-11-27 | �������� �������� üũ�ڽ� üũ
function agree_check(obj_all,obj_a1,obj_a2)
{
	if (!$("input[name='" + obj_all + "']").is(":checked"))
	{
		if (!$("input[name='" + obj_a1 + "']").is(":checked"))
		{
			alert('�������� ������ �����Ͽ� �ּ���.\n���������� �������� ������ �ش� ���񽺸� �̿��Ͻ� �� �����ϴ�.');
			return false;
		}

		if (!$("input[name='" + obj_a2 + "']").is(":checked"))
		{
			alert('������ Ȱ�뿡 �����Ͽ� �ּ���.\n������ Ȱ�뿡 �������� ������ �ش� ���񽺸� �̿��Ͻ� �� �����ϴ�.');
			return false;
		}
	}

	return true;
}

// 2014-11-27 | �������� �������� üũ�ڽ� üũ, �����õ���X
function agree_check2(obj_all,obj_a1,obj_a2)
{
	if (!$("input[name='" + obj_all + "']").is(":checked"))
	{
		if (!$("input[name='" + obj_a1 + "']").is(":checked"))
		{
			alert('�������� ������ �����Ͽ� �ּ���.\n���������� �������� ������ �ش� ���񽺸� �̿��Ͻ� �� �����ϴ�.');
			return false;
		}
		
	}

	return true;
}

// 2014-11-27 | �������� �������� üũ�ڽ� üũ, ������ ���� ������
function agree_check_test(obj_all,obj_a1,obj_a2)
{
	if (!$("input[name='" + obj_all + "']").is(":checked"))
	{
		if (!$("input[name='" + obj_a1 + "']").is(":checked"))
		{
			alert('�������� ������ �����Ͽ� �ּ���.\n���������� �������� ������ �ش� ���񽺸� �̿��Ͻ� �� �����ϴ�.');
			return false;
		}
	}

	return true;
}

// 2014-11-27 | �������� �������� üũ�ڽ� Ŭ�� �� - prop,attr ȥ�� ���� try ó��
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

//2014-12-01 | ȸ������ ��� �� �������� ���� �� ������ ��뵿�� üũ
function agree_member_check(obj_all,obj_a1,obj_a2,obj_a3,click_position)
{
	if (!$("input[name='" + obj_all + "']").is(":checked"))
	{
		if (!$("input[name='" + obj_a1 + "']").is(":checked"))
		{
			alert('ȸ�� �̿����� ������ �ּ���.');
			return false;
		}
		
		if (!$("input[name='" + obj_a2 + "']").is(":checked"))
		{
			alert('�������� ������ �����Ͽ� �ּ���.\n���������� �������� ������ �ش� ���񽺸� �̿��Ͻ� �� �����ϴ�.');
			return false;
		}

		if (!$("input[name='" + obj_a3 + "']").is(":checked"))
		{
			alert('������ Ȱ�뿡 �����Ͽ� �ּ���.\n������ Ȱ�뿡 �������� ������ �ش� ���񽺸� �̿��Ͻ� �� �����ϴ�.');
			return false;
		}
	}

	return true;
}

//2014-12-01 | ȸ������ ��� �� �������� ���� �� ������ ��뵿�� üũX ����
function agree_member_check2(obj_all,obj_a1,obj_a2,obj_a3,click_position)
{
	if (!$("input[name='" + obj_all + "']").is(":checked"))
	{
		if (!$("input[name='" + obj_a1 + "']").is(":checked"))
		{
			alert('ȸ�� �̿����� ������ �ּ���.');
			return false;
		}
		
		if (!$("input[name='" + obj_a2 + "']").is(":checked"))
		{
			alert('�������� ������ �����Ͽ� �ּ���.\n���������� �������� ������ �ش� ���񽺸� �̿��Ͻ� �� �����ϴ�.');
			return false;
		}

		/*	
		if (!$("input[name='" + obj_a3 + "']").is(":checked"))
		{
			alert('������ Ȱ�뿡 �����Ͽ� �ּ���.\n������ Ȱ�뿡 �������� ������ �ش� ���񽺸� �̿��Ͻ� �� �����ϴ�.');
			return false;
		}
		*/
	}

	return true;
}


// 2014-12-01 | ȸ������ �������, �������� �������� üũ�ڽ� Ŭ�� �� - prop,attr ȥ�� ���� try ó��
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

// 2015-02-06 | �޴��� ���ӹ��� üũ�߰�
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

//label ó���� radio ��ư on/off ó�� ���(on,off class�� ���ǵ� ���̽�)
function check_label_base_radio(c_name,obj,rd_class,on_class,off_class)
{
	var rd_index = $("." + c_name).index(obj);

	$("." + rd_class).removeClass(off_class);
	$("." + rd_class).removeClass(on_class);
	$("." + rd_class).addClass(off_class);

	$("." + rd_class).eq(rd_index).removeClass(off_class);
	$("." + rd_class).eq(rd_index).addClass(on_class);
}

//label ó���� checkbox ��ư on/off ó�� ���(on,off class�� ���ǵ� ���̽�)
function check_label_base_checkbox(c_name,obj,rd_class,on_class,off_class)
{
	var rd_index = $("." + c_name).index(obj);

	if ($("." + rd_class).eq(rd_index).attr("class").indexOf(on_class) > 0)
	{
		if (off_class == "")
		{
			$("." + rd_class).eq(rd_index).removeClass(on_class);	
		}
		else
		{
			$("." + rd_class).eq(rd_index).removeClass(on_class);	
			$("." + rd_class).eq(rd_index).addClass(off_class);	
		}
	}
	else
	{
		if (off_class == "")
		{
			$("." + rd_class).eq(rd_index).removeClass(off_class);
		}

		$("." + rd_class).eq(rd_index).addClass(on_class);
	}
}

//2017-07-31 | �������û ���� ��ũ(�˾���)
function free_service_popup_view(u_div)
{
	if (u_div)
	{
		window.open("https://www.duo.co.kr/html/service/free_service_popup.asp?u_div=" + u_div,"fs_popup","width=980,height=600,scrollbars=no,toolbar=no,menubar=no,resizable=no");
	}
	else
	{
		window.open("https://www.duo.co.kr/html/service/free_service_popup.asp","fs_popup","width=980,height=600,scrollbars=no,toolbar=no,menubar=no,resizable=no");
	}
}	

