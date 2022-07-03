<?php
$cachefile = 'DC/cache/servicos.php';

if (file_exists($cachefile)) {
    include($cachefile);
} else {
    ob_start(); // Start the output buffer
    ?>
    <li id="topico">Serviços</li>
    <?php
    $primeiro = 0;
    if ($statement = $mysqli->prepare('SELECT ServicosId,ServicosTitulo FROM ajTravelServicos')) {
        if ($statement->execute()) {
            $statement->bind_result($menuEsqId, $menuEsqTitulo);
            while ($statement->fetch()) {
                if ($primeiro == 0) {
                    ?>
                    <li id="item<?php
                    echo '<?php if($numeroTopico == ' . $menuEsqId . '|| $numeroTopico == 0' . ") { 
                        echo 'Selecionado'; " .
                    'if($numeroTopico == 0)
                            {
                                $numeroTopico = ' . $menuEsqId . ";
                            }
                            }
                            ?>";
                    ?>" ><a href="servicos.php?topico=<?php echo $menuEsqId; ?>"><?php echo htmlentities($menuEsqTitulo); ?></a></li>
                        <?php
                        $primeiro = 1;
                    } else {
                        ?>
                    <li id="item<?php echo "<?php if(" . '$numeroTopico == ' . $menuEsqId . ") echo 'Selecionado'; ?>"; ?>" ><a href="servicos.php?topico=<?php echo $menuEsqId; ?>"><?php echo htmlentities($menuEsqTitulo); ?></a></li>
                    <?php
                }
            }
        }
    }
    ?>    
    <?php
    $cached = fopen($cachefile, 'w');
    fwrite($cached, ob_get_contents());
    fclose($cached);

    ob_end_clean();
    include($cachefile);
}
?>
