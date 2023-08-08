*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SITE}                         https://www.amazon.com.br/
${LOGO_SITE}                    //i[contains(@class,'hm-icon nav-sprite')]
${BARRA_PESQUISA}               twotabsearchtextbox
${BOTAO_PESQUISA}               nav-search-submit-button
${BOTAO_ADICIONAR_CARRINHO}     add-to-cart-button
${BOTAO_CARRINHO}               nav-cart-count-container
${PRECO_TOTAL_CARRINHO}         sc-subtotal-label-activecart


*** Keywords ***
Verificar se o título da página fica "${TITULO}"
    Title Should Be    ${TITULO}

Aguardar o elemento: ${ELEMENTO} e clicar
    Wait Until Element Is Visible    ${ELEMENTO}
    Click Element    ${ELEMENTO}

Abrir navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Acessar a home page do site Amazon.com.br
    Go To    ${SITE}
    Wait Until Element Is Visible    ${LOGO_SITE}

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    ${BARRA_PESQUISA}    ${PRODUTO}

Clicar no botão de pesquisa
    Click Element    ${BOTAO_PESQUISA}

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible
    ...    //span[@class='a-size-medium-plus a-color-base a-text-bold'][contains(.,'Resultados')]
    # Element Should Be Visible    //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]
    Element Should Be Visible    //img[contains(@alt,'${PRODUTO}')]

Adicionar o produto "${PRODUTO}" no carrinho
    # Click Element    //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]
    Click Element    //img[contains(@alt,'${PRODUTO}')]
    Aguardar o elemento: ${BOTAO_ADICIONAR_CARRINHO} e clicar

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Aguardar o elemento: ${BOTAO_CARRINHO} e Clicar
    Wait Until Element Is Visible    ${PRECO_TOTAL_CARRINHO}
    Page Should Contain    ${PRODUTO}
    Capture Page Screenshot    ${PRODUTO}_no_carrinho.png

    # Element Should Be Visible    //span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]

Remover o produto "${PRODUTO}" do carrinho
    Click Element    //input[contains(@aria-label,'Excluir ${PRODUTO}')]

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    //h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]

# Gherkin

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."


Quando adicionar o produto "${PRODUTO}" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Adicionar o produto "${PRODUTO}" no carrinho

Então o produto "${PRODUTO}" deve ser mostrado no carrinho
    Verificar se o produto "${PRODUTO}" foi adicionado com sucesso

E existe o produto "${PRODUTO}" no carrinho
    Quando adicionar o produto "${PRODUTO}" no carrinho
    Verificar se o produto "${PRODUTO}" foi adicionado com sucesso

Quando remover o produto "${PRODUTO}" do carrinho
    Remover o produto "${PRODUTO}" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio




