*** Settings ***
Documentation    Keywords comuns reutilizáveis em todos os testes
Library          RequestsLibrary
Library          Collections
Library          String
Library          OperatingSystem
Library          ../libraries/APIHelpers.py

*** Keywords ***
Setup API Test Suite
    [Documentation]    Configura a sessão API para a suite de testes
    Create Session    api    ${BASE_URL}    verify=False

Teardown API Test Suite
    [Documentation]    Limpa a sessão API após a suite
    Delete All Sessions

Setup API Test Case
    [Documentation]    Preparação antes de cada caso de teste
    Log    Iniciando teste: ${TEST_NAME}

Teardown API Test Case
    [Documentation]    Limpeza após cada caso de teste
    Log    Finalizando teste: ${TEST_NAME}

Send GET Request
    [Documentation]    Envia requisição GET e retorna a resposta
    [Arguments]    ${endpoint}    ${headers}=${EMPTY}
    ${response}=    GET On Session    api    ${endpoint}    headers=${headers}    expected_status=any
    [Return]    ${response}

Send POST Request
    [Documentation]    Envia requisição POST com body JSON
    [Arguments]    ${endpoint}    ${body}    ${headers}=${EMPTY}
    ${response}=    POST On Session    api    ${endpoint}    json=${body}    headers=${headers}    expected_status=any
    [Return]    ${response}

Send PUT Request
    [Documentation]    Envia requisição PUT com body JSON
    [Arguments]    ${endpoint}    ${body}    ${headers}=${EMPTY}
    ${response}=    PUT On Session    api    ${endpoint}    json=${body}    headers=${headers}    expected_status=any
    [Return]    ${response}

Send PATCH Request
    [Documentation]    Envia requisição PATCH
    [Arguments]    ${endpoint}    ${params}=${EMPTY}    ${headers}=${EMPTY}
    ${response}=    PATCH On Session    api    ${endpoint}    params=${params}    headers=${headers}    expected_status=any
    [Return]    ${response}

Send DELETE Request
    [Documentation]    Envia requisição DELETE
    [Arguments]    ${endpoint}    ${headers}=${EMPTY}
    ${response}=    DELETE On Session    api    ${endpoint}    headers=${headers}    expected_status=any
    [Return]    ${response}

Verify Status Code
    [Documentation]    Verifica o código de status da resposta
    [Arguments]    ${response}    ${expected_status}
    Should Be Equal As Integers    ${response.status_code}    ${expected_status}

Verify Response Contains
    [Documentation]    Verifica se a resposta contém um valor específico
    [Arguments]    ${response}    ${key}    ${expected_value}
    ${json}=    Set Variable    ${response.json()}
    Should Be Equal    ${json}[${key}]    ${expected_value}

Extract JSON Value
    [Documentation]    Extrai um valor do JSON da resposta
    [Arguments]    ${response}    ${json_path}
    ${json}=    Set Variable    ${response.json()}
    ${value}=    Get From Dictionary    ${json}    ${json_path}
    [Return]    ${value}

Generate Random Job ID
    [Documentation]    Gera um ID aleatório para job
    ${random_id}=    Evaluate    random.randint(1, 100)    random
    [Return]    ${random_id}

Create Standard Headers
    [Documentation]    Cria headers padrão para requisições JSON
    [Arguments]    ${accept}=${ACCEPT_JSON}    ${content_type}=${CONTENT_TYPE_JSON}
    ${headers}=    Create Dictionary    Accept=${accept}    Content-Type=${content_type}
    [Return]    ${headers}

Log Response
    [Documentation]    Loga a resposta completa para debug
    [Arguments]    ${response}
    Log    Status Code: ${response.status_code}
    Log    Response Body: ${response.text}
    Log    Response Headers: ${response.headers}
