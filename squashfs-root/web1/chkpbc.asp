<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=<%getInfo("charset");%>" />
<script type="text/javascript" src="<%getInfo("lang");%>"></script>
<script type="text/javascript" src="javascripts/jquery.min.js"></script>
<script type="text/javascript" src="BelkinSetupConfig.js" language="JavaScript"></script>
<script type="text/javascript">
$(function() {
	$.ajaxSetup({cache:false});
	function inputbuttonclick() {
		$("input:button").click(function() {
			$.get("BelkinAPI/CancelWPS.asp", function() {
				window.opener = null
				window.open('','_self')
				window.close()
			})
			.fail(function() {
				window.opener = null
				window.open('','_self')
				window.close()
			});
		});
	}
	function GetWPSStatus() {
		$.get("BelkinAPI/GetWPSStatus.asp", function(data) {
			if (data == "-") $("#text1").text(wps_msg4_1+' PBC '+wps_msg4_2)
			else if (data == "e") $("#text1").text(wps_msg6)
			else if (data == 33) $("#text1").text(wps_msg8)
			else if (data == 3) $("#text1").text(wps_msg7)
			else if (data == 2) $("#text1").text(wps_msg9)
			else if (data == 1) $("#text1").text(wps_msg8)
			else if (data == 0 || data == -1) $("#text1").text(wps_msg4_1+' PBC '+wps_msg4_2)
			else $("#text1").text(wps_msg5)
			if (data == "e") $("#text2").html('<input type="button" value="Close" />')
			else if (data == 33) $("#text2").html('<input type="button" value="Close" />')
			else if (data == 3) $("#text2").html('<input type="button" value="OK" />')
			else if (data == 2) $("#text2").html('<input type="button" value="Close" />')
			else if (data == 1) $("#text2").html('<input type="button" value="Close" />')
			else $("#text2").html('<input type="button" value="Cancel" />')
			inputbuttonclick()
			if ((data != 1) && (data != 2) && (data != 3) && (data != 33)) setTimeout(GetWPSStatus, 2000)
		})
		.fail(function() {
			$("#text1").text(wps_msg6)
			$("#text2").html('<input type="button" value="Close" />')
			inputbuttonclick()
			setTimeout(GetWPSStatus, 2000)
		});
	}
	$("#text1").text(wps_msg4_1+' PBC '+wps_msg4_2)
	$("#text2").html('<input type="button" value="Cancel" />')
	setTimeout(GetWPSStatus, 3000)
});
</script>
</head>
<body>
<br />
<p id="text1" align="center"></p>
<p id="text2" align="center"></p>
</body>
</html>
