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

            var nome=prompt("Insira o nome do novo tópíco","Nome do novo tópico");

            if (nome!=null)
            {
                x=nome;
                window.location = "cpAllJapanTravel.php?insere=" + nome;
            }
        }
 
        
        function deletarTopico()
        {
            if (confirm("Deletar o tópico?"))
            {
                window.location = "cpAllJapanTravel.php?deleta=" + document.getElementById("cpAllJapanTravelTopico").value;
            }
        }          

        function mudarTopico()
        {
            window.location = "cpAllJapanTravel.php?verifica=" + document.getElementById("cpAllJapanTravelTopico").value;
        }

    </script>

    <body>
        <div id="cpConteinerPrincipal">

            <?php
            include('Templates/menuTop.html');
            include('Templates/menuLateral.html');
            $formTopico = $_POST["cpAllJapanTravelTopico"];
            $formConteudo = $_POST["cpAllJapanTravelConteudo"];
            $existeTopico = 0;
            $houveMudanca = 0;
            $removerCache = 0;
            if ($formTopico !== NULL && $formConteudo !== NULL) {
                if ($mysqli->query('UPDATE ajTravelAJT set AJTConteudo = "' . $formConteudo . '" where AJTId = ' . $formTopico)) {
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
                    if ($statement = $mysqli->prepare('INSERT INTO ajTravelAJT (AJTTitulo) values (?)')) {
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
                    if ($statement2 = $mysqli->prepare('DELETE FROM ajTravelAJT where AJTId =?')) {
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
                    if ($statement2 = $mysqli->prepare('SELECT AJTId FROM ajTravelAJT ORDER BY AJTId LIMIT 1')) {
                        if ($statement2->execute()) {
                            $statement2->bind_result($formTopico);
                            if ($statement2->fetch()) {
                                $existeTopico = 1;
                            }
                        }
                        $statement2->close();
                    }
                } else {
                    if ($statement2 = $mysqli->prepare('SELECT AJTId FROM ajTravelAJT where AJTId =' . $verifica)) {
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
                if (file_exists("../DC/cache/ajTravel.php")) {
                    unlink("../DC/cache/ajTravel.php");
                }
            }
            ?>
            <div id="conteudoPagina">

                <span id="cpAllJapanTravelTitulo"><b>All Japan Travel</b></span>

                <br><br>
                <form action="cpAllJapanTravel.php" id="AJTForm" method="post">
                    <span id="cpAllJapanTravelLabel">Tópico:</span> 
                    <select name="cpAllJapanTravelTopico" id="cpAllJapanTravelTopico" form="AJTForm" onchange="mudarTopico()" style="width: 200px;">
<?php
if ($statement = $mysqli->prepare("
				select 
                                AJTId,
				AJTTitulo
				from ajTravelAJT
                                ")) {
    if ($statement->execute()) {
        $statement->bind_result($topicoId, $topicoNome);
        while ($statement->fetch()) {
            ?>
                                    <option value="<?php echo $topicoId; ?>" <?php if ($topicoId == $formTopico) echo 'selected'; ?>><?php echo htmlentities($topicoNome); ?></option>
                                    <?php
                                }
                            }
                        }
                        $statement->close();
                        ?></select>
                    <br><br>
                    <button type="button" class="cpAllJapanTravelInsereNovo" onclick="inserirNovoTopico()">Inserir novo tópico</button> <button type="button" class="cpAllJapanTravelDeletar" onclick="deletarTopico()">Deletar tópico</button>

                    <br><br>
<?php
if ($existeTopico == 1) {
    ?>      
                        <span id="cpAllJapanTravelLabel">Conteudo:</span> <br>
                        <textarea name="cpAllJapanTravelConteudo" form="AJTForm" style="resize:none; width: 400px; height: 100px;" maxlength="1000" tabindex=70><?php
    if ($formTopico !== NULL) {
        if ($statement = $mysqli->prepare('SELECT AJTConteudo FROM ajTravelAJT where AJTId = ' . $formTopico)) {
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
                    <input type="submit" class="cpAllJapanTravelSalva" value="Atualizar"> <button type="button" class="cpAllJapanTravelCancela" onclick="mudarTopico()">Cancelar</button>
                        <?php
                    }
                    ?>                    
                </form>
            </div>

        </div>
    </body>

</html>