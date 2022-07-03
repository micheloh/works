<?php
session_start();
ob_start();
if (!isset($_SESSION['logado'])) {
    header('Location: cpLogin.php');
    exit;
}
if (!($_SESSION['logado'] == 1)) {
    header('Location: cpLogin.php');
    exit;
}
include_once('BDfiles/BDAccess.php');
if (mysqli_connect_errno()) {
    header('Location: 404.html');
    exit;
}
//inserir verificacao do ususario aqui
?>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Japan Travel - Painel de Controle</title>
        <link rel="stylesheet" type="text/css" href="cp.css">
    </head>
    <script>
        function cancelar()
        {
            window.location = "cpContato.php";
        }
    </script>

    <body>
        <div id="cpConteinerPrincipal">

            <?php
            include('Templates/menuTop.html');
            include('Templates/menuLateral.html');
            $formUser = $_POST["formUser"];
            $formPass = $_POST["formPass"];
            $houveMudanca = 0;
            if ($formUser !== NULL && $formPass !== NULL) {
                if ($statement = $mysqli->prepare("UPDATE ajTravelLogin set loginUser = ? , loginSenha = ? where loginUser = ? and loginSenha = ?")) {
                    if ($statement->bind_param("ssss", $formUser, $formPass, $_SESSION['user'], $_SESSION['pass'])) {
                        if ($statement->execute()) {
                            
                        }
                    }
                    $statement->close();
                }
                if ($statement = $mysqli->prepare("select loginUser,loginSenha from ajTravelLogin where loginUser = ? and loginSenha = ?")) {
                    if ($statement->bind_param("ss", $formUser, $formPass)) {
                        if ($statement->execute()) {
                            $statement->bind_result($userFind, $passFind);
                            if ($statement->fetch()) {
                                $_SESSION['logado'] = 1;
                                $_SESSION['user'] = $userFind;
                                $_SESSION['pass'] = $passFind;
                                $houveMudanca = 1;
                            } else {
                                $_SESSION['logado'] = 0;
                                $_SESSION['user'] = "";
                                $_SESSION['pass'] = "";
                                $houveMudanca = 3;
                            }
                        }
                    }
                }
            }
            ?>
            <div id="conteudoPagina">

                <span id="cpContatoTitulo"><b>Contato:</b></span>

                <form action="cpConfig.php" id="ContatoForm" method="post">
                    <br><br>
                    <span>Usuário:</span><input type="text" maxlength="32" name="formUser" value="<?php echo $_SESSION['user']; ?>">
                    <br>
                    <span>Senha:</span><input type="text" maxlength="32" name="formPass" value="<?php echo $_SESSION['pass']; ?>">
                    <br>
                    <?php
                    if ($houveMudanca == 1)
                        echo 'Atualização realizada com sucesso';
                    else if ($houveMudanca == 2)
                        echo 'Não foi possível atualizar os dados, por favor tente novamente';
                    else if ($houveMudanca == 3)
                        echo 'Erro de usuário, por favor faça seu login novamente;';                    
                    ?>
                    <br><br>
                    <?php
                    if ($houveMudanca != 3)
                    {
                    ?>
                    <input type="submit" class="cpConfigSalva" value="Atualizar"> <button type="button" class="cpConfigCancela" onclick="cancelar()">Cancelar</button>
                    <?php
                    }
                    ?>

                </form>
            </div>

        </div>
    </body>

</html>