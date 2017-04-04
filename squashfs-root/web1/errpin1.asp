<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<meta HTTP-EQUIV="Expires" CONTENT="text/html">
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script type="text/javascript">
strHtml='<title>'+ wps_msg1 + '</title>';
dw(strHtml);
<!-- Start Script
function close_widow() {
window.opener=null
window.open('','_self')
window.close()
}
// End Script -->
</script>
</head>
<body>
<form>
<br />
<p align="center"><script type="text/javascript">dw(wps_msg2);</script></p>
<p align="center">
<script type="text/javascript">
dw('<input name="ok" type="button" style="{width:20%;}" value="'+OK+'" onClick="close_widow()">');
</script>
</p>
</form>
</body>
</html>
