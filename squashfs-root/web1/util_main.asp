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
var helpItem 	='';
var menuSection	='Util';
var menuItem	='';
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
function logoutF()
{
document.tF0.logout.value=1;
document.tF0.submit();
return true;
}
//-->
</script>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<% getInfo("load_file","/web/includes/_body.htm") %>
<FORM name=tF0 action=util_main.asp method=post>
<INPUT type=hidden value=utilities name=page> <INPUT type=hidden value=2 name=logout>

	<div class="row show-on-phones">
		<div class="twelve columns nav-links">
			<div href="index.asp"><a>&larr; Back to Status</a></div>
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
			<h2><script type="text/javascript">dw(um1);</script></h2>
			<TABLE class="minimal_1" border=0>
				<TBODY>
				<TR vAlign=top>
					<TD><SPAN class="body">
						<script type="text/javascript">dw(um2);</script>
						<BR><br>

						<A class="more" href="util_reset.asp">
						<script type="text/javascript">dw(um3);</script>
						</A><BR>
						<script type="text/javascript">dw(um4);</script>
						<BR><BR>

						<A class="more" href="util_factory.asp">
						<script type="text/javascript">dw(um5);</script>
						</A><BR>
						<script type="text/javascript">dw(um6);</script>
						<BR><BR>

						<A class="more" href="util_firmware.asp">
						<script type="text/javascript">dw(um7);</script>
						</A><BR>
						<script type="text/javascript">dw(um8);</script>
						<BR><BR>

						<a class="more" href="util_system.asp">
						<script type="text/javascript">dw(um9);</script>
						</A><BR>
						<script type="text/javascript">dw(um10);
						</script>
						<BR><BR>

						<A class="more" href="util_log.asp">
						<script type="text/javascript">dw(um11);</script>
						</SPAN>
					</TD>
				</TR>
				</TBODY>
			</TABLE>
		</div>
	</div>
<FORM>
<% getInfo("load_file","/web/includes/_footer_FWGUI.htm") %>
