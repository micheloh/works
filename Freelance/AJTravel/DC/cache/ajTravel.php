    <li id="topico">All Japan Travel</li>
                        <li id="item<?php if($numeroTopico == 25|| $numeroTopico == 0) { 
                        echo 'Selecionado'; if($numeroTopico == 0)
                            {
                                $numeroTopico = 25;
                            }
                            }
                            ?>" ><a href="allJapanTravel.php?topico=25">Empresa</a></li>
                                            <li id="item<?php if($numeroTopico == 30) echo 'Selecionado'; ?>" ><a href="allJapanTravel.php?topico=30">Princ&iacute;pios</a></li>
                        
    