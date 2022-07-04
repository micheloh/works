Wscript.echo "iniciando o vbs."

cpFolder = "C:\Projetos\SAS\SAS - Rotinas 12-2012\Programas10-12\PGMS_ORIGINAIS\scxx003cau"
control = false

set FSO = createobject("scripting.filesystemobject")

set folder = FSO.getFolder(cpFolder)

set files1 = folder.Files

for each folderIdx in files1
	filePath = cpFolder & "\" & folderIdx.Name
	if right(filePath, 4) = ".SAS" then
		set arq = FSO.OpenTextFile(filePath, 1)
		set temp = FSO.OpenTextFile(cpFolder & "\resultado.txt", 8, true)
		strall = ""
		do while not arq.AtEndofStream
			line = arq.readLine
			if instr("%carga",line) <> 0 or instr("%carga",line) <> null then
				control = true
				strall = strall & trim(line)
			else if control = true then
				if instr("%fim",line) <> 0 or instr("%fim",line) <> null then
					control = false
				else
					strall = strall & trim(line)
				end if
			end if
		loop
		
		strtemp = strall
		replace(strtemp,");",",")
		replace(strtemp,"%carga(","")
		
		do while strtemp <> ""
			tam = instr(",",strtemp)
			strtemp2 = mid(strtemp,0,tam)
			temp.writeline(strtemp2)
			strtemp = right(strtemp,tam+1)
		loop
		
		arq.close
		temp.close
	end if
next

Wscript.echo "Arquivos lidos. vbs finished!"

