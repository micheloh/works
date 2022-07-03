    <li id="topico">Serviços</li>
                        <li id="item<?php if($numeroTopico == 15|| $numeroTopico == 0) { 
                        echo 'Selecionado'; if($numeroTopico == 0)
                            {
                                $numeroTopico = 15;
                            }
                            }
                            ?>" ><a href="servicos.php?topico=15">Assessoria</a></li>
                                            <li id="item<?php if($numeroTopico == 18) echo 'Selecionado'; ?>" ><a href="servicos.php?topico=18">Passagem A&eacute;rea</a></li>
                        
    