<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<link rel="stylesheet" type="text/css" href="<%getInfo("style");%>" media="all" />
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script language="JavaScript" src="showMenu.js"></script>
<script type="text/javascript">
strHtml='<title>'+ss2+'</title>';
dw(strHtml);
var helpItem ='save setting';
var menuSection	='';
var menuItem ='save setting';
var isPS ='0';
var wanStatus= '';
var time=60
var CurrentTime=new Date().getTime();
var timeoutId;
var i = time;
function countDown()
{
i--;
document.tF.timeRemain.value=i;
if (i<1) {
clearInterval(timeoutId);
if ('<%getInfo("ok_msg")%>' == 'util_factory.asp')
window.top.location.assign("http://192.168.206.1")
else
window.top.location.assign("http://belkin.range")
}
}
function timecheck()
{
document.forms[0].timeRemain.value = "" + i;
timeoutId = setInterval("countDown()", 1000);
}
</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" marginheight="0" onload="timecheck()">
<% getInfo("load_file","/web/includes/_body.htm") %>	
<form name="tF" action=/goform/formRestOK method="post">
<input type="hidden" name="page" value="">
<input type="hidden" name="logout" value="">
	<div class="row">
		<div class="twelve columns">
			<div class="textcenter" >
				<table border=0 class="minimal_1">
					<tr>
						<td>
						<table width="485" border="0" cellspacing="5" cellpadding="0" align="center" class="minimal_1">
							<tr>
								<td height="41" class="body" colspan="2" valign="center" align="center">
									<font color=red>
									<script type="text/javascript">dw(apply_msg1);</script>
									<br><br>
									<INPUT type=text size=2 DISABLED name=timeRemain value="">
									<script type="text/javascript">dw(rs4);</script>
									</font>
								</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</form>
<% getInfo("load_file","/web/includes/_footer.htm") %>
