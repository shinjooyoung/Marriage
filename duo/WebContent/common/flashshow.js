<!--
// flashShow(파일경로, 가로, 세로, 아이디, 배경색, 윈도우모드)
function flashShow(url,w,h,id,bg,win,num){
	var subNum = -1;
	if(num != undefined) {
		subNum = num;
	}
	var flashStr=
	"<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='https://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0' width='"+w+"' height='"+h+"' id='"+id+"' align='middle'>"+
	"<param name='movie' value='"+url+"' />"+
	"<param name='wmode' value='Transparent' />"+
	"<param name='menu' value='false' />"+
	"<param name='quality' value='high' />"+
	"<param name='bgcolor' value='"+bg+"' />"+
	"<param name='FlashVars' value='subNum="+subNum+"' />"+
	"<embed src='"+url+"' wmode='"+win+"' menu='false' quality='high' bgcolor='"+bg+"' width='"+w+"' height='"+h+"' name='"+id+"' align='middle' type='application/x-shockwave-flash' pluginspage='https://www.macromedia.com/go/getflashplayer' />"+
	"</object>";
	document.write(flashStr);
}
-->
