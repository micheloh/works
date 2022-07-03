<!DOCTYPE HTML>
<?php ob_start(); ?>

<html>
 <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<title>Vautier Compras</title>
    	<link rel="stylesheet" type="text/css" href="/mystyle.css">
        <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">

</head>
<style>
	div#indexMainDivCss div#buscasHead
	{
		position:absolute;
		background: #EFEC69;
		width: 500px;
		height: 100px;
		margin-left: 250px;
		margin-top: 40px;
		border-radius: 25px 25px 25px 25px; 
		-moz-border-radius: 25px 25px 25px 25px; 
		-webkit-border-radius: 25px 25px 25px 25px; 
		border: 0px solid #FFFFFF;
		z-index: 2;
		box-shadow: -5px -5px 5px #888888;
	}


	div#indexMainDivCss div#buscasHead table
	{
		border: 0px;
		margin-left: 20px;
		margin-top: 20px;
	}

	div#indexMainDivCss div#buscasHead table td
	{
		vertical-align: top;
	}


	div#indexMainDivCss div#buscasHead span
	{
		position: relative;
		padding-left: 15px;
		padding-top: 10px;
		line-height: 22px;
		font-size: 12px;
	}

	div#indexMainDivCss div#buscasLista
	{
		position: absolute;
		margin-left: 240px;
		margin-top: 150px;	
	}

	div#indexMainDivCss div#buscasLista table#tableLista
	{
		width: 600px;
	}



	div#indexMainDivCss div#buscasLista table#tableLista tr
	{
	
	}

	div#indexMainDivCss div#buscasLista table#tableLista tr td
	{
		width: 300px;
	}

	div#indexMainDivCss div#buscasLista table#tableLista tr td a
	{
		display: block;
		height: 70px;
		width: 300px;
		border: 1px;
		border-style: solid;
		border-color: black;
		text-decoration: none;
		color: black;
	}

	div#indexMainDivCss div#buscasLista table#tableLista tr td table#itemLista
	{
		border: 1px;
		border-style: solid;
		height: 70px;
		width: 300px;	
		cursor: pointer;	
	}
	
	div#indexMainDivCss div#buscasLista table#tableLista tr td table#itemLista:hover
	{
		background: #dddddd;
	}
	
	div#indexMainDivCss div#buscasLista table#tableLista tr td table#itemLista tr td span
	{
		font-size: 12px;
		display: block;
	}
	
	div#indexMainDivCss div#buscasLista table#tableLista tr td table#itemLista tr td#itemPhoto
	{
		height: 70px;
		width: 70px;
	}
	
	div#indexMainDivCss div#buscasLista table#tableLista tr td table#itemLista tr td#itemPhoto img
	{
		height: 60px;
		width: 60px;
		
	}

	div#indexMainDivCss div#buscasLista table#indexLista
	{
		position:relative;
		border: 0px;
		margin: auto;
		margin-top: 10px;
	}
	
	div#indexMainDivCss div#buscasLista table#indexLista tr
	{
		height: 30px;	
	}
	
	div#indexMainDivCss div#buscasLista table#indexLista td
	{
		text-align: center;
		width: 30px;
		background: #cccccc;
	}

	div#indexMainDivCss div#buscasLista table#indexLista td a
	{
		display: block;
		height: 30px;
		width: 30px;
		line-height: 30px;
		color: black;
		text-decoration: none;
	}
	
	div#indexMainDivCss div#buscasLista table#indexLista td a:hover
	{
		background: #aaaaaa;
	}

</style>

<script>
function lojaRedirect(cel)
{
document.location.href = '/' + cel;
}
</script>


<body>
<?php include 'Templates/menuTop.php'; ?>
<div id="indexMainDivCss">
<?php include 'Templates/menuEsq.php'; ?>

<div id="buscasHead">
<form name="formBusca" action="" method="get" id="buscaForm">
<table>
<tr>
	<td>
		Buscar por:
	</td>
	<td>
		<select name="tipoBusca" form="buscaForm">
		<?php
		if(empty($_GET['tipoBusca']))
		{
			$busParam = 1;
		}
		else
		{
			$busParam = $_GET['tipoBusca'];
			$busParam2 = 1;
		}
		?>
		
		<option value="1" <?php if($busParam == 1){ echo 'selected'; $busParam2 = $busParam; }?>>Produto</option>
		<option value="2" <?php if($busParam == 2){ echo 'selected'; $busParam2 = $busParam; }?>>Loja</option>
	</select>
	</td> 
	<td>
		Categoria:
	</td>
	<td>
		<select name="catBusca" form="buscaForm">
			<?php
			if(empty($_GET['catBusca']))
			{
				$catParam = '';
			}
			else
			{
				$catParam = $_GET['catBusca'];
				$catParam2 = '';
			}
			?>
			<option value="" <?php if($catParam === ''){ echo 'selected'; $catParam2 = $catParam; }?>>Todas</option>
			<option value="Moda" <?php if($catParam === 'Moda'){ echo 'selected'; $catParam2 = $catParam; }?>>Moda</option>
			<option value="Moda Feminina" <?php if($catParam === 'Moda Feminina'){ echo 'selected'; $catParam2 = $catParam; }?>>Moda Feminina</option>  					
			<option value="Moda Masculina" <?php if($catParam === 'Moda Masculina'){ echo 'selected'; $catParam2 = $catParam; }?>>Moda Masculina</option>
			<option value="Moda Infantil" <?php if($catParam === 'Moda Infantil'){ echo 'selected'; $catParam2 = $catParam; }?>>Moda Infantil</option>
			<option value="Moda Jovem" <?php if($catParam === 'Moda Jovem'){ echo 'selected'; $catParam2 = $catParam; }?>>Moda Jovem</option>
			<option value="Moda Íntima" <?php if($catParam === 'Moda Íntima'){ echo 'selected'; $catParam2 = $catParam; }?>>Moda Íntima</option>
                        <option value="Acessórios" <?php if($catParam === 'Acessórios'){ echo 'selected'; $catParam2 = $catParam; }?>>Acessórios</option>                        
                        <option value="Calçados" <?php if($catParam === 'Calçados'){ echo 'selected'; $catParam2 = $catParam; }?>>Calçados</option>                        
                        <option value="Cosméticos" <?php if($catParam === 'Cosméticos'){ echo 'selected'; $catParam2 = $catParam; }?>>Cosméticos</option>                                                
			<option value="Jeans" <?php if($catParam === 'Jeans'){ echo 'selected'; $catParam2 = $catParam; }?>>Jeans</option>  					
			<option value="Brinquedos" <?php if($catParam === 'Brinquedos'){ echo 'selected'; $catParam2 = $catParam; }?>>Brinquedos</option>
			<option value="Informática/Eletrônica" <?php if($catParam === 'Informática/Eletrônica'){ echo 'selected'; $catParam2 = $catParam; }?>>Informática/Eletrônica</option>
			<option value="Artesanato/Decoração" <?php if($catParam === 'Artesanato/Decoração'){ echo 'selected'; $catParam2 = $catParam; }?>>Artesanato/Decoração</option>  	
                        <option value="Presentes" <?php if($catParam === 'Presentes'){ echo 'selected'; $catParam2 = $catParam; }?>>Presentes</option>
                        <option value="Embalagens" <?php if($catParam === 'Embalagens'){ echo 'selected'; $catParam2 = $catParam; }?>>Embalagens</option>                        

		</select>
	</td>			
</tr>
<tr style="height: 7px;"></tr>
<tr>
	<td colspan="3">
		<?php
		if(empty($_GET['paramBusca']))
		{
			$strBusca= '';
		}
		else
		{
			$strBusca= $_GET['paramBusca'];
		}
		?>
		<input type="text" name="paramBusca" size="45" value="<?php echo $strBusca; ?>">
	</td>
	<td>
		<input type="submit" value="Buscar">
	</td>
	
</tr>
</form>
</table>
</div>

<?php
$currentPagina = null;
$strPagina = null;
if(empty($_GET['pagina']))
{
	$currentPagina = 1;
	$strPagina = 0;
}
else
{
	$currentPagina = $_GET['pagina'];
	if(is_numeric($currentPagina))
	{
		if($currentPagina > 0)
		{
			$strPagina = $currentPagina - 1;
		}
		else
		{
			$currentPagina = 1;
			$strPagina = 0;
		}
	}
	else
	{
		$currentPagina = 1;
		$strPagina = 0; 
	}
}
$strPagina = $strPagina * 8;
?>
	
<?php include 'DAO/BDAccessSearch.php'; ?>

<div id="navegacao">
<table>
<tr>
	<td>
	<a href="/">Home</a>
	</td>
	<td>
	&rarr;
	</td>
	<td>
	<a href="/buscas.php">Busca</a>
	</td>     		
</tr>
</table>
</div>
</body>
</html>
<?php ob_end_flush(); ?>