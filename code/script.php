<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>PVD project</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>

	<?php

		mysql_connect("localhost", "root", "root") or die(mysql_error());
		mysql_select_db("CK") or die(mysql_error());
		

		$q = $_POST['q'];
		$result = mysql_query($q);
		$haveHeader = false;

		echo "Váš dotaz je: <b>". $q ."</b></br>";
		echo "<h3>Výsledok:</h3></br>";

		if (!$result) {
		    die('Invalid query: ' . mysql_error());
		}

		/* open table with row */
		echo "<table><tr>";
		$r = mysql_fetch_assoc($result);
		$keys = array();

		foreach( $r as $key => $value ){
			echo "<th>" .$key. "</th>";
			$keys[] = $key;
		}
		/* close first row */
		echo "</tr>";


		/* TODO: fixme */
		/* get result again, cause first item is lost in header creating process */
		$result = mysql_query($q);

		/* iterate through results and print them to the table */
		while ($row = mysql_fetch_assoc($result)) {
			echo "<tr>";
			foreach ($keys as $value) {
				echo "<td>";
				echo $row[$value];
				echo "</td>";
			}
			echo "</tr>";
		}

		/* close table */
		echo "</table>";
	?>
	
    </body>
</html>