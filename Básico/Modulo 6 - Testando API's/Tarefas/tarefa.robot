*** Settings ***
Resource    ../Resources/teste_usuarios.resource


*** Test Cases ***
Cenário 04: Logar com o novo usuário criado
    Criar um usuario novo
    Cadastrar o usuario criado na SERVREST    email=${EMAIL_TESTE}    codigo_esperado=201
    Realizar Login com o usuário
    Conferir se o Login ocorreu com sucesso


*** Keywords ***
Realizar Login com o usuário
    ${body}    Create Dictionary
    ...    email=${emailTeste}
    ...    password=123456
    Log    ${body}

    ${respostaLogin}    POST On Session
    ...    alias=SERVREST
    ...    url=/login
    ...    json=${body}
    Set Test Variable    ${RESPOSTA_LOGIN}    ${respostaLogin.json()}

Conferir se o Login ocorreu com sucesso
    Log    ${RESPOSTA_LOGIN}
    Dictionary Should Contain Item    ${RESPOSTA_LOGIN}    message    Login realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA_LOGIN}    authorization
