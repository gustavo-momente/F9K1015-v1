<html>
<head>
<link rel="stylesheet" href="set.css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Cross Band</title>
</head>
<body>

<form name ="QQ" method="post" action="/goform/formSetWifi" >
Band:
<select name=band>
	<option value=1>b</option>
	<option value=2>n</option>
	<option value=3>b+g</option>
	<option value=4>g</option>
	<option value=5>b+g+n</option>
</select>
<script>
	band=<%getVar("band","","");%>
	document.QQ.band.selectedIndex=band-1;
</script>
<br>
BandWidth:
        <input type="radio" value="1" name="wlanNChanWidth" <%getVar("NChanWidth","1","checked");%>>    40/20 MHz
        <input type="radio" name="wlanNChanWidth" value="0" <%getVar("NChanWidth","0","checked");%>>    20 MHz
<br>
Channel:
	<select size="1" name="chan">
		<script>
			regDomain = <%getVar("regDomain","","");%>;
			defaultChan = <%getVar("channel","","");%>;
                        var Reg_to_Domain = new Array("0", "0", "1", "2", "3", "5");
                        var region = Reg_to_Domain[regDomain-1];
                        var domainMin = new Array("1","1","10","10","14","1","3","5");
                        var domainMax = new Array("11","13","11","13","14","14","9","13");
                        // B G N
                        for (j=domainMin[region]; j<=domainMax[region]; j++)
                        {
                                if ( j==defaultChan){
                                        document.write('<option selected value="'+j+'">'+j+'</option>');
				}
                                else
                                        document.write('<option value="'+j+'">'+j+'</option>');
                        }
		</script>
	</select>
	<script>
	document.QQ.chan.selectedIndex=defaultChan-domainMin[region];
	</script>
<br>
<input type=hidden value="setwifi.asp" name="webpage">
<input type=submit value="Apply">
</form>

</body>
