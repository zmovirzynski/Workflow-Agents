*** Settings ***
Documentation    Testes de requisições POST - Migrado de createJobEntry.feature
Resource         ../resources/common_keywords.robot
Resource         ../resources/job_keywords.robot
Resource         ../config/common.robot
Resource         ../config/staging.robot

Suite Setup      Setup API Test Suite
Suite Teardown   Teardown API Test Suite
Test Setup       Setup API Test Case
Test Teardown    Teardown API Test Case

*** Test Cases ***
Create Job Entry In JSON Format
    [Documentation]    Cria uma entrada de job em formato JSON
    [Tags]    post    create    smoke    regression
    ${job_id}=    Generate Random Job ID
    ${job_data}=    Create Standard Job Data    ${job_id}
    ${headers}=    Create Standard Headers
    ${response}=    Create Job Entry    ${job_data}    ${headers}
    Verify Status Code    ${response}    201
    Verify Job Response    ${response}    Software Engg - 2
    Log Response    ${response}

Create Job Entry With Random ID
    [Documentation]    Cria job com ID gerado aleatoriamente
    [Tags]    post    create    regression
    ${job_id}=    Generate Random Job ID
    ${job_data}=    Create Dictionary
    ...    jobId=${job_id}
    ...    jobTitle=Software Engg - 2
    ...    jobDescription=To develop andriod application
    ${experience}=    Create List    Google    Apple    Mobile Iron    Google
    Set To Dictionary    ${job_data}    experience=${experience}
    ${technology}=    Create List    Kotlin    SQL Lite    Gradle    Jenkins
    ${project_data}=    Create Dictionary    projectName=Movie App    technology=${technology}
    ${projects}=    Create List    ${project_data}
    Set To Dictionary    ${job_data}    project=${projects}
    ${headers}=    Create Standard Headers
    ${response}=    Create Job Entry    ${job_data}    ${headers}
    Verify Status Code    ${response}    201
    Verify Response Contains    ${response}    jobTitle    Software Engg - 2
    ${response_job_id}=    Extract JSON Value    ${response}    jobId
    Should Be Equal As Integers    ${response_job_id}    ${job_id}
    Log Response    ${response}

Create Job Entry From External File
    [Documentation]    Cria job usando dados de arquivo externo
    [Tags]    post    create    data-driven
    ${job_id}=    Generate Random Job ID
    ${job_data}=    Create Standard Job Data    ${job_id}
    ${headers}=    Create Standard Headers
    ${response}=    Create Job Entry    ${job_data}    ${headers}
    Verify Status Code    ${response}    201
    Verify Job Response    ${response}    Software Engg - 2
    Log Response    ${response}
