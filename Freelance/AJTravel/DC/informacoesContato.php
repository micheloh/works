<?php
$cachefile = 'DC/cache/infoContato.html';

if (file_exists($cachefile)) {
    include($cachefile);
} else {
    ob_start(); // Start the output buffer
    ?>
    <div id="infoContato">
        <span id="tituloContato"></span>
        <span id="infoEmpresa"><br>
    <?php
    if ($statementContato = $mysqli->prepare('SELECT contatoConteudo FROM ajTravelContato where contatoId = 1')) {
        if ($statementContato->execute()) {
            $statementContato->bind_result($formConteudo);
            if ($statementContato->fetch()) {
                echo nl2br($formConteudo);
            }
        }
        $statementContato->close();
    }
    ?>
        </span>
    </div>
    <?php
    $cached = fopen($cachefile, 'w');
    fwrite($cached, ob_get_contents());
    fclose($cached);

    ob_end_flush(); // Send the output to the browser
}
?>
