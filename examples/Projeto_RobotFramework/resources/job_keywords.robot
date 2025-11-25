*** Settings ***
Documentation    Keywords específicas para operações de Job
Resource         common_keywords.robot

*** Keywords ***
Create Job Entry
    [Documentation]    Cria uma nova entrada de job
    [Arguments]    ${job_data}    ${headers}
    ${response}=    Send POST Request    ${ADD_ENDPOINT}    ${job_data}    ${headers}
    [Return]    ${response}

Get All Jobs
    [Documentation]    Obtém todos os jobs
    [Arguments]    ${headers}=${EMPTY}
    ${response}=    Send GET Request    ${ALL_ENDPOINT}    ${headers}
    [Return]    ${response}

Find Job By Parameters
    [Documentation]    Busca job por parâmetros de query
    [Arguments]    ${params}    ${headers}=${EMPTY}
    ${endpoint_with_params}=    Set Variable    ${FIND_ENDPOINT}?${params}
    ${response}=    Send GET Request    ${endpoint_with_params}    ${headers}
    [Return]    ${response}

Update Job Entry
    [Documentation]    Atualiza uma entrada de job completa
    [Arguments]    ${job_id}    ${job_data}    ${headers}
    ${endpoint}=    Set Variable    ${UPDATE_ENDPOINT}/${job_id}
    ${response}=    Send PUT Request    ${endpoint}    ${job_data}    ${headers}
    [Return]    ${response}

Update Job Description
    [Documentation]    Atualiza apenas a descrição do job
    [Arguments]    ${params}    ${headers}
    ${response}=    Send PATCH Request    ${UPDATE_ENDPOINT}    ${params}    ${headers}
    [Return]    ${response}

Delete Job Entry
    [Documentation]    Remove uma entrada de job
    [Arguments]    ${job_id}    ${headers}
    ${endpoint}=    Set Variable    ${REMOVE_ENDPOINT}/${job_id}
    ${response}=    Send DELETE Request    ${endpoint}    ${headers}
    [Return]    ${response}

Create Standard Job Data
    [Documentation]    Cria dados padrão para um job
    [Arguments]    ${job_id}
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
    [Return]    ${job_data}

Verify Job Response
    [Documentation]    Verifica campos básicos da resposta de job
    [Arguments]    ${response}    ${expected_title}
    ${json}=    Set Variable    ${response.json()}
    Should Be Equal    ${json}[jobTitle]    ${expected_title}
    Should Not Be Empty    ${json}[jobId]
