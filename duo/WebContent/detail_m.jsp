<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="mybatis.model.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript" src="/duo/common/js/jquery-1.11.0.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <%
// Control에서 param을 넘겨받아 pList 변수에 지정
 Member member = (Member)request.getAttribute("paramDetail");
 %>
 <script type="text/javascript">
 
 function sendHeart(){
	 
	
	 <%-- var rId = <%=member.getmId()%>; --%>
	
<%-- 	 location.href="/duo/search?cmd=sendHeart&rId=<%=member.getmId()%>"; 
 --%>	
	 
	 $.ajax({
			type:"POST",
			dataType:"TEXT",  
			url:"/duo/search?cmd=sendHeart",
			data:"rId=<%=member.getmId()%>",
			success:function(data) {

					window.close();
			}
		});
	 alert("하트보내기가 완료되었습니다.")
	  
 } 
 </script>
  
</head>


<style>
#sendHeart:hover{
 text-align: center;
  border: 2px solid #369;
  
  color: #FFF;
}

table.detailTb {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  margin : 20px 10px;
}
table.detailTb th{
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.detailTb td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
#btn_heart{
margin-left:270px;
width: 200px;
}

/* .detail{
height:35px;
width:100px;
font-size: 12pt;
text-align:center;
font-weight: bold;
}

.detail1{
height:35px;
width:180px;
font-size: 12pt;
text-align:center;
font-weight: bold;
}


#tot{
margin-top: 20px;
margin-left: 20px;
}
 */
</style>

<body>

<table class="detailTb">
  	<tr>
	<td colspan='2' ><img class="img-thumbnail" src="/duo/upload/<%=member.getmPic() %>" 
				style="width: 365px; height: 220px;" /></td>
	</tr>
  	
  	<tr>
        <th scope="row">이름</th>
        <td><%=member.getmName() %></td>
    </tr>
    <tr>
        <th scope="row">나이</th>
        <td><%=2017-Integer.parseInt(member.getmBirth().substring(0,4))+1 %></td>
    </tr>
    <tr>
        <th scope="row">학력</th>
        <td><%=member.getmEdu()%></td>
    </tr>
     <tr>
        <th scope="row">직업</th>
        <td><%=member.getmJob() %></td>
    </tr>
     <tr>
        <th scope="row">결혼여부</th>
        <td> <%=member.getmRemarry() %></td>
    </tr>
</table>

<%-- <table border="2" id="tot" class="detailTb">
<tr>
<td rowspan='5' ><img class="img-thumbnail" src="/duo/upload/Koala.jpg" 
				style="width: 100px; height: 144px;" /></td> <td class="detail">이 름</td> <td class="detail1"><%=member.getmName() %></td>    <!-- 열을 합치는 colspan -->
</tr>


<tr>
<td class="detail">나 이</td><td class="detail1">  <%=2017-Integer.parseInt(member.getmBirth().substring(0,4))+1 %></td>
</tr>

<tr>
<td class="detail">학 력</td> <td class="detail1"> <%=member.getmEdu()%></td>  <!-- 열을 합치는 colspan -->
</tr>

<tr>
<td class="detail">직 업</td><td class="detail1">  <%=member.getmJob() %></td>
</tr>


<tr>
<td class="detail">초 혼</td><td class="detail1">  <%=member.getmRemarry() %></td>
</tr>
</table> --%>
<br/><br/>
<div id="btn_heart">
<button type="button" id="sendHeart" class="btn btn-info" onclick="sendHeart()">♥하트보내기♥</button>
</div>

	
	
	

</body>
</html>