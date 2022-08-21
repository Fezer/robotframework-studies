*** Settings ***
Documentation    Esta suíte de testes verifica o site do SIGA
Resource         tads_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Variables ***
${URL}            https://www.tads.ufpr.br/
${URL_LOGIN}      https://www.tads.ufpr.br/login/index.php
${NOME_MENU}      COE (Estágio)
${MENU_LOGIN}     Acessar
${NOME_USUARIO}   USUARIO
${SENHA_USUARIO}  senhaeerada

*** Test Cases ***

CASO DE TESTE 1: Verifica página COE (Estágio)
    [Documentation]    Acessa a home do site do TADS
    [Tags]             estagio
    Acessar site do TADS "${URL}"
    Clicar no menu "${NOME_MENU}"
    Verificar se aparece na página "Estágio"

CASO DE TESTE 3: Verificar login inválido
    [Documentation]    Verificar login de usuário inválido
    [Tags]             senha    acesso    invalido
    Acessar de login site do TADS "${URL_LOGIN}"
    ##Clicar no menu login "${MENU_LOGIN}"
    Preenhcer nome de usuário "${NOME_USUARIO}"
    Preencher senha "${SENHA_USUARIO}"
    Clicar em "Acessar"
    Verificar se login não foi efetuado
