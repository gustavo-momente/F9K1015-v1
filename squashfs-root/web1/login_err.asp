<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<link rel="stylesheet" type="text/css" href="<%getInfo("style");%>" media="all" />
<META http-equiv=Pragma content=no-cache>
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<SCRIPT language=JavaScript src="showMenu.js"></script>
<script language="Javascript" src="code.js"></script>
<script type="text/javascript" src="BelkinSetupConfig.js"></script>
<script type="text/javascript">
var now_lang="<%getInfo("lang");%>";
strHtml='<title>'+le1+'</title>';
dw(strHtml);
<!--
var helpItem 	='Login';
var menuSection	='';
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
var fw_auto = '<%getIndexInfo("fw_auto_detect");%>';
function logoutF()
{
document.tF.logout.value=1;
document.tF.submit();
return true;
}
function checkfw()
{
if( fw_auto == 'Enabled')
{
if( wanStatus =='Down')
{
newwin=window.open("ckfw_fail.asp","Firmware","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,width=395,height=200,resizable=0");
newwin.focus();
}else
{
newwin=window.open("chkfw.asp","Firmware","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,width=395,height=200,resizable=0");
newwin.focus();
}
}
}
function checkPwdLength()
{
return;
if(12 <= document.tF.pws.value.length)
alert(usys88);
}
function submitF()
{
checkfw();
//if( document.tF.pws.value.length != 0)
	document.tF.pws.value=base64encode(document.tF.pws.value);
//Welly marked 110925 Encode
//document.tF.pws.value = base64encode(document.tF.pws.value);
return true;
}
//-->
</script>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<% getInfo("load_file","/web/includes/_body.htm") %>
<FORM name=tF action=/goform/formLogin method=post>
	<INPUT type=hidden name=page>
	<INPUT type=hidden name=logout>
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
			<h2><script type="text/javascript">dw(lo1);</script></h2>
			<TABLE class="minimal_1" cellSpacing=5 cellPadding=0 width=480 align=left border=0>
				<TBODY>
					<TR>
						<TD colSpan=2 height=41 class="body">
							<script type="text/javascript">dw(lo2);</script>
						</TD></TR>
					<TR>
						<TD width=146>&nbsp;</TD>
						<TD width=250>&nbsp;</TD></TR>
					<TR>
						<TD width=146 class="body"><B>
							<script type="text/javascript">dw(lo3);</script>
						</B></TD>
						<TD width=250><INPUT onKeyUp="checkPwdLength()" type=password maxLength=63 size=9 name=pws>
						</TD></TR>
					<TR>
						<TD colSpan=2><B><FONT color=#6f4afd>
							<script type="text/javascript">dw(lo4);</script>
						</FONT></B></TD></TR>
					<TR>
						<TD colSpan=2></TD></TR>
					<TR>
						<TD align=middle colSpan=2>
							<script type="text/javascript">strHtml='<input type="reset" value="'+Clear+'" style="{width:120px;}" class="submitBtn" onMouseOver="window.status=\'Clear\'; return true;" onMouseOut="window.status=\'\'; return true;">&nbsp;&nbsp;';
							dw(strHtml);
							strHtml='<input type="submit" value="'+Submit+'" style="{width:120px;}" class="submitBtn" onClick="return submitF();">';
							dw(strHtml);</script>
							<p style="font-family:Arial,Helvetica,sans-serif;font-size:large;color:red"><script type="text/javascript">dw(lerror)</script></p><br />
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</div>
	</div>
</FORM>
<% getInfo("load_file","/web/includes/_footer_FWGUI.htm") %>
