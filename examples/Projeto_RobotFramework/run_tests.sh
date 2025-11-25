#!/bin/bash
# Script para executar testes Robot Framework no Linux/Mac

echo "========================================"
echo "Robot Framework Test Execution"
echo "========================================"
echo ""

# Verificar se o ambiente virtual existe
if [ ! -d "venv" ]; then
    echo "Ambiente virtual não encontrado. Criando..."
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
else
    source venv/bin/activate
fi

echo ""
echo "Selecione o tipo de execução:"
echo "1. Smoke Tests (rápido)"
echo "2. Regression Tests (completo)"
echo "3. Todos os testes"
echo "4. Testes específicos por tag"
echo "5. Execução paralela (Pabot)"
echo ""

read -p "Digite sua escolha (1-5): " choice

case $choice in
    1)
        echo ""
        echo "Executando Smoke Tests..."
        robot --include smoke --outputdir results/smoke tests/
        ;;
    2)
        echo ""
        echo "Executando Regression Tests..."
        robot --include regression --outputdir results/regression tests/
        ;;
    3)
        echo ""
        echo "Executando todos os testes..."
        robot --outputdir results/full tests/
        ;;
    4)
        read -p "Digite a tag: " tag
        echo ""
        echo "Executando testes com tag: $tag"
        robot --include $tag --outputdir results/$tag tests/
        ;;
    5)
        echo ""
        echo "Executando testes em paralelo..."
        pabot --processes 4 --outputdir results/parallel tests/
        ;;
    *)
        echo "Opção inválida!"
        exit 1
        ;;
esac

echo ""
echo "========================================"
echo "Execução concluída!"
echo "========================================"
echo ""
echo "Para visualizar o relatório:"
echo "  Linux: xdg-open results/report.html"
echo "  Mac: open results/report.html"
echo ""
