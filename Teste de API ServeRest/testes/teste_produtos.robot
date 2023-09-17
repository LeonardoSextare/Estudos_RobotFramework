*** Settings ***
Library             RequestsLibrary
Resource            ..\\recursos.robot

Suite Setup         Criar Sessão
Suite Teardown      Encerrar Sessão
Test Setup          Criar e Logar Usuario
Test Teardown       Excluir Usuario


*** Variables ***
&{produto}      nome=Mouse    preco=200    descricao=Mouse Gamer RGB    quantidade=10


*** Test Cases ***
Teste - CRUD Produto
    ${id_produto}    Criar Produto    &{produto}    token=${token}
    Buscar Produto    ${id_produto}
    Alterar Produto    ${id_produto}    &{produto}    token=${token}
    Excluir Produto    ${id_produto}    token=${token}


*** Keywords ***
Criar e Logar Usuario
    ${id_usuario}    Criar Usuario    &{usuario_admin}
    ${token}    Autenticar Usuario    ${usuario_admin}[login]    ${usuario_admin}[senha]

    ${token}    Set Test Variable    ${token}
    ${id_usuario}    Set Test Variable    ${id_usuario}

Excluir Usuario
    Deletar Usuario    ${id_usuario}
