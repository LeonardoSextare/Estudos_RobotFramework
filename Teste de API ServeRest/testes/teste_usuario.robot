*** Settings ***
Library             RequestsLibrary
Resource            ..\\recursos.robot

Suite Setup         Criar Sessão
Suite Teardown      Encerrar Sessão


*** Test Cases ***
Teste - CRUD
    ${ID_usuario}    Criar Usuario    &{usuario_admin}
    Buscar Usuario    ${ID_usuario}    200
    Atualizar Usuario    ${ID_usuario}    &{usuario_comum}
    Buscar Usuario    ${ID_usuario}    200
    Deletar Usuario    ${ID_usuario}
    Buscar Usuario    ${ID_usuario}    400
