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
    $numeroSegmento = 0;
    $deletar = 0;
    if(!empty($_GET["deletar"]))
    {
        $deletar = $_GET["deletar"];
    }
    
    if (!empty($_GET["segmento"]) && $deletar == 0) {
        $numeroSegmento = $_GET["segmento"];
        if ($numeroSegmento == 0 || $numeroSegmento < 0) {
            $numeroSegmento = 0;
        }
    }
    ?>
    <style type="text/css">

        div#cpConteinerPrincipal div#conteudoPagina div#cpSegmentoListagem ul {
            position: absolute;
            margin-top: 10px;
            padding:0px;
            margin:0px;
            width: 140px;
            background-color:#ffffff;
            list-style:none;
            border: 1px solid;
            text-align:center;
            z-index: 2;
        }



        div#cpConteinerPrincipal div#conteudoPagina div#cpSegmentoListagem ul li a {
            width: 100%;
            background-color:#ffffff;
            color: #333;
            text-decoration: none;
            cursor:pointer;
            display: block;

        }

        div#cpConteinerPrincipal div#conteudoPagina div#cpSegmento
        { 
            position: absolute;
            border: 1px solid;
            width: 400px;
            height: 350px;
            padding: 10px;
            margin-top: -20px;
            margin-left: 150px;
            z-index: 3;
        }
    </style>

    <script>
        var paginaAtual = <?php
    if ($statement = $mysqli->prepare('SELECT segmentoId FROM ajTravelSegmentos where segmentoId = ' . $numeroSegmento)) {
        if ($statement->execute()) {
            if ($statement->fetch()) {
                
            }
        } else {
            $numeroSegmento = 0;
        }
        $statement->close();
    }
    echo $numeroSegmento;
    ?>;

        window.onload=function()
        {
            document.getElementById("segmentoTab_" + paginaAtual).style.display="block";
            document.getElementById("segmentoTab_" + paginaAtual).style.backgroundColor="#cccccc";            
            if(paginaAtual == 0)
            {
                document.getElementById("botaoSalva").value = "Salvar";
                document.getElementsByName("segmentoTitulo")[0].innerHTML = "Inserir novo segmento";
            }
                
        }
        function mudarPagina(numeroPagina)
        {
            window.location = "cpVagasSegmento.php?segmento=" + numeroPagina;
        }
        
        function deletarSegmento(numeroPagina)
        {
            var confirmar;
            confirmar = confirm("Deseja realmente deletar o segmento junto com as empresas desse segmento?");
            if(confirmar)            
                window.location = "cpVagasSegmento.php?deletar=" + numeroPagina;
        }        
        
        function changeImage(a) {
            document.getElementById("cpSegmentoImagem").src=a;
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

                        var olddiv = document.getElementById('cpSegmentoImagem');

                        d.removeChild(olddiv);
                        var span = document.createElement('span');
                        span.innerHTML = ['<img style="width: 300px; height: 100px;" id="cpSegmentoImagem" src="', e.target.result,
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
        if($deletar != 0)
        {
            if ($statement = $mysqli->prepare('delete from ajTravelSegmentos where segmentoId = "' . $deletar . '"')) {
                if ($statement->execute()) {
                    $idUpdate = $mysqli->insert_id;
                    if (file_exists("../Segmento/" . $deletar . ".jpg")) {
                        unlink("../Segmento/" . $deletar . ".jpg");
                    }
                    if (file_exists("../Segmento/" . $deletar . ".jpeg")) {
                        unlink("../Segmento/" . $deletar . ".jpeg");
                    }
                    if (file_exists("../Segmento/" . $deletar . ".gif")) {
                        unlink("../Segmento/" . $deletar . ".gif");
                    }
                    if (file_exists("../Segmento/" . $deletar . ".png")) {
                        unlink("../Segmento/" . $deletar . ".png");
                    }                          
                }
                $statement->close();
            }
            $inserido = 3;
        }
        else
        {
        if (!empty($_POST["cpSegmentoTitulo"])) {
            $conteudoUpdate = utf8_decode($_POST["cpSegmentoTitulo"]);
            $idUpdate = 0;
            if ($numeroSegmento == 0) {
                if ($statement = $mysqli->prepare('INSERT INTO ajTravelSegmentos (segmentoTitulo,segmentoURL) values ("","") ')) {
                    if ($statement->execute()) {
                        $idUpdate = $mysqli->insert_id;
                    }
                    $statement->close();
                }
                $inserido = 1;
            } else {
                if ($statement = $mysqli->prepare('SELECT segmentoId from ajTravelSegmentos where segmentoId = ' . $numeroSegmento)) {
                    if ($statement->execute()) {
                        $statement->bind_result($idUpdate);
                        if ($statement->fetch()) {
                            
                        } else {
                            $idUpdate = 0;
                        }
                    }
                    $statement->close();
                }
                $inserido = 2;
            }
            if ($idUpdate !== 0) {
                $allowedExts = array("jpg", "jpeg", "gif", "png");
                $extension = end(explode(".", $_FILES["file"]["name"]));
                if ((($_FILES["file"]["type"] == "image/gif")
                        || ($_FILES["file"]["type"] == "image/jpeg")
                        || ($_FILES["file"]["type"] == "image/png")
                        || ($_FILES["file"]["type"] == "image/pjpeg"))
                        && ($_FILES["file"]["size"] < 5000000)
                        && ($_FILES["file"]["size"] > 0)
                        && in_array($extension, $allowedExts)) {
                    if ($_FILES["file"]["error"] > 0) {
                        
                    } else {
                        $nomeArquivo = $idUpdate . '.' . end(explode(".", $_FILES["file"]["name"]));
                        if (file_exists("../Segmento/" . $nomeArquivo)) {
                            unlink("../Segmento/" . $nomeArquivo);
                        }
                        if (!move_uploaded_file($_FILES["file"]["tmp_name"], "../Segmento/" . $nomeArquivo)) {
                            $nomeArquivo = "";
                        }
                        if ($statement = $mysqli->prepare('UPDATE ajTravelSegmentos set segmentoURL = ? , segmentoTitulo = ? where segmentoId = ?')) {
                            if ($statement->bind_param("ssi", $nomeArquivo, $conteudoUpdate, $idUpdate)) {
                                if ($statement->execute()) {
                                    
                                }
                            }
                            $statement->close();
                        }
                    }
                } else {
                    if ($statement = $mysqli->prepare('UPDATE ajTravelSegmentos set segmentoTitulo = ? where segmentoId = ?')) {
                        if ($statement->bind_param("si", $conteudoUpdate, $idUpdate)) {
                            if ($statement->execute()) {
                                
                            }
                        }
                        $statement->close();
                    }
                }
                $numeroSegmento = $idUpdate;
            }
        }
        }
        ?>
        <div id="conteudoPagina">
            <span id="cpSegmentoTitulo"><b>Segmentos</b></span>
            <span><?php
        if ($inserido == 1) {
            echo '<br><br>Segmento inserido com sucesso';
            $numeroSegmento = 0;
        } else if ($inserido == 2) {
            echo '<br><br>Segmento atualizado com sucesso';
        }else if ($inserido == 3) {
            echo '<br><br>Segmento deletado com sucesso';
        }
        ?></span>     

            <div id="cpSegmentoListagem">
                <br>
                <ul>
<?php
if ($statement = $mysqli->prepare('SELECT segmentoId,segmentoTitulo FROM ajTravelSegmentos')) {
    if ($statement->execute()) {
        $statement->bind_result($listaSegmento, $listaTitulo);

        while ($statement->fetch()) {
            ?>
                                <li><a id="segmentoTab_<?php echo $listaSegmento; ?>" onclick="mudarPagina(<?php echo $listaSegmento; ?>)"><?php echo htmlentities($listaTitulo); ?></a></li>
                                <?php
                            }
                        }
                        $statement->close();
                    }
                    ?>
                    <li><a id="segmentoTab_0" onclick="mudarPagina(0)">Novo Segmento</a></li>
                </ul>

            </div>
            <br>
            <div id="cpSegmento">
                <span id="cpSegmentoLabel" name="segmentoTitulo">Visualização de Segmento<span id="cpSegmentoLabel2" name="segmentoTitulo2"></span></span> 

                <br><br>              
                <form action="cpVagasSegmento.php?segmento=<?php echo $numeroSegmento; ?>" method="post"
                      enctype="multipart/form-data" id="segmentoForm">
<?php
if ($numeroSegmento != 0) {
    if ($statement = $mysqli->prepare('SELECT segmentoURL,segmentoTitulo FROM ajTravelSegmentos where segmentoId = ' . $numeroSegmento)) {
        if ($statement->execute()) {
            $statement->bind_result($verURL, $verConteudo);
            if ($statement->fetch()) {
                ?>
                                    <span id="cpSegmentoLabel">Imagem:</span><br>
                                    <output id="list"><img id="cpSegmentoImagem" src="../Segmento/<?php echo $verURL; ?>" style="width: 300px; height: 100px;"></output>
                                    <br>
                                    <span>Mudar imagem:</span><input type="file" id="file" name="file"/>
                                    <br> 
                                    <span style="font-size: 10px;">
                            Extensões aceitas: jpg,jpeg,gif e png
                            <br>
                            Tamanho máximo: 5Mb
                            <br>
                            Dimensões: Largura-750px / Altura-200px     
                                    </span>                                       

                                    <br><br>

                                    <span id="cpSegmentoLabel">Título:</span> <br>
                                    <input type="text" id="cpSegmentoInputTitulo" maxlength="100" style="width: 200px;" tabindex=1 name="cpSegmentoTitulo" value="<?php echo htmlentities($verConteudo); ?>" maxlength="100">
                <?php
            }
        }
        $statement->close();
    }
} else if ($numeroSegmento == 0) {
    ?>
                        <span id = "cpSegmentoLabel">Imagem:</span><br>

                        <output id="list"><img id="cpSegmentoImagem" src="" style="width: 300px; height: 100px;"></output>

                        <br>
                        <span>Mudar imagem:</span><input type="file" id="file" name="file"/>
                        <br> 
                        <span style="font-size: 10px;">
                            Extensões aceitas: jpg,jpeg,gif e png
                            <br>
                            Tamanho máximo: 5Mb
                            <br>
                            Dimensões: Largura-750px / Altura-200px                               
                        </span>                           

                        <br><br>

                        <span id = "cpSegmentoLabel">Título:</span> <br>
                        <input type="text" id="cpSegmentoInputTitulo" maxlength="20" style="width: 200px;" tabindex=1 name="cpSegmentoTitulo" value="" maxlength="100">
    <?php
}
?>
                    <br><br>
                    <input type="submit" class="cpSegmentoSalva" id="botaoSalva" value="Alterar"> 
                    <?php if($numeroSegmento!=0)
                    {
                     ?>
                    <button type="button" class="cpSegmentoDeletar" onclick="deletarSegmento(<?php echo $numeroSegmento; ?>)">Deletar</button>
                    <?php
                    }?>
                </form>
            </div>
        </div>

    </div>
</body>
<script>
    document.getElementById('file').addEventListener('change', handleFileSelect, false);
</script>
</html>