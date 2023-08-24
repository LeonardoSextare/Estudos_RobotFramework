*** Settings ***
Library     funcoes.py


*** Test Cases ***
Utilizando as funções Python
    Verificar se o número 24214 é par
    Contar quantos caracteres tem a palavra "Paralelepipedo"


*** Keywords ***
Verificar se o número ${numero} é par
    ${retorno}    verificar numero impar par    ${numero}
    Log To Console    ${retorno}

Contar quantos caracteres tem a palavra "${palavra}"
    ${retorno}    contar caracteres    ${palavra}
    Log To Console    Número de caracteres ${retorno}
