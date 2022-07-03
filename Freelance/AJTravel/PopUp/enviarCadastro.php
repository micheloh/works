<!DOCTYPE html>
<html>
    <head>

        <title>AJTravel - Cadastro de curriculum</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="formulario.css">
    </head>
    <style>
        h3
        {
            text-align: center;
            font-size: large;
        }  

    </style>
    <body>
        <div id="banner"></div>
        <div>

            <h3><?php
//                $formNome = filter_input(INPUT_POST, 'nome', FILTER_NULL_ON_FAILURE);
//                $formDataNascimento = filter_input(INPUT_POST, 'dataNascimento', FILTER_NULL_ON_FAILURE);
//                $formCPF = filter_input(INPUT_POST, 'CPF', FILTER_NULL_ON_FAILURE);
//                $formRG = filter_input(INPUT_POST, 'RG', FILTER_NULL_ON_FAILURE);
//                $formSexo = filter_input(INPUT_POST, 'sexo', FILTER_NULL_ON_FAILURE);
//                $formNomePai = filter_input(INPUT_POST, 'nomePai', FILTER_NULL_ON_FAILURE);
//                $formNomeMae = filter_input(INPUT_POST, 'nomeMae', FILTER_NULL_ON_FAILURE);
//                $formEndereco = filter_input(INPUT_POST, 'endereco', FILTER_NULL_ON_FAILURE);
//                $formCidade = filter_input(INPUT_POST, 'cidade', FILTER_NULL_ON_FAILURE);
//                $formUf = filter_input(INPUT_POST, 'uf', FILTER_NULL_ON_FAILURE);
//                $formCep = filter_input(INPUT_POST, 'cep', FILTER_NULL_ON_FAILURE);
//                $formTelefone = filter_input(INPUT_POST, 'telefone', FILTER_NULL_ON_FAILURE);
//                $formCelular = filter_input(INPUT_POST, 'celular', FILTER_NULL_ON_FAILURE);
//                $formSelectEstadoCivil = filter_input(INPUT_POST, 'selectEstadoCivil', FILTER_NULL_ON_FAILURE);
//                $formNacionalidade = filter_input(INPUT_POST, 'nacionalidade', FILTER_NULL_ON_FAILURE);
//                $formDescendente = filter_input(INPUT_POST, 'descendente', FILTER_NULL_ON_FAILURE);
//                $formSelectEscolaridade = filter_input(INPUT_POST, 'selectEscolaridade', FILTER_NULL_ON_FAILURE);
//                $formPassaporte = filter_input(INPUT_POST, 'passaporte', FILTER_NULL_ON_FAILURE);
//                $formReentry = filter_input(INPUT_POST, 'reentry', FILTER_NULL_ON_FAILURE);
//                $formFoijapao = filter_input(INPUT_POST, 'foijapao', FILTER_NULL_ON_FAILURE);
//                $formCartaBrasil = filter_input(INPUT_POST, 'cartaBrasil', FILTER_NULL_ON_FAILURE);
//                $formCartaJapao = filter_input(INPUT_POST, 'cartaJapao', FILTER_NULL_ON_FAILURE);
//                $formPeso = filter_input(INPUT_POST, 'peso', FILTER_NULL_ON_FAILURE);
//                $formAltura = filter_input(INPUT_POST, 'altura', FILTER_NULL_ON_FAILURE);
//                $formSapato = filter_input(INPUT_POST, 'sapato', FILTER_NULL_ON_FAILURE);
//                $formCoordenacao = filter_input(INPUT_POST, 'coordenacao', FILTER_NULL_ON_FAILURE);
//                $formOculos = filter_input(INPUT_POST, 'oculos', FILTER_NULL_ON_FAILURE);
//                $formBebidas = filter_input(INPUT_POST, 'bebidas', FILTER_NULL_ON_FAILURE);
//                $formFumante = filter_input(INPUT_POST, 'fumante', FILTER_NULL_ON_FAILURE);
//                $formTatuagem = filter_input(INPUT_POST, 'tatuagem', FILTER_NULL_ON_FAILURE);
//                $formSaude = filter_input(INPUT_POST, 'saude', FILTER_NULL_ON_FAILURE);
//                $formSelectJpEntende = filter_input(INPUT_POST, 'selectJpEntende', FILTER_NULL_ON_FAILURE);
//                $formSelectJpFala = filter_input(INPUT_POST, 'selectJpFala', FILTER_NULL_ON_FAILURE);
//                $formSelectJpLe = filter_input(INPUT_POST, 'selectJpLe', FILTER_NULL_ON_FAILURE);
//                $formSelectJpEscreve = filter_input(INPUT_POST, 'selectJpEscreve', FILTER_NULL_ON_FAILURE);

                $formNome = $_POST['nome'];
                $formDataNascimento = $_POST['dataNascimento'];
                $formCPF = $_POST['CPF'];
                $formRG = $_POST['RG'];
                $formSexo = $_POST['sexo'];
                $formNomePai = $_POST['nomePai'];
                $formNomeMae = $_POST['nomeMae'];
                $formEndereco = $_POST['endereco'];
                $formCidade = $_POST['cidade'];
                $formUf = $_POST['uf'];
                $formCep = $_POST['cep'];
                $formTelefone = $_POST['telefone'];
                $formCelular = $_POST['celular'];
                $formSelectEstadoCivil = $_POST['selectEstadoCivil'];
                $formNacionalidade = $_POST['nacionalidade'];
                $formDescendente = $_POST['descendente'];
                $formSelectEscolaridade = $_POST['selectEscolaridade'];
                $formPassaporte = $_POST['passaporte'];
                $formReentry = $_POST['reentry'];
                $formFoijapao = $_POST['foijapao'];
                $formCartaBrasil = $_POST['cartaBrasil'];
                $formCartaJapao = $_POST['cartaJapao'];
                $formPeso = $_POST['peso'];
                $formAltura = $_POST['altura'];
                $formSapato = $_POST['sapato'];
                $formCoordenacao = $_POST['coordenacao'];
                $formOculos = $_POST['oculos'];
                $formBebidas = $_POST['bebidas'];
                $formFumante = $_POST['fumante'];
                $formTatuagem = $_POST['tatuagem'];
                $formSaude = $_POST['saude'];
                $formSelectJpEntende = $_POST['selectJpEntende'];
                $formSelectJpFala = $_POST['selectJpFala'];
                $formSelectJpLe = $_POST['selectJpLe'];
                $formSelectJpEscreve = $_POST['selectJpEscreve'];

                if (
                        $formNome !== false &&
                        $formDataNascimento !== false &&
                        $formCPF !== false &&
                        $formRG !== false &&
                        $formSexo !== false &&
                        $formNomePai !== false &&
                        $formNomeMae !== false &&
                        $formEndereco !== false &&
                        $formCidade !== false &&
                        $formUf !== false &&
                        $formCep !== false &&
                        $formTelefone !== false &&
                        $formCelular !== false &&
                        $formSelectEstadoCivil !== false &&
                        $formNacionalidade !== false &&
                        $formDescendente !== false &&
                        $formSelectEscolaridade !== false &&
                        $formPassaporte !== false &&
                        $formReentry !== false &&
                        $formFoijapao !== false &&
                        $formCartaBrasil !== false &&
                        $formCartaJapao !== false &&
                        $formPeso !== false &&
                        $formAltura !== false &&
                        $formSapato !== false &&
                        $formCoordenacao !== false &&
                        $formOculos !== false &&
                        $formBebidas !== false &&
                        $formFumante !== false &&
                        $formTatuagem !== false &&
                        $formSaude !== false &&
                        $formSelectJpEntende !== false &&
                        $formSelectJpFala !== false &&
                        $formSelectJpLe !== false &&
                        $formSelectJpEscreve !== false
                ) {
                    ini_set('include_path', ini_get('include_path') . ';../Classes/');
                    include 'PHPExcel.php';
                    include 'PHPExcel/Writer/Excel2007.php';
                    $objPHPExcel = new PHPExcel();
                    $objPHPExcel->getProperties()->setCreator('AJTravel');
                    $objPHPExcel->getProperties()->setLastModifiedBy('AJTravel');
                    $objPHPExcel->getProperties()->setTitle('Formulário de cadastro de ' . $formNome);
                    $objPHPExcel->getProperties()->setSubject('Cadastro de curriculum');
                    $objPHPExcel->getProperties()->setDescription("Curriculum");
                    $objPHPExcel->getDefaultStyle()->getFont()->setName('Calibri');
                    $objPHPExcel->getDefaultStyle()->getFont()->setSize(10);
                    $objPHPExcel->getDefaultStyle()->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_TEXT);
                    $styleBorda = array('borders' => array('outline' => array('style' => PHPExcel_Style_Border::BORDER_MEDIUM, 'color' => array('argb' => '00000000'),),),);
                    $styleNegrito = array('font' => array('bold' => true));
                    $objPHPExcel->setActiveSheetIndex(0);
                    $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(32);
                    $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(18);
                    $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(18);
                    $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(18);
                    $highestColumn = "Z";
                    $highestRow = "100";
                    $objPHPExcel->getActiveSheet()->getStyle('a1:' . $highestColumn . $highestRow)->applyFromArray(
                            array(
                                'fill' => array(
                                    'type' => PHPExcel_Style_Fill::FILL_SOLID,
                                    'color' => array('rgb' => 'FFFFFF')
                                )
                            )
                    );



                    $objPHPExcel->getActiveSheet()->getStyle('A1:A80')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
                    $objPHPExcel->getActiveSheet()->getStyle('B1:B80')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
                    $objPHPExcel->getActiveSheet()->getStyle('C1:C80')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
                    $objPHPExcel->getActiveSheet()->getStyle('D1:D80')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
                    $objPHPExcel->getActiveSheet()->getStyle('A1:A80')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                    $objPHPExcel->getActiveSheet()->getStyle('B1:B80')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
                    $objPHPExcel->getActiveSheet()->getStyle('C1:C80')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                    $objPHPExcel->getActiveSheet()->getStyle('D1:D80')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);

                    $linhaAtual = 1;

                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Informações do Cliente');
                    $objPHPExcel->getActiveSheet()->mergeCells('A' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->applyFromArray($styleNegrito);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Nome Completo:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formNome);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Sexo:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formSexo);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'Data de Nascimento:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, $formDataNascimento);
                    $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'RG:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formRG);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'CPF:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, $formCPF);
                    $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Nome do Pai:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formNomePai);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Nome da Mãe:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formNomeMae);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Endereço no Brasil:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formEndereco);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'UF:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formUf);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Telefone:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formTelefone);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'Celular:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, $formCelular);
                    $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Nacionalidade:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formNacionalidade);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Descendencia Japonesa:');
                    if ($formDescendente == 'descendenteNao') {
                        $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, 'Não');
                    } else {
                        $formNivelDescendencia = filter_input(INPUT_POST, 'selectDescendencia');
                        if ($formNivelDescendencia == 'Outro') {
                            $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, filter_input(INPUT_POST, 'selectDescendencia'));
                        } else {
                            $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formNivelDescendencia);
                        }
                    }
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Escolaridade:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formSelectEscolaridade);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;
                    if ($formSelectEscolaridade == 'Pós-Graduação Completo' || $formSelectEscolaridade == 'Pós-Graduação Incompleto' || $formSelectEscolaridade == 'Superior Completo' || $formSelectEscolaridade == 'Superior Incompleto') {
                        $formNomeCursoSuperior = filter_input(INPUT_POST, 'cursoSuperior');
                        $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Curso:');
                        $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formNomeCursoSuperior);
                        $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                        $linhaAtual++;
                    }

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Possui carta de Habilitação no Brasil:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formCartaBrasil);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'No Japão:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, $formCartaJapao);
                    $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Estado Civil:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formSelectEstadoCivil);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;
                    $formConjNome = filter_input(INPUT_POST, 'nomeConjuge');
                    $formConjDataNascimento = filter_input(INPUT_POST, 'dataNascimentoConjuge');
                    if (
                            $formConjNome !== false && $formConjNome !== '' &&
                            $formConjDataNascimento !== false && $formConjDataNascimento !== ''
                    ) {
                        $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Nome do Conjugue:');
                        $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formConjNome);
                        $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                        $linhaAtual++;

                        $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Data de Nascimento do Conjugue:');
                        $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formConjDataNascimento);
                        $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                        $linhaAtual++;
                    }

                    $linhaAtual++; //inserir quebra de bloco

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Dados de Viagem');
                    $objPHPExcel->getActiveSheet()->mergeCells('A' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->applyFromArray($styleNegrito);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Passaporte:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formPassaporte);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;
                    if ($formPassaporte == 'Possui') {
                        $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Numero:');
                        $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, filter_input(INPUT_POST, 'numeroPassaporte'));
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                        $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'Data de validade:');
                        $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, filter_input(INPUT_POST, 'validadePassaporte'));
                        $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                        $linhaAtual++;
                    }



                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Reentry:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formReentry);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;
                    if ($formReentry == 'Possui') {
                        $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Tipo do Visto:');
                        $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, filter_input(INPUT_POST, 'tipoVisto'));
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                        $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'Data de validade:');
                        $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, filter_input(INPUT_POST, 'validadeVisto'));
                        $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                        $linhaAtual++;
                    }

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Ja esteve no Japão:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formFoijapao);
                    if ($formFoijapao == 'Sim') {
                        $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'Quantas vezes:');
                        $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, filter_input(INPUT_POST, 'idaJapao'));
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                        $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    } else {
                        $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    }
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;


                    $linhaAtual++; //inserir quebra de bloco

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Lingua Japonesa');
                    $objPHPExcel->getActiveSheet()->mergeCells('A' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->applyFromArray($styleNegrito);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Entende:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formSelectJpEntende);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'Fala:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, $formSelectJpFala);
                    $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Le:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formSelectJpLe);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'Escreve:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, $formSelectJpEscreve);
                    $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;

                    $linhaAtual++; //inserir quebra de bloco

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Saúde do Cliente');
                    $objPHPExcel->getActiveSheet()->mergeCells('A' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->applyFromArray($styleNegrito);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
                    $linhaAtual++;
                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Peso:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formPeso . 'Kg');
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'Altura:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, $formAltura . 'm');
                    $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;
                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Coordenação:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formCoordenacao);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'Número do Sapato:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, $formSapato);
                    $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;
                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Usa óculos:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formOculos);
                    if ($formOculos == 'Usa') {
                        $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'Grau:');
                        $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, filter_input(INPUT_POST, 'grau'));
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                        $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    } else {
                        $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    }
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;
                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Consome Bebidas Alcoólicas:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formBebidas);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'Fumante:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, $formFumante);
                    $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;
                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Possui Tatuagem:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formTatuagem);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;
                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Estado de Saúde:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formSaude);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;
                    if ($formSaude == 'Ruim') {
                        $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Motivo:');
                        $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, filter_input(INPUT_POST, 'motivo'));
                        $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . ($linhaAtual + 3));
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . ($linhaAtual + 3))->applyFromArray($styleBorda);
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . ($linhaAtual + 3))->getAlignment()->setWrapText(true);
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . ($linhaAtual + 3))->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_TOP);
                        $linhaAtual++;
                        $linhaAtual++;
                        $linhaAtual++;
                        $linhaAtual++;
                    }

                    $linhaAtual++; //inserir quebra de bloco

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Referência no Japão');
                    $objPHPExcel->getActiveSheet()->mergeCells('A' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->applyFromArray($styleNegrito);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
                    $linhaAtual++;
                    $formRefJpNome = filter_input(INPUT_POST, 'refJpNome');
                    if ($formRefJpNome == false)
                        $formRefJpNome = '';
                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Nome:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formRefJpNome);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;
                    $formRefJpParentesco = filter_input(INPUT_POST, 'refJpParentesco');
                    if ($formRefJpParentesco == false)
                        $formRefJpParentesco = '';
                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Parentesco:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formRefJpParentesco);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;
                    $formRefJpEndereco = filter_input(INPUT_POST, 'refJpEndereco');
                    if ($formRefJpEndereco == false)
                        $formRefJpEndereco = '';
                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Endereço:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formRefJpEndereco);
                    $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;
                    $formRefJpTelefone1 = filter_input(INPUT_POST, 'refJpTelefone1');
                    if ($formRefJpTelefone1 == false)
                        $formRefJpTelefone1 = '';
                    $formRefJpTelefone2 = filter_input(INPUT_POST, 'refJpTelefone2');
                    if ($formRefJpTelefone2 == false)
                        $formRefJpTelefone2 = '';
                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Telefone1:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formRefJpTelefone1);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'Telefone2:');
                    $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, $formRefJpTelefone2);
                    $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $linhaAtual++;

                    $formQtdeExperienciaBrasil = filter_input(INPUT_POST, 'qtdeExperienciaBrasil');
                    $formQtdeExperienciaJapao = filter_input(INPUT_POST, 'qtdeExperienciaJapao');
                    if ($formQtdeExperienciaBrasil == false) {
                        $formQtdeExperienciaBrasil = 0;
                    }
                    if ($formQtdeExperienciaJapao == false) {
                        $formQtdeExperienciaJapao = 0;
                    }
                    if ($formQtdeExperienciaBrasil > 0 && $formQtdeExperienciaBrasil > 0) {
                        $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Experiência Profissional');
                        $objPHPExcel->getActiveSheet()->mergeCells('A' . $linhaAtual . ':D' . $linhaAtual);
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->applyFromArray($styleNegrito);
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                        $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
                        $linhaAtual++;
                        $varAuxExpBrasil = 1;
                        if ($formQtdeExperienciaBrasil <= 10) {
                            $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'No Brasil');
                            $objPHPExcel->getActiveSheet()->mergeCells('A' . $linhaAtual . ':D' . $linhaAtual);
                            $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->applyFromArray($styleNegrito);
                            $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                            $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
                            $linhaAtual++;
                            while ($varAuxExpBrasil <= $formQtdeExperienciaBrasil) {
                                $formExpTipo = filter_input(INPUT_POST, 'expTipoBr' . $varAuxExpBrasil);
                                $formExpInit = filter_input(INPUT_POST, 'expInitBr' . $varAuxExpBrasil);
                                $formExpFim = filter_input(INPUT_POST, 'expFimBr' . $varAuxExpBrasil);
                                $formExpLocal = filter_input(INPUT_POST, 'expLocalBr' . $varAuxExpBrasil);
                                $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Experiência ' . $varAuxExpBrasil);
                                $objPHPExcel->getActiveSheet()->mergeCells('A' . $linhaAtual . ':D' . $linhaAtual);
                                $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->applyFromArray($styleNegrito);
                                $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                                $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
                                $linhaAtual++;
                                $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Tipo de Serviço:');
                                $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formExpTipo);
                                $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                                $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                                $linhaAtual++;
                                $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Local de Trabalho:');
                                $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formExpLocal);
                                $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                                $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                                $linhaAtual++;
                                $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Período Inicial:');
                                $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formExpInit);
                                $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                                $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'Período Final:');
                                $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, $formExpFim);
                                $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                                $linhaAtual++;
                                $varAuxExpBrasil++;
                            }
                        }
                        $varAuxExpJapao = 1;
                        if ($formQtdeExperienciaJapao <= 10) {
                            $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'No Japão');
                            $objPHPExcel->getActiveSheet()->mergeCells('A' . $linhaAtual . ':D' . $linhaAtual);
                            $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->applyFromArray($styleNegrito);
                            $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                            $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
                            $linhaAtual++;
                            while ($varAuxExpJapao <= $formQtdeExperienciaJapao) {
                                $formExpTipo = filter_input(INPUT_POST, 'expTipoJp' . $varAuxExpJapao);
                                $formExpInit = filter_input(INPUT_POST, 'expInitJp' . $varAuxExpJapao);
                                $formExpFim = filter_input(INPUT_POST, 'expFimJp' . $varAuxExpJapao);
                                $formExpLocal = filter_input(INPUT_POST, 'expLocalJp' . $varAuxExpJapao);
                                $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Experiência ' . $varAuxExpJapao);
                                $objPHPExcel->getActiveSheet()->mergeCells('A' . $linhaAtual . ':D' . $linhaAtual);
                                $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->applyFromArray($styleNegrito);
                                $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                                $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
                                $linhaAtual++;
                                $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Tipo de Serviço:');
                                $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formExpTipo);
                                $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                                $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                                $linhaAtual++;
                                $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Local de Trabalho:');
                                $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formExpLocal);
                                $objPHPExcel->getActiveSheet()->mergeCells('B' . $linhaAtual . ':D' . $linhaAtual);
                                $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                                $linhaAtual++;
                                $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Período Inicial:');
                                $objPHPExcel->getActiveSheet()->SetCellValue('B' . $linhaAtual, $formExpInit);
                                $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':B' . $linhaAtual)->applyFromArray($styleBorda);
                                $objPHPExcel->getActiveSheet()->SetCellValue('C' . $linhaAtual, 'Período Final:');
                                $objPHPExcel->getActiveSheet()->SetCellValue('D' . $linhaAtual, $formExpFim);
                                $objPHPExcel->getActiveSheet()->getStyle('C' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                                $linhaAtual++;
                                $varAuxExpJapao++;
                            }
                        }
                    }

                    $linhaAtual++; //inserir quebra de bloco

                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, 'Considerações Finais');
                    $objPHPExcel->getActiveSheet()->mergeCells('A' . $linhaAtual . ':D' . $linhaAtual);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->applyFromArray($styleNegrito);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . $linhaAtual)->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
                    $linhaAtual++;
                    $formConsideracoes = filter_input(INPUT_POST, 'consideracoesFinais');
                    if ($formConsideracoes == false)
                        $formConsideracoes = '';
                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $linhaAtual, $formConsideracoes);
                    $objPHPExcel->getActiveSheet()->mergeCells('A' . $linhaAtual . ':D' . ($linhaAtual + 3));
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . ($linhaAtual + 3))->applyFromArray($styleBorda);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual . ':D' . ($linhaAtual + 3))->getAlignment()->setWrapText(true);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $linhaAtual)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_TOP);

                    for (; $linhaAtual > 0; $linhaAtual--)
                        $objPHPExcel->getActiveSheet()->getRowDimension($linhaAtual)->setRowHeight(20);



                    //fim da geracao do excel



                    $data = null;
                    @ob_start();

                    $objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);
                    $objWriter->save('php://output');

                    $data = @ob_get_contents();

                    @ob_end_clean();

                    if ($data != null) {

                        require_once('class.phpmailer.php');
                        include('../DC/dadosEmail.php');

                        $mail = new PHPMailer();

                        $emailmsg = 'Foi realizado um cadastro de formulário pelo site.<br><br>O formulário preenchido está anexado ao email.';
                        $assuntoEmail = 'Cadastro de Curriculum';

                        $body = $emailmsg;
                        $mail->IsSMTP();
                        $mail->SMTPDebug = 0;
                        $mail->SMTPAuth = true;
                        $mail->SMTPSecure = "tls";
                        $mail->Host = $smtpemail;
                        $mail->Port = $smtpporta;
                        $mail->Username = $emailusuario;
                        $mail->Password = $emailsenha;


                        $mail->SetFrom($emailusuario, $nomeDoRemetente);

                        $mail->AddReplyTo($emailusuario, $nomeDoRemetente);

                        $mail->Subject = $formNome . ' - ' . $assuntoEmail;

                        $mail->AltBody = "Para ver a mensagem utilize um visualizador compatível com HTML"; // optional, comment out and test

                        $mail->MsgHTML($body);


                        $mail->AddAddress($destinatario, "Administrador AJTravel");
                        $mail->AddStringAttachment($data, date('Y') . '-' . date('m') . '-' . date('d') . '-' . $formNome . '.xls');      // attachment

                        if (!$mail->Send()) {
                            echo 'Não foi possível enviar o cadastro, por favor tente mais tarde.';
                        } else {
                            echo 'Cadastro enviado com sucesso!';
                        }
                    }
                } else {
//                    $formNome = filter_input(INPUT_POST, 'nome', FILTER_NULL_ON_FAILURE);
//                    $formDataNascimento = filter_input(INPUT_POST, 'dataNascimento', FILTER_NULL_ON_FAILURE);
//                    $formCPF = filter_input(INPUT_POST, 'CPF', FILTER_NULL_ON_FAILURE);
//                    $formRG = filter_input(INPUT_POST, 'RG', FILTER_NULL_ON_FAILURE);
                    echo $_POST["nome"] . '<br>';
                    echo $_POST["dataNascimento"] . '<br>';
                    echo $_POST["CPF"] . '<br>';
                    echo $_POST["RG"] . '<br>';
                    echo 'Não foi possível enviar o cadastro, por favor tente mais tarde.';
                }
                ?></h3>

            <center><button type="button" class="botaoFormulario" onclick="self.close()">Fechar Janela</button></center>

        </div>

    </body>
</html>