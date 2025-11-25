*** Settings ***
Documentation    Testes de requisições DELETE - Migrado de deleteJobEntry.feature
Resource         ../resources/common_keywords.robot
Resource         ../resources/job_keywords.robot
Resource         ../config/common.robot
Resource         ../config/staging.robot

Suite Setup      Setup API Test Suite
Suite Teardown   Teardown API Test Suite
Test Setup       Setup API Test Case
Test Teardown    Teardown API Test Case

*** Test Cases ***
Delete Job Entry By ID
    [Documentation]    Deleta uma entrada de job usando o ID
    [Tags]    delete    crud    regression
    # Criar job primeiro
    ${job_id}=    Generate Random Job ID
    ${job_data}=    Create Standard Job Data    ${job_id}
    ${headers}=    Create Standard Headers
    ${create_response}=    Create Job Entry    ${job_data}    ${headers}
    Verify Status Code    ${create_response}    201
    ${created_job_id}=    Extract JSON Value    ${create_response}    jobId
    
    # Deletar o job criado
    ${delete_response}=    Delete Job Entry    ${created_job_id}    ${headers}
    Verify Status Code    ${delete_response}    200
    Log Response    ${delete_response}
    
    # Verificar que o job não existe mais (404)
    ${params}=    Create Dictionary    id=${created_job_id}    jobTitle=Software Engg - 2
    ${query_string}=    APIHelpers.Create Query String    ${params}
    ${find_response}=    Find Job By Parameters    ${query_string}    ${headers}
    Verify Status Code    ${find_response}    404

Delete Job Entry Twice
    [Documentation]    Tenta deletar o mesmo job duas vezes
    [Tags]    delete    negative    regression
    # Criar job primeiro
    ${job_id}=    Generate Random Job ID
    ${job_data}=    Create Standard Job Data    ${job_id}
    ${headers}=    Create Standard Headers
    ${create_response}=    Create Job Entry    ${job_data}    ${headers}
    Verify Status Code    ${create_response}    201
    ${created_job_id}=    Extract JSON Value    ${create_response}    jobId
    
    # Deletar o job criado
    ${delete_response}=    Delete Job Entry    ${created_job_id}    ${headers}
    Verify Status Code    ${delete_response}    200
    
    # Tentar deletar novamente (deve retornar 404)
    ${delete_response2}=    Delete Job Entry    ${created_job_id}    ${headers}
    Verify Status Code    ${delete_response2}    404

Request Chaining Demo
    [Documentation]    Demonstra encadeamento de requisições (Create -> Patch -> Get)
    [Tags]    delete    integration    regression
    # Criar job
    ${job_id}=    Generate Random Job ID
    ${job_data}=    Create Standard Job Data    ${job_id}
    ${headers}=    Create Standard Headers
    ${create_response}=    Create Job Entry    ${job_data}    ${headers}
    Verify Status Code    ${create_response}    201
    ${created_job_id}=    Extract JSON Value    ${create_response}    jobId
    ${job_title}=    Extract JSON Value    ${create_response}    jobTitle
    
    # Atualizar descrição do job
    ${new_description}=    Set Variable    To develop andriod application and web application
    ${params}=    Create Dictionary
    ...    id=${created_job_id}
    ...    jobTitle=${job_title}
    ...    jobDescription=${new_description}
    ${patch_response}=    Update Job Description    ${params}    ${headers}
    Verify Status Code    ${patch_response}    200
    
    # Buscar job e verificar descrição atualizada
    ${query_params}=    Create Dictionary    id=${created_job_id}    jobTitle=${job_title}
    ${query_string}=    APIHelpers.Create Query String    ${query_params}
    ${get_response}=    Find Job By Parameters    ${query_string}    ${headers}
    Verify Status Code    ${get_response}    200
    Verify Response Contains    ${get_response}    jobDescription    ${new_description}
