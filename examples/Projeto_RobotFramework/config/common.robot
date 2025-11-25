*** Settings ***
Documentation    Configurações comuns para todos os ambientes

*** Variables ***
# Timeouts
${TIMEOUT}              30s
${RETRY_COUNT}          3

# Logging
${LOG_LEVEL}            INFO

# Headers padrão
${CONTENT_TYPE_JSON}    application/json
${CONTENT_TYPE_XML}     application/xml
${ACCEPT_JSON}          application/json
${ACCEPT_XML}           application/xml
