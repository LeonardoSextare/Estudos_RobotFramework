*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}                  https://www.amazon.com.br/
${MENU_ELETRONICOS}     //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${TEXTO_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
# ${TEXTO_PESQUISA}       //input[contains(@type,'text')]
${TEXTO_PESQUISA}       twotabsearchtextbox
# ${BOTAO_PESQUISA}       //input[contains(@type,'submit')] nav-search-submit-button
${BOTAO_PESQUISA}       nav-search-submit-button



*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    ${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Element Is Visible    ${TEXTO_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    ${TITULO}

Verificar se aparece a categoria "${CATEGORIA_NOME}"
    Element Should Be Visible    //a[@aria-label='${CATEGORIA_NOME}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    ${TEXTO_PESQUISA}    ${PRODUTO}

Clicar no botão de pesquisa
    Click Element    //input[contains(@type,'submit')]

Verificar o resultado da pesquisa se está listando "${PRODUTO}"
    Wait Until Page Contains    ${PRODUTO}
    Capture Page Screenshot



