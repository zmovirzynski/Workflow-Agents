*** Settings ***
Documentation    Testes de requisições GET - Migrado de getRequest.feature
Resource         ../resources/common_keywords.robot
Resource         ../resources/job_keywords.robot
Resource         ../config/common.robot
Resource         ../config/staging.robot

Suite Setup      Setup API Test Suite
Suite Teardown   Teardown API Test Suite
Test Setup       Setup API Test Case
Test Teardown    Teardown API Test Case

*** Test Cases ***
Get All Jobs In JSON Format
    [Documentation]    Obtém todos os dados da aplicação em formato JSON
    [Tags]    get    smoke    regression
    ${response}=    Get All Jobs
    Verify Status Code    ${response}    200
    Log Response    ${response}

Get All Jobs With JSON Accept Header
    [Documentation]    Obtém todos os dados usando header Accept JSON
    [Tags]    get    regression
    ${headers}=    Create Standard Headers    accept=${ACCEPT_JSON}
    ${response}=    Get All Jobs    ${headers}
    Verify Status Code    ${response}    200
    Log Response    ${response}

Get All Jobs In XML Format
    [Documentation]    Obtém todos os dados em formato XML
    [Tags]    get    xml    regression
    ${headers}=    Create Standard Headers    accept=${ACCEPT_XML}
    ${response}=    Get All Jobs    ${headers}
    Verify Status Code    ${response}    200
    Log Response    ${response}
