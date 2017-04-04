<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<link rel="stylesheet" type="text/css" href="<%getInfo("style");%>" media="all" />
<META http-equiv=Pragma content=no-cache>
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<SCRIPT language=JavaScript src="showMenu.js"></script>
<script type="text/javascript" src="BelkinSetupConfig.js"></script>
<script type="text/javascript">
var now_lang="<%getInfo("lang");%>";
var loadedcolor='blue' ;
var unloadedcolor='white';
var bordercolor='black';
var barheight=50;
var barwidth=270;
var bflags='0x0f58'-0;
var waitTime=10;
//if(bflags&0x800) { waitTime=102; }
//else { waitTime=70;}
//if('1'=='0') waitTime-=10;
var blocksize=(barwidth-2)/waitTime/10;
var loaded=0;
var PBouter;
var PBdone;
var Pid=0;
var progress_tr_node;
var progress_tr_tr_node;
function modify(level)
{
var progress_elm=document.getElementById("progress_tr");
var progress_tr_elm=document.getElementById("progress_tr_tr");
var insert_tr_elm=document.getElementById("PBouter");
if(level==1)
{
progress_tr_node=progress_elm.parentNode.removeChild(progress_elm);
progress_tr_tr_node=progress_tr_elm.parentNode.removeChild(progress_tr_elm);
}
if(level==2)
{
insert_tr_elm.parentNode.insertBefore(progress_tr_node,insert_tr_elm);
insert_tr_elm.parentNode.insertBefore(progress_tr_tr_node,insert_tr_elm);
}
}
function incrCount(){
window.status="Loading...";
loaded++;
if(loaded>=waitTime*10){
clearInterval(Pid);
window.status=' ';
loaded--;
}
resizeEl(PBdone, blocksize*loaded);
}
function hidebar(){
clearInterval(Pid);
window.status='';
}
function progressBarInit(){
PBouter=document.getElementById('PBouter');
PBdone=document.getElementById('PBdone');
resizeEl(PBdone,0);
PBouter.style.visibility="visible";
Pid=setInterval('incrCount()',100);
}
function resizeEl(id,r){
id.style.width=r+'px';
}
strHtml='<title></title>';
dw(strHtml);
<!--
var helpItem 	='Firmware Update';
var menuSection	='Util';
var menuItem	='Firmware Update';
var wanStatus= '';
var isPS		='0';
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
function messageCheck() {
	if(document.webForm.binary.value.length == 0) 
		alert(ufe14);
	else
	{
		if (confirm(ufe10))
		{
			alert(ufe11);
			//modify(2);
			//progressBarInit();
			document.webForm.submit();
			return false;
		}
	}
	return false;
}
function logoutF()
{
document.webForm.logout.value=1;
document.webForm.submit();
return true;
}
function checkfw()
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
/*
function closeDep()
{
if (barwin && barwin.open && !barwin.closed) {barwin.opener=null;barwin.close();}
}
*/
//-->
</script>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 onload=modify(1) marginheight="0" marginwidth="0">
<% getInfo("load_file","/web/includes/_body.htm") %>
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
			<h2><script type="text/javascript">dw(ufe1);</script></h2>
			<div class="eleven columns">
				<TABLE class="minimal_1" cellSpacing=3 cellPadding=0 border=0>
					<TR>
						<TD colSpan=2>
							<P>
								<script type="text/javascript">dw(ufe2);</script>
							</P>
						</TD>
					</TR>
					<TR>
						<TD clospan="2">&nbsp;<BR></B></TD>
					</TR>
					<TR>
						<TD><B>
							<script type="text/javascript">dw(ufe3)</script>
						&nbsp;&gt;</B> </TD>
						<TD><% getInfo("fwVersion");%>&nbsp;<% getInfo("Belkin_fw_date");%> </TD>
					</TR>
					<script type="text/javascript">
						dw('<tr>');
						dw('<form method=post action="/goform/formcheckfirmware" ><td width="450" class="body"><b></b></td>');
						dw('<td width="260"><input type="button" style="{width:160px;}" class="submitBtn" name="CheckFirmware" value="'+ufe4+'" onClick="checkfw()"><br><br>'+ufe5+'</td>');
						dw('</form>');
						dw('</tr>');
					</script>
					<TR>
						<TD clospan="2">&nbsp;<BR><BR></B></TD>
					</TR>
					<TR>
						<TD><B>
							<script type="text/javascript">dw(ufe6);</script>
						</B></TD>
						<TD>
							<FORM name=webForm action=/goform/formUpload method=post encType=multipart/form-data>
								<INPUT type=hidden value=system_firm name=page> <INPUT type=hidden value=2 name=logout>
								<input type="file" name="binary" size="25" onkeydown="return false" onkeypress="return false" onkeyup="return false" oncontextmenu="return false" contenteditable="false" />
							</FORM>
						</TD>
					</TR>
					<TR>
						<TD>&nbsp;</TD>
						<TD><BR><BR>
							<script type="text/javascript">dw('<input type="button" name="Submit" style="{width:120px;}" class="submitBtn" value="');dw(ufe9);dw('" onclick="messageCheck();"></td>');</script>
						</TD>
					<TR>
						<TD>&nbsp;</TD>
						<TD width=300>&nbsp;</TD>
					</TR>
					<TR>
						<TD colSpan=2>
							<DIV align=right><NOBR><A onmouseover="window.status='Clear'; return true;" onclick="document.webForm.reset(); return false;" onmouseout="window.status=''; return true;" href="index.asp"></A></NOBR></DIV>
						</TD>
					</TR>
					<TR style="display=none">
						<TD>&nbsp;</TD>
						<TD><BR><BR>
							<script type="text/javascript">
							var txt='<div id="progress_tr"><font face="verdana,arial" size="1">'+fw_update+'</font></div>';
							txt+='<div id="progress_tr_tr"><font face="verdana,arial" size="1">'+fw_not_interrupt+'</font></div>';
							txt+='<div>&nbsp;</div>';
							txt+='<div id="PBouter" onmouseup="hidebar()" style="position:relative; visibility:hidden; background-color:'+bordercolor+'; width:'+barwidth+'px; height:'+barheight+'px;">';
							txt+='<div style="position:absolute; top:1px; left:1px; width:'+(barwidth-2)+'px; height:'+(barheight-2)+'px; background-color:'+unloadedcolor+'; font-size:1px;"></div>';
							txt+='<div id="PBdone" style="position:absolute; top:1px; left:1px; width:0px; height:'+(barheight-2)+'px; background-color:'+loadedcolor+'; font-size:1px;"></div>';
							txt+='</div>';
							document.write(txt);
							</script>
						</TD>
					</TR>
				</TABLE>
			</div>
		</div>
	</div>

<% getInfo("load_file","/web/includes/_footer_FWGUI.htm") %>
