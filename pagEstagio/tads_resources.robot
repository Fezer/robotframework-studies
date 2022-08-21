*** Settings ***
Documentation    Resources dos testes da página do SIGA
Library          SeleniumLibrary

*** Variables ***
${BROWSER}               chrome
${TITULO_PAGINA}         //button[@class='btn btn-primary btn-lg'][contains(.,'Log in')]
${MENU_ESTAGIO}          //a[@role='menuitem'][contains(.,'COE (Estágio)')]
${MENU_LOGIN}            //a[@href='https://www.tads.ufpr.br/login/index.php']

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar site do TADS "${SITE_TADS}"
    Go To    ${SITE_TADS}
    Wait Until Element Is Visible    locator=//a[@role='menuitem'][contains(.,'COE (Estágio)')]

Acessar de login site do TADS "${SITE_TADS}"
    Go To    ${SITE_TADS}
    Wait Until Element Is Visible    locator=username

Clicar no menu "${NOME_MENU}"
    Click Element    locator=${MENU_ESTAGIO}

Verificar se aparece na página "${TEXTO}"
    Wait Until Element Is Visible    locator=//h1[@class='h2'][contains(.,'COE (${TEXTO})')]

Clicar no menu login "${NOME_MENU_LOGIN}"
    Click Element    locator=${MENU_LOGIN}

Preenhcer nome de usuário "${NOME_USUARIO}"
    Input Text    locator=//input[contains(@type,'text')]    text=${NOME_USUARIO}

Preencher senha "${SENHA_USUARIO}"
    Input Text    locator=//input[contains(@type,'password')]    text=${SENHA_USUARIO}

Clicar em "Acessar"
    Click Button    locator=loginbtn

Verificar se login não foi efetuado
    Wait Until Element Is Visible    locator=//div[@class='alert alert-danger']
    