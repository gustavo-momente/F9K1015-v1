<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<link rel="stylesheet" type="text/css" href="<%getInfo("style");%>" media="all" />
<META http-equiv=Pragma content=no-cache>
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<SCRIPT language=JavaScript src="showMenu.js"></script>
<script type="text/javascript" src="BelkinSetupConfig.js"></script>
<script type="text/javascript">
var now_lang="<%getInfo("lang");%>";

strHtml='<title></title>';
dw(strHtml);
var helpItem 	='Channel and SSID';
var menuSection	='WLAN';
var menuItem	='Channel and SSID';
var isPS		='0';
var wanStatus= '';
var isRouter;
var isAPmode;
if(('<% getVar("apMode","","");%>' =='0')) {
isAPmode='1';
isRouter='0';
}
else {
isAPmode='0';
isRouter='1';
}
function init()
{
	document.getElementById("2gset1").style.display = "none"
	document.getElementById("2gset2").style.display = "none"
	var ap_mode = '<% getVar("apMode","","");%>';
	if (ap_mode == 0)
		document.getElementById("2gset1").style.display = "block"
	else
		document.getElementById("2gset2").style.display = "block"
	var f = document.tF
	if (<%getVar("hiddenSSID","","");%> == 0)
		f.hiddenssid.checked = true
	else
		f.hiddenssid.checked = false

	f.wl0_gmode_protection.selectedIndex = <%getVar("disProtection","","");%>
	f.wl0_qos.selectedIndex = <%getVar("wlanWmm","","");%>
	f.ssid.value = '<%getInfo("ssid");%>'
}
function isBlank(s)
{
for(var i = 0; i < s.length; i++) {
var c = s.charAt(i);
if((c !=' ') && (c!='\n') && (c !='\t')) return false;
}
return true;
}
function submitF() {
	var f=document.tF
	if (isBlank(f.ssid.value)) {
		alert(msg_wls_chan1)
		return false
	}
	if(f.hiddenssid.checked==true)
		f.wl0_hiddenssid.value=0
	else
		f.wl0_hiddenssid.value=1

	f.wl0_ssid.value=f.ssid.value

	return true
}
function logoutF()
{
document.tF.logout.value=1
document.tF.submit()
return true
}
</script>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 onload=init(); marginheight="0" marginwidth="0" reload="init()">
<% getInfo("load_file","/web/includes/_body.htm") %>
<FORM name=tF action=/goform/formWlanSetup method=post>
	<INPUT type=hidden value=wireless_chan.asp name=webpage>
	<input type="hidden" name="band" />
	<input type="hidden" name="chan" />
	<INPUT type=hidden value=0 name=wl0_ssid>
	<input type="hidden" name="wl0_hiddenssid"  />
	<INPUT type=hidden name=wl0_clear_configure_by_extreg>
	<input type="hidden" name="wlanDisabled" />
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
			<h2><script type="text/javascript">dw(wlc1);</script></h2>
			<div class="twelve columns">
				<table class="minimal_1" border=0><!--table 2-->
					<tr>
						<td class="copy_2">&nbsp;</td>
						<td class="copy_2" width="300" colspan=2><b><script type="text/javascript">dw(wlc4);</script></b></td>
					</tr>
					<tr>
						<td >
							<table width="100%" class="minimal_1" cellSpacing=0 cellPadding=0 align=left border=0>
								<tr height=30>
									<td><B>
										<script type="text/javascript">dw(wlc6);</script><br>
									</B></td>
								</tr>
								<tr height=30 style="display:none">
									<td> <B>
										<script type="text/javascript">dw(wlc7);</script><br>
									</B></td>
								</tr>
								<tr height=30>
									<td ><B>
										<script type="text/javascript">dw(wlc8);</script><br>
									</B></td>
								</tr>
								<tr height=30>
									<td ><B>
										<script type="text/javascript">dw(wlc9);</script><br>
									</B></td>
								</tr>
								<tr height=30>
									<td ><B>
										<script type="text/javascript">dw(wlc10);</script><br>
									</B></td>
								</tr>
								<tr height=30>
									<td ><B>
										<script type="text/javascript">dw(wlc11);</script><br>
									</B></td>
								</tr>
								<tr height=30>
									<td ><B>
										<script type="text/javascript">dw(wlc12);</script><br>
									</B></td>
								</tr>
								<tr height=30>
									<td ><B>
										<script type="text/javascript">dw(wlc13);</script>
									</B></td>
								</tr>
							</table>
						</td>
						<td valign=top>
							<span id="2gset1" style="display:none">
								<table width="100%" class=minimal_1 align=left border=0>
									<tr>
										<td class="body" >
											<script type="text/javascript">
												dw(wlc3.replace('<a>','<a href="util_factory.asp">'))
											</script><br>
										</td>
									</tr>
								</table>
							</span>
							<span id="2gset2" style="display:block">
								<table width="100%" class=minimal_1 cellSpacing=5 cellPadding=0 align=left border=0>
									<tr height=30>
										<td class="body" ><B>
											<% getInfo("channel_2g");%>
										</B></td>
									</tr>
									<tr height=30>
										<td class="body"><B>
											<input type="text" name="ssid" size="24" maxlength="32">
										</B></td>
									</tr>
									<tr height=30>
										<td class="body"><B>
											<script type="text/javascript">
												var band=<%getVar("band","","");%>
												var bandary = new Array("b","n","b,g","g","b,g,n");
												document.write(bandary[band-1]);
											</script>
										</B></td>
									</tr>
									<tr height=30>
										<td class="body"><B>
											<script type="text/javascript">
												//var bandwidth=<%getVar("NChanWidth","","");%>
												var bandwidth=<% getInfo("BandWidth_2g");%>
												var bandwidthary = new Array("20 MHz","20/40 MHz");
												if (bandwidth == 0)
													document.write(bandwidthary[0]);
												else	
													document.write(bandwidthary[1]);
											</script>
										</B></td>
									</tr>
									<tr height=30>
										<td class="body"><B>
											<input type="checkbox" name="hiddenssid" onclick="if (!this.checked) alert('If turn off Broadcasting, WPS 2.0 will be disabled')" />
										</B></td>
									</tr>
									<tr height=30>
										<td class="body"><B>
											<select name="wl0_gmode_protection">
											<script type="text/javascript">
											dw('<option value="0">'+On+'</option>')
											dw('<option value="1">'+Off+'</option>')
											</script>
											</select>
										</B></td>
									</tr>
									<tr height=30>
										<td class="body"><B>
											<select name="wl0_qos">
											<script type="text/javascript">
											dw('<option value="0">'+Off+'</option>')
											dw('<option value="1">'+On+'</option>')
											</script>
											</select>
										</B></td>
									</tr>
								</table>
							</span>
						</td>
					</tr>
					<tr>
						<td align=middle colSpan=3>
							<br>
							<script type="text/javascript">
								dw('<input type="button" value="');dw(btn1);
								dw('" style="{width:160px;}" class="submitBtn" onMouseOver="window.status=\'Clear\'; return true;" onMouseOut="window.status=\'\'; return true;" onClick="location.href=\'wireless_chan.asp'+'?t='+new Date().getTime()+'\'; return true;">&nbsp;&nbsp;');
								dw('<input type="submit" style="{width:160px;}" value="');dw(btn2);dw('" onClick="return submitF();" class="submitBtn">');
							</script>
						</td>
					</tr>
				</table><!--table 2-->
			</div><!--twelve columns-->
		</div><!--forcebfc-->
	</div><!--row-->
</FORM>
<% getInfo("load_file","/web/includes/_footer_FWGUI.htm") %>
