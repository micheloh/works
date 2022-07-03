<?php
	ob_start();
	include('../DAO/BDAccess.php');
	if (mysqli_connect_errno() || empty($_GET['produto']) || empty($_GET['loja'])) 
	{
		ob_end_clean();
		exit;
	}
	else 
	{

		$ajxProd = $mysqli->real_escape_string($_GET['produto']);
		$ajxLoja = $mysqli->real_escape_string($_GET['loja']);
		if ($statement = $mysqli->prepare("
				select 
				produtoNome, 
				produtoDescricao,
				produtoPreco,
				produtoPrecoAt,
				produtoIMG
				from produto where produtoId = ?"))
		{
			if($statement->bind_param( "s", $ajxProd ))
			{
				if($statement->execute())
				{
					$statement->bind_result($resajxnome, $resajxdesc, $resajxpreco, $resajxprecoAt, $resajxurl);
					if(!($statement->fetch()))
					{
						ob_end_clean();
						exit;
					}
					else
					{
                                                $statement->close();
                                                $mysqli->query("UPDATE produto SET produtoCliques=produtoCliques+1 WHERE produtoId=" . $ajxProd);
						?>
						<html>
						<head>
						<body>
						<img src="<?php echo '/Images/' . $ajxLoja . '/' . $resajxurl; ?>" alt="" id="prodImgConteudo"/>
						<table>
						<tr>
							<td><b>Produto:</b><br><span id="frameProdDesc"><?php echo htmlentities($resajxnome); ?></span></td>
							<td rowspan="10" valign="top"><b>Mais Informações:</b><br><span id="frameProdMoreDesc"><?php echo str_replace("|", "<br>", htmlentities($resajxdesc)); ?><span></td>
						</tr>
						<tr>
							<td><b>Preço:</b><br>
								<span id="frameProdPreco">
									<?php 
									if(!is_null($resajxpreco)) echo 'Varejo - R$ ' . str_replace(".", ",", htmlentities($resajxpreco)) . '<BR>';
									if(!is_null($resajxprecoAt)) echo 'Atacado - R$ ' . str_replace(".", ",", htmlentities($resajxprecoAt)); 
									
                                                                        ?>
								</span>
							</td>
						</tr>
						</table>
						Clique em qualquer lugar dessa janela para fecha-la
						</body>
						</html>	
						<?php					
					}
				}
			}
		}
	
	}
mysqli_close($mysqli);	
ob_end_flush();
?>		