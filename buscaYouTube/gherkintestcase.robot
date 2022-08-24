*** Settings ***
Documentation       Essa suíte de testes verificar vídeos no YouTube utilizando test cases escritos em formato Gherkin
Resource            resources.robot
Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador

*** Variables ***
${SITE_YOUTUBE}     https://youtube.com/
${STRING_BUSCA}     Web Service Login em Java

*** Test Cases ***
Caso de Teste 1: Buscar aula de Web Service Loginem Java
    [Tags]     pesquisa
    Given YouTube foi acessado "${SITE_YOUTUBE}"
    When Buscar aula de "${STRING_BUSCA}"
    Then A aula do Prof. Razer deve aparecer nos resultados