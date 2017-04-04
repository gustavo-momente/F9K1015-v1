<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<link rel="stylesheet" type="text/css" href="<%getInfo("style");%>" media="all" />
<META http-equiv=Pragma content=no-cache>
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script type="text/javascript" src="showMenu.js"></script>
<script type="text/javascript" src="BelkinSetupConfig.js"></script>
<script type="text/javascript">
var now_lang="<%getInfo("lang");%>";
function refresh(){
	window.location.reload();
}
function init() {
/*
	var ap_mode = '<% getVar("apMode","","");%>';
	if( (ap_mode==6))
		return;
	else
		window.location = "setting_start.asp";
*/
setTimeout("refresh()",30000);//every 30 sec refresh
}
var showFlag = 0;
strHtml='<title></title>';
dw(strHtml);
var helpItem='';
var menuSection='Status';
var menuItem='';
var isPS='0';
var wanStatus='';
var isRouter;
var isAPmode;
var str_24g_sec="";
var encrypt = "<%getInfo("stadrv_encrypttype","","");%>"
var connect2g="<% getInfo("BS_get_2gconnect")%>"
if (encrypt == 0){
	str_24g_sec = Disabled;
}
else if (encrypt == 1){
	var wepkey="<%getInfo("stadrv_wepkey1","","");%>"
	var weplen=wepkey.length
	if (weplen == 10)
		str_24g_sec = "64bit WEP";
	else 
		str_24g_sec = "128bit WEP";
}
else if (encrypt == 2){
	str_24g_sec = "WPA/WPA2-Personal(PSK)";
}

if(('<% getVar("apMode","","");%>' =='0'))
{	
	isAPmode='1';
	isRouter='0';
}
else
{
	isAPmode='0';
	isRouter='1';
}

var CurrentTime=new Date().getTime();
var t_time='?t='+CurrentTime;
var language_mask=1023
if (document.images)
{
Pic1 = new Image
Pic2 = new Image
Pic3 = new Image
Pic4 = new Image
Pic5 = new Image
Pic6 = new Image
Pic7 = new Image
Pic8 = new Image
Pic9 = new Image
Pic10 = new Image
Pic1_1 = new Image
Pic2_1 = new Image
Pic3_1 = new Image
Pic4_1 = new Image
Pic5_1 = new Image
Pic6_1 = new Image
Pic7_1 = new Image
Pic8_1 = new Image
Pic9_1 = new Image
Pic10_1 = new Image
Pic1.src = "images/en1.gif"
Pic2.src = "images/es1.gif"
Pic3.src = "images/fr1.gif"
Pic4.src = "images/de1.gif"
Pic5.src = "images/ne1.gif"
Pic6.src = "images/it1.gif"
Pic7.src = "images/chs1.gif"
Pic8.src = "images/cht1.gif"
Pic10.src = "images/kr1.gif"
Pic1_1.src = "images/en1.gif"
Pic2_1.src = "images/es1.gif"
Pic3_1.src = "images/fr1.gif"
Pic4_1.src = "images/de1.gif"
Pic5_1.src = "images/ne1.gif"
Pic6_1.src = "images/it1.gif"
Pic7_1.src = "images/chs1.gif"
Pic8_1.src = "images/cht1.gif"
Pic10_1.src = "images/kr1.gif"
}
else
{
Pic1 = ""
Pic2 = ""
Pic3 = ""
Pic4 = ""
Pic5 = ""
Pic6 = ""
Pic7 = ""
Pic8 = ""
Pic9 = ""
Pic10 = ""
Pic1_1 = ""
Pic2_1 = ""
Pic3_1 = ""
Pic4_1 = ""
Pic5_1 = ""
Pic6_1 = ""
Pic7_1 = ""
Pic8_1 = ""
Pic9_1 = ""
Pic10_1 = ""
document.link1 =""
document.link2 =""
document.link3 =""
document.link4 =""
document.link5 =""
document.link6 =""
document.link7 =""
document.link8 =""
document.link9 =""
document.link10 =""
}
</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="init()" >
<% getInfo("load_file","/web/includes/_body.htm") %>
<form name="tF0" action=/goform/formSetLanguage method=post>
	<input type="hidden" name="page" value="index">
	<input type="hidden" name="logout" value="2">
	<input type="hidden" name="langtype" />
	<input type="hidden" name="webpage" value=index.asp>

	<div class="row">
		<div class="four columns hide-on-phones nav-links">
			<!-- The NAV bar for desktop -->
		<script language="JavaScript">
			var login='<% getInfo("isLogin"); %>';

			if (login==0)
				helpItem='indexa';
			//showHead(wanStatus,helpItem,isRouter,isPS);
			showMenu(menuSection,menuItem,isRouter,isPS,isAPmode);
		</script>
		</div>
		<div class="forcebfc" id="status">
			<!-- h2 style for page title at top of content area -->
			<h2><script>dw(i2);</script></h2>
			<div class="row">
				<div class="six columns">
					<table class="minimal">
						<thead>
							<th colspan="2" tid="gtRouterInfo"><script>dw(i3);</script></th>
						</thead>
						<tr>
							<td><strong tid="gtName"><script>dw(i6);</script></strong></td>
							<td><% getInfo("modelNum");%></td>
						</tr>
						<tr>
							<td><strong><script>dw(i4);</script></strong></td>
							<td><% getInfo("fwVersion");%> (<% getInfo("Belkin_fw_date");%>)</td><!-- Please follow version (date) format -->
						</tr>
						<tr>
							<td><strong><script>dw(i5_1);</script></strong></td>
							<td><% getInfo("bootVer");%></td>
						</tr>
						<tr>
							<td><strong><script>dw(i7);</script></strong></td>
							<td><%getInfo("SerialNumber");%></td>
						</tr>
					</table>
				</div>
				<div class="six columns">
					<table class="minimal">
						<thead>
							<th colspan="2" tid="gtWireless"><script>dw(i20);</script></th>
						</thead>
						<tr id="WPSEnable2G">
							<td><strong><script>dw(wps29);</script></strong></td>
							<td><script>dw(wps31);</script></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="six columns">
					<table class="minimal" id="2gstate1">
						<thead>
							<th colspan="2" tid="gtWireless"><script>dw(i30)</script></th>
						</thead>
						<tr>
							<td><strong tid="gtName"><script>dw(i2)</script></strong></td>
							<td><script>dw(wps21)</script></td>
						</tr>
					</table>
					<table class="minimal" id="2gstate2">
						<thead>
							<th colspan="2" tid="gtWireless"><script>dw(i30)</script></th>
						</thead>
						<tr id="2gconnect1" style="display:none">
							<td><strong tid="gtName"><script>dw(i2)</script></strong></td>
							<td><script type="text/javascript">dw(show6);</script></td>
</td>
						</tr>
						<tr id="2gconnect2" style="display:none">
							<td><strong tid="gtName"><script>dw(i2)</script></strong></td>
							<td><a class="more" href="wisp_24g.asp"><script type="text/javascript">dw(show7);</script></a></td>
						</tr>
						<tr>
							<td><strong tid="gtModel"><script>dw(i23);</script></strong></td>
							<td><% getInfo("stadrv_ssid1")%></td>
						</tr>
						<tr>
							<td><strong><script>dw(i34)</script></strong></td>
							<td>
							<script>
								var signal = 10 + <% getInfo("BS_get_rssi")%>;
								var connectstat=<%getInfo("BS_get_sta_info","","");%>
								if(signal == 0  || connect2g == 1)
									dw('<img src="images/icon-Wi-Fi_mobile-sm_1-4_white.png" height="37" width="26">')
								else if(signal >= 80)
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
						<tr>
							<td><strong tid="gtSerial"><script>dw(ld4);</script></strong></td>
							<td>
							<script>
								if (connect2g == 0)
									dw("<% getInfo("BS_get_IP")%>")
							</script>
							</td>
						</tr>
						<tr>
							<td><strong tid="gtModel"><script>dw(i32)</script></strong></td>
							<td><% getInfo("ssid1")%></td>
						</tr>
						<tr>
							<td><strong tid="gtModel"><script>dw(show18);</script></strong></td>
							<td><script>dw(str_24g_sec)</script></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- These are the nav links on phones in the STATUS PAGE ONLY.  On other pages, this should be removed. -->
	<div class="row">
		<div class="twelve columns show-on-phones nav-links">
			<ul class="router-settings">
				<li>
					<a href="wisp_24g.asp" class="router-link router-link-caret" ><script>dw(wls4);</script></a>
					<!-- NOTE: Client should "remember" toggle state of these groups so that section is expanded or hidden as the user was the last time that he was on this page -->
					<a id="toggle-Ext" class="router-link" href="wireless_main.asp"><img src="images/btn-justCaret-green-up.png" class="DBCaret" id="caret-Ext"><span class="padded"><script>dw(wlm1);</script></span></a>
					<div id="settings-Ext">
						<a href="wireless_chan.asp" class="router-link lpad55 router-link-caret"><script>dw(wlm3);</script></a>
						<a href="wireless_encrypt.asp" class="router-link lpad55 router-link-caret"><script>dw(wlm5);</script></a>
						<a href="wireless_wps.asp" class="router-link lpad55 router-link-caret"><script>dw(wlm7);</script></a>
					</div>
					<a id="toggle-Utils" class="router-link" href="util_main.asp"><img src="images/btn-justCaret-green-up.png" class="DBCaret" id="caret-Utils"><span class="padded"><script>dw(um1);</script></span></a>
					<div id="settings-Utils">
						<a href="util_firmware.asp" class="router-link lpad55 router-link-caret"><script>dw(um7);</script></a>
						<a href="util_system.asp" class="router-link lpad55 router-link-caret"><script>dw(um9);</script></a>
						<a href="util_reset.asp" class="router-link lpad55 router-link-caret"><script>dw(um3);</script></a>
						<a href="util_factory.asp" class="router-link lpad55 router-link-caret"><script>dw(um5);</script></a>
						<a href="util_log.asp" class="router-link lpad55 router-link-caret"><script>dw(um11);</script></a>
					</div>
				</li>
			</ul>
		</div>
	</div>

<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/jQueryRotateCompressed.2.2.js"></script>
<script>
	var slideDur = 600;
	
	// Initial state
	$('[id|="caret"]').rotate(180);
	$('[id|="settings"]').hide();
	
	$('[id|="toggle"]').click(function(e) {
		e.preventDefault();
		
		// strip off the extra
		var id = $(this).attr('id');
		id = id.replace(/toggle-/g, "");
		//alert(id);
		if ($("#settings-" + id).is(":hidden")) {
			$("#caret-" + id).rotate({animateTo:0, duration:slideDur});
			$("#settings-" + id).slideDown(slideDur);
		} else {
			$("#caret-" + id).rotate({animateTo:180, duration:slideDur});
			$("#settings-" + id).slideUp(slideDur);
		}
	});
	
	
</script>
<script language="JavaScript">
	document.getElementById("2gstate1").style.display = "none"
	document.getElementById("2gstate2").style.display = "none"

	var ap_mode = '<% getVar("apMode","","");%>';

	if (ap_mode == 6){
        	document.getElementById("2gstate2").style.display = ""
	        document.getElementById("2gconnect1").style.display = "none"
        	document.getElementById("2gconnect2").style.display = "none"
	        var connectstat=<%getInfo("BS_get_sta_info","","");%>
        	//if ((connectstat == 1) && (IP2g != "0") && (connect2g != "1"))
	        if (connect2g != "1")
        	        document.getElementById("2gconnect1").style.display = ""
	        else
        	        document.getElementById("2gconnect2").style.display = ""
	}
	else {
        	document.getElementById("2gstate1").style.display = ""
	}

	var wpsEnable=<%getVar("wpsEnable","","");%>
	if (wpsEnable == 1)
        	document.getElementById("WPSEnable2G").style.display = ""
	else
		document.getElementById("WPSEnable2G").style.display = "none"
</script>

</form>
<% getInfo("load_file","/web/includes/_footer_FWGUI.htm") %>

