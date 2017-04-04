/* wizard select network */

//CHOOSE NETWORK
function deactivateAll(max) {
	for (var i=1; i<=max; i++) {
		var clss = document.getElementById('item'+ i).className;
		document.getElementById('item'+ i).className = clss.replace(/activerow/, '');
		}
	}

function activateRow(id, max) {
 	deactivateAll(max);
 	document.getElementById(id).className = document.getElementById(id).className +' activerow';
	//document.getElementById('nextlink').href = 'password.html?network='+ document.getElementById(id +'_network').innerHTML;
	}

/* global */
function dw(s) { document.write(s); }
function getCurSeconds()
{
	var time = new Date();
	var when = time.getTime();
	return when;
}

var ua = navigator.userAgent.toLowerCase();
var isChrome = false;
if(ua.indexOf('applewebkit')!=-1)	//chrome and safari
	isChrome = true;

var sGood = "Good";
var sBad = "Bad";
var sVeryBad = "Very Bad";
function showSig(rssi)
{
	var v = parseFloat(rssi);
	var p = (100-(((v - (-50))/-50)*100));
	if(p>=36) return sGood;
	else if(p<36 && p>20) return sBad;
	else return sVeryBad;
}
function showSigPercent(rssi)
{
	var v = parseFloat(rssi);
	var p = (100-(((v - (-50))/-50)*100));
	if(p>=100) return 100;
	else if(p<=0) return 0;
	else return parseInt(p);
}
	
/* index */
var frameTopHeight = 62;

/* menu */
var gMenuWidth = 216;
var gMenuFontSize = 14; //pixel
var gMenuTopSpaceHeight = 10;
var gMenuBgColor = '#FFFFFF';
var gMenuMainColor = '#050707'; //'#ffffff';
var gMenuMainHightlightColor = '#3C89C8'; //'#ffff00';
var gMenuSubHightlightColor = '#6699ff';
var gMenuSeperatorColor = '#BBBBBB';

/* setup.wizard common */
function gopage(p) { location.href = p; }

var counter = 0;
var MODE_LOOP=1, MODE_CD=2;
var mode = 1; //0:clear, 1:loop, 2:cd. 
var cd = 3, nl = 5;
var MAX_LIGHT = 60;
var COLOR_BASE = '#EEEEEE';
var COLOR_HIGH = '#00D510';
var bLoadFinish = false;
function drewCtrTB()
{
	var result = '<table id=counterTB height=30><tr>';
	for(i=0; i<MAX_LIGHT; i++) result += '<td id=counterTD'+i+' width=1 bgcolor="'+COLOR_BASE+'"></td>';
	return (result+'</tr></table>');
}
function highlight(index, color)
{
	if(document.getElementById('counterTD'+index))
		document.getElementById('counterTD'+index).bgColor=color;
}
function RunCounterByMode()
{
	switch(mode)
	{
		case 2: //count down
			if(counter<=MAX_LIGHT)
			{
				setTimeout('RunCounterByMode()', parseInt((cd/MAX_LIGHT)*1000));
				highlight((counter++)%MAX_LIGHT, COLOR_HIGH);
			}
			else
				bLoadFinish = true;
			break;
		case 1: //loop
			setTimeout('RunCounterByMode()', 50);
			for(i=nl; i>=0; i--) highlight((counter-i)%MAX_LIGHT, (i==nl)?COLOR_BASE:COLOR_HIGH);
			counter++;
			break;
		case 0:
			for(i=0; i<MAX_LIGHT; i++) document.getElementById('counterTD'+i).bgColor=COLOR_BASE;
			counter=0;
			break;
	}
}
function doFinishRedirect(url)
{
	if(mode==MODE_CD)
	{
		if(bLoadFinish)
			gopage(url);
		else
			setTimeout('doFinishRedirect("'+url+'");', 50);
	}
}
function counterInit(m, p, url)
{
	mode = m;
	if(p && mode==MODE_LOOP) nl = p;
	if(p && mode==MODE_CD) 
	{
		cd = p;
		if(url) doFinishRedirect(url);
	}
	document.write(drewCtrTB());
	RunCounterByMode();
}

/* Proccess bar start*/
var BAR_LENGTH = 60;
var TIME_OUT = 60;
var COLOR_HIGH_BLUE = '#2060DB';
function doFinishRedirect2(url)
{
	if(bLoadFinish)
		gopage(url);
	else
		setTimeout('doFinishRedirect("'+url+'");', 50);
}
function drewProcessBar()
{
	var result = '<table id=counterTB height=30><tr>';
	for(i=0; i<BAR_LENGTH; i++) result += '<td id=counterTD'+i+' width=1 bgcolor="'+COLOR_BASE+'"></td>';
	return (result+'</tr></table>');
}
function Processing()
{
	if(counter<=BAR_LENGTH)
	{
		setTimeout('Processing()', (TIME_OUT/BAR_LENGTH)*1000);
		highlight((counter++)%BAR_LENGTH, COLOR_HIGH_BLUE);
	}
	else
		bLoadFinish = true;
}

function ProcessBarInit(timeout, barlength, url)
{
	TIME_OUT = timeout;
	BAR_LENGTH = barlength;
	
	if(url) 
		doFinishRedirect2(url);
		
	document.write(drewProcessBar());
	Processing();
}
/* Proccess bar end*/

/* setup.wizard, step2: ap list*/
var AP_LIST_BASE = '#EEEEEE';
var AP_LIST_OVER = '#336699';
var AP_LIST_CLICK = '#00D510';
var AP_LIST_BORDER = '#999999';

/* setup.wizard, step2/3: status check*/
var wait = 5; //Default: 5 seconds.
var period = 1; //Default: Check every 1 second.
var start = getCurSeconds();
var now = 0;
var bSuccess = 0;
var bLoadable = 1;
var retry_times = 0;
function setWaitTime(t) { wait = t; };
function StatusCheck(success_page, fail_page)
{
	if(bSuccess == 2)
	{//Special case
		gopage(fail_page);
	}
	else 
	if(!bSuccess)
	{
		if((now-start)>(wait*1000) && retry_times == 0) //timeout
		{
			gopage(fail_page);
		}
		else
		{
			setTimeout('StatusCheck("'+success_page+'", "'+fail_page+'");', period*1000);
			now = getCurSeconds();
		}
	}
	else //success
	{
		gopage(success_page);
	}
}

/* routine.txt */
function isBlank(s)
{
	var i;
	var c;
	for(i=0;i<s.length;i++)
	{
		c=s.charAt(i);
		if((c!=' ')&&(c!='\n')&&(c!='\t'))return false;
	}
	return true;
}

function isBlank_Zero(s)
{
	var i;
	var c;
	for(i=0;i<s.length;i++){
		c=s.charAt(i);
		if((c!=' ')&&(c!='\n')&&(c!='\t')&&(c!='0'))return false;
	}
	return true;
}

function isNValidIP(s) {
	if((isBlank(s))||(isNaN(s))||(isNValidInt(s))||(isNegInt(s))||(s<0||s>255))
		return true;
	else
		return false;
}

function isNValidLastIP(s) {
	if((isBlank(s))||(isNaN(s))||(isNValidInt(s))||(isNegInt(s))||(s<1||s>254))
		return true;
	else
		return false;
}

function isNValidSubnetMask(s1, s2, s3, s4) {
	if (s1 != 255)
		return true;

	if ((isNValidMask(s2)) || (isNValidMask(s3)) || (isNValidLastMask(s4)))
		return true;
	
	if (s2 != 255)
	{
		if ((s3 != 0) || (s4 != 0))
			return true;
	}
	
	if ((s3 != 255) && (s3 != 0))
	{
		if ((s2 != 255) || (s4 != 0))
			return true;
	}
	
	if(s4>s3 || s3>s2 || s2>s1) return true; //Avoid 255.255.0.x.
	
	return false;
}

function isValidIPAddress3(a1,a2,a3,a4,m1,m2,m3,m4){
  var net_id;
  var host_id;	
	  if(isNValidIP(a1.value) == true) return 1;
      if(isNValidIP(a2.value) == true) return 2;
      if(isNValidIP(a3.value) == true) return 3;
      if(isNValidIP(a4.value) == true) return 4;
      net_id =parseInt(m1.value, 10) * 0x1000000 +parseInt(m2.value, 10) * 
0x10000 + parseInt(m3.value, 10) * 0x100 + parseInt(m4.value, 10) * 0x1;

      host_id =parseInt(a1.value, 10) * 0x1000000 +parseInt(a2.value, 10) * 
0x10000 + parseInt(a3.value, 10) * 0x100 + parseInt(a4.value, 10) * 0x1;

		if ((host_id|net_id)==-1) {//heyu_20070227 for #329
			return 4;//heyu_20070227 for #329
		}//heyu_20070227 for #329
		if ((host_id&net_id)==host_id) {//heyu_20070227 for #329
			return 4;//heyu_20070227 for #329
		}//heyu_20070227 for #329		
	return 0;
}

function isNValidInt(s)
{
	var i, c;
	
	for (i=0; i<s.length; i++) {
		c = s.charCodeAt(i);
		if ((c < 48) || (c > 57))
			return true;
	}
	return false;
}

function isNegInt(s)
{
	if (s<0)
		return true;
	else
		return false;
}

function isNValidMask(s) {
	if ((s == 255) || (s == 254) || (s == 252) || (s == 248) || (s == 240) || (s == 224) || (s == 192) || (s == 128) || (s == 0))
		return false;
	return true;
}

function isNValidLastMask(s) {
	if ( (s == 252) || (s == 248) || (s == 240) || (s == 224) || (s == 192) || (s == 128) || (s == 0) )
		return false;
	return true;
}

/*valdiate wireless security key*/
var inValid = new Array();	//global array store the invalid characters.

function check_invalid_ascii(I)
{
	var count = 0;
	var idx = 0;
	var conflit = 0;
		
	for(i=0 ; i<I.value.length; i++){
		conflit = 0;
		ch = I.value.charAt(i);
		if(ch < ' ' || ch > '~'){
			for(idx=0; idx < inValid.length; idx++)
			{
				if(inValid[idx] == ch)
				{
					conflit	= 1;
					break;
				}
			}
			if(conflit == 0)
			{
				inValid[count] = ch;
				count++;
			}
		}
	}
	return count;
}
function checkWPA(keyname)
{
	inValid = [];
	
	if(keyname.length == 64)
	{
		if(!isxdigit(keyname)) 
		{
			return false;
	}	
	}	
	else if(keyname.value.length >= 8 && keyname.value.length <= 63 )
	{
		if(check_invalid_ascii(keyname) != 0) 
		{
			return false;
	}
	}
	else
	{
		return false;
	}
	return true;

}

function isxdigit(I)
{
	var count = 0;
	var idx = 0;
	var conflit = 0;
	for(i=0 ; i<I.value.length; i++){
		conflit = 0;
		ch = I.value.charAt(i).toLowerCase();
		if(ch >= '0' && ch <= '9' || ch >= 'a' && ch <= 'f'){}
		else{
			for(idx=0; idx < inValid.length; idx++)
			{
				if(inValid[idx] == I.value.charAt(i))
				{
					conflit	= 1;
					break;
				}
			}
			if(conflit == 0)
			{
				inValid[count] = I.value.charAt(i);
				count++;
			}
		}
	}
	return count;
}

function checkWEP(keyname)
{
	inValid = [];
	switch(keyname.value.length)
	{
		case 10: 
		case 26:
			if(isxdigit(keyname) != 0) 
				return false; 
			break;
		default: 
			return false;
	}
	return true;
}

function isNValidSSID(s)
{
	var acc="+_.";
	for(i=0; i<s.length; i++)
	{
		if(!(/[\x20-\x7f]/.test(s.charAt(i)))) //detecting all printable char
			return true;
/*
		if(!(/^[a-zA-Z0-9]$/.test(s.charAt(i))))
		{
			var bValid=false;efe
			for(j=0; j<acc.length; j++)
				if(s.charAt(i)==acc.charAt(j)) { bValid=true; break; }
			if(!bValid) return true;
		}
*/
	}
	return false;		
}


