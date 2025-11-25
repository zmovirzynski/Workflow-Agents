@echo off
REM Script para executar testes Robot Framework no Windows

echo ========================================
echo Robot Framework Test Execution
echo ========================================
echo.

REM Verificar se o ambiente virtual existe
if not exist "venv\" (
    echo Ambiente virtual nao encontrado. Criando...
    python -m venv venv
    call venv\Scripts\activate
    pip install -r requirements.txt
) else (
    call venv\Scripts\activate
)

echo.
echo Selecione o tipo de execucao:
echo 1. Smoke Tests (rapido)
echo 2. Regression Tests (completo)
echo 3. Todos os testes
echo 4. Testes especificos por tag
echo.

set /p choice="Digite sua escolha (1-4): "

if "%choice%"=="1" (
    echo.
    echo Executando Smoke Tests...
    robot --include smoke --outputdir results/smoke tests/
) else if "%choice%"=="2" (
    echo.
    echo Executando Regression Tests...
    robot --include regression --outputdir results/regression tests/
) else if "%choice%"=="3" (
    echo.
    echo Executando todos os testes...
    robot --outputdir results/full tests/
) else if "%choice%"=="4" (
    set /p tag="Digite a tag: "
    echo.
    echo Executando testes com tag: %tag%
    robot --include %tag% --outputdir results/%tag% tests/
) else (
    echo Opcao invalida!
    goto end
)

echo.
echo ========================================
echo Execucao concluida!
echo ========================================
echo.
echo Abrindo relatorio...
start results\report.html

:end
pause
