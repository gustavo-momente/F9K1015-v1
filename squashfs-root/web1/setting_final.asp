<% getInfo("load_file","/web/includes/_header.htm") %>
<META http-equiv="Content-Type" content="text/html; charset=<%getInfo("charset");%>" >
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<!--<link rel="stylesheet" type="text/css" href="BelkinSetup.css" media="screen" />-->
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script language="JavaScript">
var lang="<%getInfo("lang");%>";
var wl0_ssid =' ';
var wl01_ssid =' ';
var wl1_ssid =' ';
var wl11_ssid =' ';
var _24g_passwd;
var _24g_secType;
var _24g_connected;
var SiteSurveyResult = '<% getInfo("BS_get_sitesurvey_ok_info"); %>'
var ResultArray = SiteSurveyResult.split(' ');

_24g_secType1 = '<%getVar("encrypt","","");%>'

if(_24g_secType1 == '1')//wep
{
	_24g_secType = "WEP";
	var wepValueAll = <%getInfo("wepValueAll");%>
	if (<%getVar("wep","","");%> == 1) //64
		_24g_passwd = wepValueAll[0];
	else if (<%getVar("wep","","");%> == 2) //128
		_24g_passwd = wepValueAll[4];
}
else if(_24g_secType1 == '2'){
	_24g_secType = "WPA/WPA2";
	_24g_passwd = "<%getInfo("pskValue");%>"
}
else{
	_24g_secType = "Open";
	_24g_passwd = "None";
}

if(_24g_passwd == '0')
	_24g_passwd = "None";
if(SiteSurveyResult != '0')
	_24g_connected = '1';
function evaltF() {
	//document.tF.submit()
	window.top.opener=null
	window.top.open('','_self')
	window.top.close()
}

function getSecurity(num)
{
	if(num == "001" || num == "010" || num == "002" || num == "020" )
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
	}
}
</script>
</head>
<body>
<% getInfo("load_file","/web/includes/_body.htm") %>
<form name ="tF" method="post" action="/goform/formBSSetSitesurvey" >
	<div id="main">
		<div class="row">
			<div class="twelve columns">
				<h1 class="success-icon"><script>dw(setting_8);</script></h1>
				<p><script>dw(setting_9);</script></p>
				
				<script>
					// Load the serviceCard stylesheet
					var newStyle = document.createElement("link");
					newStyle.rel = "stylesheet";
					newStyle.href = "css/serviceCard.css";
					document.getElementsByTagName("head")[0].appendChild(newStyle);
				</script>
				<div class="row">
					<div class="six columns offset-by-three">
						<div class="servCardInfo">
							<div class="freq-label inline-block tcenter roundTop2">
								<b><span tid="gt24ghz">2.4 GHz</span></b>
							</div>
							<div class="pad-w-img wifi roundUR" tid="gt5SSID">
							<script>
								var myssid = '<% getInfo("ssid"); %>';
								dw(CharFilterForHtml(myssid));
							</script>
							</div>
							<div class="pad-w-img pass" tid="gt5PSK">
								<script>dw(_24g_passwd.replace(/nbsp/g," "));</script>
							</div>
							<div class="pad-w-img roundBL roundBR" tid="gt5Sec">
								<script>dw(_24g_secType);</script>
							</div>
						</div>
					</div>
				</div>
				
				<div id="completed-links">
					<a class="support right hide-on-phones clearfix" href="javascript:window.print()"><script type="text/javascript">dw(set29)</script></a>
					<a class="small button nice green radius clearfix show-on-phones " href="javascript:window.print()"><script type="text/javascript">dw(set29)</script></a>
					<div class="clear"></div>
					<a class="medium button nice green radius right hide-on-phones" href="javascript:evaltF();"><script>dw(Close);</script></a>
					<div class="clear"></div>
				</div>
				
				<p><script>dw(setting_10);</script></p>
				
			</div>
		</div>
	</div>
</form>
<% getInfo("load_file","/web/includes/_footer.htm") %>
