*** Settings ***
Resource     ..\\recursos.robot


Suite Setup    Criar Sessão
Suite Teardown    Encerrar Sessão


*** Test Cases ***
Teste - Autenticação com sucesso
    ${id_usuario}    Criar Usuario    &{usuario_admin}
    ${token}    Autenticar Usuario    ${usuario_admin}[login]    ${usuario_admin}[senha]    resultado_esperado=200
    Deletar Usuario    ${id_usuario}


Teste - Autenticação sem sucesso
    ${id_usuario}    Criar Usuario    &{usuario_admin}
    ${token}    Autenticar Usuario    ${usuario_admin}[login]    senha=senhaerrada    resultado_esperado=401
    Deletar Usuario    ${id_usuario}



    