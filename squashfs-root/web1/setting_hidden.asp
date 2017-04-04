<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<script src="jq/jquery.js"></script>
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<!--<link rel="stylesheet" type="text/css" href="BelkinSetup.css" media="screen" />-->
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script language="JavaScript">
function checkValue(F)
{
	var str_normal_ssid = "<b>Enter the name of your wireless network (SSID).</b>";
	var str_normal_key = "<b>Enter the password used by your network.</b>";
	
	document.getElementById("ssid_tag").style.display = "none";
	document.getElementById("key_tag").style.display = "none";
	
	if(F.wl_ssid_field.value == "")	//check ssid
	{

		//document.getElementById("ssid_tag").innerHTML = "<font color=\"#FF0000\"<b>Please enter a network name (SSID).</b></font>";
		document.getElementById("ssid_tag").innerHTML = "<font color=\"#FF0000\"<b>" + wls14 + "</b></font>";
		document.getElementById("key_tag").innerHTML = str_normal_key;
		document.getElementById("ssid_tag").style.display = "";
		return false;
	}
	/*if(isNValidSSID(F.wl_ssid_field.value))
	{
	document.getElementById("ssid_tag").innerHTML = "<font color=\"#FF0000\"<b>SSID: " + F.wl_ssid_field.value + " is invalid, please correct it first!</b></font>";
	document.getElementById("key_tag").innerHTML = str_normal_key;
	return false;
	}*/
	if(F.sec.value != "" && F.key.value == "")
	{
		//document.getElementById("key_tag").innerHTML = "<font color=\"#FF0000\"<b>Please enter a password.</b></font>";
		document.getElementById("key_tag").innerHTML = "<font color=\"#FF0000\"<b>" + wls17 + "</b></font>";
		document.getElementById("ssid_tag").innerHTML = str_normal_ssid;
		document.getElementById("key_tag").style.display = "";
		return false;
	}
	if((F.sec.value.substr(0,3) == "wpa"))
	{
		if(!checkWPA(F.key))
		{
			//alert(F.key.value.length);
			document.getElementById("ssid_tag").innerHTML = str_normal_ssid;
			if(F.key.value.length < 8)
			{
				//document.getElementById("key_tag").innerHTML = "<font color=\"#FF0000\"<b>WPA passwords need to be at least 8 digits long.</b></font>";
				document.getElementById("key_tag").innerHTML = "<font color=\"#FF0000\"<b>" + wls16 + "</b></font>";
				document.getElementById("key_tag").style.display = "";
				return false;
			}
		}
	}
	if(F.sec.value == "wep")
	{
		if(!checkWEP(F.key))
		{
			var valuenospace = F.key.value.replace(/\s/g,"");
			//alert(valuenospace.length);
			document.getElementById("ssid_tag").innerHTML = str_normal_ssid;
			if(valuenospace.length!=10 && valuenospace.length!=26)
			{
				//document.getElementById("key_tag").innerHTML = "<font color=\"#FF0000\"<b>WEP passwords can be 10 characters or 26 characters.</b></font>";
				document.getElementById("key_tag").innerHTML = "<font color=\"#FF0000\"<b>" + wls15 + "</b></font>";
				document.getElementById("key_tag").style.display = "";
				return false;
			}
			F.key.value = valuenospace;
		}
	}
	return true;
}
var bHiddenApMode = true;
function evaltF()
{
	//if(bHiddenApMode) document.tF.location_page.value = 'setup_wizard_step3t.stm'; //We have select security and set key, jump to connection test page.
	if(!checkValue(document.tF))
	{
		//alert(document.tF.key.value);
		return;
	}
	//document.getElementById("ssid_tag").innerHTML = str_normal_key;
	//document.getElementById("ssid_tag").innerHTML = str_normal_ssid;
	document.tF.wl_ssid.value = CharFilterForSH(document.tF.wl_ssid_field.value);
	document.tF.wl_ssidforfile.value = CharFilterForfile(document.tF.wl_ssid_field.value);
	if(document.tF.sec.value == "")//no security
	{
		document.tF.hidden_sectype.value = "000";
		document.tF.action.value = "done";
	}
	else
	{ 
		if(document.tF.sec.value == "wpat")
			document.tF.hidden_sectype.value = "001"; 
		else if(document.tF.sec.value == "wpaa")
			document.tF.hidden_sectype.value = "002";
		else if(document.tF.sec.value == "wpa2t")
			document.tF.hidden_sectype.value = "010";
		else if(document.tF.sec.value == "wpa2a")
			document.tF.hidden_sectype.value = "020";
		else if(document.tF.sec.value == "wep")
			document.tF.hidden_sectype.value = "100";
		document.tF.wl_seckey.value = CharFilterForSH(document.tF.key.value);
		document.tF.wl_seckeyforfile.value = CharFilterForfile(document.tF.key.value);
	}
	document.tF.submit();
	//return true;
}
$(function()
{
	$("#cancel").click(function(){
		$.get("getSuccessStatus.asp", function(data){
			if( (data == 2) || (data == 5))
				window.location = "setting_sitesurvey_con.asp";
			else
				window.location = "setting_sitesurvey.asp";
			return;
		});
	});
});
function foo()
{
return;
}
</script>
</head>
<body>
<% getInfo("load_file","/web/includes/_body.htm") %>
<form name ="tF" method="post" action="/goform/formBSSetSitesurvey" >
	<input type="hidden" name="location_page" value="setting_hidden.asp">
	<input type="hidden" name="arc_action" value="vl_wizard_sel_ap">
	<input type="hidden" name="wl_ssid">
	<input type="hidden" name="wl_ssidforfile">
	<input type="hidden" name="wl_seckey">
	<input type="hidden" name="wl_seckeyforfile">
	<input type="hidden" name="action" value="SetPassWord">
	<input type="hidden" name="formHiddenSSID" value="formHiddenSSIDpage">
	<input type="hidden" name="submit-url-ok" value="setting_checkpassword.asp">
	<input type="hidden" name="hidden_sectype" >
	<input type="hidden" name="wl_rssi" value="100">

	<div id="main">
		<div class="row">
			<div class="twelve columns">
			
				<h1><script>dw(setting_12);</script></h1>
				
				<script>
					// Load the serviceCard stylesheet
					var newStyle = document.createElement("link");
					newStyle.rel = "stylesheet";
					newStyle.href = "css/serviceCard.css";
					document.getElementsByTagName("head")[0].appendChild(newStyle);
				</script>

				<div class="row intro_copy">
					<div class="six columns offset-by-three">
						<div class="servCardInfo">
							<div class="pad-w-img wifi roundTop2"  style="height:auto; min-height:56px" tid="gt5SSID">
								<script>
									dw(set31);
								</script>
								<div id="ssid_tag" style="display:none; border:0px;"></div>
								<input type="text" maxLength="32" size="27" name="wl_ssid_field" class="default_input">
							</div>
							<div id="key_field" class="pad-w-img pass" style="height:auto; min-height:56px" tid="gt5PSK">
								<script>dw(set33);</script>
								<div id="key_tag" style="display:none; border:0px;"></div>
								<script>
									dw('<input type="text" maxLength="64" size="27" name="key" placeholder="'+setting_2+'">');
								</script>
							</div>
							<div class="pad-w-img roundBL roundBR" style="height:auto; min-height:56px" tid="gt5Sec">
								<script>dw(set32);</script><br>
								<select name=sec id=sec class="default_input" onchange="checkSec(this.value); " size="1">
									<option value="">None</option>
									<option value="wpa2t">WPA2-TKIP</option>
									<option value="wpa2a">WPA2-AES</option>
									<option value="wpat">WPA-TKIP</option>
									<option value="wpaa">WPA-AES</option>
									<option value="wep">WEP</option>
								</select>
								<script>
									function checkSec(s){ document.getElementById('key_field').style.display=(s!='')?'':'none'; }
									checkSec(document.tF.sec.value);
								</script>
								<input name=bHiddenAP type=hidden value=1>
							</div>
						</div>
					</div>
				</div>	
			</div>
		</div>
		<div id="actions">
			<div class="row">
				<div class="twelve columns">
					<a id="next" class="medium button nice green radius right" href="javascript:evaltF();"><script type="text/javascript">dw(Next)</script></a>
					<a id="cancel" class="inline-block right-on-desktops" href="javascript:foo();" ><script type="text/javascript">dw(btn4)</script></a>
				</div>
			</div>
		</div>
	</div>
</form>
<% getInfo("load_file","/web/includes/_footer.htm") %>

