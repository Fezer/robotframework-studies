*** Settings ***
Documentation    Esta suíte de testes verifica o site do SIGA
Resource         siga_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Variables ***
${URL}            https://siga.ufpr.br/portal/
${NOME_MENU}      Notícias

*** Test Cases ***

CASO DE TESTE 1: Verifica página Notícias
    [Documentation]    Acessa a home do site do SIGA
    [Tags]             noticia
    Acessar site do SIGA "${URL}"
    Clicar no menu "${NOME_MENU}"
    Verificar se aparece na página "Notícias"