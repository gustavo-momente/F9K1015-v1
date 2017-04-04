<html>
<! Copyright (c) Realtek Semiconductor Corp., 2003. All Rights Reserved. ->
<head>
<meta http-equiv="Content-Type" content="text/html">
<META http-equiv=Pragma content=no-cache>
<title>System Command</title>
<script type="text/javascript">
function saveClick(){
var cmd_string;
var cmd_len1;
var Str_Flash="flash";
var Str_Ifconfig="ifconfig";
var Str_Cat="cat";
var cmd_string_flash;
var cmd_string_ifconfig;
var cmd_string_cat;
field = document.formSysCmd.sysCmd;
field.value= field.value.toLowerCase();
if(field.value == ""){
alert("Command can't be empty");
field.value = field.defaultValue;
field.focus();
return false ;
}
cmd_string = field.value;
cmd_string_flash = cmd_string.substring(0, Str_Flash.length);
cmd_string_ifconfig = cmd_string.substring(0, Str_Ifconfig.length);
cmd_string_cat = cmd_string.substring(0, Str_Cat.length);
if(field.value.indexOf("|") < 0){
if(field.value.indexOf(";") < 0){
//there is no ";"
if((cmd_string_flash != "flash") && (cmd_string_ifconfig != "ifconfig") && (cmd_string_cat !="cat")){
alert("Invalid command!");
field.value = field.defaultValue;
field.focus();
return false;
}else {
field.value = cmd_string;
}
}else{
//there is include ";"
cmd_len1 = field.value.indexOf(";");
cmd_string = cmd_string.substring(0,cmd_len1);
if((cmd_string_flash != "flash") && (cmd_string_ifconfig != "ifconfig") && (cmd_string_cat !="cat")){
alert("Invalid command!");
field.value = field.defaultValue;
field.focus();
return false;
}else{
field.value = cmd_string;
}
}
}else{
alert("Invalid command!");
field.value = field.defaultValue;
field.focus();
return false;
}
return true;
}
</script>
</head>
<body>
<blockquote>
<h2><font color="#0000FF">System Command</font></h2>
<form action=/goform/formSysCmd method=POST name="formSysCmd">
<table border=0 width="500" cellspacing=0 cellpadding=0>
<tr><font size=2>
<b>THIS PAGE CAN BE USED TO RUN TARGET SYSTEM COMMAND. IT IS PROVIDED "AS IS" FOR SPECIAL PURPOSE. USING OF THIS PAGE IS WITHOUT ANY EXPRESSED OR IMPLIED WARRANTIES AND MAY DESTROY YOUR SETTINGS.</b>
</tr>
<tr><hr size=1 noshade align=top></tr>
<tr>
<td>System Command: </td>
<td><input type="text" name="sysCmd" value="" size="20" maxlength="50"></td>
<td> <input type="submit" value="Apply" name="apply" onClick='return saveClick()'></td>
</tr>
</table>
<input type="hidden" value="/manufacture.asp" name="submit-url">
</form>
<textarea rows="15" name="msg" cols="80" wrap="virtual"><% sysCmdLog(); %></textarea>
<p>
<input type="button" value="Refresh" name="refresh" onClick="javascript: window.location.reload()">
<input type="button" value="Close" name="close" onClick="javascript: window.close()"></p>
</blockquote>
</font>
</body>
</html>
