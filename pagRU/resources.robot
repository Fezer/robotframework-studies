*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}                 https://pra.ufpr.br/ru/
${TITULO}              Restaurante Universitário
${MENU}                (//a[@title='Cardápio'][contains(.,'Cardápio')])[2]
${TITULO_CARDAPIO}     //h2[contains(.,'Cardápios')]
${SUBMIT_BUSCA}        searchsubmit
${TITULO_BUSCA}        //h3[contains(.,'Resultados da pesquisa')]
${LINK_PRECOS}         (//a[@href='https://pra.ufpr.br/ru/precos/'][contains(.,'Preços')])[3]
${TITULO_VALORES}      //h2[contains(.,'Valores cobrados por refeição nos RUs/UFPR')]

*** Keywords ***
Abrir browser
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar browser
    Capture Page Screenshot
    Close Browser


Acessar o site do RU
    Go To    ${URL}
    Title Should Be    ${TITULO}

Clicar no menu Cardário
    Click Element    ${MENU}

Verificar se a página de cardápios foi disponibilizada
    Wait Until Element Is Visible    ${TITULO_CARDAPIO}

Acessar o site do RU do Centro Politécnico
    Go To    url=https://pra.ufpr.br/ru/ru-centro-politecnico/
    Wait Until Element Is Visible    locator=//h2[contains(.,'Cardápio RU Centro Politécnico')]

Verificar se o cardápio do café da manhã para o dia atual está disponível
    Wait Until Element Is Visible    locator=(//strong[contains(.,'CAFÉ DA MANHÃ')])[1]
    ${DIA}    Get Time    format=day
    ${MES}    Get Time    format=month
    ${ANO}    Get Time    format=year
    Log     message=A data atual é ${DIA}/${MES}/${ANO}
    Wait Until Page Contains    ${DIA}/${MES}/${ANO}

No menu Pesquisa escrever "${TERMO_BUSCA}" e Pesquisar
    Input Text    s    ${TERMO_BUSCA}
    Click Button    locator=${SUBMIT_BUSCA}
    Wait Until Element Is Visible    ${TITULO_BUSCA}

Verificar se página "Preços" está no resultado da busca
    Element Should Be Visible    ${LINK_PRECOS}

Ao clicar, verificar se os preços são exibidos
    Click Element    ${LINK_PRECOS}
    Wait Until Element Is Visible    ${TITULO_VALORES}

### Gherkin

A página do RU é acessada
    Acessar o site do RU

Clicar no menu de Cardário
    Clicar no menu Cardário

A página de cardárpios é exibida
    Verificar se a página de cardápios foi disponibilizada