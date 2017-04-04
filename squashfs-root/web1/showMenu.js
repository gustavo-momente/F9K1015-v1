var Now_is=new Date().getTime();
function showsetupHead()
{
var strHtml;
strHtml = '<table border="0" cellspacing="0" cellpadding="0" align="center" width="100%" height="100%">'+
'<tr>'+
'<td colspan=3 bordercolor="#FFFFFF">'+
'<table width=100% border="0" cellspacing="0" cellpadding="0" bgcolor="#d6d6d6">'+
'<tr>'+
'<td valign="bottom" width=238>'+
'<a href="http://www.belkin.com"><img src="graphics/headlogo.gif" border="0" width="180" height="70">                                 </a>'+
'</td>'+
'<td nowrap align=left class=app_name width=460>'+show46+'</td>'+
'</td>'+
'<td></td>'+
'</tr>'+
'</table>'+
'</td>'+
'</tr>';
document.write(strHtml);
}
function showHead(wanStatus,helpItem,isRouter,isPS)
{
var strHtml;
strHtml = '<table border="0" cellspacing="0" cellpadding="0" align="center" width="100%" height="100%">'+
'<tr>'+
'<td colspan=3 bordercolor="#FFFFFF">'+
'<table width=100% border="0" cellspacing="0" cellpadding="0" bgcolor="#d6d6d6">'+
'<tr id="header">'+
'<td width="238">'+
'&nbsp;&nbsp;<a href="http://www.belkin.com" target="_top"><img src="graphics/belkin_wordmark.png" border="0" width="147" height="42"></a>'+
'</td>'+
'<td class=app_name>'+rp_setup+'</td>';
document.write(strHtml);
strHtml =					'</td>'+
'</tr>'+
'</table>'+
'</td>'+
'</tr>';
document.write(strHtml);
}
function showMenu(menuSection,menuItem,isRouter,isPS,isAPmode)
{
	var no_class	='';
	var current	='current';
	var sub_current	='subnav current';
	var subnav	='subnav';

// WLAN Section
	if(isAPmode == "0")
	{
		if(menuSection=='Status')
			printMenuSection('index.asp', i2, current);
		else
			printMenuSection('index.asp', i2, no_class);
		if(menuSection=='WISP_24G')
			printMenuSection('wisp_24g.asp', wls4, current);
		else
			printMenuSection('wisp_24g.asp', wls4, no_class);

		if(menuSection=='WLAN')
		{
			printMenuSection('wireless_main.asp', wlm1, current);
			if(menuItem=='Channel and SSID')
				printMenuItem('wireless_chan.asp', wlm3, sub_current);
			else
				printMenuItem('wireless_chan.asp', wlm3, subnav);
			if(menuItem=='Security')
				printMenuItem('wireless_encrypt.asp', wlm5, sub_current);
			else
				printMenuItem('wireless_encrypt.asp', wlm5, subnav);
			if(menuItem=='Wireless WPS')
				printMenuItem('wireless_wps.asp', wlm7, sub_current);
			else
				printMenuItem('wireless_wps.asp', wlm7, subnav);
		}
		else
		{
			printMenuSection('wireless_main.asp', wlm1, no_class);
			printMenuItem('wireless_chan.asp', wlm3, subnav);
			printMenuItem('wireless_encrypt.asp', wlm5, subnav);
			printMenuItem('wireless_wps.asp', wlm7, subnav);
		}
		if(menuSection=='Util')
		{
			printMenuSection('util_main.asp', um1, current);
			if(menuItem=='Restart Router')
				printMenuItem('util_reset.asp', um3, sub_current);
			else
				printMenuItem('util_reset.asp', um3, subnav);
			if(menuItem=='Restore Factory Default')
				printMenuItem('util_factory.asp', um5, sub_current);
			else
				printMenuItem('util_factory.asp', um5, subnav);
			if(menuItem=='Firmware Update')
				printMenuItem('util_firmware.asp', um7, sub_current);
			else
				printMenuItem('util_firmware.asp', um7, subnav);
			if(menuItem=='System Settings')
				printMenuItem('util_system.asp', um9, sub_current);
			else
				printMenuItem('util_system.asp', um9, subnav);
			if (menuItem == 'Log')
				printMenuItem('util_log.asp', um11, sub_current);
			else
				printMenuItem('util_log.asp', um11, subnav);
		}
		else
		{
			printMenuSection('util_main.asp', um1, no_class);
			printMenuItem('util_reset.asp', um3, subnav);
			printMenuItem('util_factory.asp', um5, subnav);
			printMenuItem('util_firmware.asp', um7, subnav);
			printMenuItem('util_system.asp', um9,  subnav);
			printMenuItem('util_log.asp', um11, subnav);
		}
	}
	else
	{
		if(menuSection=='Status')
			printMenuSection('index.asp', i2, current);
		else
			printMenuSection('index.asp', i2, no_class);
		if(menuItem=='Restart Router')
			printMenuSection('util_reset.asp', um3, current);
		else
			printMenuSection('util_reset.asp', um3, no_class);
		if(menuItem=='Restore Factory Default')
			printMenuSection('util_factory.asp', um5, current);
		else
			printMenuSection('util_factory.asp', um5, no_class);
		if(menuItem=='Firmware Update')
			printMenuSection('util_firmware.asp', um7, current);
		else
			printMenuSection('util_firmware.asp', um7, no_class);
		if (menuItem == 'Log')
			printMenuSection('util_log.asp', um11, current);
		else
			printMenuSection('util_log.asp', um11, no_class);
	}
// router or ap mode
// Utilities Section

}
function showTail()
{
var strHtml;
strHtml = '</tr>'+
'</table>'+
'</body>'+
'</html>';
document.write(strHtml);
}
function printMenuSection(link, content, color)
{
	var strHtml;

	strHtml='<div><a class="'+ color +'" href="'+ link +'">'+ content + '</a></div>'
	document.write(strHtml);
}
function printMenuItem(link, content, color)
{
	var strHtml;

	strHtml='<div><a class="'+ color +'" href="' + link +'?t='+new Date().getTime()+'">'+ content +'</a></div>'
	document.write(strHtml);
}
