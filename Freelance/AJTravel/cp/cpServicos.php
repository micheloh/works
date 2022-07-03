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
        function inserirNovoTopico()
        {
            var x;

            var nome = prompt("Insira o nome do novo tópíco", "Novo tópico");

            if (nome !== null)
            {
                    x = nome;
                    window.location = "cpServicos.php?insere=" + nome;

            }
        }


        function deletarTopico()
        {
            if (confirm("Deletar o tópico?"))
            {
                window.location = "cpServicos.php?deleta=" + document.getElementById("cpServicosTopico").value;
            }
        }

        function mudarTopico()
        {
            window.location = "cpServicos.php?verifica=" + document.getElementById("cpServicosTopico").value;
        }


    </script>

    <body>
        <div id="cpConteinerPrincipal">

            <?php
            include('Templates/menuTop.html');
            include('Templates/menuLateral.html');
            $formTopico = $_POST["cpServicosTopico"];
            $formConteudo = $_POST["cpServicosConteudo"];
            $houveMudanca = 0;
            $existeTopico = 0;
            $removerCache = 0;
            if ($formTopico !== NULL && $formConteudo !== NULL) {
                if ($mysqli->query('UPDATE ajTravelServicos set ServicosConteudo = "' . $formConteudo . '" where ServicosId = ' . $formTopico)) {
                    $houveMudanca = 1;
                    $existeTopico = 1;
                    $removerCache = 1;
                }
                else
                    $houveMudanca = 2;
            }
            else {
                $formTopicoInsert = $_GET['insere'];
                if ($formTopicoInsert !== NULL) {
                    if ($statement = $mysqli->prepare('INSERT INTO ajTravelServicos (ServicosTitulo) values (?)')) {
                        if ($statement->bind_param("s", utf8_decode($formTopicoInsert))) {
                            if ($statement->execute()) {
                                $houveMudanca = 3;
                                $removerCache = 1;
                            }
                            else
                                $houveMudanca = 2;
                        }
                        $statement->close();
                    }
                }
                $formTopicoDelete = $_GET['deleta'];
                if ($formTopicoDelete !== NULL) {
                    if ($statement2 = $mysqli->prepare('DELETE FROM ajTravelServicos where ServicosId =?')) {
                        if ($statement2->bind_param("s", utf8_encode($formTopicoDelete))) {
                            if ($statement2->execute()) {
                                $houveMudanca = 4;
                                $removerCache = 1;
                            }
                            else
                                $houveMudanca = 2;
                        }
                        $statement2->close();
                    }
                }
                $formTopico = $_GET['verifica'];
                if ($formTopico == NULL) {
                    if ($statement2 = $mysqli->prepare('SELECT ServicosId FROM ajTravelServicos ORDER BY ServicosId LIMIT 1')) {
                        if ($statement2->execute()) {
                            $statement2->bind_result($formTopico);
                            if ($statement2->fetch()) {
                                $existeTopico = 1;
                            }
                        }
                        $statement2->close();
                    }
                } else {
                    if ($statement2 = $mysqli->prepare('SELECT ServicosId FROM ajTravelServicos where ServicosId =' . $verifica)) {
                        if ($statement2->execute()) {
                            $statement2->bind_result($formTopico);
                            if ($statement2->fetch()) {
                                $existeTopico = 1;
                            }
                        }
                        $statement2->close();
                    }
                }
            }
            if ($removerCache == 1) {
                if (file_exists("../DC/cache/servicos.php")) {
                    unlink("../DC/cache/servicos.php");
                }
            }
            ?>
            <div id="conteudoPagina">

                <span id="cpServicosTitulo"><b>Serviços</b></span>

                <br><br>
                <form action="cpServicos.php" id="ServicosForm" method="post">
                    <span id="cpServicosLabel">Tópico:</span> 
                    <select name="cpServicosTopico" id="cpServicosTopico" form="ServicosForm" onchange="mudarTopico()" style="width: 200px;">
<?php
if ($statement = $mysqli->prepare("
				select 
                                ServicosId,
				ServicosTitulo
				from ajTravelServicos
                                ")) {
    if ($statement->execute()) {
        $statement->bind_result($topicoId, $topicoNome);
        while ($statement->fetch()) {
            $topicoNome = htmlentities($topicoNome);
            ?>
                                    <option value="<?php echo $topicoId; ?>" <?php if ($topicoId == $formTopico) echo 'selected'; ?>><?php echo $topicoNome; ?></option>
                                    <?php
                                }
                            }
                        }
                        $statement->close();
                        ?></select>
                    <br><br>
                    <button type="button" class="cpServicosInsereNovo" onclick="inserirNovoTopico()">Inserir novo tópico</button> <button type="button" class="cpServicosDeletar" onclick="deletarTopico()">Deletar tópico</button>

                    <br><br>
<?php
if ($existeTopico == 1) {
    ?>                        
                        <span id="cpServicosLabel">Conteudo:</span> <br>
                        <textarea name="cpServicosConteudo" form="ServicosForm" style="resize:none; width: 400px; height: 100px;" maxlength="2000" tabindex=70><?php
                        if ($formTopico !== NULL) {
                            if ($statement = $mysqli->prepare('SELECT ServicosConteudo FROM ajTravelServicos where ServicosId = ' . $formTopico)) {
                                if ($statement->execute()) {
                                    $statement->bind_result($formConteudo);
                                    if ($statement->fetch()) {
                                        echo $formConteudo;
                                    }
                                }
                                $statement->close();
                            }
                        }
                        ?></textarea><br>
                            <?php
                        }
                        if ($houveMudanca == 1)
                            echo 'Atualização realizada com sucesso';
                        else if ($houveMudanca == 2)
                            echo 'Não foi possível atualizar os dados, por favor tente novamente';
                        else if ($houveMudanca == 3)
                            echo 'Tópico inserido com sucesso';
                        else if ($houveMudanca == 4)
                            echo 'Tópico deletado com sucesso';
                        ?>
                    <br><br>
                    <?php
                    if ($existeTopico == 1) {
                        ?>                       
                        <input type="submit" class="cpServicosSalva" value="Atualizar"> <button type="button" class="cpServicosCancela" onclick="mudarTopico()">Cancelar</button>
                        <?php
                    }
                    ?>
                </form>
            </div>

        </div>
    </body>

</html>