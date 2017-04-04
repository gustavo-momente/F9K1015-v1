<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<link rel="stylesheet" type="text/css" href="<%getInfo("style");%>" media="all" />
<META http-equiv=Pragma content=no-cache>
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<SCRIPT language=JavaScript src="showMenu.js"></script>
<script type="text/javascript" src="BelkinSetupConfig.js"></script>
<script type="text/javascript">
var now_lang="<%getInfo("lang");%>";

strHtml='<title>'+wlm1+'</title>';
dw(strHtml);
<!--
var helpItem 	='';
var menuSection	='WLAN';
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
<FORM name=tF0 action=wireless_main.html method=post>
<INPUT type=hidden value=wireless name=page> <INPUT type=hidden value=2 name=logout>
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
			<h2><script type="text/javascript">dw(wlm1);</script></h2>
			<script type="text/javascript">dw(wlm2);</script>
			<br><br>

			<A class="more" href="wireless_chan.asp"><B>
			<script type="text/javascript">dw(wlm3);</script>
                        </B></A><BR>
                        <script type="text/javascript">dw(wlm4);</script>
                        <BR><br>

                        <A class="more" href="wireless_encrypt.asp"><B>
                        <script type="text/javascript">dw(wlm5);</script>
                        </B></A><BR>
                        <script type="text/javascript">dw(wlm6);</script>
                        <BR><br>

                        <A class="more" href="wireless_wps.asp"><B>
                        <script type="text/javascript">dw(wlm7);</script>
                        </B></A><BR>
                        <script type="text/javascript">dw(wlm8);</script>
                        <BR><br>
		</div>
	</div>
</FORM>
<% getInfo("load_file","/web/includes/_footer_FWGUI.htm") %>
