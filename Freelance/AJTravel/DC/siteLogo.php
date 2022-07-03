<?php
$cachefile = 'DC/cache/logo.html';

if (file_exists($cachefile)) {
    include($cachefile);
}
else
{
    ob_start(); // Start the output buffer
    ?>
    <div id="logoDiv">
        <a href="/"> 
            <img src="/Images/logo.gif" alt="AJTravel">
        </a>
    </div>
    <?php
    $cached = fopen($cachefile, 'w');
    fwrite($cached, ob_get_contents());
    fclose($cached); 

    ob_end_flush(); // Send the output to the browser
}
?>
