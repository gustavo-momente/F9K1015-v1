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
var helpItem 	='Restart Router';
var menuSection	='Util';
var menuItem	='Restart Router';
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
function doConfirm(){
if(confirm(ur4)) {
alert(ur5);
document.reboot_form.action.value='Reboot';
document.reboot_form.submit();
return true;
}
return false;
}
function logoutF()
{
document.RebootForm.logout.value=1;
document.RebootForm.submit();
return true;
}
//-->
</script>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<% getInfo("load_file","/web/includes/_body.htm") %>
	<FORM name=reboot_form action=/goform/formReboot method=post>
	<INPUT type=hidden value=util_reset.asp name=webpage>
	<INPUT type=hidden name=action> <INPUT type=hidden value=system_reset name=page>
	<INPUT type=hidden value=2 name=logout>
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
			<h2><script type="text/javascript">dw(ur1);</script></h2>
			<TABLE class="minimal_1" cellSpacing=3 cellPadding=0 width=580 align=left border=0>
				<TBODY>
					<TR>
						<TD class="body">
							<script type="text/javascript">dw(ur2);</script>
					<BR><BR><BR></TD></TR>
					<TR>
						<TD align=middle>
							<script type="text/javascript">dw('<input type="submit" style="{width:150px;}" class="submitBtn" onClick="return doConfirm()" value="');dw(ur3);dw('">');</script>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</div>
	</div>
</FORM>
<% getInfo("load_file","/web/includes/_footer_FWGUI.htm") %>
