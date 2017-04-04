<% getInfo("load_file","/web/includes/_header.htm") %>
<META http-equiv="Content-Type" content="text/html; charset=<%getInfo("charset");%>" >
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<!--<link rel="stylesheet" type="text/css" href="BelkinSetup.css" media="screen" />-->
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
</head>
<body>
<% getInfo("load_file","/web/includes/_body.htm") %>
<form name="tF" method="post" action="apply.cgi">
	<div id="main">
		<div class="row">
			<div class="twelve columns">
				<h1 class="warning-icon">
				<script>
					var SiteSurveyResult = '<% getInfo("BS_get_sitesurvey_result"); %>'
					var ResultArray = SiteSurveyResult.split(' ');
					var repeaterSSID = ResultArray[1].replace(/nbsp/g," ");
					var strSSID = repeaterSSID;
					document.write(setting_13.replace(/<SSID>/,CharFilterForHtml(strSSID)));
				</script>
				</h1>
				<p><script>dw(setting_14)</script></p>
				<a target="_blank" class="support" href="http://www.belkin.com/support">http://www.belkin.com/support</a>
			</div>
		</div>
	</div>
</form>
<% getInfo("load_file","/web/includes/_footer.htm") %>
