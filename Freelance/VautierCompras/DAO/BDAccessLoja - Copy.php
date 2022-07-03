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
		if(empty($_GET['nome']))
		{
			$urlLoja = '';
		}
		else
		{
			$urlLoja = $mysqli->real_escape_string($_GET['nome']);
			if ($statement = $mysqli->prepare(
						"select
			    			categoriaNome,
			    			lojaSetor,
			    			lojaBox,
			    			lojaEmail1,
			    			lojaTelefone1,
			    			lojaURL,
							lojaIMG,
			    			lojaId,
			    			lojaNome
			    			from loja,categoria where lojaNome = ? and lojaCategoria = categoriaId"))
			{
				if($statement->bind_param( "s", $urlLoja ))
				{
					if($statement->execute())
					{
						$statement->bind_result($rescategoria, $ressetor, $resbox, $resemail, $restel, $urlLoja, $resimg, $resid, $nomeLoja);
						if(!($statement->fetch()))
						{
							exit;
						}
						else
						{
							?>
							<div id="lojaBanner">
							<img src="/Images/<?php echo $urlLoja . '/' . $resimg; ?>" alt="Banner da loja"/>
							</div>
							
							<div id="lojaFillInfo">
							<span id="lojaInfoHead">
							<?php echo $nomeLoja ;?>
							</span><br><br>
							<table>
							<tr>
								<td>
									<span id="lojeInfoMainSetor"><b>Setor: </b>
									<?php echo $ressetor; ?>
									</span><br>		
								</td>
								<td rowspan="4">
									<span id="lojeInfoMainCat">
									<b>Categoria(s):</b>
									</span>	
								</td>
								<td rowspan="4">														
								<?php
								$statement->close();
								if ($statement2 = $mysqli->prepare(
									"select 
									categoriaNome as cat
									from categoria where categoriaId 
									in(select cat_lojaCategoria from cat_loja 
									where cat_lojaLoja = ?)"))
								{
									if($statement2->bind_param( "i", $resid))
									{
										if($statement2->execute())
										{
											$statement2->bind_result($resarraycat);
											while ($statement2->fetch()) {
											?>
												<span>
												<?php echo $resarraycat; ?>
												</span><br>
											<?php
											}
										}
									}
								}
								$statement2->close();
								?>
								</td>
								</tr>
								<tr>
									<td>
										<span id="lojeInfoMainBox"><b>Box: </b><?php echo $resbox; ?></span><br>
									</td>
								</tr>
								<tr>
									<td>
									<span id="lojeInfoMainTel"><b>Telefone: </b><?php echo $restel; ?></span><br>
									</td>
								</tr>
								<tr>
									<td>
									<span id="lojeInfoMainEmail"><b>E-mail: </b><?php echo $resemail; ?></span><br>
									</td>
								</tr>	
								</table>
								</div>	
								
								<div id="lojaFillProds">
								<table id="tblProdLoja">
								<tr>		
								<?php
								
								if(empty($_GET['pagina']))
								{
									$currentPagina= 1;
								}
								else
								{
									$currentPagina= $_GET['pagina'];
								}
								$minhaPaginaAnt = ($currentPagina - 1) * 10;
								$minhaPagina = $currentPagina * 10;
								if ($statement3 = $mysqli->prepare("select 
								    produtoId,
								    produtoNomeReduzido,
								    produtoIMG,
								    produtoPreco
								    from produto where produtoLoja = ? 
									order by produtoId DESC
									limit ?,?"))
								{   
									if($statement3->bind_param( "iii", $resid, $minhaPaginaAnt, $minhaPagina))	
									{
										if($statement3->execute())	
										{
											$statement3->bind_result($resprodid, $resprodnr, $resprodurl, $resprodpreco);
											$listaprodrow = 0;
											while ($statement3->fetch()) {
											?>
												<td>
												<div id="itemProd" onclick="prodDivShow(<?php echo $resprodid; ?>,'<?php echo $urlLoja; ?>')">
												<img src="<?php echo '/Images/' . $urlLoja . '/' . $resprodurl; ?>"  />
												<br><span><?php echo htmlentities($resprodnr); ?><BR><?php echo $resprodpreco; ?></span></div>
												</td>
												<?php
												$listaprodrow++;
												if($listaprodrow == 5)
												{
													$listaprodrow = 0;
													?>
													</tr></td>
													<?php
													
												}
											}
										}
									}
								}
								$statement3->close();
								?>
								</tr>
								</table>
								<table id="lojaPaginas">
								<tr>								
								<?php
								if ($statement4 = $mysqli->prepare("select 
								ceil(count(*)/10)
								from produto where produtoLoja = ?"))
								{
									if($statement4->bind_param( "i", $resid))	
									{
										if($statement4->execute())	
										{
											$statement4->bind_result($resprodmaxpage);								
											if(!($statement4->fetch()))
											{
												ob_end_clean();
												header('Location: 404.html');
												exit;
											}
											else
											{
												if($currentPagina > 3)
												{
													?>
														<td><a href="/<?php echo $urlLoja; ?>/<?php echo ($currentPagina-4); ?>">&laquo;</a></td>
													<?php
												}
												$paginaAux = $currentPagina - 3;
												$paginaMax = $currentPagina + 3;
												if($paginaAux < 0)
												{
													$paginaAux = 1;
												}
												if($paginaMax > $resprodmaxpage)
												{
													$paginaMax = $resprodmaxpage;
												}
												for(;$paginaAux <= $paginaMax;$paginaAux++)
												{
													?>
													<td><a href="/<?php echo $urlLoja; ?>/<?php echo $paginaAux; ?>"><?php echo $paginaAux; ?></a></td>
													<?php
												}
												if($paginaAux <= $resprodmaxpage)
												{
													?>
													<td><a href="/<?php echo $urlLoja; ?>/<? echo $paginaAux; ?>">&raquo;</a></td>
													<?php
												}
											}
										}
									}
								}
								
							
								?>
								</tr>
								</table>
								</div>
								<?php
								
						
						
						}								
					}
				}
			}
		}
	}
	mysqli_close($mysqli);
	ob_end_flush();
?>