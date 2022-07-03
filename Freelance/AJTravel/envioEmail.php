<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AJTravel</title>
        <link rel="stylesheet" type="text/css" href="ajtravelcss.css">

    </head>

    <style>
        /* CSS para a pagina de contato */

        div#conteudo
        {
            width: 940px;
            height: 300px;
            margin: auto;
        }

        div#conteudo div#conteudoTop
        {
            width: 940px;
            height: 10px;
            position: relative;
            background-image: url('Images/bgTopLarge.png');
            background-repeat: no-repeat;
            box-shadow:0px 3px 5px #646464;
            border-radius: 25px 25px 0px 0px;            
            overflow: visible;
        }

        div#conteudo div#conteudoMain
        {
            padding-top: 20px;
            padding-left: 20px;
            width: 940px;
            height: 290px;
            background-image: url('Images/bgLarge.png');
            background-repeat: no-repeat;        
        }        

        div#conteudo div#conteudoMain div#infoContato
        {
            width: 400px;
            float:right;
        }

        div#conteudo div#conteudoMain div#infoContato span#infoEmpresa
        {
            font-size: 12px;
        }

        div#conteudo div#conteudoMain div#contatoDiv
        {

            width: 500px;
            float:left;
        }

        div#conteudo div#conteudoMain div#contatoDiv span#tituloContato
        {
            padding-left: 20px;
            font-size: 18px;
        }

        div#conteudo div#conteudoMain div#contatoDiv table
        {
            width:500px;
            padding-left: 20px;
        }

        div#conteudo div#conteudoMain div#contatoDiv table tr td#alinhaDir
        {
            font-size: 14px;
            text-align: left;
            width: 100px;    
        }

        div#conteudo div#conteudoMain div#contatoDiv table tr td input
        {

            border: 1px solid #003063; 
        }

        div#conteudo div#conteudoMain div#contatoDiv table tr td input[type="text"]
        {

            width:300px;    
        }

        div#conteudo div#conteudoMain div#contatoDiv table tr td select
        {
            width: 300px;
            text-align: left;
            border: 1px solid #003063;
        }

        div#conteudo div#conteudoMain div#contatoDiv table tr td textarea
        {
            resize:none; 
            width: 300px; 
            height: 100px;
            border: 1px solid #003063;
        }

        div#conteudo div#conteudoMain div#contatoDiv table tr td button
        {
            background: #ffffff;
            border: 1px solid #003063;
            font-weight: normal;
        }

        div#conteudo div#conteudoMain div#contatoDiv h3
        {
            text-align: center;
            font-size: x-large;
        }

        div#conteudo div#conteudoMain div#contatoDiv h4
        {
            text-align: center;
        }


    </style>    
    <?php include('DC/bannerConstructor.php'); ?>
    <body>
        <div id="conteinerPrincipal">
            <?php include 'DC/siteLogo.php'; ?>

            <?php include 'Templates/menuTop.php'; ?>
            <?php include 'Templates/menuEsq.php'; ?>
            <?php include 'DC/bannerTemplate.php'; ?>
            <div id="paginasDiv">
                <div id="conteudo">
                    <div id="conteudoTop"></div>
                    <div id="conteudoMain">
                        <h4><?php
                            $formNome = filter_input(INPUT_POST, 'contatoNome', FILTER_SANITIZE_SPECIAL_CHARS);
                            $formEmail = filter_input(INPUT_POST, 'contatoEmail', FILTER_SANITIZE_SPECIAL_CHARS);
                            $formTelefone = filter_input(INPUT_POST, 'contatoTelefone', FILTER_SANITIZE_SPECIAL_CHARS);
                            $formAssunto = filter_input(INPUT_POST, 'selectAssunto', FILTER_SANITIZE_SPECIAL_CHARS);
                            $formMensagem = nl2br(filter_input(INPUT_POST, 'assuntoMensagem', FILTER_SANITIZE_STRING));
                            if (
                                    $formNome !== false &&
                                    $formEmail !== false &&
                                    $formTelefone !== false &&
                                    $formAssunto !== false &&
                                    $formMensagem !== false
                            ) {
                                require_once('PopUp/class.phpmailer.php');
                                include('DC/dadosEmail.php');
                                $mail = new PHPMailer();
                                $emailmsg = 'Contato realizado pelo site.
                                <br>
                                Foi enviado por ' . $formNome . ', pelo Email ' . $formEmail . ' e telefone ' . $formTelefone . '.
                                <br><br>Assunto: ' . $formAssunto .
                                        '<br><br>Mensagem:<br>' . $formMensagem;


                                $assuntoEmail = 'ajtravel.com.br - Nova mensagem';
                                $body = $emailmsg;
                                $mail->IsSMTP();
                                $mail->SMTPAuth = true;
                                $mail->SMTPSecure = "tls";
                                $mail->Host = $smtpemail;
                                $mail->Port = $smtpporta;
                                $mail->Username = $emailusuario;
                                $mail->Password = $emailsenha;


                                $mail->SetFrom($emailusuario, $nomeDoRemetente);

                                $mail->AddReplyTo($emailusuario, $nomeDoRemetente);

                                $mail->Subject = $assuntoEmail;

                                $mail->AltBody = "Para ver a mensagem utilize um visualizador compatível com HTML";

                                $mail->MsgHTML($body);


                                $mail->AddAddress($destinatario, "Administrador AJTravel");

                                if (!$mail->Send()) {
                                    echo 'Não foi possível enviar o cadastro, por favor tente mais tarde.';
                                } else {
                                    echo 'Mensagem enviada com sucesso.';
                                }
                            } else {
                                ?>Não foi possível enviar o email, por favor tente novamente mais tarde.<?php
                            }
                            ?></h4>
                    </div>
                </div>
                <?php include 'DC/footer.php'; ?>
            </div>            
        </div>
    </body>
</html>