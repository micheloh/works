<?php

function curPageName() {
    return substr($_SERVER["SCRIPT_NAME"], strrpos($_SERVER["SCRIPT_NAME"], "/") + 1);
}
?>
<div id="menuEsq">
    <ul>
        <li id="topico">Trabalho no Japão</li>
        <li id="item<?php if (preg_match('/arubaito.php/', curPageName())) echo 'Selecionado'; ?>"><a href="arubaito.php">Arubaito</a></li>
        <li id="item<?php if (preg_match('/emprego.php/', curPageName())) echo 'Selecionado'; ?>"><a href="emprego.php">Emprego</a></li>
        <li id="topico">Cadastro</li>
        <li id="item<?php if (preg_match('/curriculo.php/', curPageName())) echo 'Selecionado'; ?>"><a href="#" onclick="window.open('PopUp/formulario.html','popUpWindow','height=700,width=670,left=0,top=0,resizable=no,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes');">Currículo</a></li>
        <li id="topico">Localização</li>
        <li id="item<?php if (preg_match('/mapaJapao.php/', curPageName())) echo 'Selecionado'; ?>"><a href="#" onclick="window.open('PopUp/mapaJapao.html','popUpWindow','height=450,width=450,left=0,top=0,resizable=no,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes');">Mapa do Japão</a></li>     
        <?php
        $numeroTopico = 0;
        if (!empty($_GET["topico"])) {
            $numeroTopico = $_GET["topico"];
        }
        if (preg_match('/allJapanTravel.php/', curPageName())) {
            include('DC/allJapanTravelTopicos.php');
        }
        if (preg_match('/servicos.php/', curPageName())) {
            include('DC/servicosTopicos.php');
        }
        ?>
    </ul>
</div>
