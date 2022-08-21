*** Settings ***
Documentation    Casos de testes em formato Gherkin para exemplos de cardápios do RU
Test Setup        Abrir browser
Test Teardown     Fechar browser

Resource    resources.robot


*** Test Cases ***

Acessar Cardárpio do RU
    [Tags]    acesso
    Given A página do RU é acessada
    When Clicar no menu de Cardário
    Then A página de cardárpios é exibida