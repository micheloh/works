<?php
ob_start();
include_once('DAO/BDAccess.php');
if (mysqli_connect_errno()) {
    header('Location: 404.html');
    exit;
}
?>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AJTravel</title>
        <link rel="stylesheet" type="text/css" href="ajtravelcss.css">

    </head>
    <style>
        div#listaSegmentos
        {
            position: absolute;
            padding-left: 10px;
            margin-top: 370px;            
            width: 160px;
            float: left;
        }

        div#listaSegmentos div#detalheCima
        {
            top: 0px;
            position: relative;
            background-image: url('Images/bgSegmentosListaTop.png');
            background-repeat: no-repeat;
            overflow: visible;
            height: 30px;
            width: 160px;
            text-align: center;
        }

        div#listaSegmentos div#detalheCima span{
            color: #ffffff;
            line-height: 30px;
        }

        div#listaSegmentos div#listagem ul
        {
            list-style-type: none;
            margin:0px;
            margin-top: 7px;
            margin-bottom: 7px;
        }

        div#listaSegmentos div#listagem li
        {
            margin-top: 5px;
            margin-bottom: 5px;
        }

        div#listaSegmentos div#listagem li a
        {
            text-decoration: none;
            color: #225285;
        }        

        div#detalheBaixo
        {
            position: relative;
            background-image: url('Images/bgSegmentosListaBot.png');
            background-repeat: no-repeat;
            height: 10px;
            bottom: 0px;
        }        


        div#listaConteudo{
            margin-right: 10px;
            margin-top: 30px;
            float: right;
            width: 750px;
            height: 470px;
        }

        div#listaConteudo div#listaConteudoInterno
        {
            width: 750px;
            background-image: url('Images/bgListaConteudo.png');
            overflow: hidden;
            overflow-y: visible;
            background-repeat: no-repeat;
            height: 450px;
            top: 0px;
        }

        div#listaConteudo div#listaConteudoInterno span#tituloSegmento
        {
            line-height: 40px;
            padding-left: 20px;
        }

        div#listaConteudo div#listaConteudoInterno span#tituloEmpresa
        {
            font-size: 12px;
            padding-left: 30px;
        }        

        div#listaConteudo div#listaConteudoInterno span#descricaoEmpresa
        {
            font-size: 12px;
            padding-left: 30px;
            display: block;
        }                

        div#listaConteudoDetalheCima
        {
            position: relative;
            width: 750px;
            background-image: url('Images/bgListaConteudoTop.png');
            background-repeat: no-repeat;
            box-shadow:0px 3px 5px #646464;
            border-radius: 25px 25px 0px 0px;
            overflow: visible;
            height: 10px;
            z-index: 5;
        }

        div#listaConteudo div#listaConteudoDetalheQuebra
        {
            width: 750px;
            margin-top: 10px;
            margin-bottom: 10px;
            margin-left: 30px;
            background-image: url('Images/bgListaConteudoQuebra.jpg');
            background-repeat: no-repeat;
            height: 10px;
            bottom: 0px;
        }    

        div#listaConteudo img
        {
            width: 300px;
            height: 100px;
        }


        div#imagemSegmento
        {
            position: relative;
            float: right;
            margin-right: 10px;
            margin-top: 160px;
            width: 750px;
            height: 210px;
        }


        div#footerDiv
        {
            position:absolute;
            margin-top: 850px;
        }
    </style>
    <body>
        <div id="conteinerPrincipal">


            <?php include 'Templates/menuTop.php'; ?>
            <?php include 'Templates/menuEsq.php'; ?>

            <?php
            $numeroSegmento = 0;
            if (!empty($_GET["segmento"])) {
                $numeroSegmento = $_GET["segmento"];
                if ($numeroSegmento == 0 || $numeroSegmento < 0) {
                    $numeroSegmento = 0;
                }
            }
            else
                $numeroSegmento = 0;
            if ($numeroSegmento == 0) {
                if ($statement = $mysqli->prepare('SELECT segmentoId,segmentoURL,segmentoTitulo FROM ajTravelSegmentos where segmentoId in (select segmentoId from ajTravelEmpresas where empresaTipo = 0) order by segmentoId limit 0,1')) {
                    if ($statement->execute()) {
                        $statement->bind_result($numeroSegmento, $segmentoURL, $segmentoTitulo);
                        if ($statement->fetch()) {
                            
                        }
                    }
                }
                $statement->close();
            } else {
                if ($statement = $mysqli->prepare('SELECT segmentoId,segmentoURL,segmentoTitulo FROM ajTravelSegmentos where segmentoId = ' . $numeroSegmento . ' and segmentoId in (select segmentoId from ajTravelEmpresas where empresaTipo = 0) order by segmentoId limit 0,1')) {
                    if ($statement->execute()) {
                        $statement->bind_result($numeroSegmento, $segmentoURL, $segmentoTitulo);
                        if ($statement->fetch()) {
                            
                        }
                    }
                }
                $statement->close();
            }
            ?>
            <div id="imagemSegmento">
                <div id="listaConteudoDetalheCima"></div>   
                <img src="Segmento/<?php echo $segmentoURL; ?>" width="750" height="200"/>
            </div>




            <div id="listaSegmentos">
                <div id="detalheCima">
                    <span>Segmentos</span>
                </div>
                <div id="listagem">
                    <ul>
                        <?php
                        if ($statement = $mysqli->prepare('SELECT segmentoTitulo,segmentoId FROM ajTravelSegmentos where segmentoId in (select segmentoId from ajTravelEmpresas where empresaTipo = 0)')) {
                            if ($statement->execute()) {
                                $statement->bind_result($tituloSegmento, $idSegmento);
                                while ($statement->fetch()) {
                                    ?>
                                    <li>
                                        <a href="/arubaito.php?segmento=<?php echo $idSegmento; ?>">
            <?php echo htmlentities($tituloSegmento); ?>
                                        </a>

                                    </li>
                                    <?php
                                }
                            }
                            $statement->close();
                        }
                        ?>     
                    </ul>
                </div>
                <div id="detalheBaixo">
                </div>
            </div>
            <div id="listaConteudo">
                <div id="listaConteudoDetalheCima"></div>
                <div id="listaConteudoInterno">
                    <span id="tituloSegmento">Segmento: <?php echo htmlentities($segmentoTitulo); ?></span>
                    <br><br>
                    <?php
                    $tituloSegmentoAnterior = null;
                    if ($statement = $mysqli->prepare('SELECT empresaNome, empresaDesc
                                                                            FROM ajTravelEmpresas
                                                                            WHERE segmentoId = ' . $numeroSegmento . ' and empresaTipo = 0')) {
                        if ($statement->execute()) {
                            $statement->bind_result($empresaNome, $empresaDesc);
                            while ($statement->fetch()) {
                                echo '<span id="tituloEmpresa">' . nl2br(htmlentities($empresaNome)) . '</span>';
                                echo '<br><br>';
                                echo '<span id="descricaoEmpresa">' . nl2br(htmlentities($empresaDesc)) . '</span>';
                                echo '<div id="listaConteudoDetalheQuebra"></div>';
                            }
                        }
                        $statement->close();
                    }
                    ?>    
                </div>

            </div>
<?php include 'DC/footer.php'; ?>




        </div>

    </body>
</html>
<?php
$mysqli->close();
?>            