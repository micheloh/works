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
        div#conteudo
        {
            width: 940px;
            height: 300px;
            margin: auto;
        }

        div#conteudo div#conteudoTop
        {
            width: 940px;
            height: 10px;
            position: relative;
            background-image: url('Images/bgTopLarge.png');
            background-repeat: no-repeat;
            box-shadow:0px 3px 5px #646464;
            border-radius: 25px 25px 0px 0px;            
            overflow: visible;
        }

        div#conteudo div#conteudoMain
        {
            padding-top: 20px;
            width: 940px;
            height: 290px;
            background-image: url('Images/bgLarge.png');
            background-repeat: no-repeat;        
        }  

        div#conteudo div#conteudoMain span#Titulo
        {
            padding-right: 20px;
            padding-left: 40px;
        }

        div#conteudo div#conteudoMain div#Conteudo
        {
            margin-left: 40px;
            width: 900px;
            height: 260px;
            overflow: hidden;
            overflow-y: visible;
        }

        div#conteudo div#conteudoMain div#Conteudo div#interno
        {
            width: 860px;
            height: 260px;
            font-size: 14px;
        }


    </style>
    <?php include('DC/bannerConstructor.php'); ?>

    <body>
        <div id="conteinerPrincipal">


            <?php include 'Templates/menuTop.php'; ?>
            <?php include 'Templates/menuEsq.php'; ?>
            <?php include 'DC/bannerTemplate.php'; ?>

            <div id="paginasDiv">
                <div id="conteudo">
                    <div id="conteudoTop"></div>
                    <div id="conteudoMain">

                        <?php
                        if ($statement = $mysqli->prepare("
				select 
				AJTTitulo,
                                AJTConteudo
				from ajTravelAJT where 
                                AJTId = ?
                                ")) {
                            if ($statement->bind_param("s", $numeroTopico)) {
                                if ($statement->execute()) {
                                    $statement->bind_result($titulo, $conteudo);
                                    if ($statement->fetch()) {
                                        ?>
                                        <span id="Titulo"><?php echo htmlentities(mb_strtoupper(nl2br($titulo))); ?></span>
                                        <br><br>
                                        <div id="Conteudo">
                                            <div id="interno"">
                                                <?php echo nl2br($conteudo); ?>
                                                </span>
                                            </div>
                                        </div>                                        
                                        <?php
                                    }
                                }
                            }
                        }
                        ?>
                    </div>
                    <?php include 'DC/footer.php'; ?>
                </div>

            </div>
    </body>
</html>
<?php
$mysqli->close();
?>