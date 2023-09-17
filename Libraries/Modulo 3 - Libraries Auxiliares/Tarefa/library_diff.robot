*** Settings ***
Library     DiffLibrary


*** Variables ***
${LocalArquivo1}    C:\\TEMP\\arquivo1.txt
${LocalArquivo2}    C:\\TEMP\\arquivo2.txt


*** Test Cases ***
Uso da Lib DiffLibrary
    Verificar diferença entre dois arquivos


*** Keywords ***
Verificar diferença entre dois arquivos
    Diff Files    ${LocalArquivo1}    ${LocalArquivo2}    fail=True
