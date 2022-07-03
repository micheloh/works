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
            $formConteudo = $_POST["cpContatoConteudo"];
            $houveMudanca = 0;
            $removerCache = 0;
            if ($formConteudo !== NULL) {
                if ($mysqli->query('UPDATE ajTravelContato set contatoConteudo = "' . $formConteudo . '" where contatoId = 1')) {
                    $houveMudanca = 1;
                    $removerCache = 1;
                }
                else
                    $houveMudanca = 2;
            }
            if ($removerCache == 1) {
                if (file_exists("../DC/cache/infoContato.html")) {
                    unlink("../DC/cache/infoContato.html");
                }
            }
            ?>
            <div id="conteudoPagina">

                <span id="cpContatoTitulo"><b>Contato:</b></span>

                <form action="cpContato.php" id="ContatoForm" method="post">
                    <br><br>
                    <textarea name="cpContatoConteudo" form="ContatoForm" style="resize:none; width: 400px; height: 100px;" maxlength="1000" tabindex=70><?php
                        if ($statement = $mysqli->prepare('SELECT contatoConteudo FROM ajTravelContato where contatoId = 1')) {
                            if ($statement->execute()) {
                                $statement->bind_result($formConteudo);
                                if ($statement->fetch()) {
                                    echo $formConteudo;
                                }
                            }
                            $statement->close();
                        }
                        ?></textarea><br>
                    <?php
                    if ($houveMudanca == 1)
                        echo 'Atualização realizada com sucesso';
                    else if ($houveMudanca == 2)
                        echo 'Não foi possível atualizar os dados, por favor tente novamente';
                    ?>
                    <br><br>

                    <input type="submit" class="cpServicosSalva" value="Atualizar"> <button type="button" class="cpServicosCancela">Cancelar</button>

                </form>
            </div>

        </div>
    </body>

</html>