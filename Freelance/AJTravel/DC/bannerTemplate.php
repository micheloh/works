<?php
$cachefile = 'DC/cache/bannerTemplate.html';

if (file_exists($cachefile)) {
    include($cachefile);
}
else
{
    ob_start(); // Start the output buffer
    ?>
            <div id="bannerDiv">
                <div id="bannerTop"></div>
                <div id="bannerMenu">
                    <ul id="listaBanners">

                    </ul>
                </div>
                <div id="bannerContent"></div>
                <div id="banner0">
                </div>
                <div id="banner1">
                </div>
            </div>
    <?php  
    $cached = fopen($cachefile, 'w');
    fwrite($cached, ob_get_contents());
    fclose($cached); 
 
    ob_end_flush(); // Send the output to the browser
}
?>
