<% getInfo("load_file","/web/includes/_header.htm") %>
<META http-equiv="Content-Type" content="text/html; charset=<%getInfo("charset");%>" >
<script src="jq/jquery.js"></script>
<!--<link rel="stylesheet" type="text/css" href="BelkinSetup.css" media="screen" />-->
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script language="JavaScript">
var ts = new Date().getTime();
$(function()
{
$("#closewin").click(function(){
//alert("opener clicked");
//$( "#dialog-modal" ).dialog( "open" );
//func();
if(!checkValue(document.tF))
{
document.getElementById("intro1").style.display = "none";
document.getElementById("key_tag").style.display = "";
return;
}
else
stop = self.setInterval("func()",2000);
//$.blockUI();
});
$("#cancel").click(function(){
$.get("getSuccessStatus.asp",  {NoCache:ts},function(data){
if( (data == 2) || (data == 5))
window.location = "setting_sitesurvey_con.asp";
else
window.location = "setting_sitesurvey.asp";
return;
});
});
$("#inputField").keypress(function(e) {
if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
return false;
}
});
});
var  stop;
function func(){
//alert("inside");
$.get("testalive.html",  {NoCache:ts},function(data){
//window.clearInterval(stop);
window.location = "setting_checkpassword.asp";
//$("#dialog-modal").dialog("close");
});
}
var SiteSurveyResult = '<% getInfo("BS_get_sitesurvey_result"); %>'
var ResultArray = SiteSurveyResult.split(' ');
var band = ResultArray[0];
var repeaterSSID = ResultArray[1];
var sSecure = ResultArray[2];
var channel = ResultArray[3];
var Bandwidth = ResultArray[4];
var bandtype = ResultArray[6];
var root_AP_bssid =  ResultArray[9];
//alert("sSecure ="+sSecure);
function checkValue(F)
{
document.getElementById("intro1").style.display = "";
document.getElementById("key_tag").style.display = "none";
if(F.key.value.length == 0)
{
document.getElementById("key_tag").innerHTML = "<font color=\"#FF0000\"<b>"+wls17+"</b></font>";
return false; //No password
}
if (sSecure == '001' || sSecure == '002' || sSecure == '010' || sSecure == '020')
{
if(F.key.value.length < 8){
document.getElementById("key_tag").innerHTML = "<font color=\"#FF0000\"<b>"+wls16+"</b></font>";
return false;
}
/*if(!checkWPA(F.key))
{
if(inValid.length > 0)
{
var errmsg = "<font color=\"#FF0000\"<b>Password contains invalid characters: ";
for(var i=0; i<inValid.length; i++)
{
errmsg += inValid[i];
if(i != inValid.length - 1)
errmsg += ", ";
else
errmsg += "</b></font>";
}
document.getElementById("key_tag").innerHTML = errmsg;
}
else
{
//document.getElementById("key_tag").innerHTML = "<font color=\"#FF0000\"<b>WPA passwords need to be at least 8 digits long.</b></font>";
document.getElementById("key_tag").innerHTML = "<font color=\"#FF0000\"<b>" + wls16 + "</b></font>";
}
return false;
}*/
}
else if(sSecure == '100')	//WEP
{
if( (F.key.value.length != 10 && F.key.value.length !=26) )
{
document.getElementById("key_tag").innerHTML = "<font color=\"#FF0000\"<b>"+wls15+"</b></font>";
return false;
}
/*
if(!checkWEP(F.key))
{
if(inValid.length > 0)
{
var errmsg = "<font color=\"#FF0000\"<b>Password contains invalid characters: ";
for(var i=0; i<inValid.length; i++)
{
errmsg += inValid[i];
if(i != inValid.length - 1)
errmsg += ", ";
else
errmsg += "</b></font>";
}
document.getElementById("key_tag").innerHTML = errmsg;
}
else
{
//document.getElementById("key_tag").innerHTML = "<font color=\"#FF0000\"<b>WEP passwords can be 10 characters or 26 characters.</b></font>";
document.getElementById("key_tag").innerHTML = "<font color=\"#FF0000\"<b>" + wls15 + "</b></font>";
}
return false;
}
*/
}
return true;
}
/* submit */
function isiPhonePad(){
return (
(navigator.platform.indexOf("iPhone") != -1) ||
(navigator.platform.indexOf("iPad") != -1)
);
}
function evaltF()
{
if(!checkValue(document.tF))
{
//document.getElementById("intro1").style.display = "none";
document.getElementById("key_tag").style.display = "";
return;
}
/* Should not check now. */
document.tF.wl_ssid.value = CharFilterForSH(repeaterSSID);
document.tF.wl_ssidforfile.value = CharFilterForfile(repeaterSSID);
document.tF.wl_security.value = sSecure;
document.tF.wl_band.value = band;
document.tF.wl_channel.value = channel;
document.tF.wl_bandwidth.value = Bandwidth;
document.tF.wl_bandtype.value = bandtype;
document.tF.wl_seckey.value = CharFilterForSH(document.tF.key.value);
document.tF.wl_seckeyforfile.value = CharFilterForfile(document.tF.key.value);
document.tF.wl_rssi.value = ResultArray[8];
document.tF.wl_bssid.value = root_AP_bssid;
document.tF.fromFlag.value = isiPhonePad();
//window.location = "setting_sitesurvey.asp";
document.tF.submit();
//return true;
}
function foo(){
	window.location = "setting_sitesurvey.asp";
};
</script>
</head>
<body>
<% getInfo("load_file","/web/includes/_body.htm") %>
	<div id="main">
		<div class="row">
			<div class="twelve columns">
				<div class="intro_copy" id="intro1">
					<!--<h1><script>dw(set35)</script></h1>-->
					<script>
						var SiteSurveyResult = '<% getInfo("BS_get_sitesurvey_result"); %>'
						var ResultArray = SiteSurveyResult.split(' ');
						var repeaterSSID = ResultArray[1].replace(/nbsp/g," ");
						var strSSID = repeaterSSID;
						document.write("<h1>"+password_require.replace(/<SSID>/,CharFilterForHtml(strSSID))+"</h1>");
					</script>
				</div>
				<div class="intro_copy" id="key_tag" style="display:none"></div>
				<h6 class="password-warning"><script type="text/javascript">dw(setting_1)</script></h6>
				<div class="password">
					<form class="nice" name ="tF" method="post" action="/goform/formBSSetSitesurvey">
						<input type="hidden" name="submit-url" value="setting_password.asp">
						<input type="hidden" name="submit-url-ok" value="setting_checkpassword.asp">
						<input type="hidden" name="action" value="SetPassWord">
						<input type="hidden" name="wl_ssid">
						<input type="hidden" name="wl_ssidforfile">
						<input type="hidden" name="wl_security">
						<input type="hidden" name="wl_band">
						<input type="hidden" name="wl_channel">
						<input type="hidden" name="wl_bandwidth">
						<input type="hidden" name="wl_bandtype">
						<input type="hidden" name="wl_seckey">
						<input type="hidden" name="wl_seckeyforfile">
						<input type="hidden" name="fromFlag">
						<input type="hidden" name="wl_rssi">
						<input type="hidden" name="wl_bssid">
						<script>//dw('<input type="text" name="key" class="input-text" id="inputField" maxlength=64 placeholder="'+setting_2+'"></input>');</script>
						<script>dw('<input type="text" maxLength="64" name="key" class="input-text" style="margin:57px auto; width:100%; max-width: 358px" id="inputField" placeholder="'+setting_2+'"></input>');</script>
					</form>
				</div>
				<div style="margin-top:-57px; margin-buttom:57px; margin-left:auto; margin-right:auto; width:100%; max-width: 358px; background-color:red; color:#FFFFFF">		<script>dw(setting_15);</script>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="intro_tips" style="margin-bottom:57px; margin-left:auto; margin-right:auto;width:348px;">
				<script>dw(setting_16)</script>
				<br>
				<script>dw(setting_17)</script>
				<br><br>
				<script>dw(setting_18)</script>
			</div>
		</div>
                <div id="actions">
                        <div class="row">
                                <div class="twelve columns">
                                        <a id="Next" class="medium button nice green radius right" href="javascript:evaltF();"><script>dw(wls12)</script></a>
                                        <a id="Back" class="inline-block right-on-desktops" href="javascript:foo();" ><script>dw(btn4)</script></a>
                                </div>
                        </div>
                </div>
	</div>
<% getInfo("load_file","/web/includes/_footer.htm") %>
