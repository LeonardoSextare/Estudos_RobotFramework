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
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Tablets"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca do produto "Xbox Series S" no campo de pesquisa
    ...    E verifica se o produto pesquisado está no resultado da pesquisa
    [Tags]    busca_produtos    lista_da_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando "${PRODUTO}"
