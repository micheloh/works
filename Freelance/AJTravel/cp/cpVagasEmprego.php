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
            
            var nome=prompt("Insira o nome da empresa","Nome da empresa");
            var segmento=document.getElementById("cpVagasEmpresasSegmento").value;
            if (nome!=null)
            {
                x=nome;
                if(segmento!=null)
                {
                    window.location = "cpVagasEmprego.php?insere=" + nome + "&segmento=" + segmento;
                }
            }
        }
 
        
        function deletarTopico()
        {
            if (confirm("Remover a empresa da lista?"))
            {
                window.location = "cpVagasEmprego.php?deleta=" + document.getElementById("cpVagasEmpresasEmpresa").value + "&segmento=" + document.getElementById("cpVagasEmpresasSegmento").value;
            }
        }          

        function mudarSegmento()
        {
            window.location = "cpVagasEmprego.php?segmento=" + document.getElementById("cpVagasEmpresasSegmento").value;
        }
        
        function mudarEmpresa()
        {
            window.location = "cpVagasEmprego.php?verifica=" + document.getElementById("cpVagasEmpresasEmpresa").value + "&segmento=" + document.getElementById("cpVagasEmpresasSegmento").value;
        }        

    </script>

    <body>
        <div id="cpConteinerPrincipal">

            <?php
            include('Templates/menuTop.html');
            include('Templates/menuLateral.html');
            $formSegmento = $_POST["cpVagasEmpresasSegmento"];
            $formEmpresa = $_POST["cpVagasEmpresasEmpresa"];
            $formDesc = $_POST["cpVagasEmpresasConteudo"];
            $houveMudanca = 0;
            $existeSegmentos = 0;
            $ver = 0;
            if ($formEmpresa !== NULL && $formDesc !== NULL && $formSegmento !== NULL) {

                if ($statement = $mysqli->prepare('UPDATE ajTravelEmpresas set empresaDesc = ? where empresaId = ? and empresaTipo = 1')) {
                    if ($statement->bind_param("ss", utf8_decode($formDesc), $formEmpresa)) {
                        if ($statement->execute()) {
                            $houveMudanca = 1;
                            $existeSegmentos = 1;
                        }
                    }
                } else {
                    $houveMudanca = 5;
                }
            } else {
                $formSegmento = $_GET['segmento'];
                if ($formSegmento != NULL) {
                    $formEmpresaInsert = $_GET['insere'];
                    if ($formEmpresaInsert !== NULL) {
                        if ($statement = $mysqli->prepare('INSERT INTO ajTravelEmpresas (empresaNome,segmentoId,empresaTipo) values (?,?,1)')) {
                            if ($statement->bind_param("ss", utf8_decode($formEmpresaInsert), $formSegmento)) {
                                if ($statement->execute())
                                    $houveMudanca = 3;
                                else
                                    $houveMudanca = 5;
                            }
                            $statement->close();
                        }
                    }
                    $formEmpresaDelete = $_GET['deleta'];
                    if ($formEmpresaDelete !== NULL) {
                        if ($statement2 = $mysqli->prepare('DELETE FROM ajTravelEmpresas where empresaId =? and empresaTipo = 1')) {
                            if ($statement2->bind_param("s", utf8_encode($formEmpresaDelete))) {
                                if ($statement2->execute())
                                    $houveMudanca = 4;
                                else
                                    $houveMudanca = 2;
                            }
                            $statement2->close();
                        }
                    }
                    $formEmpresa = $_GET['verifica'];
                    if ($formEmpresa == NULL) {
                        if ($statement2 = $mysqli->prepare('SELECT empresaId FROM ajTravelEmpresas where segmentoId = ' . $formSegmento . ' and empresaTipo = 1 ORDER BY empresaId LIMIT 1')) {
                            if ($statement2->execute()) {
                                $statement2->bind_result($formEmpresa);
                                if ($statement2->fetch()) {
                                    $existeSegmentos = 1;
                                }
                            }
                            $statement2->close();
                        }
                    }
                } else {
                    if ($statement2 = $mysqli->prepare('SELECT empresaId,segmentoId FROM ajTravelEmpresas where empresaTipo = 1 ORDER BY segmentoId LIMIT 1')) {
                        if ($statement2->execute()) {
                            $statement2->bind_result($formEmpresa, $formSegmento);
                            if ($statement2->fetch()) {
                                $existeSegmentos = 1;
                                $ver = 1;
                            }
                        }
                        $statement2->close();
                    }
                }
            }
            ?>
            <div id="conteudoPagina">

                <span id="cpVagasEmpresasTitulo"><b>Empresas</b></span>

                <br><?php echo $mysqli->error; ?><br>
                <form action="cpVagasEmprego.php" id="VagasEmpresasForm" method="post">
                    <span id="cpVagasEmpresasLabel">Segmento:</span> 
                    <select name="cpVagasEmpresasSegmento" id="cpVagasEmpresasSegmento" form="VagasEmpresasForm" onchange="mudarSegmento()" style="width: 200px;">
                        <?php
                        $existeSegmentos = 0;
                        if ($statement = $mysqli->prepare("
				select 
                                segmentoId,
				segmentoTitulo
				from ajTravelSegmentos
                                ")) {
                            if ($statement->execute()) {
                                $statement->bind_result($segmentoId, $segmentoNome);
                                while ($statement->fetch()) {
                                    $existeSegmentos = 1;
                                    $segmentoNome = htmlentities($segmentoNome);
                                    ?>
                                    <option value="<?php echo $segmentoId; ?>" <?php if ($segmentoId == $formSegmento) echo 'selected'; ?>><?php echo $segmentoNome; ?></option>
                                    <?php
                                }
                            }
                        }
                        $statement->close();
                        ?></select>
                    <br><br>
                    <?php
                    if ($existeSegmentos == 1) {
                        ?>
                        <span id="cpVagasEmpresasLabel">Empresa:</span> 
                        <select name="cpVagasEmpresasEmpresa" id="cpVagasEmpresasEmpresa" form="VagasEmpresasForm" onchange="mudarEmpresa()" style="width: 200px;">
                            <?php
                            $existeEmpresas = 0;
                            if ($statement = $mysqli->prepare("
				select 
                                empresaId,
				empresaNome
				from ajTravelEmpresas
                                where segmentoId = ?
                                and empresaTipo = 1
                                ")) {
                                if ($statement->bind_param("s", $formSegmento)) {
                                    if ($statement->execute()) {
                                        $statement->bind_result($empresaId, $empresaNome);
                                        while ($statement->fetch()) {
                                            $existeEmpresas = 1;
                                            ?>
                                            <option value="<?php echo $empresaId; ?>" <?php if ($empresaId == $formEmpresa) echo 'selected'; ?>><?php echo htmlentities($empresaNome); ?></option>
                                            <?php
                                        }
                                    }
                                }
                            }
                            $statement->close();
                            ?></select>
                        <br><br>

                        <button type="button" class="cpVagasEmpresasInsereNovo" onclick="inserirNovoTopico()">Inserir nova empresa</button> <button type="button" class="cpVagasEmpresasDeletar" onclick="deletarTopico()">Deletar empresa</button>
                        <?php
                        if ($existeEmpresas == 1) {
                            ?>
                            <br><br>

                            <span id="cpVagasEmpresasLabel">Conteudo:</span> <br>
                            <textarea name="cpVagasEmpresasConteudo" form="VagasEmpresasForm" style="resize:none; width: 400px; height: 100px;" maxlength="1000" tabindex=70><?php
                    if ($formEmpresa !== NULL) {
                        if ($statement = $mysqli->prepare('SELECT empresaDesc FROM ajTravelEmpresas where empresaTipo = 1 and empresaId = ' . $formEmpresa)) {
                            if ($statement->execute()) {
                                $statement->bind_result($formDesc);
                                if ($statement->fetch()) {
                                    echo htmlentities(stripslashes($formDesc));
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
                            echo 'Não foi possível realizar a operação, por favor tente novamente';
                        else if ($houveMudanca == 3)
                            echo 'Empresa inserida com sucesso';
                        else if ($houveMudanca == 4)
                            echo 'Empresa removida com sucesso';
                        else if ($houveMudanca == 5)
                            echo 'Eerrro';
                        ?>
                        <br><br>
                        <?php
                        if ($existeEmpresas == 1) {
                            ?>
                            <input type="submit" class="cpServicosSalva" value="Atualizar"> <button type="button" class="cpServicosCancela">Cancelar</button>
                            <?php
                        }
                    }
                    ?>
                </form>
            </div>

        </div>
    </body>

</html>