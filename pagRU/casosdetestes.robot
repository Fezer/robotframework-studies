*** Settings ***
Documentation    Casos de testes para exemplos de cardápios do RU
Test Setup        Abrir browser
Test Teardown     Fechar browser

Resource    resources.robot

*** Test Cases ***

Acessar Cardárpio do RU
    [Tags]    acesso
    Acessar o site do RU
    Clicar no menu Cardário
    Verificar se a página de cardápios foi disponibilizada

Verificar café da manhã do politécnico
    [Tags]    café
    Acessar o site do RU do Centro Politécnico
    Verificar se o cardápio do café da manhã para o dia atual está disponível

Pesquisar preços
    [Tags]    preço
    Acessar o site do RU
    No menu Pesquisa escrever "preço RU" e Pesquisar
    Verificar se página "Preços" está no resultado da busca
    Ao clicar, verificar se os preços são exibidos