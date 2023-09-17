*** Settings ***
Library     RequestsLibrary


*** Variables ***
&{usuario_admin}    nome=Leonardo Sextare    login=testaqa9612223123@qa.com.br    senha=teste    administrador=true
&{usuario_comum}    nome=Leonardo Sextare    login=testaqa9612223123@qa.com.br    senha=teste    administrador=false


*** Keywords ***
Criar Usuario
    [Arguments]    ${nome}    ${login}    ${senha}    ${administrador}
    ${header}    Create Dictionary    Content-Type=application/json

    ${resposta}    POST On Session
    ...    alias=api
    ...    url=/usuarios
    ...    headers=${header}
    ...    data={"nome": "${nome}","email": "${login}","password": "${senha}","administrador": "${administrador}"}
    ...    expected_status=201

    ${id_usuario}    Set Variable    ${resposta.json()["_id"]}

    Log To Console    ${id_usuario}
    RETURN    ${id_usuario}

Buscar Usuario
    [Arguments]    ${id_usuario}    ${status_esperado}

    ${resposta}    GET On Session
    ...    alias=api
    ...    url=/usuarios/${id_usuario}
    ...    expected_status=${status_esperado}

    Log To Console    ${resposta}

Atualizar Usuario
    [Arguments]    ${id_usuario}    ${nome}    ${login}    ${senha}    ${administrador}
    ${header}    Create Dictionary    Content-Type=application/json

    ${resposta}    PUT On Session
    ...    alias=api
    ...    url=/usuarios/${id_usuario}
    ...    headers=${header}
    ...    data={"nome": "${nome}","email": "${login}","password": "${senha}","administrador": "${administrador}"}
    ...    expected_status=200

    Log To Console    ${resposta}

Deletar Usuario
    [Arguments]    ${id_usuario}

    DELETE On Session
    ...    alias=api
    ...    url=/usuarios/${id_usuario}
    ...    expected_status=200

    Buscar Usuario    ${id_usuario}    status_esperado=400

Autenticar Usuario
    [Arguments]    ${login}    ${senha}    ${resultado_esperado}=200

    ${header}    Create Dictionary    Content-Type=application/json

    ${resposta}    POST On Session
    ...    alias=api
    ...    url=/login
    ...    headers=${header}
    ...    data={"email": "${login}","password": "${senha}"}
    ...    expected_status=${resultado_esperado}

    IF    ${resultado_esperado} == 200
        ${token}    Set Variable    ${resposta.json()['authorization']}
        RETURN    ${token}
    END
    RETURN

Criar Produto
    [Arguments]    ${nome}    ${preco}    ${descricao}    ${quantidade}    ${token}    ${resultado_esperado}=201

    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${token}
    ${resposta}    POST On Session
    ...    alias=api
    ...    url=/produtos
    ...    headers=${header}
    ...    data={"nome": "${nome}","preco": ${preco},"descricao": "${descricao}","quantidade": ${quantidade}}
    ...    expected_status=${resultado_esperado}

    IF    ${resultado_esperado} == 201
        ${id_produto}    Set Variable    ${resposta.json()['_id']}
        RETURN    ${id_produto}
    END
    RETURN

Buscar Produto
    [Arguments]    ${id_produto}    ${resultado_esperado}=200

    ${header}    Create Dictionary    Content-Type=application/json
    ${resposta}    GET On Session
    ...    alias=api
    ...    url=/produtos/${id_produto}
    ...    headers=${header}
    ...    expected_status=${resultado_esperado}

Alterar Produto
    [Arguments]
    ...    ${id_produto}
    ...    ${token}
    ...    ${nome}
    ...    ${preco}
    ...    ${descricao}
    ...    ${quantidade}
    ...    ${resultado_esperado}=200

    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${token}
    ${resposta}    PUT On Session
    ...    alias=api
    ...    url=/produtos/${id_produto}
    ...    headers=${header}
    ...    data={"nome": "${nome}","preco": ${preco},"descricao": "${descricao}","quantidade": ${quantidade}}
    ...    expected_status=${resultado_esperado}

Excluir Produto
    [Arguments]    ${id_produto}    ${token}    ${resultado_esperado}=200
    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${token}

    DELETE On Session
    ...    alias=api
    ...    url=/produtos/${id_produto}
    ...    headers=${header}
    ...    expected_status=${resultado_esperado}

Criar Sessão
    Create Session    alias=api    url=https://serverest.dev

Encerrar Sessão
    Delete All Sessions
