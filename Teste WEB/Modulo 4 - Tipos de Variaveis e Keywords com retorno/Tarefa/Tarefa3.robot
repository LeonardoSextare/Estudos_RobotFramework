*** Settings ***
Library    String

*** Variables ***


*** Test Cases ***
Criando Email e mostrando na tela
    ${EMAIL}    Criar endereço de email    Leonardo    Sextare
    Log To Console    ${EMAIL}


*** Keywords ***
Criar endereço de email
    [Arguments]    ${nome}    ${sobrenome}
    ${TEXTO_ALEATORIO}    Generate Random String
    [Return]    ${nome}${sobrenome}${TEXTO_ALEATORIO}@email.com.br

    