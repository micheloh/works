<?php
ob_start();
include_once('DAO/BDAccess.php');
if (mysqli_connect_errno()) {
    header('Location: 404.html');
    exit;
}
?>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AJTravel</title>
        <link rel="stylesheet" type="text/css" href="ajtravelcss.css">

    </head>

    <style>
        /* CSS para a pagina de contato */

        div#conteudo
        {
            width: 940px;
            height: 300px;
            margin: auto;
        }

        div#conteudo div#conteudoTop
        {
            width: 940px;
            height: 10px;
            position: relative;
            background-image: url('Images/bgTopLarge.png');
            background-repeat: no-repeat;
            box-shadow:0px 3px 5px #646464;
            border-radius: 25px 25px 0px 0px;            
            overflow: visible;
        }

        div#conteudo div#conteudoMain
        {
            padding-top: 20px;
            padding-left: 20px;
            width: 940px;
            height: 290px;
            background-image: url('Images/bgLarge.png');
            background-repeat: no-repeat;        
        }        

        div#conteudo div#conteudoMain div#infoContato
        {
            width: 400px;
            float:right;
        }

        div#conteudo div#conteudoMain div#infoContato span#infoEmpresa
        {
            font-size: 12px;
        }

        div#conteudo div#conteudoMain div#contatoDiv
        {

            width: 500px;
            float:left;
        }

        div#conteudo div#conteudoMain div#contatoDiv span#tituloContato
        {
            padding-left: 20px;
            font-size: 18px;
        }

        div#conteudo div#conteudoMain div#contatoDiv table
        {
            width:500px;
            padding-left: 20px;
        }

        div#conteudo div#conteudoMain div#contatoDiv table tr td#alinhaDir
        {
            font-size: 14px;
            text-align: left;
            width: 100px;    
        }

        div#conteudo div#conteudoMain div#contatoDiv table tr td input
        {

            border: 1px solid #003063; 
        }

        div#conteudo div#conteudoMain div#contatoDiv table tr td input[type="text"]
        {

            width:300px;    
        }

        div#conteudo div#conteudoMain div#contatoDiv table tr td select
        {
            width: 300px;
            text-align: left;
            border: 1px solid #003063;
        }

        div#conteudo div#conteudoMain div#contatoDiv table tr td textarea
        {
            resize:none; 
            width: 300px; 
            height: 100px;
            border: 1px solid #003063;
        }

        div#conteudo div#conteudoMain div#contatoDiv table tr td button
        {
            background: #ffffff;
            border: 1px solid #003063;
            font-weight: normal;
        }

        div#conteudo div#conteudoMain div#contatoDiv h3
        {
            text-align: center;
            font-size: x-large;
        }

        div#conteudo div#conteudoMain div#contatoDiv h4
        {
            text-align: center;
        }


    </style>

    <?php include('DC/bannerConstructor.php'); ?>

    <body>
        <div id="conteinerPrincipal">



            <?php include 'Templates/menuTop.php'; ?>
            <?php include 'Templates/menuEsq.php'; ?>
            <?php include 'DC/bannerTemplate.php'; ?>
            <div id="paginasDiv">
                <div id="conteudo">
                    <div id="conteudoTop"></div>
                    <div id="conteudoMain">
                        <?php
                        include 'Templates/contato.html';
                        include 'DC/informacoesContato.php';
                        ?>
                    </div>
                </div>
                <?php include 'DC/footer.php'; ?>
            </div>

        </div>
    </body>
</html>