<!DOCTYPE HTML>
<?php ob_start(); ?>
<html>
  <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<title>Vautier Compras</title>
        <meta name="description" content="O seu portal de produtos da Rua Vautier e região da Feirinha da Madrugada." \>
    	<link rel="stylesheet" type="text/css" href="mystyle.css">
        <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
    	<link rel="canonical" href="http://www.vautiercompras.com.br">

</head>
<style>

div#indexMainDivCss div#indexTextoMainCss
{
width: 300px;
height: 270px;
padding: 10px;
position: absolute;
margin-left: 250px;
margin-top: 50px;
z-index: 1;
font-size: 15px;
background:#63C765;
overflow:hidden;
border-radius:15px;
-moz-border-radius:15px;
box-shadow: -5px -5px 5px #888888;
}

div#indexMainDivCss div#indexBannerMainCss
{
position: absolute;
margin-left: 250px;
margin-top: 360px;
width: 800px;
height: 170px;
}

div#indexMainDivCss div#indexBannerMainCss table
{
border: 0px;
}

div#indexMainDivCss div#indexBannerMainCss tr
{
height: 170px;
}

div#indexMainDivCss div#indexBannerMainCss td
{
width: 362px;
}

div#indexMainDivCss div#indexBannerMainCss img
{
border: 1px;
border-style: solid;
border-color: black;
width: 320px;
height: 170px;
}


div#indexMainDivCss div#indexBannerSubCss
{
position: absolute;
margin-left: 611px;
margin-top: 50px;
width: 320px;
height: 250px;
}

div#indexMainDivCss div#indexBannerSubCss img
{
border: 1px;
border-style: solid;
border-color: black;
width: 150px;
height: 70px;
}

div#indexMainDivCss div#indexBannerSubCss img#bannerSubLeft
{
margin: 5px;
}

div#indexMainDivCss div#indexBannerSubCss img#bannerSubRight
{
margin: 5px;
}




</style>

<body>
<?php include 'Templates/menuTop.php'; ?>
<div id="indexMainDivCss">
<?php include 'Templates/menuEsq.php'; ?>

	<div id="navegacao">
	<table>
		<tr>
			<td>
     				<a href="/index.php">Home</a>
			</td>
		</tr>
	</table>
	</div>
	<div id="indexTextoMainCss">
        Desculpe-nos o transtorno. <br \>
        Estamos melhorando nosso serviço para trazer mais lojas para você!
	</div>     	
	<?php include 'DAO/BDAccessBanner.php'?>


</div>

</body>
</html>
<?php ob_end_flush(); ?>