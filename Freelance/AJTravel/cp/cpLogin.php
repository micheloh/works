<?php
//inserir verificacao do ususario aqui
session_start();
// store session data
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
                <span>Painel de Controle - Login</span>
                <br><br><br>
                <div style="width: 300px;">
                    <form action="cpVerifica.php" id="ServicosForm" method="post">
                    <span>Usuário:<input type="text" maxlength="32" name="cpLoginUser"></span>
                    <br><br>
                    <span>Senha:<input type="password" maxlength="32" name="cpLoginPass"></span>
                    <br><br>
                    <input type="submit" value="Logar">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>