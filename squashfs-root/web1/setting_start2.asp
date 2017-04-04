<% getInfo("load_file","/web/includes/_header.htm") %>
<script type="text/javascript" src="jq/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script type="text/javascript" src="BelkinSetupConfig.js"></script>
<script type="text/javascript">
var ts = new Date().getTime();
var cleantmpfile = '<% getInfo("BS_clean_tmpfiles"); %>'
</script>
</head>
<body>
<% getInfo("load_file","/web/includes/_body.htm") %>	
	<div class="row">
		<div class="twelve columns">
			<div class="textcenter" ><img id="productPhoto" src="images/WRX-N300-DB_range-extender.png"/></div>
		</div>
	</div>

	<div id="actions">
		<div class="row lang_pad">
			<div class="twelve columns">
				<div class="inline-block right-on-phones">
					<script>
						var language_mask=4095;
						dw('<p class="hide-on-phones">'+setting_5+':</p>');
						show_mlang1(language_mask,"setting_start2.asp","<%getInfo("lang");%>");
					</script>
				</div>
					
				<div class="clear show-on-phones"></div>
				<a class="medium button nice green radius right-on-desktops" href="setting_checkconnect.asp"><script>dw(setting_6)</script></a>
			</div>
		</div>
	</div>
<% getInfo("load_file","/web/includes/_footer.htm") %>
