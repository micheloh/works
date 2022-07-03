<?php
session_start();
ob_start();
include('BDfiles/BDAccess.php');
if (mysqli_connect_errno()) {
    header('Location: 404.html');
    exit;
}
$_SESSION['logado'] = false;
$_SESSION['user'] = "";
$_SESSION['pass'] = "";
$formUser = $_POST["cpLoginUser"];
$formPass = $_POST["cpLoginPass"];
if ($statement = $mysqli->prepare("select loginUser,loginSenha from ajTravelLogin where loginUser = ? and loginSenha = ?")) {
    if ($statement->bind_param("ss", $formUser, $formPass)) {
        if ($statement->execute()) {
            $statement->bind_result($userFind, $passFind);
            if ($statement->fetch()) {
                $_SESSION['logado'] = 1;
                $_SESSION['user'] = $userFind;
                $_SESSION['pass'] = $passFind;
            } else {
                $_SESSION['logado'] = 0;
                $_SESSION['user'] = "";
                $_SESSION['pass'] = "";
            }
        }
    }
}
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
                    <span><?php
                    if($_SESSION['logado'] == true)
                    {
                        echo 'Login efetuado com sucesso!';
                        echo '<br><br>';
                        echo '<a href = "cpHome.php">Ir para home</a>';
                    }else
                    {
                        echo 'Login inexistente!';
                        echo '<br><br>';
                        echo '<a href = "cpLogin.php">Voltar</a>';
                    }
                    ?></span>
                </div>
            </div>
        </div>
    </body>
</html>