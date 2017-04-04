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
var helpItem 	='Restore Factory Default';
var menuSection	='Util';
var menuItem	='Restore Factory Default';
var wanStatus= '';
var isPS	='0';
var isRouter;
var isAPmode;
if(('<% getVar("apMode","","");%>' =='0')) {
isAPmode='1';
isRouter='0';
}
else {
isAPmode='0';
isRouter='1';
}
function doConfirm(){
	if(confirm(ufy8)) {
	//	alert(ufy9);
		document.reboot_form.submit();
		return true;
	} 
	else {
		alert(ufy10);
		return false;
	}
}
function logoutF()
{
document.RebootForm.logout.value=1;
document.RebootForm.submit();
return true;
}
</script>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<% getInfo("load_file","/web/includes/_body.htm") %>
<FORM name=reboot_form action=/goform/formSaveConfig method=post>
	<INPUT type=hidden value=util_factory.asp name=webpage>
	<INPUT type=hidden value=Restore name=action>
	<INPUT type=hidden value=system_restore name=page>
	<INPUT type=hidden value=2 name=logout>
	<input type="hidden" name="reset" value="1">

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
			<h2><script type="text/javascript">dw(ufy5);</script></h2>
			<div class="eleven columns">
				<TABLE class="minimal_1" cellSpacing=3 cellPadding=0 width="98%" align=center border=0>
					<TR>
						<TD><b>
							<script type="text/javascript">dw(ufy4);</script></b>
					</TD></TR>
					<TR>
						<TD><BR>
							<DIV align=center>
								<script type="text/javascript">dw('<input type="button" style="{width:220px;}" class="submitBtn" name="Restore Defaults" value="');dw(ufy5);dw('" onclick="return doConfirm();"></div>');</script>
							</DIV><br>
						</TD>
					</TR>
					<TR>
						<TD class="body">
							<script type="text/javascript">dw(ufy6);</script>
						</TD></TR>
					<TR>
						<TD class="body">
							<script type="text/javascript">dw(ufy7);</script>
					</TD></TR>
					<TR>
						<TD class="body">
							<script type="text/javascript">dw(ufy1);</script>
					</TD></TR>
					<TR>
						<TD class="body">
							<script type="text/javascript">dw(ufy2);</script>
					</TD></TR>
					<TR>
						<TD class="body">
							<script type="text/javascript">dw(ufy3);</script>
					</TD></TR>
				</TABLE>
			</div>
		</div>
	</div>
</FORM>
<% getInfo("load_file","/web/includes/_footer_FWGUI.htm") %>
