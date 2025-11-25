*** Settings ***
Documentation    Testes de validação de resposta - Migrado de responseMatcher.feature e validateJSONArray.feature
Resource         ../resources/common_keywords.robot
Resource         ../resources/job_keywords.robot
Resource         ../config/common.robot
Resource         ../config/staging.robot
Library          Collections

Suite Setup      Setup API Test Suite
Suite Teardown   Teardown API Test Suite
Test Setup       Setup API Test Case
Test Teardown    Teardown API Test Case

*** Test Cases ***
Validate JSON Response Structure
    [Documentation]    Valida a estrutura da resposta JSON
    [Tags]    validation    json    regression
    ${job_id}=    Generate Random Job ID
    ${job_data}=    Create Standard Job Data    ${job_id}
    ${headers}=    Create Standard Headers
    ${response}=    Create Job Entry    ${job_data}    ${headers}
    Verify Status Code    ${response}    201
    
    # Validar campos obrigatórios
    ${json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    jobId
    Dictionary Should Contain Key    ${json}    jobTitle
    Dictionary Should Contain Key    ${json}    jobDescription
    Dictionary Should Contain Key    ${json}    experience
    Dictionary Should Contain Key    ${json}    project
    
    # Validar tipos
    Should Not Be Empty    ${json}[jobId]
    Should Be Equal    ${json}[jobTitle]    Software Engg - 2
    Should Not Be Empty    ${json}[jobDescription]

Validate JSON Array Response
    [Documentation]    Valida resposta que contém array
    [Tags]    validation    json    array    regression
    ${headers}=    Create Standard Headers
    ${response}=    Get All Jobs    ${headers}
    Verify Status Code    ${response}    200
    
    # Verificar que a resposta é uma lista
    ${json}=    Set Variable    ${response.json()}
    ${is_list}=    Evaluate    isinstance($json, list)
    Should Be True    ${is_list}    Response should be a list

Validate Experience Array
    [Documentation]    Valida o array de experiências no job
    [Tags]    validation    json    array
    ${job_id}=    Generate Random Job ID
    ${job_data}=    Create Standard Job Data    ${job_id}
    ${headers}=    Create Standard Headers
    ${response}=    Create Job Entry    ${job_data}    ${headers}
    Verify Status Code    ${response}    201
    
    ${json}=    Set Variable    ${response.json()}
    ${experience}=    Get From Dictionary    ${json}    experience
    ${length}=    Get Length    ${experience}
    Should Be True    ${length} > 0
    List Should Contain Value    ${experience}    Google
    List Should Contain Value    ${experience}    Apple

Validate Nested JSON Objects
    [Documentation]    Valida objetos JSON aninhados (projects)
    [Tags]    validation    json    nested
    ${job_id}=    Generate Random Job ID
    ${job_data}=    Create Standard Job Data    ${job_id}
    ${headers}=    Create Standard Headers
    ${response}=    Create Job Entry    ${job_data}    ${headers}
    Verify Status Code    ${response}    201
    
    ${json}=    Set Variable    ${response.json()}
    ${projects}=    Get From Dictionary    ${json}    project
    ${first_project}=    Get From List    ${projects}    0
    Dictionary Should Contain Key    ${first_project}    projectName
    Dictionary Should Contain Key    ${first_project}    technology
    Should Be Equal    ${first_project}[projectName]    Movie App
    
    ${technologies}=    Get From Dictionary    ${first_project}    technology
    List Should Contain Value    ${technologies}    Kotlin
    List Should Contain Value    ${technologies}    Gradle
