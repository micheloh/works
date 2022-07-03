<?php

ob_start();
session_start();
if (!isset($_SESSION['logado'])) {
    header('Location: cpLogin.php');
    exit;
}
if (!($_SESSION['logado'] == 1)) {
    header('Location: cpLogin.php');
    exit;
}
include('BDfiles/BDAccess.php');
if (mysqli_connect_errno()) {
    header('Location: 404.html');
    exit;
}




//inserir verificacao do ususario aqui


$lado = 1;
if (!empty($_GET["conteudo"]))
    $lado = $_GET["conteudo"];
if ($lado != 1 && $lado != 2) {
    $lado = 1;
}
$deletarImagem = 0;
if (!empty($_GET["deletarImagem"]))
    $deletarImagem = $_GET["deletarImagem"];
?>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Japan Travel - Painel de Controle</title>
        <link rel="stylesheet" type="text/css" href="cp.css">
    </head>

    <script>
        var lado = <?php echo $lado; ?>;
        function cancelar()
        {
            window.location = "cpHome.php?conteudo=" + lado;
        }
        
        function removerImagem()
        {
            var confirmar;
            confirmar = confirm("Deseja realmente deletar a imagem?");
            if(confirmar)
            {
                window.location = "cpHome.php?conteudo=" + lado + "&deletarImagem=1";
            }
        }
        
        function mudarTipo()
        {
            window.location = "cpHome.php?conteudo=" + document.getElementById("cphomeLadoConteudo").value;
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

                        var olddiv = document.getElementById('cphomeImagem');

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

    <body>
        <div id="cpConteinerPrincipal">

            <?php
            include('Templates/menuTop.html');
            include('Templates/menuLateral.html');
            $formTipo = $_POST["cphomeLadoConteudo"];
            $formTitulo = $_POST["cphomeInputTitulo"];
            $formConteudo = $_POST["cphomeConteudo"];
            $houveMudanca = 0;
            if ($deletarImagem == 1) {
                if ($statement = $mysqli->prepare("UPDATE ajTravelHome SET homeURL = '' where homeId = ?")) {
                    if ($statement->bind_param("s", $lado)) {
                        if ($statement->execute()) {
                            $houveMudanca = 1;
                            if (file_exists("../Home/" . $lado . ".jpg")) {
                                unlink("../Home/" . $lado . ".jpg");
                            }
                            if (file_exists("../Home/" . $lado . ".jpeg")) {
                                unlink("../Home/" . $lado . ".jpeg");
                            }
                            if (file_exists("../Home/" . $lado . ".gif")) {
                                unlink("../Home/" . $lado . ".gif");
                            }
                            if (file_exists("../Home/" . $lado . ".png")) {
                                unlink("../Home/" . $lado . ".png");
                            }
                        }else
                            $houveMudanca = 2;
                    }else
                        $houveMudanca = 2;
                }else
                    $houveMudanca = 2;
            } else {
                if ($formTipo !== NULL && $formTitulo !== NULL && $formConteudo !== NULL) {
                    $lado = $formTipo;

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
                            $nomeArquivo = $lado . '.' . end(explode(".", $_FILES["file"]["name"]));
                            if (file_exists("../Home/" . $nomeArquivo)) {
                                unlink("../Home/" . $nomeArquivo);
                            }
                            if (!move_uploaded_file($_FILES["file"]["tmp_name"], "../Home/" . $nomeArquivo)) {
                                $nomeArquivo = "";
                            }
                            if ($statement = $mysqli->prepare('UPDATE ajTravelHome SET homeTitulo = ?, homeConteudo = ?, homeURL = ? WHERE homeId = ?')) {
                                if ($statement->bind_param("sssi", $formTitulo, $formConteudo, $nomeArquivo, $formTipo)) {
                                    if ($statement->execute()) {
                                        $houveMudanca = 1;
                                    }
                                }
                                $statement->close();
                            }
                        }
                    } else {
                        if ($mysqli->query('UPDATE ajTravelHome SET homeTitulo = "' . $formTitulo . '", homeConteudo = "' . $formConteudo . '" WHERE homeId=' . $formTipo)) {
                            $houveMudanca = 1;
                        }
                        else
                            $houveMudanca = 2;
                    }
                }
            }
            ?>
            <div id="conteudoPagina">
                <?php ?>
                <span id="cphomeTitulo"><b>Home</b></span>

                <br><br>
                <form action="cpHome.php" id="homeForm" method="post" enctype="multipart/form-data">
                    <span id="cphomelabel">Lado do conteúdo:</span> 
                    <select name="cphomeLadoConteudo" id="cphomeLadoConteudo" form="homeForm" onchange="mudarTipo()" blur="mudarTipo()">
                        <option value="1" <?php if ($lado == 1) echo 'selected'; ?>>Esquerdo</option>
                        <option value="2" <?php if ($lado == 2) echo 'selected'; ?>>Direito</option>
                    </select>

                    <br><br>

                    <?php
                    if ($statement = $mysqli->prepare("
				select 
				homeTitulo,
                                homeConteudo,
                                homeURL
				from ajTravelHome where 
                                homeId = ?
                                ")) {
                        if ($statement->bind_param("s", $lado)) {
                            if ($statement->execute()) {
                                $statement->bind_result($titulo, $conteudo, $topicoURL);
                                if (!($statement->fetch())) {
                                    $titulo = "";
                                    $conteudo = "";
                                }
                                ?>

                                <output id="list"><img id="cphomeImagem" src="<?php if ($topicoURL != "") echo "../Home/" . $topicoURL; ?>" style="width: 300px; height: 100px;"></output>

                                <br>
                                <span>Mudar imagem:</span><input type="file" id="file" name="file"/>
                                <br>
                                    <span style="font-size: 10px;">
                                        Extensões aceitas: jpg,jpeg,gif e png
                                        <br>
                                        Tamanho máximo: 5Mb
                                        <br>
                                        Dimensões: Largura-420px / Altura-110px
                                    </span>      

                                <br><br>
                                <span id="cphomelabel">Titulo:</span> 

                                <input type="text" id="cphomeInputTitulo" maxlength="100" style="width: 200px;" tabindex=1 name="cphomeInputTitulo" value="<?php echo $titulo; ?>">

                                <br><br>



                                <span id="cphomelabel">Conteudo:</span> <br>
                                <textarea name="cphomeConteudo" style="resize:none; width: 400px; height: 100px;" maxlength="2000" tabindex=70><?php echo $conteudo; ?></textarea><br>
                                <?php
                                if ($houveMudanca == 1)
                                    echo 'Atualização realizada com sucesso';
                                else if ($houveMudanca == 2)
                                    echo 'Não foi possível atualizar os dados, por favor tente novamente';
                                ?>

                                <br><br>

                                <input type="submit" class="cphomeSalva" value="Atualizar"> 
                                <button type="button" class="cphomeCancela" onclick="cancelar()">Cancelar</button>
                                <button type="button" class="cphomeRemoveImagem" onclick="removerImagem()">Remover Imagem</button>
                            </form>
                            <?php
                        }
                    }
                }
                ?>

            </div>

        </div>
    </body>
    <script>
        document.getElementById('file').addEventListener('change', handleFileSelect, false);
    </script>
</html>
<?php
mysqli_close($mysqli);
ob_end_flush();
?>