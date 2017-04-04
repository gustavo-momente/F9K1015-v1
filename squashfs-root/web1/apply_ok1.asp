<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<link rel="stylesheet" type="text/css" href="<%getInfo("style");%>" media="all" />
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script language="JavaScript" src="showMenu.js"></script>
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
var i = 60;
var CurrentTime=new Date().getTime();
function logoutF()
{
document.tF.logout.value=1;
document.tF.submit();
return true;
}
var RestartTimeout=120000;
var timeoutId;
var my_time = RestartTimeout/ 1000;
var width = 0;
function countDown(){
	document.getElementById('left').bgColor='#3C89C8';
	document.getElementById('left').style.width = ( (RestartTimeout/1000 - my_time) / (RestartTimeout/1000) ) * 100 + '%'
	document.getElementById('right').style.width = ( my_time / (RestartTimeout/1000) ) * 100 + '%'

	my_time--;
	if (my_time < 1)
	{
		clearInterval(timeoutId);
		window.location.assign("/<%getInfo("reboot_msg");%>")
	}
}
function timecheck()
{
	timeoutId = setInterval(countDown,1000);
}
</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="timecheck()">
<% getInfo("load_file","/web/includes/_body.htm") %>	
<form name="tF" action="reset_ok.cgi" method="post">
<input type="hidden" name="page" value="">
<input type="hidden" name="logout" value="">
	<div class="row">
		<div class="twelve columns">
			<div class="textcenter" >
				<table border=0 class="minimal_1">
					<tr>
						<td>
							<TABLE border=0 align="center" class="minimal_1" width=360>
								<tr>
									<td valign="center" align="center" colspan='2'>
										<font color='#000000'><b>
											<script type="text/javascript">dw(wls3);</script><br>
										</b></font>
									</td>
								</tr>
								<tr valign="center" align="center" height=25>
									<TD bgcolor=#FFFFFF id=left bordercolor='#999999' style='border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1; border-left-style: solid; border-left-width: 1; border-right-width:0;' width='0%'>
									</TD>
									<TD bgcolor=#FFFFFF id=right bordercolor='#999999' style='border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1; border-right-style: solid; border-right-width: 1; border-left-width:0;' width='100%'>
									</TD>
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
