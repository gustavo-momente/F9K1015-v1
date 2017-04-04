<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<link rel="stylesheet" type="text/css" href="<%getInfo("style");%>" media="all" />
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script language="JavaScript" src="showMenu.js"></script>
<script type="text/javascript">
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
function submitF()
{
return true;
}
function redirect(url)
{
window.location = url;
}
function logoutF()
{
document.config_form.logout.value=1;
document.config_form.submit();
return true;
}
</script>
</head>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<% getInfo("load_file","/web/includes/_body.htm") %>	
<FORM id=config_form name=config_form action="/goform/formConfigERR" method=post>
<INPUT type=hidden name=webpage value=<%config_err("err_url"); %> >
<INPUT type=hidden value=setup_ok name=page>
<INPUT type=hidden value=2 name=logout>

	<div class="row">
		<div class="twelve columns">
			<div class="textcenter" >
			
				<script type="text/javascript">
					dw(<%getInfo("reboot_msg");%>);
				</script>
				<br><br>
				<TABLE class=minimal_1 border=0>
					<TR>
						<TD width=550 class=body>
							<script type="text/javascript">
								dw('<font size=3 color=red>'+<%getInfo("reboot_msg_1")%>+'</font>');
							</script>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</form>
<% getInfo("load_file","/web/includes/_footer.htm") %>
