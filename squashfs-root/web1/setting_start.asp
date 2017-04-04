<% getInfo("load_file","/web/includes/_header.htm") %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="BelkinSetupConfig.js"></script>

<title>Belkin WRX</title>
<script type="text/javascript">
var now_lang="<%getInfo("lang");%>";
var lang = window.navigator.userLanguage || window.navigator.language ;         
var relang=lang.toLowerCase();

var x = /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/
if (!x.test(location.hostname) && location.hostname != "belkin.range") window.top.location.assign("http://belkin.range")

first_setting="<%getVar("first_setting","","");%>";
relang_len=relang.length;
</script>
</head>
<form name="lang_form" action=/goform/formSetLanguage method=post>
<input type="hidden" name="location_page" value="setting_start.asp">
<input type="hidden" name="lang_code" value="0">
<input type="hidden" name="arc_action" value="change_lang" >
<input type="hidden" name="langtype" />
</form>
<script>
if(first_setting == 0){
        if( relang_len >= 2 && relang.substr(0,2)== "en")       //English 
		document.lang_form.langtype.value="en";
        else if( relang_len >= 2 && relang.substr(0,2)== "de")  //German 
		document.lang_form.langtype.value="de";
	//else if( relang_len >= 5 && relang.substr(0,5)== "fr-ca")  //French (Canada)
		//document.lang_form.langtype.value="frca";
        else if( relang_len >= 2 && relang.substr(0,2)== "fr")  //French (France)
		document.lang_form.langtype.value="fr";
        else if( relang_len >= 2 && relang.substr(0,2)== "es")  //Spanish 
		document.lang_form.langtype.value="es";
        else if( relang_len >= 2 && relang.substr(0,2)== "nl")  //Dutch 
		document.lang_form.langtype.value="du";
        else if( relang_len >= 2 && relang.substr(0,2)== "it")  //Italian 
		document.lang_form.langtype.value="it";
        else if( relang_len >= 5 && relang.substr(0,5)== "zh-cn")//Chinese
		document.lang_form.langtype.value="sc";
        else if( relang_len >= 5 && relang.substr(0,5)== "zh-tw")//Chinese(Taiwan)
		document.lang_form.langtype.value="tc";
	else if( relang_len >= 2 && relang.substr(0,2)== "pt")	//Portuguese
		document.lang_form.langtype.value="pt";
	else if( relang_len >= 2 && relang.substr(0,2)== "sv")	//Swedish
		document.lang_form.langtype.value="sv";
	//else if( relang_len >= 2 && relang.substr(0,2)== "ar")  //Arabic
	//	document.lang_form.langtype.value="ar";		
        else
                document.lang_form.langtype.value="en";  //default English
	change_language();
}
</script>
<frameset><frame src="setting_start2.asp" /></frameset>
</html>
