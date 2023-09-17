*** Settings ***
Resource    ..//Resources/teste_usuarios.resource


*** Variables ***
${placeholder}      ${EMPTY}


*** Test Cases ***
Cenario 01 - Cadastrar um novo usuario no SERVREST com sucesso
    Criar um usuario novo
    Cadastrar o usuario criado na SERVREST    ${emailTeste}    201
    Conferir se o usuario foi cadastrado corretamente

Cenario 02 - Cadastrar um usuario já existente
    Criar um usuario novo
    Cadastrar o usuario criado na SERVREST    ${emailTeste}    201
    Repetir o Cadastro
    Verificar se API não permitiu o cadastro


Cenario 03 - Consultar um usuario novo
    Criar um usuario novo
    Cadastrar o usuario criado na SERVREST    ${emailTeste}    201
    Consultar os dados do novo usuario
    Conferir os dados retornados