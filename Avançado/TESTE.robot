*** Settings ***
Library     Process


*** Test Cases ***
Teste2
    Teste


*** Keywords ***
Teste
    Run Process    mkdir teste    cwd=${CURDIR}    shell=True
