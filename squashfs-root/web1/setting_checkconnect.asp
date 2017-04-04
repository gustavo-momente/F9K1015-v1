<% getInfo("load_file","/web/includes/_header.htm") %>
<META http-equiv="Content-Type" content="text/html; charset=<%getInfo("charset");%>" >
<script src="jq/jquery.js"></script>
<!--<link rel="stylesheet" type="text/css" href="BelkinSetup.css" media="screen" />-->
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script language="JavaScript">
var stop;
var SiteSurveyResult = '<% getInfo("BS_get_sitesurvey_result"); %>'
var ResultArray = SiteSurveyResult.split(' ');
var band = ResultArray[0];
var securityType = ResultArray[2];
var password = ResultArray[5];

var isFromStaticSetting = '<% getInfo("BS_from_staticip"); %>'
var LinkRetryCounter = 0;
var WrongPassCounter = 0;
var Msg = msg_connect2net;

var ts = new Date().getTime();
var ts2 = new Date().getTime();
function func(){ 
var getStaInfoband;
var getConnectStatus;
getStaInfoband = "getStaInfo.asp"
getConnectStatus = "getConnectStatus.asp"
getSecurityOK = "getSecurityOK.asp"
getPingStatus = "getPingStatus.asp"
if(SiteSurveyResult=='empty'){
$.get("testalive.html", {NoCache:ts},function(data){
window.location = "setting_sitesurvey.asp";
window.clearInterval(stop);
return;
});
return;
}

var ts2 = new Date().getTime();
$.get(getStaInfoband, {NoCache:ts2},function(data){  //先看link狀態
if(securityType != '000' && password == '0'&& isFromStaticSetting==0){ //有加密但是還沒有填密碼
window.location = "setting_password.asp";
}
else if(data == 1 && securityType=='000' || isFromStaticSetting) //no security
{
//alert("line 61 no sec!!");
$.get(getPingStatus, {NoCache:ts2},function(data){  // ping net status
if(data==1)
{
$.get(getConnectStatus, {NoCache:ts},function(data){
return;
}); //成功以後再把檔案寫入
//window.clearInterval(stop);
//$("#dialog-modal").dialog("close");
sleep(3);
$.get("getSuccessStatus.asp", {NoCache:ts},function(data){
if(data == 8){ //都成功了
$.get("testalive.html",{NoCache:ts}, function(data){
window.location = "setting_finished.asp";
window.clearInterval(stop);
//window.clearInterval(keeptrying);
});
}
else if( (data == 2) || (data == 5)){
$.get("testalive.html",{NoCache:ts}, function(data){
window.location = "setting_sitesurvey_con.asp";
window.clearInterval(stop);
//window.clearInterval(keeptrying);
});
}
return;
});
}else{
WrongPassCounter ++;
if(WrongPassCounter==5)
window.location = "setting_surveyfail.asp";
}
return;
});
}
else if(data == 1 && securityType != '000'){
$.get(getPingStatus, {NoCache:ts},function(data){  //測試目前連線狀態  ping net status
if(data==1)
{
$.get(getConnectStatus, {NoCache:ts},function(data){
return;
}); //成功以後再把檔案寫入
//window.clearInterval(stop);
//$("#dialog-modal").dialog("close");
sleep(3);
$.get("getSuccessStatus.asp", {NoCache:ts},function(data){
if(data == 8){ //都成功了
$.get("testalive.html",{NoCache:ts}, function(data){
window.location = "setting_finished.asp";
window.clearInterval(stop);
//window.clearInterval(keeptrying);
});
}
else if( (data == 2) || (data == 5)){
$.get("testalive.html",{NoCache:ts}, function(data){
window.location = "setting_sitesurvey_con.asp";
window.clearInterval(stop);
//window.clearInterval(keeptrying);
});
}
return;
});
}else{
WrongPassCounter ++;
if(WrongPassCounter==5)
window.location = "setting_password_retry.asp";
}
return;
});
}
else{
LinkRetryCounter ++;
if(LinkRetryCounter==5)
{
window.location = "setting_surveyfail.asp";
}
return;
}
});
}

var stopforchan;
var discontimeout;
var el;
var timeoutcounter=0;
function timeout() {
	$.get("testalive.html", {NoCache: ts}, function (data) { 
		timeoutcounter=0
	});
	ts++;
	timeoutcounter++;
	if(timeoutcounter ==30){
		//$("#dialog-modal").dialog("open");
		showMask();
		el = document.getElementById("overlay");
		el.style.visibility = "visible";
		window.clearInterval(discontimeout);
	}
}

function init(){
stop = self.setInterval("func()",5000);
if(SiteSurveyResult!='empty' && band==2 && /*isiPhonePad() &&*/ securityType == '000')
{
stopforchan = self.setInterval("prepareforChan()",500);
}
discontimeout = self.setInterval("timeout()",1000); //wait for 30 sec
}
function prepareforChan()
{
var ts3 = new Date().getTime();
//funcChan();
$.get("getChangeChan.asp", {NoCache:ts3},function(data){return});
window.clearInterval(stopforchan);
}

function showMask(){
        $("#bg").css("display","block");
}

</script>
</head>
<body onLoad="init();">
<% getInfo("load_file","/web/includes/_body.htm") %>
<form name ="tF" method="post" action="apply.cgi"  onSubmit="return evaltF();">
<div id="main">
	<div class="row">
		<div class="twelve columns">
			<h1>
				<script>
					if(SiteSurveyResult=='empty')
						Msg = set49;
					else
						Msg = msg_connect2net;
					dw(Msg);
				</script>
			<h1>
		</div>
	</div>
</div>
<div id="loading-img"></div>
</form>
<% getInfo("load_file","/web/includes/_footer.htm") %>
