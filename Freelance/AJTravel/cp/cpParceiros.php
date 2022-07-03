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
    <?php
    $numeroParceiro = 0;
    if (!empty($_GET["parceiro"])) {
        $numeroParceiro = $_GET["parceiro"];
        if ($numeroParceiro == 0 || $numeroParceiro < 0) {
            $numeroParceiro = 0;
        }
    }
    if (!empty($_GET["parceiroDel"])) {
        $numeroParceiroDeleta = $_GET["parceiroDel"];
        if ($numeroParceiroDeleta == 0 || $numeroParceiroDeleta < 0) {
            $numeroParceiroDeleta = 0;
        }
    }
    ?>
    <style type="text/css">

        div#cpConteinerPrincipal div#conteudoPagina div#cpParceiroListagem ul {
            padding:0px;
            margin:0px;
            float: left;
            background-color:#ffffff;
            list-style:none;
            border: 1px solid;
        }

        div#cpConteinerPrincipal div#conteudoPagina div#cpParceiroListagem ul li { display: inline; }

        div#cpConteinerPrincipal div#conteudoPagina div#cpParceiroListagem ul li a {
            background-color:#ffffff;
            color: #333;
            text-decoration: none;
            padding: 2px 10px;
            float:left;
            cursor:pointer
        }
        div#cpConteinerPrincipal div#conteudoPagina div#cpParceiro
        {
            border: 1px solid;
            width: 600px;
            height: 500px;
            padding: 10px;
        }
    </style>

    <script>
        var paginaAtual = <?php
    if ($statement = $mysqli->prepare('SELECT parceiroId FROM ajTravelParceiro where parceiroId = ' . $numeroParceiro)) {
        if ($statement->execute()) {
            if ($statement->fetch()) {
                
            }
        } else {
            $numeroParceiro = 0;
        }
        $statement->close();
    }
    echo $numeroParceiro;
    ?>;

        window.onload = function()
        {
            document.getElementById("parceiroTab_" + paginaAtual).style.display = "block";
            document.getElementById("parceiroTab_" + paginaAtual).style.backgroundColor = "#cccccc";
            if (paginaAtual == 0)
            {
                document.getElementById("botaoSalva").value = "Salvar";
                document.getElementsByName("parceiroTitulo")[0].innerHTML = "Inserir novo parceiro";
            }
            else
                document.getElementsByName("parceiroTitulo2")[0].innerHTML = document.getElementById("parceiroTab_" + paginaAtual).innerHTML;

        }
        function mudarPagina(numeroPagina)
        {
            window.location = "cpParceiros.php?parceiro=" + numeroPagina;
        }

        function deletarParceiro(numeroParceiro)
        {
            var confirmar;
            confirmar = confirm("Deseja realmente deletar o parceiro?");
            if (confirmar)
                window.location = "cpParceiros.php?parceiroDel=" + numeroParceiro;
        }



        function handleFileSelect(evt) {
            var files = evt.target.files; // FileList object

            // Loop through the FileList and render image files as thumbnails.
            for (var i = 0, f; f = files[i]; i++) {

                // Only process image files.
                if (!f.type.match('image.*')) {
                    continue;
                }

                var reader = new FileReader();

                // Closure to capture the file information.
                reader.onload = (function(theFile) {
                    return function(e) {
                        // Render thumbnail.
                        var d = document.getElementById('list');

                        var olddiv = document.getElementById('cpParceiroImagem');

                        d.removeChild(olddiv);
                        var span = document.createElement('span');
                        span.innerHTML = ['<img style="width: 300px; height: 100px;" id="cpParceiroImagem" src="', e.target.result,
                            '" title="', escape(theFile.name), '"/>'].join('');
                        document.getElementById('list').insertBefore(span, null);

                    };
                })(f);

                // Read in the image file as a data URL.
                reader.readAsDataURL(f);
            }
        }


    </script>
</script>

<body>
    <div id="cpConteinerPrincipal">

        <?php
        include('Templates/menuTop.html');
        include('Templates/menuLateral.html');
        $inserido = 0;
        $deletado = 0;
        if (!empty($_POST["cpParceirosConteudo"]) && !empty($_POST["cpParceirosDescricao"])) {
            $conteudoUpdate = utf8_decode($_POST["cpParceirosConteudo"]);
            $descricaoUpdate = utf8_decode($_POST["cpParceirosDescricao"]);
            $idUpdate = $numeroParceiro;

            if ($numeroParceiro == 0) {
                if ($statement = $mysqli->prepare('INSERT INTO ajTravelParceiro (parceiroURL,parceiroTitulo,parceiroDesc) values ("","","") ')) {
                    if ($statement->execute()) {
                        $idUpdate = $mysqli->insert_id;
                    }
                    $statement->close();
                }
                $inserido = 1;
            } else {
                if ($statement = $mysqli->prepare('delete from ajTravelParceiro where parceiroId = ' . $numeroParceiroDeleta)) {
                    if ($statement->execute()) {
                        $deletado = 1;
                        if (file_exists("../Parceiros/" . $numeroParceiroDeleta . ".jpg")) {
                            unlink("../Parceiros/" . $numeroParceiroDeleta . ".jpg");
                        }
                        if (file_exists("../Parceiros/" . $numeroParceiroDeleta . ".jpeg")) {
                            unlink("../Parceiros/" . $numeroParceiroDeleta . ".jpeg");
                        }
                        if (file_exists("../Parceiros/" . $numeroParceiroDeleta . ".gif")) {
                            unlink("../Parceiros/" . $numeroParceiroDeleta . ".gif");
                        }
                        if (file_exists("../Parceiros/" . $numeroParceiroDeleta . ".png")) {
                            unlink("../Parceiros/" . $numeroParceiroDeleta . ".png");
                        }
                    }
                    $statement->close();
                }
            }
            if ($deletado == 0) {
                if ($idUpdate !== 0) {
                    $allowedExts = array("jpg", "jpeg", "gif", "png");
                    $extension = end(explode(".", $_FILES["file"]["name"]));
                    if ((($_FILES["file"]["type"] == "image/gif") || ($_FILES["file"]["type"] == "image/jpeg") || ($_FILES["file"]["type"] == "image/png") || ($_FILES["file"]["type"] == "image/pjpeg")) && ($_FILES["file"]["size"] < 5000000) && ($_FILES["file"]["size"] > 0) && in_array($extension, $allowedExts)) {
                        if ($_FILES["file"]["error"] > 0) {
                            
                        } else {
                            $nomeArquivo = $idUpdate . '.' . end(explode(".", $_FILES["file"]["name"]));
                            if (file_exists("../Parceiros/" . $nomeArquivo)) {
                                unlink("../Parceiros/" . $nomeArquivo);
                            }
                            if (!move_uploaded_file($_FILES["file"]["tmp_name"], "../Parceiros/" . $nomeArquivo)) {
                                $nomeArquivo = "";
                            }
                            if ($statement = $mysqli->prepare('UPDATE ajTravelParceiro set parceiroURL = ? , parceiroTitulo = ?, parceiroDesc = ? where parceiroId = ?')) {
                                if ($statement->bind_param("sssi", $nomeArquivo, $conteudoUpdate, $descricaoUpdate, $idUpdate)) {
                                    if ($statement->execute()) {
                                        
                                    }
                                }
                                $statement->close();
                                $inserido = 2;
                            }
                        }
                    } else {
                        if ($statement = $mysqli->prepare('UPDATE ajTravelParceiro set parceiroTitulo = ?, parceiroDesc = ? where parceiroId = ?')) {
                            if ($statement->bind_param("ssi", $conteudoUpdate, $descricaoUpdate, $idUpdate)) {
                                if ($statement->execute()) {
                                    
                                }
                            }
                            $statement->close();
                            $inserido = 2;
                        }
                    }
                    $numeroParceiro = $idUpdate;
                }
            }
        } if ($numeroParceiroDeleta != 0) {
            if ($statement = $mysqli->prepare('delete from ajTravelParceiro where parceiroId = ' . $numeroParceiroDeleta)) {
                if ($statement->execute()) {
                    if (file_exists("../Parceiros/" . $numeroParceiroDeleta . ".jpg")) {
                        unlink("../Parceiros/" . $numeroParceiroDeleta . ".jpg");
                    }
                    if (file_exists("../Parceiros/" . $numeroParceiroDeleta . ".jpeg")) {
                        unlink("../Parceiros/" . $numeroParceiroDeleta . ".jpeg");
                    }
                    if (file_exists("../Parceiros/" . $numeroParceiroDeleta . ".gif")) {
                        unlink("../Parceiros/" . $numeroParceiroDeleta . ".gif");
                    }
                    if (file_exists("../Parceiros/" . $numeroParceiroDeleta . ".png")) {
                        unlink("../Parceiros/" . $numeroParceiroDeleta . ".png");
                    }
                    $deletado = 1;
                }
                $statement->close();
            }
        }
        ?>
        <div id="conteudoPagina">
            <span id="cpParceirosTitulo"><b>Parceiros</b></span>

            <br>
            <br>

            <div id="cpParceiroListagem">
                <ul>
                    <?php
                    if ($statement = $mysqli->prepare('SELECT parceiroId FROM ajTravelParceiro')) {
                        if ($statement->execute()) {
                            $statement->bind_result($listaParceiro);
                            $atualParceiro = 1;
                            while ($statement->fetch()) {
                                ?>
                                <li><a id="parceiroTab_<?php echo $listaParceiro; ?>" onclick="mudarPagina(<?php echo $listaParceiro; ?>)"><?php echo $atualParceiro; ?></a></li>
                                <?php
                                $atualParceiro = $atualParceiro + 1;
                            }
                        }
                        $statement->close();
                    }
                    ?>
                    <li><a id="parceiroTab_0" onclick="mudarPagina(0)">Inserir novo parceiro</a></li>
                </ul>
                <span><?php
                    $atualizou = 0;
                    if ($inserido == 1) {
                        echo '<br><br>Parceiro inserido com sucesso';
                        $atualizou = 1;
                    } else if ($inserido == 2) {
                        echo '<br><br>Parceiro atualizado com sucesso';
                        $atualizou = 1;
                    }
                    if ($deletado == 1) {
                        echo '<br><br>Parceiro deletado com sucesso';
                        $atualizou = 1;
                    }
                    if ($atualizou == 1) {
                        if (file_exists("../DC/cache/parceiros.php")) {
                            unlink("../DC/cache/parceiros.php");
                        }
                    }
                    ?></span>
            </div>
            <br><br>
            <div id="cpParceiro">
                <span id="cpParceiroLabel" name="parceiroTitulo">Parceiro <span id="cpParceiroLabel2" name="parceiroTitulo2"></span></span> 

                <br><br>              
                <form action="cpParceiros.php?parceiro=<?php echo $numeroParceiro; ?>" method="post"
                      enctype="multipart/form-data" id="parceiroForm">
                          <?php
                          if ($numeroParceiro != 0) {
                              if ($statement = $mysqli->prepare('SELECT parceiroURL,parceiroTitulo,parceiroDesc FROM ajTravelParceiro where parceiroId = ' . $numeroParceiro)) {
                                  if ($statement->execute()) {
                                      $statement->bind_result($verURL, $verConteudo, $verDesc);
                                      if ($statement->fetch()) {
                                          ?>
                                    <span id="cpParceiroLabel">Imagem:</span><br>
                                    <output id="list"><img id="cpParceiroImagem" src="../Parceiros/<?php echo $verURL; ?>" style="width: 300px; height: 100px;"></output>
                                    <br>
                                    <span>Mudar imagem:</span><input type="file" id="file" name="file"/>
                                    <br>
                                    <span style="font-size: 10px;">
                                        Extensões aceitas: jpg,jpeg,gif e png
                                        <br>
                                        Tamanho máximo: 5Mb
                                        <br>
                                        Dimensões: Largura-200px / Altura-100px
                                    </span>                                    

                                    <br><br>

                                    <span id="cpParceiroLabel">Titulo:</span> <br>
                                    <input type="text" maxlength="50" style="width: 450px;" tabindex=1 name="cpParceirosConteudo" value="<?php echo htmlentities($verConteudo); ?>">        
                                    <br><br>
                                    <span id="cpParceiroLabel">Descrição:</span> <br>
                                    <textarea name="cpParceirosDescricao" style="resize:none; width: 400px; height: 100px;" maxlength="2000"><?php echo htmlentities($verDesc); ?></textarea><br>
                                    <?php
                                }
                            }
                            $statement->close();
                        }
                    } else if ($numeroParceiro == 0) {
                        ?>
                        <span id = "cpParceiroLabel">Imagem:</span><br>

                        <output id="list"><img id="cpParceiroImagem" src="" style="width: 300px; height: 100px;"></output>

                        <br>
                        <span>Mudar imagem:</span><input type="file" id="file" name="file"/>
                        <br> 
                        <span style="font-size: 10px;">
                            Extensões aceitas: jpg,jpeg,gif e png
                            <br>
                            Tamanho máximo: 5Mb
                            <br>
                            Dimensões: Largura-200px / Altura-100px                      
                        </span>                        

                        <br><br>

                        <span id = "cpParceiroLabel">Titulo:</span> <br>
                        <input type="text" maxlength="50" style="width: 450px;" tabindex=1 name="cpParceirosConteudo" value="">                         
                        <br><br>
                        <span id="cpParceiroLabel">Descrição:</span> <br>
                        <textarea name="cpParceirosDescricao" style="resize:none; width: 400px; height: 100px;" maxlength="2000"></textarea><br>                        

                        <?php
                    }
                    ?>
                    <br>
                    <input type="submit" class="cpParceiroSalva" id="botaoSalva" value="Alterar"> 
                    <?php
                    if ($numeroParceiro != 0) {
                        ?>
                        <button type="button" id="botaoDeleta" onclick="deletarParceiro(<?php echo $numeroParceiro; ?>)">Deletar</button>
                        <?php
                    }
                    ?>
                </form>
            </div>
        </div>

    </div>
</body>
<script>
        document.getElementById('file').addEventListener('change', handleFileSelect, false);
</script>
</html>