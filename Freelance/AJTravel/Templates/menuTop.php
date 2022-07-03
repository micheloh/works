<?php
function curPageNameTop() {
 return substr($_SERVER["SCRIPT_NAME"],strrpos($_SERVER["SCRIPT_NAME"],"/")+1);
}
$menuSelecionado = 0;
if(preg_match('/allJapanTravel.php/',curPageNameTop()))
{
    $menuSelecionado = 1;
}
if(preg_match('/servicos.php/',curPageNameTop()))
{
    $menuSelecionado = 2;
}
if(preg_match('/contato.php/',curPageNameTop()))
{
    $menuSelecionado = 4;
}
?>

<div id="menuTop">
    <div id="bannerImg">
        <a href="index2.php">
            <img src="Images/logo.png" alt="Logo All Japan Travel">
        </a>
    </div>
    <div id="menuTopOpts">
        <ul>
            <li><a href="index2.php" <?php if($menuSelecionado == 0) echo 'id="menuTopSelecionado"';?>>Home</a></li>
            <li><a href="allJapanTravel.php" <?php if($menuSelecionado == 1) echo 'id="menuTopSelecionado"';?>>All Japan Travel</a></li>
            <li><a href="servicos.php" <?php if($menuSelecionado == 2) echo 'id="menuTopSelecionado"';?>>Serviços</a></li>
            <li><a href="contato.php" <?php if($menuSelecionado == 4) echo 'id="menuTopSelecionado"';?>>Contato</a></li>
        </ul>        
    </div>
</div>
