<?php

$mailto = "linuxbog@sslug.dk";

$allowfromcountry = array("DE","DK","IE","SE");

function findGeoIPdat($list) {
	return $list[0];
}

if ($HTTP_POST_VARS["tekst"]) {
	$base = findGeoIPdat( array("../../misc/geoip", "/usr/share/GeoIP") );
	include($base."/geoip.inc");
	$gi = geoip_open($base."/GeoIP.dat",GEOIP_STANDARD);
	$country = geoip_country_code_by_addr($gi, $_SERVER["REMOTE_ADDR"]);
	geoip_close($gi);
	if (!in_array($country,$allowfromcountry)) {
		echo "<h1>FEJL</h1>\n";
		echo "<p>Beklager, men det er ikke muligt at sende �ndringer n�r du sidder i $country. Vi f�r alt for meget skidtpost, s� vi er blevet n�dt til at indl�gge denne sp�rring.</p>";
		echo "<p>Din tekst kan sendes til <a href=\"mailto:$mailto\">$mailto</a>:</p><pre>".$HTTP_POST_VARS["tekst"]."</pre>\n";
	} else {
		if (preg_match("|/([^/]+)/[^/]+/([^/]+)\.html|", $_SERVER["REQUEST_URI"], $match)) {
			$bognavn = $match[1];
			$id = $match[2];
			$output = exec("cd ../../ ; egrep -Hin 'id=\"?$id\"?' $bognavn/*.sgml");
			list($sgmlfile, $linenumber) = split(":", $output);
		}
		$tekst = stripcslashes($HTTP_POST_VARS["tekst"]);
		$email = $HTTP_POST_VARS["email"];
		$reply = ($email ? $email : $mailto);
		$subject = "[FTAV] $country ".$_SERVER["REQUEST_URI"]." $email";
		$body = "\nForslag til rettelse fra e-mail: $email\n";
		$body .= "Afsendt fra IP-nummer: ".$_SERVER["REMOTE_ADDR"]."\n";
		$body .= "Reverse look-up: ".gethostbyaddr($_SERVER["REMOTE_ADDR"])."\n";
		$body .= "Land: $country\n";
		$body .= "HTML-fil:\nhttp://".$_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"]."\n";
		if ($sgmlfile) {
			$body .= "SGML-fil:\nvi $sgmlfile +$linenumber\n";
		}
		$body .= "\n";
		$body .= "-------- Teksten --------\n";
		$body .= "$tekst\n";
		$body .= "-------- Teksten --------\n";
		$body .= "\n\nEOF";
		mail( $mailto,
			$subject,
			$body,
			"From: ftav-edit@".$_SERVER["SERVER_NAME"]."\r\n"
			."Reply-To: $reply\r\n"
			."X-Mailer: PHP/".phpversion()
		);

		echo "<hr><blockquote id=\"rettet\">\n";
		echo "F�lgende mail er sendt til $mailto:\n<pre>Subject: $subject\n";
		echo htmlentities($body)."</pre>\n";
		echo "</blockquote>\n";
	}
}
?>
<!--
Her starter "/submit.inc" af Hans Schou.
$Id$

For at bruge dette script, skal du inds�tte
	< ?php include($DOCUMENT_ROOT."/submit.inc") ?>
i bunden af din .html fil.
Dern�st skal din fil have tilf�jet .php til slut i filnavnet.
-->
<hr>
<h2>Rettelser</h2>
<p>Har du en rettelse til denne side, s� skriv den i boksen herunder.
Din besked bliver sendt til redaktionen af <i>Friheden Til At V�lge</i>.</p>
<p>Dit IP-nummer er <?php echo $_SERVER["REMOTE_ADDR"] ?>.</p>
<form action="<?php echo $_SERVER["REQUEST_URI"] ?>#rettet" method="post">
<p>
Eventuelt din e-mail adresse:
<input type="text" name="email" value="<?php echo $HTTP_POST_VARS["email"] ?>">
<br>
(E-mail er kun n�dvendig hvis du �nsker svar.)
<br>
Din kommentar eller rettelse:
<br>
<textarea name="tekst" cols="60" rows="10">
<?php echo stripcslashes($HTTP_POST_VARS["tekst"]) ?>
</textarea>
<input type="submit" name="submit" value="Submit">
</form>
<!-- Her slutter "submit.inc" -->
