<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<link rel="stylesheet" type="text/css" href="<%getInfo("style");%>" media="all" />
<META http-equiv=Pragma content=no-cache>
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<SCRIPT language=JavaScript src="showMenu.js"></script>
<SCRIPT language=JavaScript src="code.js"></script>
<script type="text/javascript" src="BelkinSetupConfig.js"></script>
<script type="text/javascript">
var now_lang="<%getInfo("lang");%>";
function validVisibleStr(Str)
{
	var i, len = Str.length;
	for(i = 0; i < len; i++)
	{
		if(Str.charAt(i) < ' ' || Str.charAt(i) > '~')
		return false;
	}
	return true;
}
</script>
<script type="text/javascript">
strHtml='<title></title>';
dw(strHtml);
<!--
var helpItem 	='System Settings';
var menuSection	='Util';
var menuItem	='System Settings';
var isPS		='0';
var wanStatus= '<% getInfo("wanStatus");%>';
var isRouter;
var isAPmode;
if(('<% getVar("apMode","","");%>' =='0') && ('<% getiNICVar("apMode","","");%>' =='0'))
{	
	isAPmode='1';
	isRouter='0';
}
else
{
	isAPmode='0';
	isRouter='1';
}
function checkPwdLength(id)
{
	return;
	if((1 == id && 12 <= document.tF0.userOldPswd.value.length)
	|| (2 == id && 12 <= document.tF0.sysPasswd.value.length)
	|| (3 == id && 12 <= document.tF0.sysConfirmPasswd.value.length))
	{
		alert(usys88);
	}
}
function init()
{
	obscure_onchange(document.tF0.obscure)
}
function isBlank(s)
{
	for(i=0;i<s.length;i++)
	{
		c=s.charAt(i);
		if((c!=' ')&&(c!='\n')&&(c!='\t'))return false;
	}
	return true;
}
function evaltF()
{
	var f=document.tF0;
//	if(!isBlank(document.tF0.sysPasswd.value))
//	{
		if(!validVisibleStr(document.tF0.sysPasswd.value))
		{
			alert(msg_invalid_char);
			//document.tF0.sysPasswd.focus();
			//document.tF0.sysPasswd.select();
			return false;
		}
		if( f.sysPasswd.value.length < 3 || f.sysPasswd.value.length > 63 ){
			alert(upw6);
			//document.tF0.sysPasswd.focus();
			//document.tF0.sysPasswd.select();
			return false;
		}
//		document.tF0.http_passwd.value = document.tF0.sysPasswd.value;
		document.tF0.http_passwd.value = base64encode(document.tF0.sysPasswd.value);
		//document.tF0.sysConfirmPasswd.value = document.tF0.sysConfirmPasswd.value;
		document.tF0.sysPasswd.value = base64encode(document.tF0.sysPasswd.value);
		document.tF0.sysPasswd1.value = base64encode(document.tF0.sysPasswd1.value);
//	}
	return true;
}
function submitF() {
	return evaltF();
}
function logoutF()
{
	document.tF0.logout.value=1;
	document.tF0.submit();
	return true;
}
function obscure_onchange(x) {
        document.getElementById("showpw").style.display = "none"
        document.getElementById("hiddenpw").style.display = "none"
        if (x.checked == true){
                document.getElementById("showpw").style.display = ""
        }
        else{
                document.getElementById("hiddenpw").style.display = ""
        }
}
function clearallpwd(){
	document.tF0.sysPasswd.value = "";
        document.tF0.sysPasswd1.value = "";
}
//funClock();-->
</script>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 onload="//init()"; marginheight="0" marginwidth="0">
<% getInfo("load_file","/web/includes/_body.htm") %>
<FORM name=tF0 action=/goform/formSetPassword method=post>
<INPUT type=hidden value=util_system name=page>
<INPUT type=hidden value=2 name=logout><INPUT type=hidden value=util_system.asp name=webpage>
<INPUT type=hidden value=0 name=user_time_update><INPUT type=hidden name=http_passwd >
<INPUT type=hidden name=http_user value="user" ><INPUT type=hidden name=http_repasswd>
<INPUT type=hidden name=ntp_timezone_sel>
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
			<h2><script type="text/javascript">dw(upw1);</script></h2>
			<div class="twelve columns">
				<TABLE class="minimal_1" cellSpacing=5 cellPadding=0 align=left border=0>
					<TR id="hiddenpw">
						<TD><B>
							<script type="text/javascript">dw(upw2);</script>
							</B>
						</TD>
						<TD  width=300>
							<INPUT onkeyup=checkPwdLength(2) type=text size=16 name=sysPasswd onchange="document.tF0.sysPasswd1.value = this.value" style="width:100px">
						</TD>
					</TR>
					<TR id="showpw" style="display:none">
						<TD><B>
							<script type="text/javascript">dw(upw2);</script>
							</B>
						</TD>
						<TD width=300>
							<INPUT onkeyup=checkPwdLength(2) type=password size=16 name=sysPasswd1 onchange="document.tF0.sysPasswd.value = this.value" style="width:100px">
						</TD>
					</TR>

					<TR>
						<TD>&nbsp;</TD>
						<TD>
							<input type="checkbox" name="obscure"  onclick="obscure_onchange(this)" <%getVar("PSEnable","1","checked");%>/><script>dw(upw3);</script> 
						</TD>
					</TR>
					<TR>
						<TD colspan=2 align=middle><br>
							<script type="text/javascript">
							dw('<input type="button" value="');dw(upw4);dw('" style="{width:150px}" class="submitBtn" onclick="clearallpwd()">&nbsp;&nbsp;');
							dw('<input type="submit" style="{width:150px;}" value="');
							dw(btn2);
							dw('" onClick="return submitF();" class="submitBtn">');
							</script>
						</TD>
					</TR>
				</TABLE>
			</div>
		</div>
	</div>
</FORM>
<% getInfo("load_file","/web/includes/_footer_FWGUI.htm") %>
