*** Settings ***
Documentation    Configurações para ambiente Staging

*** Variables ***
# Base URL
${BASE_URL}             http://localhost:9898

# Credenciais
${USERNAME}             stagingadmin1
${PASSWORD}             stagingwelcome

# Endpoints
${NORMAL_API}           /normal/webapi
${ALL_ENDPOINT}         ${NORMAL_API}/all
${ADD_ENDPOINT}         ${NORMAL_API}/add
${FIND_ENDPOINT}        ${NORMAL_API}/find
${UPDATE_ENDPOINT}      ${NORMAL_API}/update/details
${REMOVE_ENDPOINT}      ${NORMAL_API}/remove
