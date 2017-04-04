// JavaScript Document
// USED ON ALL PAGES
var userAgent=navigator.userAgent;
var patt1=/iphone/gi;
var referer = document.referrer;
var patt2=/videolink/gi;
//if (userAgent.match(patt1) != null || referer.match(patt2) != null || document.referrer == 'http://iphonetester.com/') {
if (userAgent.match(patt1) != null) {
	document.write('<link rel="stylesheet" type="text/css" href="css/main2.css" media="screen" />');
	}

//CHOOSE NETWORK
function deactivateAll(cnt) {
	for (var i=1; i<=cnt; i++) {
		var clss = document.getElementById('item'+ i).className;
		document.getElementById('item'+ i).className = clss.replace(/activerow/, '');
		}
	}
/*
function activateRow(id) {
 	deactivateAll(6);
 	document.getElementById(id).className = document.getElementById(id).className +' activerow';
	document.getElementById('nextlink').href = 'password.html?network='+ document.getElementById(id +'_network').innerHTML;
	}
*/
function activateRow(id, max) {
        deactivateAll(max);
        document.getElementById(id).className = document.getElementById(id).className +' activerow';
	//document.getElementById('nextlink').href = 'password.html?network='+ document.getElementById(id +'_network').innerHTML;
        }

//PASSWORD
function getQuerystring(key, default_) {
	if (default_ == null) default_=""; 
	key = key.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
	var regex = new RegExp("[\\?&]"+key+"=([^&#]*)");
	var qs = regex.exec(window.location.href);

	if(qs == null) {
		return default_;
		} else {
		return qs[1].replace(/%20/g, ' ').replace(/%27/g, "'");
		}
	}

function hideshow (hide, show) {
	document.getElementById(hide).style.display = 'none';
	document.getElementById(show).style.display = 'block';
	document.getElementById(show).focus();
	}
