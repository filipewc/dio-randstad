#!/bin/bash
# exemplo-git.sh

# Este script demonstra os comandos básicos do Git para ajudar você a entender como usar o Git no dia a dia.
# Execute este script em um terminal para ver os comandos em ação.

echo "🌟 Bem-vindo ao exemplo de uso do Git! 🌟"

# 1. Inicializando um repositório Git
echo "👉 Passo 1: Inicializando um repositório Git..."
git init exemplo-repositorio
cd exemplo-repositorio

# 2. Criando um arquivo de exemplo
echo "👉 Passo 2: Criando um arquivo de exemplo..."
echo "Olá, Git e GitHub!" > README.md

# 3. Verificando o status do repositório
echo "👉 Passo 3: Verificando o status do repositório..."
git status

# 4. Adicionando o arquivo ao stage
echo "👉 Passo 4: Adicionando o arquivo ao stage..."
git add README.md

# 5. Fazendo o primeiro commit
echo "👉 Passo 5: Fazendo o primeiro commit..."
git commit -m "Adiciona README inicial"

# 6. Verificando o histórico de commits
echo "👉 Passo 6: Verificando o histórico de commits..."
git log --oneline

# 7. Criando uma nova branch
echo "👉 Passo 7: Criando uma nova branch chamada 'feature-nova'..."
git checkout -b feature-nova

# 8. Fazendo alterações na branch
echo "👉 Passo 8: Fazendo alterações na branch 'feature-nova'..."
echo "Nova funcionalidade adicionada!" >> README.md

# 9. Commitando as alterações na branch
echo "👉 Passo 9: Commitando as alterações na branch 'feature-nova'..."
git add README.md
git commit -m "Adiciona nova funcionalidade no README"

# 10. Voltando para a branch principal (main)
echo "👉 Passo 10: Voltando para a branch principal (main)..."
git checkout main

# 11. Mesclando a branch 'feature-nova' com a branch principal
echo "👉 Passo 11: Mesclando a branch 'feature-nova' com a branch principal..."
git merge feature-nova

# 12. Removendo a branch 'feature-nova'
echo "👉 Passo 12: Removendo a branch 'feature-nova'..."
git branch -d feature-nova

# 13. Verificando o conteúdo final do arquivo
echo "👉 Passo 13: Verificando o conteúdo final do arquivo README.md..."
cat README.md

# 14. Desfazendo o último commit (opcional)
echo "👉 Passo 14: Desfazendo o último commit (opcional)..."
git reset --soft HEAD~1

# 15. Finalizando o exemplo
echo "🎉 Parabéns! Você concluiu o exemplo básico de uso do Git! 🎉"
echo "Agora você pode explorar mais comandos e praticar com seus próprios projetos."