*** Settings ***
Documentation    Testes de requisições PATCH - Migrado de updateJobDescription.feature
Resource         ../resources/common_keywords.robot
Resource         ../resources/job_keywords.robot
Resource         ../config/common.robot
Resource         ../config/staging.robot

Suite Setup      Setup API Test Suite
Suite Teardown   Teardown API Test Suite
Test Setup       Setup API Test Case
Test Teardown    Teardown API Test Case

*** Test Cases ***
Update Job Description
    [Documentation]    Atualiza apenas a descrição de um job existente
    [Tags]    patch    update    regression
    # Criar job primeiro
    ${job_id}=    Generate Random Job ID
    ${job_data}=    Create Standard Job Data    ${job_id}
    ${headers}=    Create Standard Headers
    ${create_response}=    Create Job Entry    ${job_data}    ${headers}
    Verify Status Code    ${create_response}    201
    ${created_job_id}=    Extract JSON Value    ${create_response}    jobId
    ${job_title}=    Extract JSON Value    ${create_response}    jobTitle
    
    # Atualizar descrição
    ${new_description}=    Set Variable    Updated job description for testing
    ${params}=    Create Dictionary
    ...    id=${created_job_id}
    ...    jobTitle=${job_title}
    ...    jobDescription=${new_description}
    ${patch_response}=    Update Job Description    ${params}    ${headers}
    Verify Status Code    ${patch_response}    200
    Verify Response Contains    ${patch_response}    jobDescription    ${new_description}
    Log Response    ${patch_response}
