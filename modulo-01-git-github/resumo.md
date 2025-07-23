# 📑 Resumo: Introdução ao Versionamento de Código com Git e GitHub

Este resumo foi criado para ajudar você a entender os conceitos básicos do versionamento de código, aprender a usar o Git e o GitHub, e dominar as operações mais importantes no dia a dia. 🚀

---

## **1. O que é Versionamento de Código, Git e GitHub?**

### **Versionamento de Código**
Imagine que você está escrevendo um texto ou desenvolvendo um software. Durante o processo, você faz várias alterações: adiciona novas funcionalidades, corrige erros e ajusta detalhes. Agora, imagine que algo dá errado e você precisa voltar a uma versão anterior do seu trabalho. Como fazer isso sem perder nada?

O **versionamento de código** resolve esse problema. Ele é uma forma de acompanhar todas as alterações feitas em um projeto ao longo do tempo. Com ele, você pode:
- Salvar diferentes versões do seu trabalho.
- Voltar a uma versão anterior sempre que necessário.
- Trabalhar em equipe sem bagunçar o código.

### **Git**
O **Git** é uma ferramenta gratuita e open-source usada para realizar o versionamento de código. Ele funciona como um "guardião" das suas alterações, permitindo que você salve o progresso do seu projeto localmente no seu computador. Além disso, o Git facilita o trabalho colaborativo, pois permite que várias pessoas trabalhem no mesmo projeto sem sobrescrever o trabalho uns dos outros.

### **GitHub**
O **GitHub** é uma plataforma online baseada em Git que serve como um repositório remoto para seus projetos. Ele permite que você:
- Armazene seus projetos na nuvem.
- Compartilhe seu código com outras pessoas.
- Colabore em equipe de forma eficiente.
- Acompanhe problemas (issues) e sugestões de melhorias.

Em resumo:
- **Git**: Ferramenta local para versionar seu código.
- **GitHub**: Plataforma online para armazenar e compartilhar seu código.

---

## **2. Instalando e Configurando o Git**

### **Instalando o Git**
Para começar a usar o Git, você precisa instalá-lo no seu computador:
- No **Windows**, baixe o instalador no site oficial: [https://git-scm.com/](https://git-scm.com/).
- No **Mac**, use o Homebrew (`brew install git`) ou baixe o instalador.
- No **Linux**, use o gerenciador de pacotes da sua distribuição (ex.: `sudo apt install git`).

### **Configurando o Git**
Após instalar o Git, configure seu nome de usuário e e-mail. Essas informações serão usadas para identificar quem fez as alterações no código:
    `git config --global user.name "Seu Nome"`
    `git config --global user.email "seu-email@example.com"`

### **Autenticação no GitHub**
Para enviar seu código para o GitHub, você precisa autenticar sua máquina. Existem duas formas principais:

#### **Autenticação via Token**
1. Acesse as configurações do seu perfil no GitHub.
2. Gere um token de acesso pessoal (Personal Access Token - PAT).
3. Use o token como senha ao fazer login no GitHub via linha de comando.

#### **Autenticação via Chave SSH**
1. Gere uma chave SSH no seu computador:
    `ssh-keygen -t ed25519 -C "seu-email@example.com"`
2. Adicione a chave pública (~/.ssh/id_ed25519.pub) nas configurações do GitHub.
3. Teste a conexão:
    `ssh -T git@github.com`

---

## **3. Operações Básicas com Git e GitHub**

### **Criando e Clonando Repositórios**
- Para criar um novo repositório no GitHub:
    1. Clique no botão New Repository .
    2. Escolha um nome e adicione uma descrição.
    3. Copie o link do repositório.
- Para clonar um repositório existente:
    `git clone https://github.com/usuario/repositorio.git`

### **Salvando Alterações no Repositório Local**
1. Verifique o status das alterações:
    `git status`
2. Adicione as alterações ao "stage":
    `git add .`
3. "Commit" (salve) as alterações com uma mensagem descritiva:
    `git commit -m "Descrição das alterações"`

### **Desfazendo Alterações**
- Defazer alterações no stage:
    `git reset HEAD <arquivo>`
- Reverter um commit:
    `git revert <hash-do-commit`

### **Enviando e Baixando Alterações com o Repositório Remoto**
- Para enviar suas alterações locais para o repositório remoto (GitHub):
    `git push origin <nome-da-branch>`
- Para baixar as alterações mais recentes do repositório remoto:
    `git pull origin <nome-da-branch>`

### **Trabalhando com Branches**
Branches são como "ramificações" do seu código. Elas permitem que você trabalhe em novas funcionalidades ou correções sem afetar o código principal.

#### **Criando uma Branch**
`git branch <nome-da-branch>`
- Para mudar para a nova branch:
    `git checkout <nome-da-branch>`
- Ou crie e mude para a branch em um único comando:
    `git checkout -b <nome-da-branch>`

#### **Mesclando Branches**
Para mesclar uma branch com a branch principal (main ou master):
1. Volte para a branch principal:
    `git checkout main`
2. Execute o merge:
    `git merge <nome-da-branch>`

#### **Deletando uma Branch**
`git branch -d <nome-da-branch>`

#### **Tratando Conflitos**
Conflitos ocorrem quando duas branches modificam o mesmo trecho de código. O Git indicará o conflito, e você precisará resolver manualmente no arquivo. Após resolver:
    `git add <arquivo-com-conflito>`
    `git commit -m "Resolvido conflito"`

#### **Comandos Úteis no Dia a Dia**
- Verificar o histórico de commits:
    `git log`
- Verificar diferenças entre commits ou arquivos:
    `git diff`
- Renomear ou mover arquivos:
    `git mv <arquivo-antigo> <arquivo-novo>`
- Remover arquivos do repositório:
    `git rm <arquivo>`

---

## **4. Dicas e Materiais de Apoio**

### **Dicas para Usar Git e GitHub de Forma Eficiente**
1. **Mensagens de Commit Claras** : Sempre use mensagens descritivas para seus commits. Exemplo: "Adiciona funcionalidade de login" ao invés de "ajuste".
2. **Pequenos Commits** : Faça commits frequentes para manter um histórico detalhado.
3. **Use Branches** : Crie uma branch para cada nova funcionalidade ou correção.
4. **Acompanhe Issues no GitHub** : Use a aba de Issues para reportar bugs ou sugerir melhorias.
5. **Automatize Fluxos** : Explore ferramentas como GitHub Actions para automatizar tarefas repetitivas.

### **Materiais de Apoio**
- **Documentação Oficial do Git** : https://git-scm.com/doc
- **Documentação do GitHub** : https://docs.github.com/
- **Guia de Markdown no GitHub** : https://docs.github.com/en/get-started/writing-on-github
- **Cheatsheet de Git** : https://education.github.com/git-cheat-sheet-education.pdf
