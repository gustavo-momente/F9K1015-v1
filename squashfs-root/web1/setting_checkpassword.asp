<% getInfo("load_file","/web/includes/_header.htm") %>
<META http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>;NO-CACHE" >
<script src="jq/jquery.js"></script>
<!--<link rel="stylesheet" type="text/css" href="BelkinSetup.css" media="screen" />-->
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script language="JavaScript">
/*var TIMEOUT_SEC = 120;
var PERIOD_SEC = 2;
var PROC_LEN = 60;
var PROC_SEC = TIMEOUT_SEC + PERIOD_SEC;
*/
var stop;
var keeptrying;
var getStaInfoband;
var getConnectStatus;
var SiteSurveyResult = '<% getInfo("BS_get_sitesurvey_result"); %>'
var ResultArray = SiteSurveyResult.split(' ');
var band = ResultArray[0];
var securityType = ResultArray[2];
var password = ResultArray[5];
var isPreTest = ResultArray[7];
var ts = new Date().getTime();
var lastCorrectFlag = 2;
var doublechk = false;
//alert("password "+ password);
/*
var SiteSurveyResult;
var ResultArray;
var band;
var securityType;
var password;
*/
var isFromStaticSetting = '<% getInfo("BS_from_staticip"); %>'
var LinkRetryCounter = 0;
var WrongPassCounter = 0;
var CantGetipCounter = 0;
var ts3;
//alert(band +"<--band");
function func() { //每個單位時間會執行一次

        getStaInfoband = "getStaInfo.asp"
        getConnectStatus = "getConnectStatus.asp"
        getSecurityOK = "getSecurityOK.asp"
        getPingStatus = "getPingStatus.asp"
    var ts2 = new Date().getTime();
    $.get(getStaInfoband, {
        NoCache: ts2
    }, function (data) { //先看link狀態
        //alert("get information of link states data ="+data);
        //if(securityType != '000' && password == '0'){ //有加密但是還沒有填密碼
        //	window.location = "setting_password.asp";
        //}
	data = 1; 
        if (data == 1 && securityType == '000') //no security
        {
            $.get(getPingStatus, {NoCache: ts2}, function (data) { // ping net status
                //alert("data="+data);
                if (data == 1) {
                    $.get(getConnectStatus, {NoCache: ts}, function (data) {return;}); //成功以後再把檔案寫入
                    //window.clearInterval(stop);
                    //$("#dialog-modal").dialog("close");
                    sleep(3);
                    $.get("getSuccessStatus.asp", {
                        NoCache: ts
                    }, function (data) {
                        //keeptrying = self.setInterval("func()",500);

                        if (data == 8) { //都成功了
                            $.get("testalive.html", {
                                NoCache: ts
                            }, function (data) {
                                window.location = "setting_finished.asp";
                                window.clearInterval(stop);
                                //window.clearInterval(keeptrying);
                            });
                        } else if ((data == 2) || (data == 5) ) {
                            $.get("testalive.html", {
                                NoCache: ts
                            }, function (data) {
                                window.location = "setting_sitesurvey_con.asp";
                                window.clearInterval(stop);
                                //window.clearInterval(keeptrying);
                            });
                        }
                        return;
                    });
                } else {
                    //alert("WrongPassCounter = "+WrongPassCounter);
                    CantGetipCounter++;
                    if (CantGetipCounter == 5) window.location = "setting_surveyfail.asp";
                }
                return;
            });
        } else if ( (data == 1 && securityType != '000') || doublechk) {
            $.get(getSecurityOK, {NoCache: ts2}, function (data) { //check password
                //alert("---> 91 data="+data);
                if ( (data == 1 || securityType == '100') || doublechk) {
                    ts3 = new Date().getTime();
                    $.get(getPingStatus, {NoCache: ts3}, function (data) { // ping net status
                        if (data == 1) {
                            $.get(getConnectStatus, {NoCache: ts2}, function (data) {
                                //alert("get connet status!! ");
                            }); //成功以後再把檔案寫入
                            sleep(3);
                            //window.clearInterval(stop);
                            $.get("getSuccessStatus.asp", {NoCache: ts3}, function (data) {
                                //keeptrying = self.setInterval("getSuccessStatusAgain()",500);
                                var nowCorrectFlag = data;
                                var ts4 = new Date().getTime();
				//alert(getSuccessStatusAgain(data));
                                if (data == 8 /*&& getSuccessStatusAgain(data)*/) { //都成功了
                                    $.get("testalive.html", {NoCache: ts4}, function (data) {
                                        window.location = "setting_finished.asp";
                                        window.clearInterval(stop);
                                        //window.clearInterval(keeptrying);
                                    });
                                } else if ( ((data == 2) || (data == 5)) /*&& getSuccessStatusAgain(data)*/&& lastCorrectFlag == data) {
                                    $.get("testalive.html", {NoCache: ts4}, function (data) {
                                        window.location = "setting_sitesurvey_con.asp";
                                        window.clearInterval(stop);
                                        //window.clearInterval(keeptrying);
                                    });
                                }
				//alert("lastCorrectFlag="+lastCorrectFlag);
				//alert("nowCorrectFlag="+nowCorrectFlag);
                                lastCorrectFlag = nowCorrectFlag;
				doublechk = true;
                                return;
                            });
                        } else {
                            CantGetipCounter++;
                            if (CantGetipCounter == 5) window.location = "setting_surveyfail.asp";
                        }
                    }); //end of PingStatus
                } else {
                    //alert("WrongPassCounter = "+WrongPassCounter);
                    WrongPassCounter++;
                    if (WrongPassCounter == 3) if (isPreTest == '1') window.location = "setting_password.asp";
                    else window.location = "setting_password_retry.asp";
                }
                return;
            });
        } else {
            //alert("else");
            //alert("LinkRetryCounter = "+LinkRetryCounter);
            LinkRetryCounter++;
            if (LinkRetryCounter == 5) {
                window.location = "setting_surveyfail.asp";
            }
            return;
        }
    });
}
var doublecheck = false;
function getSuccessStatusAgain(data)
{
	$.get("getSuccessStatus.asp", {NoCache: ts3}, function (result) {
		//alert("result="+result);
		//alert("data="+data);
		if(result==data)
			doublecheck = true ;
		else{
			doublecheck = false;
		}
		//return flag;
	});
	return doublecheck;
}

var timeoutcounter=0;
function timeout() {
	$.get("testalive.html", {NoCache: ts}, function (data) { 
		timeoutcounter=0
	});
	timeoutcounter++;
	ts++;
	if(timeoutcounter == 30){
		showMask();
		el = document.getElementById("overlay");
		el.style.visibility = "visible";
		window.clearInterval(discontimeout);
		window.clearInterval(discontimeout);
	}
}
/*function isiPhonePad(){
return (
(navigator.platform.indexOf("iPhone") != -1) ||
(navigator.platform.indexOf("iPad") != -1)
);
}*/
var discontimeout
var stopforchan;

function init() {
    stop = self.setInterval("func()", 8000);
    if (SiteSurveyResult != 'empty' && band == 2 /*&& isiPhonePad()*/ ) stopforchan = self.setInterval("prepareforChan()", 500);
    discontimeout = self.setInterval("timeout()", 1000); //wait for 30 sec
}

function prepareforChan() {
    var ts3 = new Date().getTime();
    //funcChan();
    $.get("getChangeChan.asp", {
        NoCache: ts3
    }, function (data) {
        return
    });
    window.clearInterval(stopforchan);
}
function showMask(){
        $("#bg").css("display","block");
}
</script>
</head>
<body onLoad="init();">
<% getInfo("load_file","/web/includes/_body.htm") %>
<script type="text/javascript">
dw('<div id="overlay">');
dw('<div>');
dw(discontitle);
dw('</div>');
dw('<br>');
dw('<span style="width: 64px; height: 61px; background-image: url(images/notice.jpg); float:left; margin:0 7px 0 0;"></span>');
dw(disconwarning);
dw('</div>');
</script>
<form name ="tF" method="post" action="apply.cgi"  onSubmit="return evaltF();">
	<div id="main">
		<div class="row">
			<div class="twelve columns">
				<h1><script>dw(setting_7)</script></h1>
				<div id="loading-img"></div>
			</div>
		</div>
	</div>
	<div id="bg"></div>
</form>
<% getInfo("load_file","/web/includes/_footer.htm") %>
