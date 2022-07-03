<?php
ob_start();

// CONNECT TO THE DATABASE
	include_once('BDAccess.php');

	
	if (mysqli_connect_errno()) {
		ob_end_clean();
		header('Location: 404.html');
		exit;
	}
	else
	{
		?>
		<div id="indexBannerSubCss">
		<table>
		<?php
		$query = "select bannerUrl as url, lojaURL as nome
    from banner,loja where bannerLoja = lojaId and bannerMaior >= 0 limit 6";
		$result = $mysqli->query($query) or die($mysqli->error.__LINE__);
		if($result->num_rows > 0) {
			$chkrow = 0;
			?>
			<tr>
			<?php
			while($row = $result->fetch_assoc()) 
			{
				if($chkrow == 2)
				{
					?>
					</tr>
					<tr>
					<?php
					$chkrow = 0;
				}
				$lojaNome = htmlentities($row['nome']);
				$lojaUrl = htmlentities($row['url']);
				echo '<td>';
				switch ($chkrow) {
					case 0:
		       				echo "<a href=\"loja.php?nome=" . $lojaNome . "\"><img alt=\"\" src=\"" . 'Images/' . $lojaNome . '/' . $lojaUrl . "\" id=\"bannerSubLeft\" align=\"top\"/></a>";
		        			break;
		        		case 1:
		        			echo "<a href=\"loja.php?nome=" . $lojaNome . "\"><img alt=\"\" src=\"" . 'Images/' . $lojaNome . '/' . $lojaUrl . "\" id=\"bannerSubRight\" align=\"top\"/></a>";
		        			break;	
				}
				$chkrow++;
				echo '</td>';
			}
			echo '<tr>';
		}
		else {
			//inserir banner de anuncie aqui
			echo '';	
		}
		echo '</table>';
		echo '</div>';
	
		$query2 = "select bannerUrl as url, lojaURL as nome
    from banner,loja where bannerLoja = lojaId and bannerMaior = 1 limit 2";
		$result2 = $mysqli->query($query2) or die($mysqli->error.__LINE__);
		if($result2->num_rows > 0) {
			echo "<div id=\"indexBannerMainCss\">";
			echo '<table>';
			echo '<tr>';
			while($row = $result2->fetch_assoc()) 
			{
				$lojaNome = htmlentities($row['nome']);
				$lojaUrl = htmlentities($row['url']);			
				echo '<td>';
				echo "<a href=\"loja.php?nome=" . $lojaNome . "\" id=\"atop\">";
				echo "<img alt=\"\" src=\"" . 'Images/' . $lojaNome . '/' . $lojaUrl . "\" id=\"bannerHead\" align=\"top\"/>";	
				echo '</a>';
				echo '</td>';
			}	
			echo '</tr>';
			echo '</table>';
			echo '</div>';	
		}
		// CLOSE CONNECTION
		mysqli_close($mysqli);
	}
	ob_end_flush();
?>