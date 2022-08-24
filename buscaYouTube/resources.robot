*** Settings ***
Documentation        Resources dos casos de testes da suíte de acesso ao YouYube
Library              SeleniumLibrary

*** Variables ***
${BROWSER}            chrome

*** Keywords ***

Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar o site do YouTube "${SITE_YOUTUBE}"
    Go To    url=${SITE_YOUTUBE}
    Wait Until Element Is Visible    locator=logo-icon

Buscar pelo conteúdo "${STRING_BUSCA}"
    Input Text    locator=//input[contains(@id,'search')]    text=${STRING_BUSCA}

Clicar em buscar
    Click Element    locator=(//yt-icon[contains(@class,'style-scope ytd-searchbox')])[2]

Verificar se aula do Prof. Razer aparece nos resultados
    Wait Until Element Is Visible    locator=//yt-formatted-string[@class='style-scope ytd-toggle-button-renderer style-text'][contains(.,'Filtros')]
    Wait Until Page Contains Element    locator=(//a[@class='yt-simple-endpoint style-scope yt-formatted-string'][contains(.,'Prof. Razer')])[2]

YouTube foi acessado "${SITE_YOUTUBE}"
    Acessar o site do YouTube "${SITE_YOUTUBE}"

Buscar aula de "${STRING_BUSCA}"
    Buscar pelo conteúdo "${STRING_BUSCA}"
    Clicar em buscar

A aula do Prof. Razer deve aparecer nos resultados
    Verificar se aula do Prof. Razer aparece nos resultados