# **Projeto de Banco de Dados para E-commerce**

Este projeto consiste na criação de um banco de dados em pgSQL para um sistema de e-commerce, com tabelas, inserção de dados, consultas básicas e respostas a perguntas específicas. Além disso, foi gerado um backup do banco de dados.

---

## **1. Scripts de Criação de Tabelas**

Foram desenvolvidos scripts SQL para criar as tabelas necessárias para o sistema de e-commerce. As tabelas incluem entidades como clientes, pedidos, produtos, fornecedores, vendedores, estoques, categorias, carrinhos de compras, listas de desejos e muito mais. Essas tabelas foram projetadas para suportar funcionalidades essenciais de um sistema de comércio eletrônico, como gerenciamento de pedidos, controle de estoque, avaliações de produtos e promoções.

---

## **2. Inserção de Dados**

Após a criação das tabelas, foram inseridos dados fictícios em cada uma delas para simular um ambiente realista. Foram adicionadas até 10 linhas em cada tabela, abrangendo informações sobre clientes, produtos, pedidos, fornecedores, vendedores e outros elementos do sistema. Esses dados servem como base para testar as consultas e garantir que o banco de dados está funcionando corretamente.

---

## **3. Consultas Básicas**

Foram desenvolvidas consultas SQL para demonstrar operações básicas no banco de dados. Essas consultas incluem:

- **Recuperações Simples**: Utilização do comando `SELECT` para listar dados.
- **Filtros com `WHERE`**: Filtragem de registros com base em condições específicas.
- **Atributos Derivados**: Cálculo de valores derivados, como o valor final de pedidos após descontos.
- **Ordenação com `ORDER BY`**: Organização dos resultados em ordem crescente ou decrescente.
- **Agrupamentos e Filtros com `GROUP BY` e `HAVING`**: Agrupamento de dados e aplicação de filtros em grupos.
- **Junções entre Tabelas**: Combinação de informações de várias tabelas para fornecer uma visão mais abrangente dos dados.

Essas consultas demonstram o uso eficiente dos recursos do SQL para extrair insights úteis do banco de dados.

---

## **4. Perguntas do Projeto**

Foram criados scripts SQL para responder às seguintes perguntas:

### **Pergunta 1: Quantos pedidos foram feitos por cada cliente?**
A consulta retornou o número total de pedidos realizados por cada cliente, agrupando os resultados pelo nome do cliente e ordenando-os em ordem decrescente de número de pedidos.

**Resultado:**
| customer_name      | order_count |
|--------------------|-------------|
| João Silva         | 1           |
| Empresa ABC Ltda   | 1           |
| Pedro Almeida      | 1           |
| Indústria XYZ S.A. | 1           |
| Maria Souza        | 1           |

---

### **Pergunta 2: Algum vendedor também é fornecedor?**
A consulta verificou se há vendedores que também atuam como fornecedores, comparando os nomes das empresas nas tabelas `Seller` e `Supplier`. Nenhum resultado foi encontrado, indicando que nenhum vendedor também é fornecedor.

---

### **Pergunta 3: Relação de produtos, fornecedores e estoques**
A consulta relacionou produtos com seus fornecedores e informações de estoque, incluindo o nome do produto, nome do fornecedor, quantidade fornecida, localização do estoque e quantidade disponível.

**Resultado:**
| product_name       | supplier_name             | supplier_stock | stock_location | inventory_quantity |
|--------------------|---------------------------|----------------|----------------|--------------------|
| Smartphone X10     | Fornecedor Eletrônicos SA | 50             | Depósito SP    | 50                 |
| Camiseta Basica    | Tecidos e Roupas Ltda     | 200            | Depósito RJ    | 200                |
| Café Premium       | Alimentos Gourmet Ltda    | 100            | Depósito DF    | 100                |
| Livro de Ficção    | Editora Livros SA         | 30             | Depósito PR    | 30                 |
| Sofá Retrátil      | Móveis Modernos Ltda      | 10             | Depósito RS    | 10                 |

---

### **Pergunta 4: Relação de nomes dos fornecedores e nomes dos produtos**
A consulta listou os nomes dos fornecedores e os produtos que eles fornecem, combinando as tabelas `Supplier`, `ProductAvailability` e `Product`.

**Resultado:**
| supplier_name             | product_name       |
|---------------------------|--------------------|
| Fornecedor Eletrônicos SA | Smartphone X10     |
| Tecidos e Roupas Ltda     | Camiseta Basica    |
| Alimentos Gourmet Ltda    | Café Premium       |
| Editora Livros SA         | Livro de Ficção    |
| Móveis Modernos Ltda      | Sofá Retrátil      |

---

## **5. Backup do Banco de Dados**

Para garantir a segurança dos dados, foi gerado um backup completo do banco de dados. O arquivo de backup foi salvo no formato personalizado (`backup-schema-ecommerce`) e está localizado na pasta raiz do projeto. Esse backup pode ser restaurado futuramente usando ferramentas como `pg_restore` (para backups personalizados) ou `psql` (para backups em formato SQL).

O processo de backup foi realizado utilizando o utilitário `pg_dump`, que permite exportar o conteúdo do banco de dados para um arquivo local. A automação do backup pode ser implementada para garantir que os dados sejam salvos regularmente.

---

## **Conclusão**

Este projeto demonstra a criação de um banco de dados robusto para um sistema de e-commerce, abrangendo desde a modelagem das tabelas até a execução de consultas e geração de backups. Os scripts de criação de tabelas, inserção de dados e consultas foram desenvolvidos para fornecer uma base sólida para futuras expansões e melhorias. O backup gerado garante que os dados estejam protegidos contra perdas acidentais.

---