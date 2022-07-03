<!DOCTYPE HTML>
<html>
<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<title>AJTravel</title>
    	<link rel="stylesheet" type="text/css" href="ajtravelcss.css">
</head>
<script type="text/javascript">
function abrirFormulario() {
	popupWindow = window.open(
		'PopUp/formulario.html','popUpWindow','height=700,width=670,left=0,top=0,resizable=no,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
}

function abrirFormulario2() {
	popupWindow = window.open(
		'popUpContato.php','popUpWindow','height=700,width=670,left=0,top=0,resizable=no,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
}
</script>


<body>
    <div id="conteinerPrincipal">

        
        
        Teste do site do yuji

        <input type="button" onclick="abrirFormulario()" value="Testando Pop Up" />
        <input type="button" onclick="window.open('PopUp/formulario.html','popUpWindow','height=700,width=670,left=0,top=0,resizable=no,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes');" value="Testando Pop Up2" />
    </div>
</body>
</html>