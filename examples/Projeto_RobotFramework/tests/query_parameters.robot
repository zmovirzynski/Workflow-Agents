*** Settings ***
Documentation    Testes com query parameters - Migrado de queryParameter.feature
Resource         ../resources/common_keywords.robot
Resource         ../resources/job_keywords.robot
Resource         ../config/common.robot
Resource         ../config/staging.robot

Suite Setup      Setup API Test Suite
Suite Teardown   Teardown API Test Suite
Test Setup       Setup API Test Case
Test Teardown    Teardown API Test Case

*** Test Cases ***
Find Job With Query Parameters
    [Documentation]    Busca job usando query parameters
    [Tags]    get    query-params    regression
    # Criar job primeiro
    ${job_id}=    Generate Random Job ID
    ${job_data}=    Create Standard Job Data    ${job_id}
    ${headers}=    Create Standard Headers
    ${create_response}=    Create Job Entry    ${job_data}    ${headers}
    Verify Status Code    ${create_response}    201
    ${created_job_id}=    Extract JSON Value    ${create_response}    jobId
    ${job_title}=    Extract JSON Value    ${create_response}    jobTitle
    
    # Buscar usando query parameters
    ${params}=    Create Dictionary    id=${created_job_id}    jobTitle=${job_title}
    ${query_string}=    APIHelpers.Create Query String    ${params}
    ${response}=    Find Job By Parameters    ${query_string}    ${headers}
    Verify Status Code    ${response}    200
    Verify Response Contains    ${response}    jobId    ${created_job_id}
    Verify Response Contains    ${response}    jobTitle    ${job_title}
    Log Response    ${response}

Find Non Existent Job
    [Documentation]    Busca job que não existe (deve retornar 404)
    [Tags]    get    query-params    negative
    ${headers}=    Create Standard Headers
    ${params}=    Create Dictionary    id=99999    jobTitle=Non Existent Job
    ${query_string}=    APIHelpers.Create Query String    ${params}
    ${response}=    Find Job By Parameters    ${query_string}    ${headers}
    Verify Status Code    ${response}    404
