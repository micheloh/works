<?php
$cachefile = 'DC/cache/footer.html';

if (file_exists($cachefile)) {
    include($cachefile);
}
else
{
    ob_start(); // Start the output buffer
    ?>
    <br><br>
    
    <div id="footerDiv">
        <div id="footerDivRight"></div>
        <div id="footerDivCenter">
        <span>All Japan Travel 2013 - Todos os direitos reservados</span>
        </div>
        <div id="footerDivLeft">
            <span>Webdesign: Ponto Alpha Studio</span>
            <br>
            <span>Desenvolvido por: Insert name here</span>
                
            
        </div> 
    </div> 
    
    <?php  
    $cached = fopen($cachefile, 'w');
    fwrite($cached, ob_get_contents());
    fclose($cached); 
 
    ob_end_flush(); // Send the output to the browser
}
?>
