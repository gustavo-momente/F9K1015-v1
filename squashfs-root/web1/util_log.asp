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
<!--
var helpItem 	='Log';
var menuSection	='Util';
var menuItem	='Log';
var isPS		='0';
var wanStatus= '';
var isRouter;
var isAPmode;
if(('<% getVar("apMode","","");%>' =='0'))
{	
isAPmode='1';
isRouter='0';
}
else
{
isAPmode='0';
isRouter='1';
}
function logoutF()
{
document.syslog_form.logout.value=1;
document.syslog_form.submit();
return true;
}
function refreshLog()
{
document.location.replace("util_log.asp");
}

//-->
</script>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<% getInfo("load_file","/web/includes/_body.htm") %>
<form method="post" action="goform/formSysLog"  name="sysLog">
	<INPUT type=hidden value=2 name=logout>
	<input type="hidden" value="/util_log.asp" name="submit-url">

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
			<h2><script type="text/javascript">dw(ur6);</script></h2>
			<TABLE class="minimal_1" cellSpacing=3 cellPadding=0 width=580 align=left border=0>
				<TBODY>
					<TR>
						<TD class="body">
						<script type="text/javascript">dw(ur7);</script>:<%getInfo("uptime"); %><BR><BR>
						</TD>
					</TR>
					<TR>
						<TD>
							<TEXTAREA cols="80" name="logtext" readOnly rows="15" wrap="off" edit="off" style="background-color:#e1e1e1;width=100%" class="width_full"><% getInfo("syslog"); %></TEXTAREA>
						</TD>
					</TR>
					<TR>
						<TD align=right><BR>
						<script type="text/javascript">dw('<input type="submit" name="send" style="{width:150px;}" value="');dw(ur8);dw('">');</script>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</div>
	</div>
</form>
<% getInfo("load_file","/web/includes/_footer_FWGUI.htm") %>
