*** Settings ***
Documentation       Essa suite testa o site da amazon.com.br

Resource            amazon_resources.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Variables ***
${PRODUTO}      Xbox Series S



*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu eletrônico do site da amazon.com.br
    ...    E verifica a categoria "Computadore e Informática"
    [Tags]    menus    categorias

    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca do produto "Xbox Series S" no campo de pesquisa
    ...    E verifica se o produto pesquisado está no resultado da pesquisa
    [Tags]    busca_produtos    lista_da_busca

    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "${PRODUTO}"
    Então o título da página deve ficar "Amazon.com.br : ${PRODUTO}"
    E um produto da linha "${PRODUTO}" deve ser mostrado na página
