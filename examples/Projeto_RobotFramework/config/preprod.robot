*** Settings ***
Documentation    Configurações para ambiente Pre-Production

*** Variables ***
# Base URL
${BASE_URL}             http://preprod.localhost:9898

# Credenciais
${USERNAME}             preprodadmin1
${PASSWORD}             preprodwelcome

# Endpoints
${NORMAL_API}           /normal/webapi
${ALL_ENDPOINT}         ${NORMAL_API}/all
${ADD_ENDPOINT}         ${NORMAL_API}/add
${FIND_ENDPOINT}        ${NORMAL_API}/find
${UPDATE_ENDPOINT}      ${NORMAL_API}/update/details
${REMOVE_ENDPOINT}      ${NORMAL_API}/remove
