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
    if (!empty($_GET["banner"])) {
        $numeroSegmento = $_GET["banner"];
        if ($numeroSegmento == 0 || $numeroSegmento < 0) {
            $numeroSegmento = 0;
        }
    }
    if (!empty($_GET["bannerDel"])) {
        $numeroSegmentoDeleta = $_GET["bannerDel"];
        if ($numeroSegmentoDeleta == 0 || $numeroSegmentoDeleta < 0) {
            $numeroSegmentoDeleta = 0;
        }
    }
    ?>
    <style type="text/css">

        div#cpConteinerPrincipal div#conteudoPagina div#cpSegmentoListagem ul {
            padding:0px;
            margin:0px;
            float: left;
            background-color:#ffffff;
            list-style:none;
            border: 1px solid;
        }

        div#cpConteinerPrincipal div#conteudoPagina div#cpSegmentoListagem ul li { display: inline; }

        div#cpConteinerPrincipal div#conteudoPagina div#cpSegmentoListagem ul li a {
            background-color:#ffffff;
            color: #333;
            text-decoration: none;
            padding: 2px 10px;
            float:left;
            cursor:pointer
        }
        div#cpConteinerPrincipal div#conteudoPagina div#cpBanner
        {
            border: 1px solid;
            width: 600px;
            height: 420px;
            padding: 10px;
        }
    </style>

    <script>
        var paginaAtual = <?php
    if ($statement = $mysqli->prepare('SELECT bannerId FROM ajTravelBanner where bannerId = ' . $numeroSegmento)) {
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

        window.onload = function()
        {
            document.getElementById("bannerTab_" + paginaAtual).style.display = "block";
            document.getElementById("bannerTab_" + paginaAtual).style.backgroundColor = "#cccccc";
            if (paginaAtual == 0)
            {
                document.getElementById("botaoSalva").value = "Salvar";
                document.getElementsByName("bannerTitulo")[0].innerHTML = "Inserir novo banner";
            }
            else
                document.getElementsByName("bannerTitulo2")[0].innerHTML = document.getElementById("bannerTab_" + paginaAtual).innerHTML;

        }
        function mudarPagina(numeroPagina)
        {
            window.location = "cpBanner.php?banner=" + numeroPagina;
        }

        function deletarBanner(numeroBanner)
        {
            var confirmar;
            confirmar = confirm("Deseja realmente deletar o banner?");
            if (confirmar)
                window.location = "cpBanner.php?bannerDel=" + numeroBanner;
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

                        var olddiv = document.getElementById('cpBannerImagem');

                        d.removeChild(olddiv);
                        var span = document.createElement('span');
                        span.innerHTML = ['<img style="width: 300px; height: 100px;" id="cpBannerImagem" src="', e.target.result,
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
        if (!empty($_POST["cpBannersConteudo"])) {
            $conteudoUpdate = utf8_decode($_POST["cpBannersConteudo"]);
            $idUpdate = $numeroSegmento;

            if ($numeroSegmento == 0) {
                if ($statement = $mysqli->prepare('INSERT INTO ajTravelBanner (bannerURL,bannerConteudo,bannerPosicao) values ("","",1) ')) {
                    if ($statement->execute()) {
                        $idUpdate = $mysqli->insert_id;
                    }
                    $statement->close();
                }
                $inserido = 1;
            } else {
                if ($statement = $mysqli->prepare('delete from ajTravelBanner where bannerId = ' . $numeroSegmentoDeleta)) {
                    if ($statement->execute()) {
                        $deletado = 1;
                        if (file_exists("../Banners/" . $numeroSegmentoDeleta . ".jpg")) {
                            unlink("../Banners/" . $numeroSegmentoDeleta . ".jpg");
                        }
                        if (file_exists("../Banners/" . $numeroSegmentoDeleta . ".jpeg")) {
                            unlink("../Banners/" . $numeroSegmentoDeleta . ".jpeg");
                        }
                        if (file_exists("../Banners/" . $numeroSegmentoDeleta . ".gif")) {
                            unlink("../Banners/" . $numeroSegmentoDeleta . ".gif");
                        }
                        if (file_exists("../Banners/" . $numeroSegmentoDeleta . ".png")) {
                            unlink("../Banners/" . $numeroSegmentoDeleta . ".png");
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
                            if (file_exists("../Banners/" . $nomeArquivo)) {
                                unlink("../Banners/" . $nomeArquivo);
                            }
                            if (!move_uploaded_file($_FILES["file"]["tmp_name"], "../Banners/" . $nomeArquivo)) {
                                $nomeArquivo = "";
                            }
                            if ($statement = $mysqli->prepare('UPDATE ajTravelBanner set bannerURL = ? , bannerConteudo = ? where bannerId = ?')) {
                                if ($statement->bind_param("ssi", $nomeArquivo, $conteudoUpdate, $idUpdate)) {
                                    if ($statement->execute()) {
                                        
                                    }
                                }
                                $statement->close();
                                $inserido = 2;
                            }
                        }
                    } else {
                        if ($statement = $mysqli->prepare('UPDATE ajTravelBanner set bannerConteudo = ? where bannerId = ?')) {
                            if ($statement->bind_param("si", $conteudoUpdate, $idUpdate)) {
                                if ($statement->execute()) {
                                    
                                }
                            }
                            $statement->close();
                            $inserido = 2;
                        }
                    }
                    $numeroSegmento = $idUpdate;
                }
            }
        } if ($numeroSegmentoDeleta != 0) {
            if ($statement = $mysqli->prepare('delete from ajTravelBanner where bannerId = ' . $numeroSegmentoDeleta)) {
                if ($statement->execute()) {
                    if (file_exists("../Banners/" . $numeroSegmentoDeleta . ".jpg")) {
                        unlink("../Banners/" . $numeroSegmentoDeleta . ".jpg");
                    }
                    if (file_exists("../Banners/" . $numeroSegmentoDeleta . ".jpeg")) {
                        unlink("../Banners/" . $numeroSegmentoDeleta . ".jpeg");
                    }
                    if (file_exists("../Banners/" . $numeroSegmentoDeleta . ".gif")) {
                        unlink("../Banners/" . $numeroSegmentoDeleta . ".gif");
                    }
                    if (file_exists("../Banners/" . $numeroSegmentoDeleta . ".png")) {
                        unlink("../Banners/" . $numeroSegmentoDeleta . ".png");
                    }
                    $deletado = 1;
                }
                $statement->close();
            }
        }
        ?>
        <div id="conteudoPagina">
            <span id="cpServicosTitulo"><b>Banners</b></span>

            <br><br>

            <div id="cpSegmentoListagem">
                <ul>
<?php
if ($statement = $mysqli->prepare('SELECT bannerId FROM ajTravelBanner')) {
    if ($statement->execute()) {
        $statement->bind_result($listaSegmento);
        $atualBanner = 1;
        while ($statement->fetch()) {
            ?>
                                <li><a id="bannerTab_<?php echo $listaSegmento; ?>" onclick="mudarPagina(<?php echo $listaSegmento; ?>)"><?php echo $atualBanner; ?></a></li>
                                <?php
                                $atualBanner = $atualBanner + 1;
                            }
                        }
                        $statement->close();
                    }
                    ?>
                    <li><a id="bannerTab_0" onclick="mudarPagina(0)">Inserir novo banner</a></li>
                </ul>
                <span><?php
                    $atualizou = 0;
                    if ($inserido == 1) {
                        echo '<br><br>Banner inserido com sucesso';
                        $atualizou = 1;
                    } else if ($inserido == 2) {
                        echo '<br><br>Banner atualizado com sucesso';
                        $atualizou = 1;
                    }
                    if ($deletado == 1) {
                        echo '<br><br>Banner deletado com sucesso';
                        $atualizou = 1;
                    }
                    if ($atualizou == 1) {
                        if (file_exists("../DC/cache/bannerFunctions.js")) {
                            unlink("../DC/cache/bannerFunctions.js");
                        }
                    }
                    ?></span>
            </div>
            <br><br>
            <div id="cpBanner">
                <span id="cpBannerLabel" name="bannerTitulo">Banner <span id="cpBannerLabel2" name="bannerTitulo2"></span></span> 

                <br><br>              
                <form action="cpBanner.php?banner=<?php echo $numeroSegmento; ?>" method="post"
                      enctype="multipart/form-data" id="bannerForm">
<?php
if ($numeroSegmento != 0) {
    if ($statement = $mysqli->prepare('SELECT bannerURL,bannerConteudo FROM ajTravelBanner where bannerId = ' . $numeroSegmento)) {
        if ($statement->execute()) {
            $statement->bind_result($verURL, $verConteudo);
            if ($statement->fetch()) {
                ?>
                                    <span id="cpBannerLabel">Imagem:</span><br>
                                    <output id="list"><img id="cpBannerImagem" src="../Banners/<?php echo $verURL; ?>" style="width: 300px; height: 100px;"></output>
                                    <br>
                                    <span>Mudar imagem:</span><input type="file" id="file" name="file"/>
                                    <br>
                                    <span style="font-size: 10px;">
                                        Extensões aceitas: jpg,jpeg,gif e png
                                        <br>
                                        Tamanho máximo: 5Mb
                                        <br>
                                        Dimensões: Largura-750px / Altura-290px
                                    </span>                                    

                                    <br><br>

                                    <span id="cpBannerLabel">Conteudo:</span> <br>
                                    <input type="text" maxlength="50" style="width: 450px;" tabindex=1 name="cpBannersConteudo" value="<?php echo htmlentities($verConteudo); ?>">                         
                <?php
            }
        }
        $statement->close();
    }
} else if ($numeroSegmento == 0) {
    ?>
                        <span id = "cpBannerLabel">Imagem:</span><br>

                        <output id="list"><img id="cpBannerImagem" src="" style="width: 300px; height: 100px;"></output>

                        <br>
                        <span>Mudar imagem:</span><input type="file" id="file" name="file"/>
                        <br> 
                        <span style="font-size: 10px;">
                            Extensões aceitas: jpg,jpeg,gif e png
                            <br>
                            Tamanho máximo: 5Mb
                            <br>
                            Dimensões: Largura-750px / Altura-290px                         
                        </span>                        

                        <br><br>

                        <span id = "cpBannerLabel">Conteudo:</span> <br>
                        <input type="text" maxlength="50" style="width: 450px;" tabindex=1 name="cpBannersConteudo" value="<?php echo htmlentities($verConteudo); ?>">                         

    <?php
}
?>
                    <br><br>
                    <input type="submit" class="cpBannerSalva" id="botaoSalva" value="Alterar"> 
                    <?php
                    if ($numeroSegmento != 0) {
                        ?>
                        <button type="button" id="botaoDeleta" onclick="deletarBanner(<?php echo $numeroSegmento; ?>)">Deletar</button>
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