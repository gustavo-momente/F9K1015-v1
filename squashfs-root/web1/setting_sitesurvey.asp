<% getInfo("load_file","/web/includes/_header.htm") %>
<META http-equiv="Content-Type" content="text/html; charset=<%getInfo("charset");%>" >
<!--<link rel="stylesheet" type="text/css" href="BelkinSetup.css" media="screen" />-->
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script src="jq/jquery.js" type="text/javascript"></script>
<!--<script src="jq/jquery.dd.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="dd.css" />-->
<title>Belkin WRX Setting </title>
<script language="JavaScript">
var ts = new Date().getTime();
var aplist = new Array();
var ap_data = [
<% wlSiteSurveySetupPage() %>
];
var  stop;
function gopage(p) { location.href = p; }
function func(){
//alert("inside");
$.get("testalive.html",{NoCache:ts},function(data){
//alert("Seccusss!!!"+data);
window.clearInterval(stop);
//$("#dialog-modal").dialog("close");
if(aplist[selIndex].sec=='000')
window.location = "setting_checkconnect.asp";
else
window.location = "setting_password.asp";
});
}
function isiPhonePad(){
return (
(navigator.platform.indexOf("iPhone") != -1) ||
(navigator.platform.indexOf("iPad") != -1)
);
}
$(function() {//just in case
$("#next").click(function(){ //按下去就開始disable頁面
//alert("opener clicked");
stop = self.setInterval("func()",3000);
});
});
//
function init()
{
}
function apObj(id, band, sec, sig, bssid, channel, bandwidth, bandtype) //把抓近來的東西設定成內部使用參數
{
this.ssid = id;
this.band = band;
this.sec = sec;
this.sig = sig;
this.bssid = bssid;
this.channel = channel;
this.bandwidth = bandwidth;
this.bandtype = bandtype;
}



for(i=0; i<ap_data.length; i++)
	aplist[i] = new apObj(ap_data[i][0], ap_data[i][1], ap_data[i][2], ap_data[i][3], ap_data[i][4], ap_data[i][5], ap_data[i][6], ap_data[i][7]);

function sortrule(a,b)
{
//return (a.sig<b.sig) ? 1 : ((a.sig == b.sig ) ? 0 : -1);
return b.sig - a.sig;
}
aplist.sort(sortrule);

function showSec(s)
{
var output = "";
var wep = parseInt(s.charAt(0));
var wpa = parseInt(s.charAt(1));
var wpa2 = parseInt(s.charAt(2));
//if(wpa) output = "WPA";
//if(wpa2) output += (((output.length>0)?"+":"")+"WPA2");
if(wpa || wpa2) output = "Secure";
if(output.length==0)
{
//if(wep) output="WEP";
//else output="OPEN";
if(wep) output="Secure";
else output="Open";
}
return output;
}
function showBand(b)
{
if(b==5) return "5 ghz";
return "2.4 ghz";
}
/* submit */
function evaltF()
{
var f = document.tF;
//Should indicate index.
if(selIndex==-1)
{
//Alert message to select AP.
return;
}
f.wl_unit.value = (aplist[selIndex].band==5)?5:2; //5g =1 2.4=0
f.wl_ssid.value = CharFilterForSH(aplist[selIndex].ssid);
f.wl_ssidforfile.value = CharFilterForfile(aplist[selIndex].ssid);	//for special
f.wl_rssi.value = aplist[selIndex].sig;
f.wl_channel.value = aplist[selIndex].channel;
f.wl_security.value = aplist[selIndex].sec;
f.wl_bandwidth.value = aplist[selIndex].bandwidth;
f.wl_bandtype.value = aplist[selIndex].bandtype;
f.wl_bssid.value = aplist[selIndex].bssid;
f.fromFlag.value = isiPhonePad();
f.submit();
//return true;
}
function reScanWL()
{
//var f = document.tF;
//f.action.value = "refresh" ;.
window.location = "setting_sitesurvey.asp";
//f.submit-url.value="setting_sitesurvey.asp" ;
//f.submit();
}
</script>
</head>
<body onLoad="init();">
<% getInfo("load_file","/web/includes/_body.htm") %>
<form name ="tF" method="post" action="/goform/formBSSetSitesurvey" >
<input type="hidden" name="submit-url" value="setting_password.asp">
<input type="hidden" name="submit-url-ok" value="setting_checkconnect.asp">
<input type="hidden" name="action" value="done">
<input type="hidden" name="wl_channel">
<input type="hidden" name="wl_ssid">
<input type="hidden" name="wl_unit">
<input type="hidden" name="skip_scan" value="1">
<input type="hidden" name="wl_rssi">
<input type="hidden" name="wl_security">
<input type="hidden" name="wl_bandwidth">
<input type="hidden" name="wl_bandtype">
<input type="hidden" name="wl_bssid">
<input type="hidden" name="wl_ssidforfile">
<input type="hidden" name="fromFlag">

<div id="main">
	<div class="row">
		<div class="twelve columns">
			<h1><script>dw(setting_3)</script></h1>
			<div class="controls">
				<div class="right"><a href="javascript:reScanWL();"><img src="images/icon-refresh.png"/></a></div>
				<div class="clear"></div>
				<div id="networklist">
<script language=javascript>
var selIndex = -1;
function selIdx(idx) { selIndex = idx; };
for(i=0; i<aplist.length; i++)
{
	if(i==0)
		dw('<div id="item'+(i+1)+'" class="networklistrow first" onclick="javascript: activateRow(this.id, '+aplist.length+'); selIdx('+i+'); evaltF();">');
	else
		dw('<div id="item'+(i+1)+'" class="networklistrow" onclick="javascript: activateRow(this.id, '+aplist.length+'); selIdx('+i+'); evaltF();">');
	dw('    <div class="lock'+(aplist[i].sec=='000'?'':' locked')+' right" alt="'+(aplist[i].sec=='000'?'un':'')+'locked"></div>');
	if(showSigPercent(aplist[i].sig)>=80){
		sig_word="bars four right inline-block";
		sig_number="4 bars";	
	}
	else if(showSigPercent(aplist[i].sig)<40){
		sig_word="bars one right";
		sig_number="1 bar";
	}
	else if(showSigPercent(aplist[i].sig)>60){
		sig_word="bars three right";
		sig_number="3 bars";
	}
	else{
		sig_word="bars two right";
		sig_number="2 bars";
	}
	dw('	<div class="'+sig_word+'" alt="'+sig_number+'"/></div>');
	dw('	<span class="name">'+CharFilterForHtml(aplist[i].ssid)+'</span>');
	dw('    <div class="clear"></div>')
	dw('</div>')
}
	dw('<div id="item'+i+'" class="networklistrow usehidden" onclick=javascript:gopage("setting_hidden.asp");>');
	dw('	<span class="name">'+setting_11+'</span>');
	dw('	<div class="clear"></div>');
	dw('</div>');
if(aplist.length)
{
	activateRow("item1", aplist.length);	//Activate 1st Row
	selIdx(0);
}
</script>
				</div><!-- networklist -->
			</div><!-- controls -->
		</div><!-- twelve columns --> 
	</div><!-- row -->
</div><!-- main -->
</form>
<% getInfo("load_file","/web/includes/_footer.htm") %>
