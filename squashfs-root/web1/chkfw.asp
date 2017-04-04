<html>
<head>
<meta HTTP-EQUIV="Expires" CONTENT="text/html">
<title> </title>
<META http-equiv="Content-Type" content="text/html; charset=<%getInfo("charset");%>" >
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script type="text/javascript">
<!-- Start Script
function change_chk_page()
{
var result = document.forms[0].chkfw_result.value;
//var result = 0 
//alert(result);
if(result==0)
location.href = "ckfw_fail.asp";
else if(result==1)
window.location.href = "http://networking.belkin.com/update/files/F9K1015/v1/WW/version.html";
else if(result==2)
location.href = "ckfw_notfound.asp";
else if(result==3)
setTimeout("location.href='chkfw.asp'", 3000);
else
alert(result);
}
// End Script -->
</script>
</head>
<BODY bgcolor="#FFFFFF" onLoad="change_chk_page();">
<form>
<b><script type="text/javascript">dw(wps_msg5);</script></b>
<input type="hidden" name="chkfw_result" value="<% getInfo("Belkin_check_FW");%>">
</form>
</body></html>
