# 📑 Resumo: Introdução ao Versionamento de Código com Git e GitHub

Este resumo foi criado para ajudar você a entender os conceitos básicos do versionamento de código, aprender a usar o Git e o GitHub, e dominar as operações mais importantes no dia a dia. Vamos explorar tudo de forma clara e didática. 🚀

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

git config --global user.name "Seu Nome"
git config --global user.email "seu-email@example.com"

### **Autenticação no GitHub**
Para enviar seu código para o GitHub, você precisa autenticar sua máquina. Existem duas formas principais:

#### **Autenticação via Token**
- Acesse as configurações do seu perfil no GitHub.
- Gere um token de acesso pessoal (Personal Access Token - PAT).
- Use o token como senha ao fazer login no GitHub via linha de comando.

#### **Autenticação via Chave SSH**
- Gere uma chave SSH no seu computador:
    ssh-keygen -t ed25519 -C "seu-email@example.com"
- Adicione a chave pública (~/.ssh/id_ed25519.pub) nas configurações do GitHub.
- Teste a conexão:
    ssh -T git@github.com