*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections


*** Keywords ***
Criar um usuario novo
    ${palavraAleatoria}    Generate Random String    length=6    chars=[LETTERS]
    ${palavraAleatoria}    Convert To Lower Case    ${palavraAleatoria}
    Set Test Variable    ${emailTeste}    ${palavraAleatoria}@emailteste.com.br
    Log    ${emailTeste}

Cadastrar o usuario criado na SERVREST
    [Arguments]    ${email}    ${codigo_esperado}
    ${body}    Create Dictionary
    ...    nome=Fulano Ciclano
    ...    email=${email}
    ...    password=123456
    ...    administrador=true
    Log    ${body}

    Criar sessão na SERVREST

    ${resposta}    POST On Session
    ...    alias=SERVREST
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${codigo_esperado}
    Log    ${resposta.json()}
    
    IF    ${resposta.status_code} == 201
        Set Test Variable    ${idUsuario}    ${resposta.json()["_id"]}
    END

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Criar sessão na SERVREST
    ${headers}    Create Dictionary    accept=application/json    content-type=application/json
    Create Session    alias=SERVREST    url=https://serverest.dev    headers=${headers}

Conferir se o usuario foi cadastrado corretamente
    Dictionary Should Contain Item    ${RESPOSTA}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA}    _id

Repetir o Cadastro
    Cadastrar o usuario criado na SERVREST    ${emailTeste}    400

Verificar se API não permitiu o cadastro
    Dictionary Should Contain Item    ${RESPOSTA}    message    Este email já está sendo usado

Consultar os dados do novo usuario
    ${respostaConsulta}    GET On Session
    ...    alias=SERVREST
    ...    url=/usuarios/${idUsuario}

    Set Test Variable    ${respostaConsulta}    ${respostaConsulta.json()}

Conferir os dados retornados
    Log    ${respostaConsulta}
    Dictionary Should Contain Item    ${respostaConsulta}    nome    Fulano Ciclano
    Dictionary Should Contain Item    ${respostaConsulta}    email    ${emailTeste}
    Dictionary Should Contain Item    ${respostaConsulta}    password    123456
    Dictionary Should Contain Item    ${respostaConsulta}    administrador    true
    Dictionary Should Contain Item    ${respostaConsulta}    _id    ${idUsuario}
