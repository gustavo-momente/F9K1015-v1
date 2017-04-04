<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<link rel="stylesheet" type="text/css" href="<%getInfo("style");%>" media="all" />
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<SCRIPT language=JavaScript src="showMenu.js"></script>
<script type="text/javascript" src="BelkinSetupConfig.js"></script>
<script type="text/javascript">
var now_lang="<%getInfo("lang");%>";

var apMode = <%getVar("apMode","","");%>
var f=document.tF
strHtml='<title>'+wps1+'</title>';
dw(strHtml);
var helpItem 	='Wireless WPS';
var menuSection	='WLAN';
var menuItem	='Wireless WPS';
var isPS		='0';
var wanStatus= '';
var isRouter;
var isAPmode;
if(('<% getVar("apMode","","");%>' =='0'))
{	isAPmode='1';
isRouter='0';
}
else
{
isAPmode='0';
isRouter='1';
}
var strpskValue;
strpskValue='<% getInfo("pskValue");%>';
var strWpsConfig;
if (<%getVar("wpsConfigType","","");%>)
strWpsConfig = wps19;
else
strWpsConfig = wps21;
var strWepKey = <%getInfo("wepValueAll");%>
var strDataEncryption;
var wls_enc = "<%getVar("wpaCipher","","");%>";
if (wls_enc == 1)
strDataEncryption = "WPA-PSK";
else if (wls_enc == 2)
strDataEncryption = "WPA2-PSK";
else
strDataEncryption = "WPA-PSK + WPA2-PSK";
//----5G
var wlan_encrypt="<%getVar("encrypt","","");%>";
var wls_enc = "<%getVar("wpaCipher","","");%>";
var wls_wep = "";
var wls_psk=strpskValue;
var manu_conf = "";
function popup_pbc()
{
pbcwin=window.open("chkpbc.asp","pbc","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,width=450,height=200,resizable=0");
pbcwin.focus();
}
function popup_pin()
{
enrolle	=window.open("pinok.asp","pbc","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,width=450,height=200,resizable=0");
enrolle.focus();
}
function checksum()
{
var cf = document.forms[0];
var pin=cf.wps_enrolee_pin.value;
var accum= 0;
accum += 3 * (parseInt(pin.substring(0,1)));
accum += 1 * (parseInt(pin.substring(1,2)));
accum += 3 * (parseInt(pin.substring(2,3)));
accum += 1 * (parseInt(pin.substring(3,4)));
accum += 3 * (parseInt(pin.substring(4,5)));
accum += 1 * (parseInt(pin.substring(5,6)));
accum += 3 * (parseInt(pin.substring(6,7)));
accum += 1 * (parseInt(pin.substring(7,8)));
if(0 == (accum%10))
return true;
else
return false;
}
function checkData()
{
var cf = document.forms[0];
var pin = cf.wps_enrolee_pin.value;
var my4RE = /[0-9]{4}/;
var my8RE = /[0-9]{8}/;
if ((pin.length == 4) && (my4RE.test(pin) == true))
return true
if (!((pin.length == 8) && (my8RE.test(pin) == true)))
{
window.open("errpin1.asp","pbc","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,width=450,height=200,resizable=0");
return false;
}
if(pin.length == 8 && checksum() == false)
{
window.open("errpin2.asp","pbc","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,width=450,height=200,resizable=0");
return false;
}
return true;
}
rnd.today=new Date();
rnd.seed=rnd.today.getTime();
function rnd()
{
rnd.seed = (rnd.seed*9301+49297) % 233280;
return rnd.seed/(233280.0);
};
function generatePinValue()
{
var number;
var accum = 0;
var valueString = "";
var cf = document.forms[0];
number = rand(10)-1;
accum += 3 * number ;
valueString = valueString + number.toString(10);
number = rand(10)-1;
accum += 1 * number ;
valueString = valueString + number.toString(10);
number = rand(10)-1;
accum += 3 * number ;
valueString = valueString + number.toString(10);
number = rand(10)-1;
accum += 1 * number ;
valueString = valueString + number.toString(10);
number = rand(10)-1;
accum += 3 * number ;
valueString = valueString + number.toString(10);
number = rand(10)-1;
accum += 1 * number ;
valueString = valueString + number.toString(10);
number = rand(10)-1;
accum += 3 * number ;
valueString = valueString + number.toString(10);
accum = (accum % 10);
accum = (10 - accum) % 10;
valueString = valueString + accum.toString(10);
cf.h_wps_dev_genpin.value = valueString;
//alert(valueString);
}
function changToDoValue(buttonType)
{
var wpsEnable=<%getVar("wpsEnable","","");%>
if(buttonType == 1) {
document.tF.h_wps_action.value ="1";
document.tF.next_file.value = "save_ok.html";
document.tF.todo.value = "reboot";
document.tF.submit();
return true;
}
if( buttonType == 2) {
pincheck(document.tF.wps_enrolee_pin)
if ((wpsEnable == 1)) {
if(checkData() == false)
return false;
document.tF.h_wps_action.value ="2";
document.tF.todo.value = "wps_action";
popup_pin();
document.tF.submit();
return true;
}
}
if( buttonType == 3) //generate pin
{
generatePinValue();
document.tF.h_wps_action.value ="3";
document.tF.todo.value = "wps_action";
document.tF.submit();
return true;
}
if( buttonType == 4) //restore pin
{
document.tF.h_wps_action.value ="4";
document.tF.todo.value = "wps_action";
document.tF.submit();
return true;
}
if (buttonType == 5) {
if ((wpsEnable == 1)) {
document.tF.h_wps_action.value = 5
document.tF.todo.value = "wps_action"
popup_pbc()
document.tF.submit()
return true
}
}
}
function rand(number)
{
return Math.ceil(rnd()*number);
};
function WPSHWEnableDisplay(x) {
if (x == 0) {
document.getElementById("pin1").style.display = "none"
document.getElementById("pin2").style.display = "none"
document.getElementById("pin3").style.display = "none"
document.getElementById("pin4").style.display = "none"
document.getElementById("pin5").style.display = "none"
document.getElementById("pbc1").style.display = "none"
document.getElementById("pbc2").style.display = "none"
document.getElementById("pbc3").style.display = "none"
document.getElementById("pbc4").style.display = "none"
}
else {
document.getElementById("pin1").style.display = ""
document.getElementById("pin2").style.display = ""
document.getElementById("pin3").style.display = ""
document.getElementById("pin4").style.display = ""
document.getElementById("pin5").style.display = ""
document.getElementById("pbc1").style.display = ""
document.getElementById("pbc2").style.display = ""
document.getElementById("pbc3").style.display = ""
document.getElementById("pbc4").style.display = ""
}
}
function pincheck(x) {
x.value = x.value.replace(/\D/g,"")
}
</script>
</HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<% getInfo("load_file","/web/includes/_body.htm") %>
	<FORM name=tF action=/goform/formWlanSetupWPS method=post>
		<div class="row show-on-phones">
				<div class="twelve columns nav-links">
						<div><a href="index.asp">&larr; Back to Status</a></div>
				</div>
		</div>
		<div class="row">
			<div class="four columns hide-on-phones nav-links">
				<!-- The NAV bar for desktop -->
				<script language="JavaScript">
					var login='<% getInfo("isLogin"); %>';

					if (login==0)
							helpItem='indexa';
					showMenu(menuSection,menuItem,isRouter,isPS,isAPmode);
				</script>
			</div>
			
			<div class="forcebfc" id="status">
				<h2><script type="text/javascript">dw(wps1);</script></h2>
				<div class="twelve columns">
					<table class="minimal_1" cellspacing=10 cellpadding=0 width=550 align=center border=0 id="wps_disable">
						<tr>
							<td>
								<p><script type="text/javascript">dw(wps41)</script></p>
								<p><script type="text/javascript">dw(wps42.replace('<a>','<a href="wireless_chan.asp">'))</script></p>
								<p><script type="text/javascript">dw(wps43.replace('<a>','<a href="wireless_encrypt.asp">'))</script></p>
							</td>
						</tr>
					</table>
					<table class="minimal_1" cellspacing=10 cellpadding=0 width=550 align=center border=0 style="display:none" id="wps_enable" border=0>
						<tr>
							<TD><B>
								<script type="text/javascript">dw(wps2);</script>
							</B></TD>
							<TD noWrap width="300">
								<select name="wls_wps_enabled" onchange="WPSHWEnableDisplay(this.value)">
									<script type="text/javascript">
										dw('<option value=0 >'+Disabled+'</option>');
										if (apMode == 6) dw('<option value=1 >'+Enabled+' - 2.4 GHz</option>')
									</script>
								</select>
							</TD>
						</tr>
						<tr><td colspan="2"><hr></td></tr>
						<TR>
							<TD><B>
								<script type="text/javascript">dw(wps35);</script>
							</B></TD>
							<TD noWrap>
								<select name="WPSHWEnable">
									<script type="text/javascript">
										dw('<option value=0 >'+Disabled+'</option>');
										dw('<option value=1 >'+Enabled+'</option>');
									</script>
								</select>
							</TD>
						</TR>
						<tr>
							<td>&nbsp;</td>
							<td><script type="text/javascript">dw('<input type="button" style="{width:160px;}" value="'+btn2+'" class="submitBtn" noctl="true" onClick="changToDoValue(1)">');</script></td>
						</tr>
						<tr><td colspan="2" style="display:none" id="pin1"><hr /></td></tr>
						<tr>
							<td colspan="2" class="body" style="display:none" id="pin2"><b><script type="text/javascript">dw(wps36);</script></b></td>
						</tr>
						<tr>
							<td colspan="2" style="display:none" id="pin3"><script type="text/javascript">dw(wps37);</script></td>
						</tr>
						<tr>
							<td colspan="1" align="center" style="display:none" id="pin4"><b><script type="text/javascript">dw(wps38);</script></b></td>
							<td style="display:none" id="pin5">
								<input type="text" name="wps_enrolee_pin" style="text-align:center" onchange="pincheck(this)">
								<script type="text/javascript">dw('<input type="button" value="');dw(wps8);dw('" class="submitBtn" onclick="changToDoValue(2)" />');</script>
							</td>
						</tr>
						<tr><td colspan="2" style="display:none" id="pbc1"><hr /></td></tr>
						<tr>
							<td colspan="2" class="body" style="display:none" id="pbc2"><b><script type="text/javascript">dw(wps39);</script></b></td>
						</tr>
						<tr>
							<td colspan="2" style="display:none" id="pbc3"><script type="text/javascript">dw(wps40);</script></td>
						</tr>
						<tr><td colspan="2" align="center" style="display:none" id="pbc4">
							<script type="text/javascript">dw('<input type="button" value="');dw(wps15);dw('" class="submitBtn" onclick="changToDoValue(5)" />')</script>
						</td></tr>
					</table>
				</div>
				<INPUT type=hidden value="enabled" name=h_wls_wps_enabled noctl="true">
				<INPUT type=hidden name=h_wps_dev_genpin noctl="true">
				<INPUT type=hidden value=0 name=h_wps_config noctl="true">
				<INPUT type=hidden name=h_wps_action noctl="true">
				<INPUT type=hidden value=save name=todo noctl="true">
				<INPUT type=hidden value=wireless_wps.asp name=webpage noctl="true">
				<INPUT type=hidden value=wls_wps.html name=next_file noctl="true">
			</div>
		</div>
	</FORM>
<script type="text/javascript">

var wpsEnable=<%getVar("wpsEnable","","");%>

if (apMode == 6) {
	if (wpsEnable == 1)
		document.tF.wls_wps_enabled.selectedIndex = 1
	else
		document.tF.wls_wps_enabled.selectedIndex = 0
}

document.tF.WPSHWEnable.selectedIndex=<%getInfo("WPSHWEnable");%>
WPSHWEnableDisplay(document.tF.wls_wps_enabled.selectedIndex);
if (wpsEnable == 1 && <%getVar("wpsConfigType","","");%> == 1 && <%getVar("Encryptmod","","");%> != 0) {
	if (<%getVar("hiddenSSID","","");%> == 1 || <%getVar("Encryptmod","","");%> < 4) {
		document.getElementById("wps_disable").style.display = "block"
		document.getElementById("wps_enable").style.display = "none"
	}
	else if (<%getVar("Encryptmod","","");%> > 1 && <%getInfo("stadrv_encrypttype")%> == 2 && <%getInfo("stadrv_wpacipher");%> < 3) {
		document.getElementById("wps_disable").style.display = "block"
		document.getElementById("wps_enable").style.display = "none"
	}
	else {
		document.getElementById("wps_disable").style.display = "none"
		document.getElementById("wps_enable").style.display = "block"
	}
}
else {
	document.getElementById("wps_disable").style.display = "none"
	document.getElementById("wps_enable").style.display = "block"
}
</script>
<% getInfo("load_file","/web/includes/_footer_FWGUI.htm") %>
