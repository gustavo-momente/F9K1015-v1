<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<link rel="stylesheet" type="text/css" href="<%getInfo("style");%>" media="all" />
<META http-equiv=Pragma content=no-cache>
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script language="JavaScript" src="showMenu.js"></script>
<script type="text/javascript" src="BelkinSetupConfig.js"></script>
<script type="text/javascript">
var now_lang="<%getInfo("lang");%>";
strHtml='<title></title>'
dw(strHtml)
var helpItem =''
var menuSection ='WISP_24G'
var menuItem =''
var isPS ='0'
var wanStatus= '';
var isRouter
var isAPmode
var f = document.tF
var connectstat
var ap_mode='<% getVar("apMode","","");%>';
var connectstat2g=<%getInfo("BS_get_sta_info","","");%>
var IP2g="<% getInfo("BS_get_IP")%>";
var connect2g="<% getInfo("BS_get_2gconnect")%>"
//if (ping_2g_gw == 0)
if (connect2g != "1")
        connectstat=1
else
        connectstat=0
if(('<% getVar("apMode","","");%>' =='0') && ('<% getiNICVar("apMode","","");%>' =='0')) {
isAPmode='1'
isRouter='0'
}
else {
isAPmode='0'
isRouter='1'
}
function enc_onchange(x) {
	var f = document.tF
	//document.getElementById("disabled").style.display = "none"
	document.getElementById("wpa").style.display = "none"
	document.getElementById("err_block").style.display = "none"
	document.getElementById("psk_password").style.display = "none"
	document.getElementById("psk_password2").style.display = "none"
	f.length.value = 0
	if (x == 0){
		//document.getElementById("disabled").style.display = ""
	}
	else {
		document.getElementById("wpa").style.display = ""
                document.getElementById("psk_password").style.display = ""
                document.getElementById("psk_password2").style.display = ""
                obscure_onchange(document.tF.obscure)
	}
}
function isBlank(s)
{
	for(var i = 0; i < s.length; i++) {
		var c = s.charAt(i);
		if((c !=' ') && (c!='\n') && (c !='\t')) 
			return false;
	}
	return true;
}
function enc_submit() {
	var f = document.tF
	if (isBlank(f.stadrv_ssid.value)) {
		alert(msg_wls_chan1)
		return false
	}	
//	enc_onchange(f.method.selectedIndex)
	if (f.method.selectedIndex == 2 || f.method.selectedIndex == 3 || f.method.selectedIndex == 4 || f.method.selectedIndex == 5) {
		if (!psk_onchange(f.pskValue)) {
			document.getElementById("err_str").innerHTML="<b><font color=\"red\">"+wls16+"</font></b>"
			document.getElementById("err_block").style.display = ""
			return false
		}
		if (f.pskValue.value.length == 64) {
			if (!isHex(f.pskValue.value)){
				document.getElementById("err_str").innerHTML="<b><font color=\"red\">"+wls18+"</font></b>"
				document.getElementById("err_block").style.display = ""
				return false
			}
		}
	}
	else if (f.method.selectedIndex == 1) {
		if (f.pskValue.value.length != 26 && f.pskValue.value.length != 10){ 
			document.getElementById("err_str").innerHTML="<b><font color=\"red\">"+wls15+"</font></b>"
			document.getElementById("err_block").style.display = ""
			return false
		}
		if ( !isHex(f.pskValue.value )){
			document.getElementById("err_str").innerHTML="<b><font color=\"red\">"+wls18+"</font></b>"
			document.getElementById("err_block").style.display = ""
			return false
		}
		f.stadrv_weplength.value=f.pskValue.value.length	
	}
	return true
}
function psk_onchange(x) {
	if (x.value.length < 8 || x.value.length > 64) {
	//	alert("password length is worng");
		x.value = x.defaultValue
		return false
	}
	return true
}
function obscure_onchange(x) {
	document.getElementById("psk_password").style.display = "none"
	document.getElementById("psk_password2").style.display = "none"
	if (x.checked == true){
		document.getElementById("psk_password2").style.display = ""
	}
	else{
		document.getElementById("psk_password").style.display = ""
	}
}
function showSurveyClick(url)
{
	MyRef=window.open(url,'NewFirmware','channelmode=0, directories=0,fullscreen=0,height=335,location=0,menubar=0,resizable=yes,scrollbars=yes,status=0,titlebar=0,toolbar=0,width=850','false');
	MyRef.focus();
}
function run_init(){
	if (ap_mode == 0){
		document.getElementById("setstate").style.display = ""
		document.getElementById("setstate1").style.display = "none"
	}
	else{
		var f = document.tF
		document.getElementById("setstate1").style.display = ""
		document.getElementById("setstate").style.display = "none"
		document.getElementById("connect1").style.display = "none"
		document.getElementById("connect2").style.display = "none"
		document.getElementById("wpa").style.display = "none"
		document.getElementById("psk_password").style.display = "none"
		document.getElementById("psk_password2").style.display = "none"
	
		if(connectstat == 0){
			document.getElementById("connect2").style.display = ""
			document.getElementById("ssid").style.display = ""
			document.getElementById("security").style.display = ""
		
		}
		else{
			document.getElementById("connect1").style.display = ""
			document.getElementById("ssid").style.display = ""
			document.getElementById("security").style.display = ""
		}	
	
		var encrypt = <% getInfo("stadrv_encrypttype")%> 
		if (encrypt == 0){
			f.method.selectedIndex = 0
		}
		else if (encrypt == 2) {
			if (<%getInfo("stadrv_wpacipher");%> == 0)
				f.method.selectedIndex = 2
			else if(<%getInfo("stadrv_wpacipher");%> == 1)
				f.method.selectedIndex = 3
			else if(<%getInfo("stadrv_wpacipher");%> == 2)
				f.method.selectedIndex = 4
			else
				f.method.selectedIndex = 5
			f.pskValue.value = "<%getInfo("stadrv_pskkey");%>"
			f.pskValue3.value = "<%getInfo("stadrv_pskkey");%>"
		}
		else if (encrypt == 1){
			f.method.selectedIndex = 1
			f.pskValue.value = "<%getInfo("stadrv_wepkey1");%>"
			f.pskValue3.value = "<%getInfo("stadrv_wepkey1");%>"
		}
		enc_onchange(f.method.selectedIndex)
		f.stadrv_ssid.value='<%getInfo("stadrv_ssid");%>'
	}
}
function isHex(x) {
	for (i=0; i<x.length; i++) {
		if (isNaN(parseInt(x.charAt(i), 16)))
			return false
	}
	return true
}
</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="run_init()">
<% getInfo("load_file","/web/includes/_body.htm") %>
<form action=/goform/formWISP24G name="tF" method=post>
	<input type="hidden" name="page" value="">
	<input type="hidden" name="logout" value="">
	<input type="hidden" name="webpage" value=wisp_24g.asp>
	<input type="hidden" name="action" value="">
	<input type="hidden" name="pskFormat" value="0" />
	<input type="hidden" name="pskFormat2" value="0" />
	<input type="hidden" name="wepEnabled" />
	<input type="hidden" name="wepEnabled2" />
	<input type="hidden" name="length" />
	<input type="hidden" name="length2" />
	<input type="hidden" name="format" value="2" />
	<input type="hidden" name="format2" value="2" />
	<input type="hidden" name="key1" />
	<input type="hidden" name="key1b" />
	<input type="hidden" name="wl_key1" />
	<input type="hidden" name="wl_key2" />
	<input type="hidden" name="wl_key3" />
	<input type="hidden" name="wl_key4" />
	<input type="hidden" name="wlkey" />
	<input type="hidden" name="stadrv_chan" />
	<input type="hidden" name="stadrv_band" />
	<input type="hidden" name="bandwidth" />
	<input type="hidden" name="stadrv_pskformat" value="0" />
	<input type="hidden" name="stadrv_weplength" />
	<input type="hidden" name="stadrv_wepformat" value="1" />
	<input type="hidden" name="stadrv_defaultkey" value="0" />
	<input type="hidden" name="stadrv_type" value="6" />

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
			<h2><script type="text/javascript">dw(wls4)</script></h2>
			<span id="setstate" style="display:none">
				<table class="minimal_1" border=0 >
					<tr>
						<td width="600">
							<b><script type="text/javascript">
								dw(wls2.replace('<a>','<a href="util_factory.asp">'))
							</script></b>
						</td>
					</tr>
				</table>	
			</span>
			<span id="setstate1" style="display:none">
				<table border=0 class="minimal_1">
					<tr id="connect1" style="display:none">
						<td width="160">
							<b><script type="text/javascript">dw(wls1)</script></b>
						</td>
						<td>
							<script>
								var signal = <% getInfo("BS_get_rssi")%>;
								if(signal >= 80)
									dw('<img src="images/icon-Wi-Fi_mobile-sm_4-4.png" height="37" width="26">')
								else if(signal >= 60)
									dw('<img src="images/icon-Wi-Fi_mobile-sm_3-4.png" height="37" width="26">')
								else if(signal >= 40)
									dw('<img src="images/icon-Wi-Fi_mobile-sm_2-4.png" height="37" width="26">')
								else 
									dw('<img src="images/icon-Wi-Fi_mobile-sm_1-4.png" height="37" width="26">')
							</script>
						</td>
					</tr>
					<tr id="connect2" style="display:none">
						<td colspan=2 class="body">
							<b><font size=4 color=red>
							<script type="text/javascript">
								ssid="<% getInfo("stadrv_ssid")%>";
								dw(wls13.replace("<SSID>",ssid))
							</script></font></b><br><br>
						</td>
					</tr>
					<tr id="ssid" style="display:none">
						<td width="160">
							<b><script type="text/javascript">
							if(connectstat == 0)
								dw('<font color=red>'+wls5+'</font>')
							else
								dw(wls5)
							</script></b>
						</td>
						<td>
							<input type="text" name="stadrv_ssid" size="28" maxlength="32" />
						</td>
					</tr>

					<tr id="security" style="display:none">
						<td width="160">
							<b><script type="text/javascript">
							if(connectstat == 0)
								dw('<font color=red>'+wls6+'</font>')
							else
								dw(wls6)
							</script></b>
						</td>
						<td>
							<select name="method" onchange="enc_onchange(this.selectedIndex)" style="margin-top:3px;margin-bottom:3px;">
							<script type="text/javascript">dw('<OPTION value=0>'+none+'</OPTION>')</script>
							<option value="1">WEP</option>
							<option value="2">WPA-TKIP</option>
							<option value="3">WPA-AES</option>
							<option value="4">WPA2-TKIP</option>
							<option value="5">WPA2-AES</option>
							</select>
						</td>
					</tr>
					<tr id="err_block" style="display:none">
						<td width="160">&nbsp;
						</td>
						<td id="err_str">
						</td>
					</tr>
					<tr id="psk_password" style="display:none">
						<td width="160">
							<b><script type="text/javascript">
							if(connectstat == 0)
								dw('<font color=red>'+wls8+'</font>')
							else
								dw(wls8)
							</script></b>
						</td>	
						<td>
							<input type="text" name="pskValue" size="32" maxlength="" onchange="document.tF.pskValue3.value = this.value" />
						</td>
					</tr>
					<tr id="psk_password2" style="display:none">
						<td width="160">
							<b><script type="text/javascript">
							if(connectstat == 0)
								dw('<font color=red>'+wls8+'</font>')
							else
								dw(wls8)
							</script></b>
						</td>
						<td>
							<input type="password" name="pskValue3" size="32" maxlength="" onchange="document.tF.pskValue.value = this.value" />
						</td>
					</tr>
					<tr id="wpa" style="display:none">
						<td width="160">&nbsp;</td>
						<td>
							<input type="checkbox" name="obscure" onclick="obscure_onchange(this)" <%getVar("wlanSetTx","1","checked");%>/>
							<script type="text/javascript">dw(wls9)</script>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<script type="text/javascript">dw('<input type="button" value="');dw(btn1);dw('" style="{width:160px}" class="submitBtn" onclick="window.location.reload()">&nbsp;&nbsp;');dw('<input type="submit" style="{width:160px}" value="'+btn2+'" class="submitBtn" onclick="return enc_submit()">')</script>
						</td>
					</tr>
				</table>
			</span>
		</div>
	</div>
</form>
<% getInfo("load_file","/web/includes/_footer_FWGUI.htm") %>
