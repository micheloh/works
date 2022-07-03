<?php
ob_start();

	include('BDAccess.php');
	

	if (mysqli_connect_errno()) 
	{
		ob_end_clean();
		header('Location: 404.html');
		exit;
	}
	else 
	{
		?>
		<div id="buscasLista">
			<table id="tableLista">
				<tr>
		<?php
                
                $strBusca = $mysqli->real_escape_string(mb_convert_encoding($strBusca, "ISO-8859-1", "auto"));
                $catParam2 = $mysqli->real_escape_string(mb_convert_encoding($catParam2, "ISO-8859-1", "auto"));
		if(strlen(trim($strBusca)) < 4 && $busParam2 == 1)
		{
			?>
			Digite no mínimo 4 caracteres.
			</tr>
			</table>		
			<?php
		}
		else
		{
			$tipoBusca = 0;
			$countStmt = 0;
			$statement = null;
			$strBuscaAux1 = null;
			$strBuscaAux2 = null;	
			$strCatAux = null;				
			if($busParam2 == 1)
			{
				$tipoBusca = 1;
				if($catParam2 === '')
				{
					if ($statement = $mysqli->prepare(
						"select
					        distinct
					        produtoId,
					        produtoNomeReduzido,
						lojaURL,
					        lojaNome,
					        produtoPreco,
                                                produtoPrecoAt,
					        produtoIMG,
					        match(produtoNomeReduzido,produtoNome,produtoDescricao)
					        against(? in boolean mode) as relevancia     
					        from produto,categoria,loja
					        where 
					        produtoLoja = lojaId
					        and
					        match(produtoNomeReduzido,produtoNome,produtoDescricao)
					        against(? in boolean mode)
					        order by relevancia DESC
					        limit ?,8"))
					{
						if($statement->bind_param( "ssi", $strBusca, $strBusca, $strPagina))
						{
							$countStmt = 1;
						}
					}
				}
				else
				{
					if ($statement = $mysqli->prepare(
						"select
					        distinct
					        produtoId,
					        produtoNomeReduzido,
						lojaURL,
					        lojaNome,
					        produtoPreco,
                                                produtoPrecoAt,
					        produtoIMG,
					        match(produtoNomeReduzido,produtoNome,produtoDescricao)
					        against(? in boolean mode) as relevancia     
					        from produto,categoria,loja
					        where 
					        produtoLoja = lojaId
					        and
					        lojaCategoria = categoriaId
					        and
					        categoriaNome = ?
					        and
					        match(produtoNomeReduzido,produtoNome,produtoDescricao)
					        against(? in boolean mode)
					        order by relevancia DESC
					        limit ?,8"))
					{
						if($statement->bind_param( "sssi", $strBusca, $catParam2, $strBusca, $strPagina))
						{
							$countStmt = 2;
						}
					}
				}
			}
			else if($busParam2 == 2)
			{
				$tipoBusca = 2;
				$strBuscaAux1 = '%' . $strBusca . '%';
				$strBuscaAux2 = $strBusca . '%';	
				$strCatAux = '%' . $catParam2 . '%';
				if($catParam2 === '')
				{
					if ($statement = $mysqli->prepare(
						"select
					        distinct
					        lojaId,
						lojaURL,
					        lojaNome,
					        categoriaNome,
					        lojaIMG
					        from categoria,loja
					        where 
					        lojaNome LIKE ?
					        and
					        lojaCategoria = categoriaId
					        order by case 
					            when lojaNome LIKE ? then 1 
					            when lojaNome LIKE ?  then 2 
					            else 3 
					            end
					        limit ?,8"))
					{
						if($statement->bind_param( "sssi", $strBuscaAux1, $strBuscaAux2, $strBuscaAux1, $strPagina))
						{
							$countStmt = 3;
						}
					}
				}
				else
				{
					if ($statement = $mysqli->prepare(
						"select
					        distinct
					        lojaId,
						lojaURL,
					        lojaNome,
					        categoriaNome,
					        lojaIMG
					        from categoria,loja,cat_loja
					        where 
					        lojaNome LIKE ?
					        and
					        cat_lojaCategoria = categoriaId
					        and
					        cat_lojaLoja = lojaId
					        and
					        categoriaNome like ?
					        group by lojaId
					        order by case 
					            when lojaNome LIKE ? then 1 
					            when lojaNome LIKE ?  then 2 
					            else 3 
					            end
					        limit ?,8"))
					{
						if($statement->bind_param( "ssssi", $strBuscaAux1, $strCatAux , $strBuscaAux2, $strBuscaAux1, $strPagina))
						{
							$countStmt = 4;
						}
					}
				}
			}
			if($statement->execute())
			{
				$qtde = 0;
				$listaRow = 0;
				if($tipoBusca == 1)
				{
					$statement->bind_result($resPId, $resPNr, $resLURL, $resLN, $resPP, $resPPAt, $resPIMG, $resRel);
					while ($statement->fetch())
					{
						if($qtde == 0)
							$qtde = 1;
						?>
						<td>
							<table id="itemLista" onclick="lojaRedirect('<?php echo $resLURL; ?>')">
								<tr>
								<td id="itemPhoto">
									<img alt="" src="<?php echo 'Images/' . $resLURL . '/' . $resPIMG; ?>" align="top" />
								</td>
								<td>
									<span>
										Loja: <?php echo htmlentities($resLN); ?> <br>
										Produto: <?php echo htmlentities($resPNr); ?> <br> 
                                                                                Preco: 
                                                                                    <?php
                                                                                        if(!is_null($resPP)) echo 'R$ ' . str_replace(".", ",",$resPP) . ' - VA';
                                                                                        if(!is_null($resPPAt)) 
                                                                                        {
                                                                                            if(!is_null($resPP)) echo ' | ';
                                                                                            echo 'R$ ' . str_replace(".", ",",$resPPAt) . ' - AT';
                                                                                        }
                                                                                    ?>
									</span>
								</td>
								</tr>
							</table>

						</td>
						<?php
						$listaRow++;
						if(($listaRow % 2) == 0)
						{
							?>
							</tr>
							<tr>
							<?php
							$listaRow = 0;
						}							
					}
				}
				else if($tipoBusca == 2)
				{
					$statement->bind_result($resLId, $resLURL, $resLN, $resCN, $resLIMG);
					while ($statement->fetch())
					{
						if($qtde == 0)
							$qtde = 1;
						?>
						<td>

							<table id="itemLista" onclick="lojaRedirect('<?php echo $resLURL; ?>')">
								<tr>
								<td id="itemPhoto">
									<img alt="" src="<?php echo 'Images/' . $resLURL . '/' . $resLIMG; ?>" align="top" />
								</td>
								<td>
									<span>
										Loja: <?php echo htmlentities($resLN); ?> <br>
										Categoria: <?php echo htmlentities($resCN); ?>
									</span>
								</td>
								</tr>
							</table>
							
						</td>
						<?php
						$listaRow++;
						if(($listaRow % 2) == 0)
						{
							?>
							</tr>
							<tr>
							<?php
							$listaRow = 0;
						}								
					}					
				}
				?>
					</table>
				<?php
				if($qtde == 0)
				{
					?>
					Nenhum resultado encontrado:
					<br> -Use palavras menos específicas.
					<br> -Tente palavras-chaves diferentes.
					<?php
				}
				else
				{
					?>				
					<table id="indexLista">
					<tr>
					<?php
					$statement->close();
					$statement2 = null;
					if($countStmt == 0)
					{
					}
					else
					{
						if($countStmt == 1)
						{
							if($statement2 = $mysqli->prepare(
							"select
						        ceil(count(distinct produtoId)/8)
						        from produto,loja
						        where 
						        produtoLoja = lojaId
						        and
						        match(produtoNomeReduzido,produtoNome,produtoDescricao)
						        against(? in boolean mode)"))
							{
								if($statement2->bind_param("s", $strBusca))
								{
								}
							}
						}
						else if($countStmt == 2)
						{
							if($statement2 = $mysqli->prepare(
							"select
						        ceil(count(distinct produtoId)/8) as qtde   
						        from produto,categoria,loja
						        where 
						        produtoLoja = lojaId
						        and
						        lojaCategoria = categoriaId
						        and
						        categoriaNome = ?
						        and
						        match(produtoNomeReduzido,produtoNome,produtoDescricao)
						        against(? in boolean mode)"))
							{
								if($statement2->bind_param( "ss", $catParam2, $strBusca))
								{						
								}
							}
						}
						else if($countStmt == 3)
						{
							if($statement2 = $mysqli->prepare(
							"select
						        ceil(count(distinct lojaId)/8) as qtde
						        from categoria,loja
						        where 
						        lojaNome LIKE ?
						        and
						        lojaCategoria = categoriaId"))
							{
								if($statement2->bind_param("s", $strBuscaAux1))
								{							
								}
							}
						}	
						else if($countStmt == 4)
						{
							if($statement2 = $mysqli->prepare(
							"select
						        ceil(count(distinct lojaId)/8) as qtde
						        from categoria,loja,cat_loja
						        where 
						        lojaNome LIKE ?
						        and
						        cat_lojaCategoria = categoriaId
						        and
						        cat_lojaLoja = lojaId
						        and
						        categoriaNome like ?
						        group by lojaId"))
							{
								if($statement2->bind_param( "ss", $strBuscaAux1, $strCatAux))
								{						
								}
							}
						}
						$statement2->bind_result($resPaginas);
						if($statement2->execute())
						{
							if($statement2->fetch())
							{
								if($currentPagina > 3)
								{
									?>
										<td><a href="buscas.php?tipoBusca=<?php echo $busParam2; ?>&catBusca=<?php echo $catParam2; ?>&paramBusca=<?php echo $strBusca; ?>&pagina=<?php echo ($currentPagina-4); ?>">&laquo;</a></td>
									<?php
								}
								$paginaAux = $currentPagina - 3;
								$paginaMax = $currentPagina + 3;
								if($paginaAux < 0)
								{
									$paginaAux = 1;
								}
								if($paginaMax > $resPaginas)
								{
									$paginaMax = $resPaginas;
								}
								for(;$paginaAux <= $paginaMax;$paginaAux++)
								{
									?>
									<td><a href="buscas.php?tipoBusca=<?php echo $busParam2; ?>&catBusca=<?php echo $catParam2; ?>&paramBusca=<?php echo $strBusca; ?>&pagina=<?php echo $paginaAux; ?>"><?php echo $paginaAux; ?></a></td>	
									<?php
								}
								if($paginaAux <= $resPaginas)
								{
									?>
									<td><a href="buscas.php?tipoBusca=<?php echo $busParam2; ?>&catBusca=<?php echo $catParam2; ?>&paramBusca=<?php echo $strBusca; ?>&pagina=<? echo $paginaAux; ?>">&raquo;</a></td>							
									<?php 
								}
							}
						}
						$statement2->close();
					}	
				}
				?>
				</tr>
				</table>		
				<?php											
				
			}
		}
		?>
		</div>	
		<?php
		
	}
	mysqli_close($mysqli);
	ob_end_flush();
?>