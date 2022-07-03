var paginaAtual = 1;
var numeros = /[0-9]+$/; 
var letras = /[a-zA-Z]+$/; 
var corErro = "#ff7777";
var corDesabilitado = "#dddddd";
var corOk = "#ffffff";
var expBr = 0;
var expJp = 0;
window.onload=function()
{
	document.getElementById("parte_1").style.display="block";
	checarEstadoCivil();
        checarDescendente();
        checarTipoDescendencia();
	checarTipoEscolaridade();
	checarPossuiPassaporte();
	checarPossuiReentry();
	checarFoiJapao();
	checarOculos();
	checarSaude();
}

function checkParte1()
{
	var camposCorretos = 0;
	if(validarTexto(document.getElementById('inputNomeCompleto')) == false) camposCorretos = 1;
	if(validarDataNascimento(document.getElementById('inputDataNascimento')) == false) camposCorretos = 1;
	if(validarCPF(document.getElementById('inputCPF')) == false) camposCorretos = 1;
	if(validarTexto(document.getElementById('inputRG')) == false) camposCorretos = 1;
	if(validarTexto(document.getElementById('inputNomePai')) == false) camposCorretos = 1;
	if(validarTexto(document.getElementById('inputNomeMae')) == false) camposCorretos = 1;
	if(validarTexto(document.getElementById('inputEndereco')) == false) camposCorretos = 1;
	if(validarTextoPequeno(document.getElementById('inputCidade')) == false) camposCorretos = 1;
	if(validarTextoPequeno(document.getElementById('inputUF')) == false) camposCorretos = 1;
	if(validarCEP(document.getElementById('inputCEP')) == false) camposCorretos = 1;
	if(validarTelefone(document.getElementById('inputTelefone')) == false) camposCorretos = 1;
	if(validarCelular(document.getElementById('inputCelular')) == false) camposCorretos = 1;
	if(document.getElementById("inputSelectEstadoCivil").selectedIndex != 0)
	{
		if(validarTexto(document.getElementById('inputNomeConjuge')) == false) camposCorretos = 1;
		if(validarDataNascimento(document.getElementById('inputDataNascimentoConjuge')) == false) camposCorretos = 1;
	}
	if(camposCorretos == 0)
	{
		document.getElementById('erroMsg1').innerHTML = '';
		mudarPagina(2);
	}
	else
		document.getElementById('erroMsg1').innerHTML = '<span>Preencha corretamente os campos em vermelho</span>';
}

function checkParte2()
{
	var camposCorretos = 0;
        if(document.getElementById('descendenteSim').checked && document.getElementById("inputEscolaridade").selectedIndex > 3)
        {
            if(validarTexto(document.getElementById('inputNivelDescendencia')) == false) camposCorretos = 1;
        }
	if(document.getElementById("inputEscolaridade").selectedIndex < 4 && document.getElementById("inputEscolaridade").selectedIndex > -1)
	{
		if(validarTexto(document.getElementById('inputCursoSuperior')) == false) camposCorretos = 1;
	}
	if(document.getElementById('passaporteSim').checked)
	{
		if(validarTexto(document.getElementById('inputNumeroPassaporte')) == false) camposCorretos = 1;
		if(validarDataNascimento(document.getElementById('inputValidadePassaporte')) == false) camposCorretos = 1;
	}
	if(document.getElementById('reentrySim').checked)
	{
		if(validarTexto(document.getElementById('inputTipoVisto')) == false) camposCorretos = 1;
		if(validarDataNascimento(document.getElementById('inputValidadeVisto')) == false) camposCorretos = 1;
	}	
	if(camposCorretos == 0)
	{
		document.getElementById('erroMsg2').innerHTML = '';
		mudarPagina(3);
	}
	else
		document.getElementById('erroMsg2').innerHTML = '<span>Preencha corretamente os campos em vermelho</span>';
}

function checkParte3()
{
	var camposCorretos = 0;
	if(validarMedida(document.getElementById('inputPeso')) == false) camposCorretos = 1;
	if(validarMedida(document.getElementById('inputAltura')) == false) camposCorretos = 1;
	if(validarTextoPequeno(document.getElementById('inputSapato')) == false) camposCorretos = 1;
	if(document.getElementById('saudeRuim').checked)
	{
		if(validarTextoPequeno(document.getElementById('inputMotivo')) == false) camposCorretos = 1;
	}
	if(document.getElementById('oculosSim').checked)
	{
		if(validarTextoPequeno(document.getElementById('inputGrau')) == false) camposCorretos = 1;
	}	
	if(camposCorretos == 0)
	{
		document.getElementById('erroMsg3').innerHTML = '';
		mudarPagina(4);
	}
	else
		document.getElementById('erroMsg3').innerHTML = '<span>Preencha corretamente os campos em vermelho</span>';	
}

function checkParte4()
{
	mudarPagina(5);
}

function mudarPagina(numeroPagina)
{
	document.getElementById("parte_" + paginaAtual).style.display="none";
	document.getElementById("parte_" + numeroPagina).style.display="block";
	paginaAtual = numeroPagina;
}

function checarSaude()
{
	
	var campoSaude = document.getElementById('inputMotivo');
	var campoObgSaude = document.getElementById('motivoObrigatorio');
	if(document.getElementById('saudeBoa').checked)
	{
		campoSaude.disabled = true;		
		campoSaude.value="";		
		campoSaude.style.background=corDesabilitado;	
		campoSaude.onkeypress = '';
		campoSaude.onblur = '';			
		campoObgSaude.innerHTML = '';
	}
	else
	{
		campoSaude.disabled = false;
		campoSaude.style.background= corOk;
		campoSaude.setAttribute('onblur', "validarTextoPequeno(this)");			
		campoObgSaude.innerHTML = '*';		
	}		
}

function checarOculos()
{
	
	var campoGrau = document.getElementById('inputGrau');
	var campoObgGrau = document.getElementById('oculosObrigatorio');
	if(document.getElementById('oculosNao').checked)
	{
		campoGrau.disabled = true;		
		campoGrau.value="";		
		campoGrau.style.background=corDesabilitado;	
		campoGrau.onkeypress = '';
		campoGrau.onblur = '';			
		campoObgGrau.innerHTML = '';
	}
	else
	{
		campoGrau.disabled = false;
		campoGrau.style.background= corOk;
		campoGrau.setAttribute('onblur', "validarTextoPequeno(this)");			
		campoObgGrau.innerHTML = '*';		
	}		
}

function checarDescendente()
{
	var campoDescendencia = document.getElementById('inputDescendencia');
 	var campoNivelDescendencia = document.getElementById('inputNivelDescendencia');
	var campoObgNivelDescendencia = document.getElementById('descendenciaObrigatorio');        
	if(document.getElementById('descendenteNao').checked)
	{
		campoDescendencia.disabled = true;				
		campoDescendencia.style.background=corDesabilitado;	
                campoDescendencia.style.color= 'gray';			
		campoDescendencia.onchange = '';
		campoNivelDescendencia.disabled = true;		
		campoNivelDescendencia.value="";		
		campoNivelDescendencia.style.background=corDesabilitado;	
		campoNivelDescendencia.onkeypress = '';
		campoNivelDescendencia.onblur = '';			
		campoObgNivelDescendencia.innerHTML = '';                
	}
	else
	{
		campoDescendencia.disabled = false;			
		campoDescendencia.style.background=corOk;
                campoDescendencia.style.color= 'black';		
                campoDescendencia.setAttribute('onchange', "checarTipoDescendencia()");	
                checarTipoDescendencia();
	}	
}

function checarTipoDescendencia()
{
 	var campoNivelDescendencia = document.getElementById('inputNivelDescendencia');
	var campoObgNivelDescendencia = document.getElementById('descendenciaObrigatorio');
	var e = document.getElementById("inputDescendencia").selectedIndex;
	if(e < 4)
	{
		campoNivelDescendencia.disabled = true;		
		campoNivelDescendencia.value="";		
		campoNivelDescendencia.style.background=corDesabilitado;	
		campoNivelDescendencia.onkeypress = '';
		campoNivelDescendencia.onblur = '';			
		campoObgNivelDescendencia.innerHTML = '';		
	}
	else
	{
		campoNivelDescendencia.disabled = false;
		campoNivelDescendencia.style.background= corOk;
		campoNivelDescendencia.setAttribute('onblur', "validarTexto(this)");			
		campoObgNivelDescendencia.innerHTML = '*';		
	}   
}

function checarTipoEscolaridade()
{
	var campoCursoSuperior = document.getElementById('inputCursoSuperior');
	var campoObgCursoSuperior = document.getElementById('cursoSuperiorObrigatorio');
	var e = document.getElementById("inputEscolaridade").selectedIndex;
	if(e > -1 && e > 3)
	{
		campoCursoSuperior.disabled = true;		
		campoCursoSuperior.value="";		
		campoCursoSuperior.style.background=corDesabilitado;	
		campoCursoSuperior.onkeypress = '';
		campoCursoSuperior.onblur = '';			
		campoObgCursoSuperior.innerHTML = '';		
	}
	else
	{
		campoCursoSuperior.disabled = false;
		campoCursoSuperior.style.background= corOk;
		campoCursoSuperior.setAttribute('onblur', "validarTexto(this)");			
		campoObgCursoSuperior.innerHTML = '*';		
	}
}

function checarPossuiPassaporte()
{
	var campoPossuiPassaporte = document.getElementById('inputNumeroPassaporte');
	var campoObgPossuiPassaporte = document.getElementById('passaporteObrigatorio');
	var campoPossuiPassaporteData = document.getElementById('inputValidadePassaporte');
	var campoObgPossuiPassaporteData = document.getElementById('passaporteDataValidade');

	if(document.getElementById('passaporteNao').checked)
	{
		campoPossuiPassaporte.disabled = true;		
		campoPossuiPassaporte.value="";		
		campoPossuiPassaporte.style.background=corDesabilitado;	
		campoPossuiPassaporte.onkeypress = '';
		campoPossuiPassaporte.onblur = '';			
		campoObgPossuiPassaporte.innerHTML = '';
		campoPossuiPassaporteData.disabled = true;		
		campoPossuiPassaporteData.value="";		
		campoPossuiPassaporteData.style.background=corDesabilitado;	
		campoPossuiPassaporteData.onkeypress = '';
		campoPossuiPassaporteData.onblur = '';			
		campoObgPossuiPassaporteData.innerHTML = '';		
					
	}
	else
	{
		campoPossuiPassaporte.disabled = false;
		campoPossuiPassaporte.style.background= corOk;
		campoPossuiPassaporte.setAttribute('onblur', "validarTexto(this)");			
		campoObgPossuiPassaporte.innerHTML = '*';
		campoPossuiPassaporteData.disabled = false;
		campoPossuiPassaporteData.style.background= corOk;
		campoPossuiPassaporteData.setAttribute('onkeypress', "return checarDataNascimento(event,this);");	
		campoPossuiPassaporteData.setAttribute('onblur', "validarDataNascimento(this)");			
		campoObgPossuiPassaporteData.innerHTML = '*';		
	}	
}

function checarPossuiReentry()
{
	var campoTipoVisto = document.getElementById('inputTipoVisto');
	var campoObgTipoVisto = document.getElementById('vistoObrigatorio');
	var campoTipoVistoData = document.getElementById('inputValidadeVisto');
	var campoObgTipoVistoData = document.getElementById('vistoDataValidade');	
	if(document.getElementById('reentryNao').checked)
	{
		campoTipoVisto.disabled = true;		
		campoTipoVisto.value="";		
		campoTipoVisto.style.background=corDesabilitado;	
		campoTipoVisto.onkeypress = '';
		campoTipoVisto.onblur = '';			
		campoObgTipoVisto.innerHTML = '';			
		campoTipoVistoData.disabled = true;		
		campoTipoVistoData.value="";		
		campoTipoVistoData.style.background=corDesabilitado;	
		campoTipoVistoData.onkeypress = '';
		campoTipoVistoData.onblur = '';			
		campoObgTipoVistoData.innerHTML = '';			
	}
	else
	{
		campoTipoVisto.disabled = false;
		campoTipoVisto.style.background= corOk;
		campoTipoVisto.setAttribute('onblur', "validarTexto(this)");			
		campoObgTipoVisto.innerHTML = '*';		
		campoTipoVistoData.disabled = false;
		campoTipoVistoData.style.background= corOk;
		campoTipoVistoData.setAttribute('onkeypress', "return checarDataNascimento(event,this);");	
		campoTipoVistoData.setAttribute('onblur', "validarDataNascimento(this)");		
		campoObgTipoVistoData.innerHTML = '*';		
	}	
}

function checarFoiJapao()
{
	var campoFoiJapao = document.getElementById('inputIdaJapao');
	if(document.getElementById('japaoNao').checked)
	{
		campoFoiJapao.disabled = true;		
		campoFoiJapao.value="";		
		campoFoiJapao.style.background=corDesabilitado;	
		campoFoiJapao.onkeypress = '';								
	}
	else
	{
		campoFoiJapao.disabled = false;
		campoFoiJapao.style.background= corOk;
		campoFoiJapao.setAttribute('onkeypress', "return aceitarNumeros(event);");		
	}	
}

function checarEstadoCivil()
{
	var campoNomeConj = document.getElementById('inputNomeConjuge');
	var campoDtConj = document.getElementById('inputDataNascimentoConjuge');
	var campoObgNomeConj = document.getElementById('conjNomeObrigatorio');
	var campoObgDataConj = document.getElementById('conjDataObrigatorio');
	var e = document.getElementById("inputSelectEstadoCivil").selectedIndex;
	if(e == 0)
	{
		campoNomeConj.disabled = true;		
		campoNomeConj.value="";		
		campoNomeConj.style.background=corDesabilitado;	
		campoNomeConj.onkeypress = '';
		campoNomeConj.onblur = '';			
		campoDtConj.disabled = true;
		campoDtConj.value="";
		campoDtConj.style.background=corDesabilitado;
		campoDtConj.onkeypress = '';
		campoDtConj.onblur = '';	
		campoObgNomeConj.innerHTML = '';
		campoObgDataConj .innerHTML = '';		
	}
	else
	{
		campoNomeConj.disabled = false;
		campoNomeConj.style.background="#ffffff";
		campoNomeConj.setAttribute('onblur', "validarTexto(this)");	
                campoDtConj.disabled = false;		
		campoDtConj.style.background ="#ffffff";
		campoDtConj.setAttribute('onkeypress', "return checarDataNascimento(event, this);");
		campoDtConj.setAttribute('onblur', "validarDataNascimento(this)");			
		campoObgNomeConj.innerHTML = '*';
		campoObgDataConj .innerHTML = '*';		
	}
}

function checarCelular(e,campo)
{
	if(aceitarNumeros(e))
	{
		var tamAtual = campo.value.length;
		if(tamAtual == 0)
		{
			campo.value = '(';
		}
		else if(tamAtual == 3)
		{
			campo.value = campo.value + ')(';
		}
		else if(tamAtual == 4)
		{
			campo.value = campo.value + '(';
		}		
		else if(tamAtual == 7)
		{
			campo.value = campo.value + ')';
		}
		return true;	
	}
	else
		return false;	
}

function checarTelefone(e)
{
	if(aceitarNumeros(e))
	{
		var tamAtual = document.getElementById("inputTelefone").value.length;
		if(tamAtual == 0)
		{
			document.getElementById("inputTelefone").value = '(';
		}
		else if(tamAtual == 3)
		{
			document.getElementById("inputTelefone").value = document.getElementById("inputTelefone").value + ')(';
		}
		else if(tamAtual == 4)
		{
			document.getElementById("inputTelefone").value = document.getElementById("inputTelefone").value + '(';
		}		
		else if(tamAtual == 7)
		{
			document.getElementById("inputTelefone").value = document.getElementById("inputTelefone").value + ')';
		}
		return true;	
	}
	else
		return false;	
}

function checarCEP(e)
{
	if(aceitarNumeros(e))
	{
		var tamAtual = document.getElementById("inputCEP").value.length;
		if(tamAtual == 5)
		{
			document.getElementById("inputCEP").value = document.getElementById("inputCEP").value + '-';
		}
	}
	else
		return false;
}

function checarCPF(e)
{
	if(aceitarNumeros(e))
	{
		var tamAtual = document.getElementById("inputCPF").value.length;
		if(tamAtual == 3 || tamAtual == 7)
		{
			document.getElementById("inputCPF").value = document.getElementById("inputCPF").value + '.';
		}
		else if(tamAtual == 11)
		{
			document.getElementById("inputCPF").value = document.getElementById("inputCPF").value + '-';
		}
		return true;
	}
	else
		return false;
}

function checarDataNascimento(e,campo)
{
	if(aceitarNumeros(e))
	{
		var tamAtual = campo.value.length;
		if(tamAtual == 2 || tamAtual == 5)
		{
			campo.value = campo.value + '/';
		}
		return true;	
	}
	else
		return false;
}

function validarMedida(campo)
{
	var medida = campo.value;
	medida = medida.replace(',','');
	if(!medida.match(numeros) || medida.length == 0)
	{
		medida = campo.value;
		medida = medida.replace('.','');
		if(!medida.match(numeros) || medida.length == 0)
		{
			campo.style.background = corErro;
			return false;			
		}
	}
	campo.style.background = corOk;
	return true;	
	
}
function validarCelular(campo)
{
	var celular = campo.value;
	celular = celular.split('(').join('');
	celular = celular.split(')').join('');
	if(!celular.match(numeros) || celular.length < 12)
	{
		campo.style.background = corErro;
		return false;		
	}	
	campo.style.background = corOk;
	return true;
}

function validarTelefone(campo)
{
	var telefone = campo.value;
	telefone = telefone.split('(').join('');
	telefone = telefone.split(')').join('');
	if(!telefone.match(numeros) || telefone.length != 12)
	{
		campo.style.background = corErro;
		return false;		
	}	
	campo.style.background = corOk;
	return true;
}

function validarCEP(campo)
{
	var cep = campo.value;
	cep = cep.replace('-','');
	if(!cep.match(numeros) || cep.length != 8)
	{
		campo.style.background = corErro;
		return false;		
	}
	campo.style.background = corOk;
	return true;
}

function validarCPF(campo)
{
	var cpf = campo.value;
	var iterador;
	var primeiroDigito = 0;
	var segundoDigito = 0;
	
	cpf = cpf.split('.').join('');
	cpf = cpf.replace('-','');
	if(!cpf.match(numeros) || cpf.length != 11)
	{
		campo.style.background = corErro;
		return false;	
	}
	for(iterador = 0;iterador < 9;iterador++)
	{
		primeiroDigito = primeiroDigito + (cpf[iterador]*(10-iterador));
	}
	primeiroDigito = primeiroDigito %11;
	if(primeiroDigito < 2)
		primeiroDigito = 0;
	else
		primeiroDigito = 11 - primeiroDigito;
	if(cpf[9]!=primeiroDigito)
	{
		campo.style.background = corErro;
		return false;		
	}
	for(iterador = 0;iterador < 10;iterador++)
	{
		segundoDigito = segundoDigito + (cpf[iterador]*(11-iterador));
	}	
	segundoDigito = segundoDigito % 11;
	if(segundoDigito  < 2)
		segundoDigito = 0;
	else
		segundoDigito = 11 - segundoDigito;
	if(cpf[10]!=segundoDigito)
	{
		campo.style.background = corErro;
		return false;		
	}	
	campo.style.background = corOk;
	return true;
}

function validarDataNascimento(campo)
{
	var data = campo.value.split("/");
	var numeros = /[0-9]+$/; 
	if(
	campo.value.length < 10 || 
	data.length != 3 || 
	data[0].length != 2 || 
	!data[0].match(numeros) ||
	data[0] > 31 ||
	data[0] < 1 ||
	data[1].length != 2 ||
	!data[1].match(numeros) ||
	data[1] > 12 || 
	data[1] < 1 || 
	data[2].length != 4 ||
	!data[2].match(numeros) ||
	data[2] < 1700
	)
	{
		campo.style.background = corErro;
		return false;
	}
	campo.style.background = corOk;
	return true;
}

function validarTexto(campo)
{
	if(campo.value.length < 5)
	{
		campo.style.background = corErro;
		return false;	
	}
	else
	{
		campo.style.background = corOk;
		return true;
	}
}

function validarTextoPequeno(campo)
{
	if(campo.value.length < 2)
	{
		campo.style.background = corErro;
		return false;
	}
	else
	{
		campo.style.background = corOk;
		return true;
	}
}

function aceitarNumeros(e)
{
	var key = e.keyCode? e.keyCode : e.charCode
	if ( key < 48 || key > 57 )
		return false;
	return true;
}

function removerElemento(id,tipo)
{
	(document.getElementById(id)).parentNode.removeChild(document.getElementById(id))
	if(tipo == 1 && expJp > 0)
		expJp = expJp - 1;
	else if(tipo == 2 && expBr > 0)
		expBr = expBr - 1;
}


function adicionarNovaExperiencia(tipo)
{
	var contador;
	var table;
	var nomeLista;
	var concatenador;
	if(tipo == 1 && expJp < 10)
	{
		expJp = expJp + 1;
		table = document.getElementById("listaExperienciaJapao");
		nomeLista = 'Jp';
		contador = expJp;
                document.getElementById("qtdeExperienciaJapao").value = expJp;
	}
	else if(tipo == 2 && expBr < 10)
	{
		expBr = expBr + 1;
		table = document.getElementById("listaExperienciaBrasil");
		nomeLista = 'Br';
		contador = expBr;
                document.getElementById("qtdeExperienciaBrasil").value = expBr;
	}
	else
		return false;
	var row = table.insertRow(-1);
	row.id = 'exp' + nomeLista + contador;
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	var cell4 = row.insertCell(3);
	var cell5 = row.insertCell(4);
	cell1.id = 'experienciaDesc';
	cell2.id = 'experienciaPeriodo';
	cell3.id = 'experienciaPeriodo';
	cell4.id = 'experienciaDesc';
	cell5.id = 'experienciaRemover';
	concatenador = nomeLista + contador;
	cell1.innerHTML = '<input type="text" id="expTipo' + concatenador + '" maxlength="100" name="expTipo' + concatenador + '">';
	cell2.innerHTML = '<input type="text" id="expInit' + concatenador + '" maxlength="100" name="expInit' + concatenador + '">';
	cell3.innerHTML = '<input type="text" id="expFim' + concatenador + '" maxlength="100" name="expFim' + concatenador + '">';
	cell4.innerHTML = '<input type="text" id="expLocal' + concatenador + '" maxlength="100" name="expLocal' + concatenador + '">';
	cell5.innerHTML = '<button type="button" class="botaoFormulario" onclick="removerElemento(\'exp' + concatenador + '\',' + tipo + ')">Remover</button>';
	return true;
}