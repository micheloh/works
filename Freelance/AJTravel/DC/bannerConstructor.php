<?php
$cachefile = 'DC/cache/bannerFunctions.js';

if (file_exists($cachefile)) {
    include($cachefile);
} else {
    ob_start(); // Start the output buffer
    ?>
    <script>
        var indexAtual = 0;      
        var bannerImgs = new Array();
        var bannerText = new Array();
        var usando = 0;
        var qtde = 0;
        var bannerMudar = 1;
        var tid;
    <?php
    if ($statement = $mysqli->prepare('SELECT bannerConteudo,bannerURL FROM ajTravelBanner')) {
        if ($statement->execute()) {
            $statement->bind_result($conteudo, $URL);
            while ($statement->fetch()) {
                ?>
                                bannerText[qtde] = "<?php echo htmlentities($conteudo); ?>";
                                bannerImgs[qtde] = "<?php echo $URL; ?>";
                                qtde+=1;
                <?php
            }
        }
        $statement->close();
    }
    ?>            
                                   
        function init() {
            if(qtde>0)
            {
                document.getElementById("banner0").style.backgroundImage="url('Banners/" + bannerImgs[0] + "')"; 
                document.getElementById("bannerContent").innerHTML = "<span>" + bannerText[0] + '</span><div id="bannerContentBackground"></div>';
                var aux=0;
                var opcoesConstruir = "";
                for(aux=0;aux<qtde;aux+=1)
                {
                    if(aux==0)
                    {
                        opcoesConstruir = opcoesConstruir + '<li id="opt' + aux + '" onclick="mudarBanner(' + aux + ')" class="bannerOptSelecionado"></li>';
                    }
                    else
                    {
                        opcoesConstruir = opcoesConstruir + '<li id="opt' + aux + '" onclick="mudarBanner(' + aux + ')" class="bannerOpt"></li>';
                    }
                }
                document.getElementById("listaBanners").innerHTML = opcoesConstruir;
            }
            tid = setInterval(bannerLoop, 5000); 
    }
                               

    window.onload = init;
      
    function bannerLoop() {
    if(bannerMudar == 1)
    {
        var auxBannerLoop = (indexAtual+1)%bannerImgs.length;
        var l = document.getElementById('opt' + auxBannerLoop);
        l.onclick(auxBannerLoop);
        bannerMudar = 1;
    }else
    {
        bannerMudar = 1;
    }
    }
                    


    //CREDITS TO BLOG.CRONDESIGN.COM
    function changeOpac(obj, opacity) {//change the opacity for different browsers:
    obj = obj.style; 
    obj.opacity = (opacity / 100);
    obj.MozOpacity = (opacity / 100);
    obj.KhtmlOpacity = (opacity / 100);
    obj.filter = "alpha(opacity=" + opacity + ")";
    }
    function mudarBanner(elem)
    {
    if(indexAtual == elem)
        return;
    var changeSpeed = 3; 
    var fadeSpeed = 0.5; 
    var fps = 25;                
    document.getElementById("opt" + elem).className = "bannerOptSelecionado";
    document.getElementById("opt" + indexAtual).className = "bannerOpt";
    indexAtual = elem;
    var bannerMudando = document.getElementById("bannerContent");
    document.getElementById("bannerContent").innerHTML = "<span>" + bannerText[elem] + '</span><div id="bannerContentBackground"></div>';
    var bannerAparecendo = document.getElementById("banner" + (usando+1)%2);
    bannerAparecendo.style.backgroundImage="url('Banners/" + bannerImgs[elem] + "')"; 
    var bannerTroca = document.getElementById("banner0");
    bannerMudando.innerHTML = "<span>" + bannerText[elem] + '</span><div id="bannerContentBackground"></div>';
    if(usando==0)
    {
        var opac = 100;
        var fadeInterval = setInterval(function(){ //run fade on interval:
            if(opac > 0.00){//continue fade:
                opac -= Math.ceil(100/(fadeSpeed*fps));
                changeOpac(bannerTroca, opac);
            }else{//end fade:
                clearInterval(fadeInterval);
            }
        }, 1000/fps)                
    }
    else
    {
        var opac = 0;
        var fadeInterval = setInterval(function(){ //run fade on interval:
            if(opac < 100.00){//continue fade:
                opac += Math.ceil(100/(fadeSpeed*fps));
                changeOpac(bannerTroca, opac);
            }else{//end fade:
                clearInterval(fadeInterval);
            }
        }, 1000/fps)     
    }
    usando = (usando+1)%2;
    bannerMudar = 0;
    }
    </script>
    <?php
    $cached = fopen($cachefile, 'w');
    fwrite($cached, ob_get_contents());
    fclose($cached);

    ob_end_flush(); // Send the output to the browser
}
?>
