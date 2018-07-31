<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>title</title>
</head>

<style>

#ok{
width:110pt;
}

#no{
width:110pt;
}

#photo{
width:100pt;
height:110pt;
}

#profile{
float:left;
margin-left: 50px;
}

#okno{
margin-bottom: 1px;

}

#detail{
background-color: #FFD9FA;
}

</style>

<body>

<div id='detail'>

<h1>상세 프로필</h1>

<div id='profile'>
이 름 : <input type="text" id="name"  /><br/><br/>
나 이 : <input type="text" id="age"  /><br/><br/>
직 업 : <input type="text" id="job"  /><br/><br/>
학 력 : <input type="text" id="edu"  /><br/><br/>
연 봉 : <input type="text" id="sal"  /><br/><br/>
번 호 : <input type="text" id="tel"  /><br/><br/>

<br/><br/><br/>
</div>


<div id='pic'>
<img alt="이미지" src="/duo/mypage/member_7020.jpg" id='photo'>
</div>



<br/><br/><br/><br/><br/><br/><br/><br/><hr/><div id='okno'><br/><br/>
<input type='button' id='ok' value='수락' />
<input type='button' id='no' value='거절' />
</div>

</div>


</body>
</html>