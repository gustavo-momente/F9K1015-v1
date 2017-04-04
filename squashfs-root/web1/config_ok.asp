<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<link rel="stylesheet" type="text/css" href="<%getInfo("style");%>" media="all" />
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script language="JavaScript" src="showMenu.js"></script>
<script type="text/javascript">
strHtml='<title>'+ss1+'</title>';
dw(strHtml);
<!--
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
var i = 25;
//setTimeout('document.location.href="index.html";',50000);
function countDown()
{
i--;
document.tF.timeRemain.value=i;
if (i<1) {
clearInterval(timeoutId);
document.location.href="index.html";
}
}
function timecheck()
{
document.forms[0].timeRemain.value = "" + i;
timeoutId = setInterval(countDown,2000);
}
function submitF()
{
return true;
}
function logoutF()
{
document.config_form.logout.value=1;
document.config_form.submit();
return true;
}
function ok_return()
{
window.location.href='<%getInfo("last_url");%>?t='+new Date().getTime();
}
//-->
</script>
</head>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<% getInfo("load_file","/web/includes/_body.htm") %>	
<FORM id=config_form name=config_form action="formConfigOK" method=post>
	<INPUT type=hidden value=setup_ok name=page> <INPUT type=hidden value=2 name=logout>
	<div class="row">
		<div class="twelve columns">
			<div class="textcenter" >
				<script type="text/javascript">dw(<%getInfo("ok_msg")%>);</script><br><br><br>
				<TABLE class=minimal_1 border=0>
					<TR>
						<TD width=339>
							<script type="text/javascript">
								strHtml='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<input type="button" value="'+btn3+'" style="{width:140px;}" class="submitBtn" onClick="return ok_return()">';
								dw(strHtml);
							</script>
						</TD>
					</TR>
				</TABLE>
			</div>
		</div>
	</div>
</FORM>
<% getInfo("load_file","/web/includes/_footer.htm") %>
