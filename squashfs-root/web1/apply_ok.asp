<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<link rel="stylesheet" type="text/css" href="<%getInfo("style");%>" media="all" />
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script language="JavaScript" src="showMenu.js"></script>
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script type="text/javascript">
strHtml='<title>'+<%getInfo("ok_msg")%>+'</title>';
dw(strHtml);
var helpItem 	='save setting';
var menuSection	='';
var menuItem	='save setting';
var isPS		='0';
var wanStatus= '';
var isRouter;
var isAPmode;
if(('<% getVar("apMode","","");%>' =='0'))
{	isAPmode='1';
isRouter='0';
}
else
{
isAPmode='0';
isRouter='1';
}
var timeoutId;
var i = 60 ;
var CurrentTime=new Date().getTime();
function countDown()
{
i--;
document.tF.timeRemain.value=i;
if (i<1) {
clearInterval(timeoutId);
window.location.assign("/<%getInfo("reboot_msg");%>")
}
}
function timecheck()
{
document.forms[0].timeRemain.value = "" + i;
timeoutId = setInterval("countDown()",1000);
}
function logoutF()
{
document.tF.logout.value=1;
document.tF.submit();
return true;
}
</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" marginheight="0" onload="timecheck()">
<% getInfo("load_file","/web/includes/_body.htm") %>	


	<div class="row">
		<div class="twelve columns">
			<div class="textcenter" >
				<form name="tF" action="reset_ok.cgi" method="post">
				<input type="hidden" name="page" value="">
				<input type="hidden" name="logout" value="">
<!--
<script type="text/javascript">dw(<%getInfo("ok_msg")%>);</script><br><br>
-->
				<table border=0 class="minimal_1">
					<tr>
						<td>
						<table width="485" border="0" cellspacing="5" cellpadding="0" align="center" class="minimal_1">
							<tr>
								<td height="41" valign="center" align="center" class="body" colspan="2">
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
