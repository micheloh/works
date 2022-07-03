<!DOCTYPE HTML>
<html>
  <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<title>Vautier Compras</title>
    	<link rel="stylesheet" type="text/css" href="/mystyle.css">
        <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
    	<link rel="canonical" href="http://www.vautiercompras.com.br/<?php if(!(empty($_GET['nome']))) echo $_GET['nome']; ?>">

</head>

<style>

div#indexMainDivCss div#indexMenuCss
{
	z-index: 4;
}

div#indexMainDivCss div#indexMenuMeioCss
{
	z-index: 4;
}



div#indexMainDivCss div#lojaFillProds
{
	position:absolute;
	background: #80C6FF;
	width: 750px;
	height: 347px;
	margin-left: 220px;
	margin-top: 245px;
	border-radius: 25px 25px 25px 25px; 
	-moz-border-radius: 25px 25px 25px 25px; 
	-webkit-border-radius: 25px 25px 25px 25px; 
	border: 0px solid #FFFFFF;
	z-index: 2;
	box-shadow: -5px -5px 5px #888888;
}

div#indexMainDivCss div#lojaFillProds table#tblProdLoja
{
	position:relative;
	border: 0px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 10px;
}

div#indexMainDivCss div#lojaFillProds table#tblProdLoja tr
{
	height: 145px;
}

div#indexMainDivCss div#lojaFillProds table#tblProdLoja td
{
	text-align: center;
	line-height:10px;
	width: 145px;	
	overflow: hidden;
}

div#indexMainDivCss div#lojaFillProds table#tblProdLoja td div#itemProd
{
	display: block;
	height: 145px;
	width: 145px;
	text-decoration: none;
	cursor: pointer;
}

div#indexMainDivCss div#lojaFillProds table#tblProdLoja td div#itemProd:hover
{
	background: #60a4DD;
}

div#indexMainDivCss div#lojaFillProds table#tblProdLoja td span
{
	font-size: 10px;
	color: black;
}

div#indexMainDivCss div#lojaFillProds table#tblProdLoja td img
{
	width: 80px;
	height: 90px;

}

div#indexMainDivCss div#lojaFillProds table#lojaPaginas
{
    position:relative;
    border: 0px;
    margin: auto;
    margin-top: 5px;
}

div#indexMainDivCss div#lojaFillProds table#lojaPaginas tr
{
    height: 30px;
}

div#indexMainDivCss div#lojaFillProds table#lojaPaginas td
{
    text-align: center;
    width: 30px;
    background: #aaaaaa;
}

div#indexMainDivCss div#lojaFillProds table#lojaPaginas td a
{
    display: block;
    height: 30px;
    width: 30px;
    line-height: 30px;
    color: black;
    text-decoration: none;
}

div#indexMainDivCss div#lojaFillProds table#lojaPaginas td a:hover
{
    background: #999999;
}

div#indexMainDivCss div#lojaBanner
{
	position:absolute;
	margin-left: 220px;
	margin-top: 50px;
	width: 280px;
	height: 180px;
	background: #ffffff;	
}

div#indexMainDivCss div#lojaBanner img
{
	width: 280px;
	height: 180px;
}

div#indexMainDivCss div#lojaBanner object
{
	width: 280px;
	height: 150px;
}


div#indexMainDivCss div#lojaFillInfo
{
    position: absolute;
    background: #71FD78;
    width: 455px;
    height: 180px;
    margin-left: 515px;
    margin-top: 50px;
    border-radius: 25px 25px 25px 25px; 
    -moz-border-radius: 25px 25px 25px 25px; 
    -webkit-border-radius: 25px 25px 25px 25px; 
    border: 0px solid #FFFFFF;
    z-index: 2;
    box-shadow: -5px -5px 5px #888888;
}

div#indexMainDivCss div#lojaFillInfo table
{
    border: 0px;
    padding-top: 14px;
    padding-left: 15px;
}

div#indexMainDivCss div#lojaFillInfo table td
{
    vertical-align: top;
}

div#indexMainDivCss div#lojaFillInfo span
{
	position: relative;
	
        padding-right: 50px;
	padding-top: 10px;
	line-height: 12px;
	font-size: 12px;
}

div#indexMainDivCss div#lojaFillInfo span#lojaInfoHead
{
	position: absolute;
	padding-top: 10px;
        padding-left: 15px;
	font-size: 20px;
}


div#indexMainDivCss div#prodShow
{
	position: relative;
	height: 100%;
	width: 100%;
	background: transparent;
	display: none;
	border-radius: 25px 25px 25px 25px; 
	-moz-border-radius: 25px 25px 25px 25px; 
	-webkit-border-radius: 25px 25px 25px 25px; 	
	z-index: 10;
}

div#indexMainDivCss div#prodShow div#prodBg
{
	position:absolute;
	margin-left: auto;
	margin-right: auto;
	width: 100%;
	height: 100%;
	background: #777777;
	opacity: 0.6;
	z-index: 9;
	vertical-align: center;
	border-radius: 25px 25px 25px 25px; 
	-moz-border-radius: 25px 25px 25px 25px; 
	-webkit-border-radius: 25px 25px 25px 25px; 	
}

div#indexMainDivCss div#prodShow div#prodConteudo
{
	position:absolute;
	text-align: center;
	width: 1000px;
	height: 600px;
	opacity: 1;
	z-index:10;
	
}

div#indexMainDivCss div#prodShow div#prodConteudo img
{
	margin-top: 10px;
	height: 400px;
	text-align: center;
}

div#indexMainDivCss div#prodShow div#prodConteudo table
{
	width: 600px;
	height: 150px;
	margin-left: auto;
	margin-right: auto;
	background: #aaaaaa;
	border: 2px;
	border-style: solid;
	font-size: 12px;
}

div#indexMainDivCss div#prodShow div#prodConteudo table td
{
	text-align: left;
	width: 250px;
	vertical-align: top;
}

</style>


<script src="/js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript">
function prodDivShow(obj,loja)
{
	if( $('#prodShow').is(':hidden') )
	{
		$('#prodShow').show(300);
		ajaxFunction(obj,loja);
		
	}
	else
	{
		$('#prodShow').hide(300);
	}
	
}

    function ajaxFunction(value,loja){
    	var xmlhttp;
    	if (window.XMLHttpRequest)
    	  {
    	  xmlhttp=new XMLHttpRequest();
    	  }
    	else
    	  {
    	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    	  }
    	
    	xmlhttp.onreadystatechange=function()
    	  {
    	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	    {
    	    document.getElementById("prodConteudo").innerHTML=xmlhttp.responseText;
    	    }
    	  }
    	document.getElementById("prodConteudo").innerHTML="";
    	xmlhttp.open("GET", "/AjaxUse/BuscaProduto.php?produto="+value+"&loja="+loja, true);
    	xmlhttp.send();
 	
    }
    </script>



<body>
<?php include 'Templates/menuTop.php'; ?>
<div id="indexMainDivCss">
<?php include 'Templates/menuEsq.php'; ?>

<?php include 'DAO/BDAccessLoja.php'?>


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
     				<a href="/buscas.php?tipoBusca=2&catBusca=Todas">Lojas</a>
			</td>			
			<td>
     				&rarr;
			</td>			
			<td>
     				<a href="/buscas.php?tipoBusca=2&catBusca=<?php echo htmlentities($rescategoria); ?>">
     				<?php echo htmlentities($rescategoria); ?>
     				</a>
			</td>			
			<td>
     				&rarr;
			</td>			
			<td>
     				<a href="/loja.php?nome=<?php echo $urlLoja; ?>">
     				<?php echo htmlentities($nomeLoja); ?>
     				</a>
			</td>			
		</tr>
	</table>
	</div>
	
	<div id="prodShow" onclick="prodDivShow()">
	 	<div id="prodBg">
	 	</div>
	 	<div id="prodConteudo">
	 	<div id="ajaxloader"></div>
	 	</div>
	 </div>	

</div>
</body>
</html>
<?php ob_end_flush(); ?>