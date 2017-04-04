<% getInfo("load_file","/web/includes/_header.htm") %>
<META http-equiv="Content-Type" content="text/html; charset=<%getInfo("charset");%>" >
<script src="jq/jquery.js"></script>
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<!--<link rel="stylesheet" type="text/css" href="BelkinSetup.css" media="screen" />-->
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script language="JavaScript">
var ts = new Date().getTime();
var SiteSurveyResult = '<% getInfo("BS_get_sitesurvey_ok_info"); %>'
//var SiteSurveyResult = '2 QQQQQQQQQQQQQQ 020 5 1 12345678 5 0 62 00:01:8e:3a:7d:38'
var ResultArray = SiteSurveyResult.split(' ');
var band = ResultArray[0];
var repeaterSSID = ResultArray[1];
var channel = ResultArray[3];
var chan_bandwidth;
var SiteSurveyResult5g = '<% getInfo("BS_get_sitesurvey_ok_info5g"); %>'
var ResultArray5g = SiteSurveyResult5g.split(' ');
//var band = ResultArray5g[0];
var repeaterSSID5g = ResultArray5g[1];
var channel5g = ResultArray5g[3];
var chan_bandwidth5g;
var _24g_passwd;
var _5g_passwd;
var _24g_secType;
var _5g_secType;
var _24g_connected;
var _5g_connected;
if(SiteSurveyResult != '0')
	_24g_connected = '1';
if(SiteSurveyResult5g != '0')
	_5g_connected = '1';
//var btnmsg = 'Create Extended Network';
//if(_24g_connected == '1' && _5g_connected == '1')
//	btnmsg = 'Create Extended Networks';
//	btnmsg = btnmsg + "s";
var wl0_ssid ='';
var wl01_ssid ='';
var wl1_ssid ='';
var wl11_ssid ='';
if(_24g_connected == '1'){
	wl0_ssid = ResultArray[1].replace(/nbsp/g," ");
	//wl01_ssid = wl0_ssid.substring(0,29) + "_xt";
	wl01_ssid = wl0_ssid;
}
if(_5g_connected == '1'){
	wl1_ssid = ResultArray5g[1].replace(/nbsp/g," ");
	//wl11_ssid = wl1_ssid.substring(0,28) + "_5xt";
	wl11_ssid=wl1_ssid;
}
function gopage(p) { location.href = p; }
function getSecurity(num)
{
	if(num == "001" || num == "010" || num == "002" || num == "020")
	{
		return "WPA/WPA2"
	}
	else if( num == "100")
	{
		return "WEP";
	}
	else
	{
		return "open";
		_24g_passwd = ' ';
		_5g_passwd = ' ';
	}
}
//alert("ResultArray[5]="+ResultArray[5]);
//alert("ResultArray5g[5]="+ResultArray5g[5]);
_24g_secType = getSecurity(ResultArray[2]);
_5g_secType = getSecurity(ResultArray5g[2]);

//var password24 = CharFilterForSH(ResultArray[5]);
//var password5 = CharFilterForSH(ResultArray5g[5]);

if((_24g_secType == "WPA/WPA2"))
{
	_24g_passwd = ResultArray[5];
}
else if(_24g_secType == "WEP")
{
	_24g_passwd = ResultArray[5];
}
else
	_24g_passwd = ResultArray[5];

if((_5g_secType == "WPA/WPA2"))
{
	_5g_passwd = ResultArray5g[5];
	//_5g_passwd = '<% getiNICInfo("stadrv_pskkey"); %>'
}
else if(_5g_secType == "WEP")
{
	_5g_passwd = ResultArray5g[5];
	//_5g_passwd = '<% getiNICInfo("stadrv_wepkey1"); %>'
}
else
	_5g_passwd = ResultArray5g[5];
//_5g_passwd = "no password";
if(_5g_passwd == '0')
	_5g_passwd = "None";
if(_24g_passwd == '0')
	_24g_passwd = "None";
function checkSec(s)
{
	document.getElementById('password_field').style.display=(s!='0')?'':'none';
}
function init()
{
	document.getElementById("24g_info").style.display="";
	document.tF.wl0_passwd_t.value = _24g_passwd.replace(/nbsp/g," ");
	//document.tF.wl0_passwd_t.value = _24g_passwd.replace(/nbsp/g," ");
	//document.tF.wl1_passwd_t.value = _5g_passwd.replace(/nbsp/g," ");
	if(_24g_secType == "WPA/WPA2")
		document.tF.security_type.value = 4;
	else if(_24g_secType == "WEP")
		document.tF.security_type.value = 1;
	else
		document.tF.security_type.value = 0;

	document.tF["wl0.1_ssid"].value = wl01_ssid;
//	document.tF["wl1.1_ssid"].value = wl11_ssid;
	checkSec(document.tF.security_type.value);
	var repeaterSSID = ResultArray[1];
	var channel = ResultArray[3];
	var repeaterSSID5g = ResultArray5g[1];
	var channel5g = ResultArray5g[3];
	var StaticIPinfo = '<% getInfo("BS_get_staticip"); %>'
	var StaticIPinfo5g = '<% getiNICInfo("BS_get_staticip"); %>'
	var StaticIPinfoArray = StaticIPinfo.split(' ');
	var StaticIPinfoArray5g = StaticIPinfo5g.split(' ');
	var ip_addr = StaticIPinfoArray[0];
	var net_mask = StaticIPinfoArray[1];
	var gateway = StaticIPinfoArray[2];
	//alert("ip="+ip_addr+ "nm="+net_mask+ "gw="+gateway);
	var ip_addr5g = StaticIPinfoArray5g[0];
	var net_mask5g = StaticIPinfoArray5g[1];
	var gateway5g = StaticIPinfoArray5g[2];
	if(_24g_connected == '1'){
		wl0_ssid = ResultArray[1].replace(/nbsp/g," ");
		//wl01_ssid = wl0_ssid.substring(0,29) + "_xt";
		wl01_ssid=wl0_ssid;
	}
	if(_5g_connected == '1'){
		wl1_ssid = ResultArray5g[1].replace(/nbsp/g," ");
		//wl11_ssid = wl1_ssid.substring(0,28) + "_5xt";
		wl11_ssid=wl1_ssid;
	}
	if(_24g_connected == '1')
	{
		document.tF.BandConnetInfo.value = 1;
		document.tF.repeaterSSID.value = wl0_ssid.replace(/nbsp/g," ");
		document.tF.channel.value = channel;
		document.tF.self_ssid.value = wl01_ssid.replace(/nbsp/g," ");
		document.tF.rptpassword.value = ResultArray[5].replace(/nbsp/g," ");
		document.tF.rptpasswordType.value = ResultArray[2];
		//document.tF.bandtype.value = TranslateBandType(ResultArray[6]);
		document.tF.bandtype.value = ResultArray[6];
		document.tF.ipaddr.value = ip_addr;
		document.tF.netmask.value = net_mask;
		document.tF.gateway.value = gateway;
		document.tF.chan_bandwidth.value = ResultArray[4];

		tmp=ResultArray[9].split(":");
		for(i=0; i<tmp.length; i++){
			document.tF.root_ap_bssid.value += tmp[i];
		}
		//alert("bandtype.value="+document.tF.bandtype.value);
		//document.getElementById("24g").style.display="";
	}
	if(_5g_connected == '1')
	{
		document.tF.BandConnetInfo.value = 2
		document.tF.repeaterSSID5g.value = wl1_ssid.replace(/nbsp/g," ");
		document.tF.channel5g.value = channel5g;
		document.tF.self_ssid5g.value = wl11_ssid.replace(/nbsp/g," ");
		document.tF.rptpassword5g.value = ResultArray5g[5].replace(/nbsp/g," ");
		//document.tF.bandtype5g.value = TranslateBandType5g(ResultArray5g[6]);
		document.tF.bandtype5g.value = ResultArray5g[6];
		document.tF.ipaddr5g.value = ip_addr5g;
		//document.tF.netmask5g.value = net_mask5g;
		document.tF.gateway5g.value = gateway5g;
		document.tF.gnetmask.value = StaticIPinfoArray5g[1];
		document.tF.rptpasswordType5g.value = ResultArray5g[2];
		document.tF.chan_bandwidth5g.value = ResultArray5g[4];
		tmp=ResultArray5g[9].split(":");
		for(i=0; i<tmp.length; i++){
			document.tF.root_ap_bssid5g.value += tmp[i];
		}
		//alert("document.tF.rptpasswordType5g.value="+document.tF.rptpasswordType5g.value);
		//document.getElementById("5g").style.display="";
	}
	if((_24g_connected == '1') && (_5g_connected == '1') )
		document.tF.BandConnetInfo.value = 3 //both
	//=============
}
function editall()
{
document.getElementById("24g_info").style.display="none";
document.getElementById("edit").style.display="none";
if(_24g_connected == '1')
{
document.getElementById("24g_input").style.display="";
}

document.getElementById('idontsee').innerHTML = Save;

}
function set_security(val, b5G)
{
if(b5G)
{
var akm_name = "wl1.1_akm";
var wep_name = "wl1.1_wep";
var wpa_psk_name = "wl1.1_wpa_psk";
var crypto_name = "wl1.1_crypto";
var key1_name = "wl1.1_key1";
var passwd_name = "wl1_passwd_t";
}
else
{
var akm_name = "wl0.1_akm";
var wep_name = "wl0.1_wep";
var wpa_psk_name = "wl0.1_wpa_psk";
var crypto_name = "wl0.1_crypto";
var key1_name = "wl0.1_key1";
var passwd_name = "wl0_passwd_t";
}
if(val == "1")
{//WEP
document.tF[akm_name].value = "";
document.tF[key1_name].value = document.tF[passwd_name].value;
}
else if(val == "4")
{//WPA/WPA2
//document.tF[wep_name].value = "disabled";
//document.tF[wpa_psk_name].value = document.tF[passwd_name].value;
}
else
{//None
//document.tF[wep_name].value = "disabled";
//document.tF[akm_name].value = "";
}
}
function check_security(val, val1, div_name)
{
document.getElementById(div_name).innerHTML = "";
if(val == "0")
{
return true; //None
}
else
{
if(val1.value.length == 0)
{
//document.getElementById(div_name).innerHTML = "<font color=\"#FF0000\"<b>Please enter a password.</b></font>";
document.getElementById(div_name).innerHTML = "<font color=\"#FF0000\"<b>" + wls17 + "</b></font>";
return false; //No password
}
if(val == "1")
{//WEP
if(val1.value.length!=10 && val1.value.length!=26){
//document.getElementById(div_name).innerHTML = "<font color=\"#FF0000\"<b>WEP passwords can be 10 characters or 26 characters.</b></font>";
document.getElementById(div_name).innerHTML = "<font color=\"#FF0000\"<b>" + wls15 + "</b></font>";
return false;
}
if(!isHex(val1.value)){
document.getElementById(div_name).innerHTML = "<font color=\"#FF0000\"<b>" + wls18 + "</b></font>";
return false;
}
/*if(checkWEP(val1) == false)
{
if(inValid.length > 0)
{
var errmsg = "<font color=\"#FF0000\"<b>Password contains invalid characters: ";
for(var i = 0; i < inValid.length; i++)
{
errmsg += inValid[i];
if(i != inValid.length - 1)
errmsg += ", ";
else
errmsg += "</b></font>";
}
document.getElementById(div_name).innerHTML = errmsg;
}
else
{
document.getElementById(div_name).innerHTML = "<font color=\"#FF0000\"<b>WEP passwords can be 10 characters or 26 characters.</b></font>";
}
return false;
}
else
{
return true;
}*/
}
else
{//WPA or WPA2
if(val1.value.length < 8){
//document.getElementById(div_name).innerHTML = "<font color=\"#FF0000\"<b>WPA passwords need to be at least 8 digits long.</b></font>";
document.getElementById(div_name).innerHTML = "<font color=\"#FF0000\"<b>" + wls16 + "</b></font>";
return false;
}
if(val1.value.length == 64){
if(!isHex(val1.value)){
document.getElementById(div_name).innerHTML = "<font color=\"#FF0000\"<b>" + wls18 + "</b></font>";
return false;
}
}
/*if(checkWPA(val1) == false)
{
if(inValid.length > 0)
{
var errmsg = "<font color=\"#FF0000\"<b>Password contains invalid characters: ";
for(var i=0; i < inValid.length; i++)
{
errmsg += inValid[i];
if(i != inValid.length - 1)
errmsg += ", ";
else
errmsg += "</b></font>";
}
document.getElementById(div_name).innerHTML = errmsg;
}
else
{
document.getElementById(div_name).innerHTML = "<font color=\"#FF0000\"<b>WPA passwords need to be at least 8 digits long.</b></font>";
}
return false;
}
else
{
return true;
}*/
}
}
}
function evaltF()
{
	document.getElementById("id_err_ssid0").style.display = "none";
	document.getElementById("id_err_0").style.display = "none";
	document.getElementById("id_err_ssid0").innerHTML = "<font color=\"#FF0000\"<b>" + set30 + "</b></font>";
	if(_24g_connected == '1')
	{
		if(document.tF['wl0.1_ssid'].value == "")
		{
			document.getElementById("id_err_ssid0").innerHTML = "<font color=\"#FF0000\"<b>" + wls14 + "</b></font>";
			return;
		}
		if(check_security(document.tF["security_type"].value, document.tF["wl0_passwd_t"], "id_err_0") == false)
		{
			document.getElementById("id_err_0").style.display = "";
			return;
		}
	}
	else
	{
		document.tF["wl0.1_ssid"].disabled = true;
	}
//record the self settings
	document.tF.self_ssid.value = document.tF["wl0.1_ssid"].value;
	document.tF.self_password.value = document.tF["wl0_passwd_t"].value.replace(/nbsp/g," ");
	document.tF.self_passwordType.value = document.tF["security_type"].value;
	document.tF.submit();	//submit here.
}
function go_back(url)
{
document.tF["arc_action"].value = "vl_reset_all_stas";
document.tF["location_page"].value = url;
document.tF.submit();
}
function foo()
{
}
/*$(function()
{
$("#cancelsetup").click(function(){
$.get("getSuccessStatus.asp",{NoCache:ts},function(data){
if( (data == 2) || (data == 5))
window.location = "setting_sitesurvey_con.asp";
else
window.location = "setting_sitesurvey.asp";
return;
});
});
});*/
function isHex(x) {
for (i=0; i<x.length; i++) {
if (isNaN(parseInt(x.charAt(i), 16)))
return false
}
return true
}

</script>
</head>
<body onLoad="init()">
<% getInfo("load_file","/web/includes/_body.htm") %>
<form name ="tF" method="post" action="/goform/formBSSetSitesurvey" >
<input type="hidden" name="submit-url" value="setting_final.asp">
<input type="hidden" name="action" value="reboot">
<input type="hidden" name="self_ssid">
<input type="hidden" name="self_ssid5g">
<input type="hidden" name="self_password">
<input type="hidden" name="self_password5g">
<input type="hidden" name="self_passwordType">
<input type="hidden" name="self_passwordType5g">
<input type="hidden" name="repeaterSSID">
<input type="hidden" name="repeaterSSID5g">
<input type="hidden" name="channel">
<input type="hidden" name="channel5g">
<input type="hidden" name="rptpassword">
<input type="hidden" name="rptpassword5g">
<input type="hidden" name="rptpasswordType">
<input type="hidden" name="rptpasswordType5g">
<input type="hidden" name="bandtype">
<input type="hidden" name="bandtype5g">
<input type="hidden" name="ipaddr">
<input type="hidden" name="ipaddr5g">
<input type="hidden" name="netmask">
<input type="hidden" name="gateway">
<input type="hidden" name="gateway5g">
<input type="hidden" name="BandConnetInfo">
<input type="hidden" name="gnetmask">
<input type="hidden" name="chan_bandwidth">
<input type="hidden" name="chan_bandwidth5g">
<input type="hidden" name="root_ap_bssid">
<input type="hidden" name="root_ap_bssid5g">
	<div id="main">
		<div class="row">
			<div class="twelve columns">
				<h1><script>dw(set48);</script></h1>
				
				<script>
					// Load the serviceCard stylesheet
					var newStyle = document.createElement("link");
					newStyle.rel = "stylesheet";
					newStyle.href = "css/serviceCard.css";
					document.getElementsByTagName("head")[0].appendChild(newStyle);
				</script>
				
				<div id="24g_info" class="row" style="display:none;" >
					<div class="six columns offset-by-three">
						<div class="servCardInfo">
							<div class="freq-label inline-block tcenter roundTop2">
								<b><span tid="gt24ghz">2.4 GHz</span></b>
							</div>
							<div class="pad-w-img wifi roundUR" tid="gt5SSID">
							<script>
								dw(CharFilterForHtml(wl01_ssid.replace(/nbsp/g," ")));
							</script>
							</div>
							<div class="pad-w-img pass" tid="gt5PSK">
								<script>dw(_24g_passwd.replace(/nbsp/g," "));</script>
							</div>
							<div class="pad-w-img roundBL roundBR" tid="gt5Sec">
								<script>
									dw(_24g_secType);
								</script>
							</div>
						</div>
					</div>
				</div>		
				<div id="24g_input" class="row intro_copy" style="display:none;" >
					<div class="six columns offset-by-three">
						<div class="servCardInfo">
							<div class="freq-label inline-block tcenter roundTop2">
								<b><span tid="gt24ghz">2.4 GHz</span></b>
							</div>
							<div class="pad-w-img wifi roundUR"  style="height:auto; min-height:56px" tid="gt5SSID">
								<script>
									dw(set31);
								</script>
								<div id="id_err_ssid0" style="display:none"></div><br>
								<input type="text" name="wl0.1_ssid" size=27 maxlength=32 value="">
							</div>
							<div id="password_field" class="pad-w-img pass" style="height:auto; min-height:56px" tid="gt5PSK">
								<script>dw(set33);</script>
								<div id="id_err_0" style="display:none; border:0px;"></div>
								<input type="text" maxLength="64" name="wl0_passwd_t" size=27>
							</div>
							<div class="pad-w-img roundBL roundBR" style="height:56px;" tid="gt5Sec">
								<script>dw(set32);</script><br>
								<select size="1" name="security_type" class="default_input" onchange="checkSec(this.value);">
									<option value = 4>WPA/WPA2</option>
									<option value = 1>WEP</option>
									<option value = 0>No Security</option>
								</select>
							</div>
						</div>
					</div>
				</div>	
			</div>
		</div>
		<div id="actions">
			<div class="row">
				<div class="twelve columns">
					<a id="nextlink" class="inline-block right-on-desktops medium button nice green radius right" href="javascript:evaltF();"><div id="idontsee"><script>dw(setting_19);</script></div></a>
					<div id="edit"><a id="Next" class="inline-block right-on-desktops" href="javascript:editall();"><script>dw(Edit);</script></a></div>
					<a class="inline-block right-on-desktops " href=javascript:gopage("setting_start.asp");><div id="StartOver"><script>dw(set47);</script></div></a>
				</div>
			</div>
		</div>
	</div>
</form>
<% getInfo("load_file","/web/includes/_footer.htm") %>
