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
        div#paginasDiv div#homeConteudo
        {
            width: 460px;
            display: block;
        }

        .ladoEsq
        {
            float: left;
        }

        .ladoDir
        {
            float: right;
        }

        div#paginasDiv div#homeConteudo div#detalheCima
        {
            position: relative;
            background-image: url('Images/homeDetalheCima.png');
            background-repeat: no-repeat;
            border-radius: 25px 25px 0px 0px;   
            box-shadow:0px 3px 5px #646464;	
            top: 0px;
            height: 10px;
            z-index: 10;
            overflow:hidden;
        }   

        div#paginasDiv div#homeConteudo div#conteudo
        {
            position: relative;
            background-image: url('Images/homeDetalheBackground.png');
            background-repeat: no-repeat;
            height: 220px;
        }    

        div#paginasDiv div#homeConteudo div#conteudo span#Titulo
        {
            position: absolute;
            margin-top: 10px;
            padding-left: 20px;
            padding-right: 20px;
            font-size: 20px;
        }
        
        div#paginasDiv div#homeConteudo div#conteudo span#Texto img
        {
            width: 420px;
            height: 110px;
        }

        div#paginasDiv div#homeConteudo div#conteudo span#Texto
        {
            position: absolute;
            margin-top: 20px;
            padding-left: 20px;
            padding-right: 20px;
            font-size: 12px;
            overflow: hidden;
            width: 420px;
            overflow-y: visible;
            display: block;
            height: 200px;
        }        

        div#footerDiv
        {
            position:absolute;
            margin-top: 120px;
        }
    </style>
    <?php include('DC/bannerConstructor.php'); ?>
    
    <body>
        <div id="conteinerPrincipal">

            <?php //include 'DC/siteLogo.php'; ?>

            <?php include 'Templates/menuTop.php'; ?>
            <?php include 'Templates/menuEsq.php'; ?>
            <?php include 'DC/bannerTemplate.php'; ?>

            <div id="paginasDiv">
                <div id="homeConteudo" class="ladoEsq">
                    <div id="detalheCima">
                    </div>
                    <div id="conteudo">
                        <?php
                        if ($statement = $mysqli->prepare('SELECT homeTitulo,homeConteudo,homeURL FROM ajTravelHome where homeId = 1')) {
                            if ($statement->execute()) {
                                $statement->bind_result($tituloEsq, $conteudoEsq, $urlEsq);
                                if ($statement->fetch()) {
                                    ?>

                                    <span id="Titulo"><b><?php echo nl2br($tituloEsq); ?></b></span><br><br>
                                    <span id="Texto"><?php
                                    if (trim($urlEsq) != "") {
                                        ?>
                                        <img src="Home/<?php echo $urlEsq; ?>"/>
                                        <br>
                                        <?php
                                    }
                                    ?><?php echo nl2br($conteudoEsq); ?></span>
                                    <?php
                                }
                            }
                            $statement->close();
                        }
                        ?>
                    </div>
                </div>
                <div id="homeConteudo" class="ladoDir">
                    <div id="detalheCima">
                    </div>
                    <div id="conteudo">
                        <?php
                        if ($statement = $mysqli->prepare('SELECT homeTitulo,homeConteudo,homeURL  FROM ajTravelHome where homeId = 2')) {
                            if ($statement->execute()) {
                                $statement->bind_result($tituloDir, $conteudoDir, $urlDir);
                                if ($statement->fetch()) {
                                    ?>

                                    <span id="Titulo"><b><?php echo nl2br($tituloDir); ?></b></span><br><br>
                                    <span id="Texto"><?php
                                    if (trim($urlDir) != "") {
                                        ?>
                                        <img src="Home/<?php echo $urlDir; ?>"/>
                                        <br>
                                        <?php
                                    }
                                    ?><?php echo nl2br($conteudoDir); ?></span>
                                    <?php
                                }
                            }
                            $statement->close();
                        }
                        ?>                           
                    </div>
                </div>
                <br><br><br><br><br><br><br><br><br><br>
                <?php include 'DC/footer.php'; ?>
            </div>

        </div>
    </body>
</html>
<?php
$mysqli->close();
?>