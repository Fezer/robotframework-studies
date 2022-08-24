*** Settings ***
Documentation       Essa suíte de testes verificar vídeos no YouTube
Resource            resources.robot
Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador

*** Variables ***
${SITE_YOUTUBE}     https://youtube.com/
${STRING_BUSCA}     Web Service Login em Java


*** Test Cases ***
CASO DE TESTE 1: Buscar aula de Web Service Login em Java
    [Documentation]    Acessa o site do YouTube e busca por aula de Web Service Login em Java
    [Tags]             acessar
    Acessar o site do YouTube "${SITE_YOUTUBE}"
    Buscar pelo conteúdo "${STRING_BUSCA}"
    Clicar em buscar
    Verificar se aula do Prof. Razer aparece nos resultados
