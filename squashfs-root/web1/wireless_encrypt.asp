<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<link rel="stylesheet" type="text/css" href="<%getInfo("style");%>" media="all" />
<META http-equiv=Pragma content=no-cache>
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script type="text/javascript" src="BelkinSetupConfig.js"></script>
<script language="JavaScript" src="showMenu.js"></script>
<script type="text/javascript">
var now_lang="<%getInfo("lang");%>";

strHtml='<title></title>'
dw(strHtml)
var helpItem ='Security'
var menuSection ='WLAN'
var menuItem ='Security'
var isPS ='0'
var wanStatus= '';
var isRouter
var isAPmode
var err_str
if(('<% getVar("apMode","","");%>' =='0')) {
	isAPmode='1'
	isRouter='0'
}
else {
	isAPmode='0'
	isRouter='1'
}
function enc_onchange(x) {
	document.getElementById("err_str1").style.display = "none"
	document.getElementById("wpa").style.display = "none"
	document.getElementById("psk_password").style.display = "none"
	document.getElementById("psk_password2").style.display = "none"
	document.getElementById("err_block").style.display = "none"
	var f = document.tF
	f.wepEnabled.value = ""
	f.length.value = 0
	if (x == 0){
		document.getElementById("pskblock").style.display = "none"
	}
	else if (x == 1){
		document.getElementById("pskblock").style.display = "block"
		f.wepEnabled.value = "ON"
		if (f.pskValue.value.length == 10)
			f.length.value = 1 
		else if(f.pskValue.value.length == 26)
			f.length.value = 2
		document.getElementById("wpa").style.display = "block"
		obscure_onchange(f.obscure);
	}
	else if (x == 2) {
		document.getElementById("pskblock").style.display = "block"
		document.getElementById("wpa").style.display = "block"
		obscure_onchange(f.obscure);
	}
}
function enc_submit() {
	var f = document.tF
	if (<%getVar("apMode","","");%> == 6)
		secalert(f.method.selectedIndex)
	enc_onchange(f.method.selectedIndex)
	if (f.method.selectedIndex == 2) {
			f.wpaCipher.value=4;
		if (!psk_onchange(f.pskValue)){
			document.getElementById("err_str1").style.display = "block"
			//document.getElementById("err_str1").innerHTML=wls16
			document.getElementById("err_str11").innerHTML=wls16
			document.getElementById("err_block").style.display = "block"
			return false
		}
		if (f.pskValue.value.length == 64) {
			if (isHex(f.pskValue.value))
				f.pskFormat.value = 1
			else{
				document.getElementById("err_str1").style.display = "block"
				//document.getElementById("err_str1").innerHTML=wls18
				document.getElementById("err_str11").innerHTML=wls18
				document.getElementById("err_block").style.display = "block"
				return false
			}
		}
	}
	else if (f.method.selectedIndex == 1) {
		if (f.pskValue.value.length != 26 && f.pskValue.value.length != 10 ){
			document.getElementById("err_str1").style.display = "block"
			//document.getElementById("err_str1").innerHTML=wls15
			document.getElementById("err_str11").innerHTML=wls15
			document.getElementById("err_block").style.display = "block"
			return false
		}
		if ( isHex(f.pskValue.value )){			
			f.key1.value = f.pskValue.value
		}
		else{
			document.getElementById("err_str1").style.display = "block"
			//document.getElementById("err_str1").innerHTML=wls18
			document.getElementById("err_str11").innerHTML=wls18
			document.getElementById("err_block").style.display = "block"
			return false 
		}	
	}

	return true
}
function psk_onchange(x) {
	if (x.value.length < 8 || x.value.length > 64) {
		x.value = x.defaultValue
		return false
	}
	return true
}
function wep_onchange(x) {
	if (x.value != "") {
		if (x.value.length != 2 || !x.value.match(/^[0-9a-fA-F]{2,2}$/)) {
			x.value = x.defaultValue
			return false
		}
	}
	return true
}
function obscure_onchange(x) {
	document.getElementById("psk_password").style.display = "none"
	document.getElementById("psk_password2").style.display = "none"
	if (x.checked == true)
		document.getElementById("psk_password2").style.display = "block"
	else
		document.getElementById("psk_password").style.display = "block"
}
function run_init(){
	var f = document.tF
	var ap_mode = '<% getVar("apMode","","");%>';
	if (ap_mode == 6){
		document.getElementById("2gstate1").style.display = "block"
		var encrypt = <%getVar("encrypt","","");%>
		var wepValueAll = <%getInfo("wepValueAll");%>
		if (encrypt == 0)
			f.method.selectedIndex = 0
		else if (encrypt == 1) {
			f.method.selectedIndex = 1
			if (<%getVar("wep","","");%> == 1){
				if (wepValueAll[0] != "0000000000") {
					f.pskValue.value = wepValueAll[0] 
					f.pskValue3.value = wepValueAll[0] 
				}
			}
			else if(<%getVar("wep","","");%> == 2){ 
				if (wepValueAll[4] != "00000000000000000000000000") {
					f.pskValue.value = wepValueAll[4]
					f.pskValue3.value = wepValueAll[4]
				}
			}	
		}	
		else if (encrypt == 2){
			f.method.selectedIndex = 2;
			f.pskValue.value = "<%getInfo("pskValue");%>"
			f.pskValue3.value = "<%getInfo("pskValue");%>"
		}
		enc_onchange(f.method.selectedIndex)
	}
	else{
		document.getElementById("2gstate").style.display = "block"
	}	
}
function isHex(x) {
for (i=0; i<x.length; i++) {
if (isNaN(parseInt(x.charAt(i), 16)))
	return false
}
return true
}

var is_already_show=0;
var is_already_show1=0;
function secalert(x) {
	if (x == 0){
		if( is_already_show == 0){
			alert('Warning! None security now!');
			is_already_show=1;
		}
	}
	else if (x == 1){
		if( is_already_show1 == 0){
			alert(wpsalert1);
			is_already_show1=1;
		}
	}
}
</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="run_init()" >
<% getInfo("load_file","/web/includes/_body.htm") %>
	<form action=/goform/formWlEncrypt name="tF" method=post>
	<input type="hidden" name="page" value="">
	<input type="hidden" name="logout" value="">
	<input type="hidden" name="webpage" value=wireless_encrypt.asp>
	<input type="hidden" name="action" value="">
	<input type="hidden" name="pskFormat" value="0" />
	<input type="hidden" name="wepEnabled" />
	<input type="hidden" name="length" />
	<input type="hidden" name="format" value="2" />
	<input type="hidden" name="key1" />
	<input type="hidden" name="wpaCipher" value="3" />
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
			<h2><script type="text/javascript">dw(wlm5)</script></h2>
			<div class="twelve columns">
				<table class="minimal_1" border="0" align="center" >
					<tr>
						<td>&nbsp;</td>
						<td class="copy_2" width="300" colspan=2><b><script type="text/javascript">dw(wlc4)</script></b></td>
						<!--<td class="copy_2" width="42%"><b><script type="text/javascript">dw(wlc5)</script></b></td>-->
					</tr>
					<tr>
						<td valign="top">
							<table class="minimal_1" border="0">
								<tr height=30>
									<td>
										<b><script type="text/javascript">dw(wls6)</script></b>
									</td>
								</tr>	
								<tr id="err_block" style="display:none">
									<td height=30></td>
								</tr>
								<tr height=30 id="pskblock" style="display:none">
									<td >
										<b><script type="text/javascript">dw(wls8)</script></b>
									</td>
								</tr>	
							</table>
						</td>
						<td class="body" width="300" valign="top">
							<span id="2gstate" style="display:none">
								<font size=3><script type="text/javascript">
									dw(wlc3.replace('<a>','<a href="util_factory.asp">'))
								</script></font>
							</span>
							<span id="2gstate1" style="display:none">
								<table class="minimal_1" width="100%" border="0">
									<tr height=30>
										<td >
										<select name="method" onchange="enc_onchange(this.selectedIndex)">
										<script type="text/javascript">dw('<OPTION value=0>'+none+'</OPTION>')</script>
										<option value="1">WEP</option>
										<option value="2">WPA/WPA2</option>
										</select>
									</td>
								</tr>	
								<tr id="err_str1" style="display:none">
									<td id="err_str11"></td>
								</tr>
								<tr id="psk_password" style="display:none" height=30>
									<td>
										<input type="text" name="pskValue" size="24" maxlength=""  onchange="document.tF.pskValue3.value = this.value" />
									</td>
								</tr>
								<tr id="psk_password2" style="display:block" height=30>
									<td>
										<input type="password" name="pskValue3" size="24" maxlength=""   onchange="document.tF.pskValue.value = this.value" />
									</td>
								</tr>
								<tr id="wpa" style="display:none" height=30>
									<td>
										<input type="checkbox" name="obscure"  onclick="obscure_onchange(this)" <%getVar("wlanBurst","1","checked");%>/><b><script type="text/javascript">dw(wls9)</script></b>
									</td>
								</tr>
							</table>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<script type="text/javascript">dw('<input type="button" value="');dw(btn1);dw('" style="{width:160px}" class="submitBtn" onclick="window.location.reload()">&nbsp;&nbsp;');dw('<input type="submit" style="{width:160px}" value="'+btn2+'" class="submitBtn" onclick="return enc_submit()">')</script>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</form>
<% getInfo("load_file","/web/includes/_footer_FWGUI.htm") %>
