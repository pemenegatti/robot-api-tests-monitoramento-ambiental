*** Settings ***
Documentation    Testes de autenticação e endpoints com token
Resource         ../resources/common.resource
Suite Setup      Setup Test Environment
Suite Teardown   Desconectar a api

*** Test Cases ***
Cenário: Realizar login com credenciais válidas
    [Tags]    @auth
    Dado que o usuário possui credenciais válidas
    Quando ele realiza o login
    Então um token JWT é retornado com sucesso

Cenário: Acessar endpoint de dados do usuário com token válido
    [Tags]    @monitoramento-agua
    Dado que o usuário está autenticado
    Quando ele acessa o endpoint de dados do usuário
    Então a resposta deve conter status 200

Cenário: Acessar endpoint de dados financeiros com token válido
    [Tags]    @monitoramento-ar
    Dado que o usuário está autenticado
    Quando ele acessa o endpoint de dados financeiros
    Então a resposta deve conter status 200

Cenário: Acessar endpoint de histórico com token válido
    [Tags]    @historico-agua
    Dado que o usuário está autenticado
    Quando ele acessa o endpoint de histórico
    Então a resposta deve conter status 200