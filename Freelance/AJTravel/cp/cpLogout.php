<?php
session_start();
ob_start();
$_SESSION['logado'] = 0;
$_SESSION['user'] = "";
$_SESSION['pass'] = "";
?>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Japan Travel - Painel de Controle</title>
        <link rel="stylesheet" type="text/css" href="cp.css">
    </head>
    <body>
        <div id="cpConteinerPrincipal">        
            <?php
            include('Templates/menuTop.html');
            ?>
            <div id="conteudoPagina">
                Logout efetuado com sucesso!
                <br>
                <br>
                <a href = "cpLogin.php">Ir para tela de login</a>
            </div>
        </div>
    </body>
</html>                