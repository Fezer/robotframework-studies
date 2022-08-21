*** Settings ***
Documentation    Resources dos testes da página do SIGA
Library          SeleniumLibrary

*** Variables ***
${BROWSER}               chrome
${TITULO_PAGINA}         //h2[@class='section-header'][contains(.,'Últimas Notícias')]
${MENU_NOTICIAS}         //a[@href='https://siga.ufpr.br/portal/noticias/'][contains(.,'Notícias')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar site do SIGA "${SITE_SIGA}"
    Go To    ${SITE_SIGA}
    Wait Until Element Is Visible    locator=${TITULO_PAGINA}

Clicar no menu "${NOME_MENU}"
    Click Element    locator=${MENU_NOTICIAS}

Verificar se aparece na página "${TEXTO}"
    Wait Until Element Is Visible    locator=//h2[@class='ed-header-title'][contains(.,'${TEXTO}')]