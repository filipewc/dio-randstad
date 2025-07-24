# **E-commerce Database Project**

Este projeto consiste em um modelo de banco de dados completo para um sistema de e-commerce. Ele foi projetado para suportar funcionalidades essenciais e avançadas de uma plataforma de comércio eletrônico, garantindo escalabilidade, integridade de dados e flexibilidade para futuras expansões.

---

## **Índice**

1. [Visão Geral](#visão-geral)
2. [Premissas do Projeto](#premissas-do-projeto)
3. [Diagrama do Modelo](#diagrama-do-modelo)
4. [Descrição das Tabelas](#descrição-das-tabelas)
   - [Tabelas Principais](#tabelas-principais)
   - [Tabelas de Relacionamento](#tabelas-de-relacionamento)
   - [Tabelas de Suporte](#tabelas-de-suporte)
5. [Funcionalidades Implementadas](#funcionalidades-implementadas)

---

## **Visão Geral**

O objetivo deste projeto é fornecer uma estrutura robusta e bem planejada para o gerenciamento de dados em um sistema de e-commerce. O modelo inclui tabelas para clientes, pedidos, produtos, fornecedores, vendedores, estoque, pagamentos, entregas e funcionalidades adicionais como avaliações, promoções e listas de desejos.

---

## **Premissas do Projeto**

1. **Clientes**: Podem ser cadastrados como pessoa física ou jurídica.
2. **Produtos**: Cada produto pode ser associado a categorias, fornecedores e vendedores.
3. **Pedidos**: Os pedidos incluem informações sobre status, frete, descontos e entregas.
4. **Pagamentos**: Diversas formas de pagamento são suportadas, com histórico de transações.
5. **Estoque**: O sistema gerencia múltiplos estoques e disponibiliza informações sobre quantidades disponíveis.
6. **Funcionalidades Avançadas**: Avaliações de produtos, cupons de desconto, carrinho de compras, lista de desejos e histórico de navegação.

---

## **Diagrama do Modelo**

O diagrama ER (Entidade-Relacionamento) pode ser visualizado abaixo:

![Diagrama ER]()

---

## **Descrição das Tabelas**

### **Tabelas Principais**

#### **Customer**
- Armazena informações sobre os clientes.
- **Campos**: `customer_id`, `customer_type_id`, `name`, `email`, `phone`, `address`, `identification`, `created_at`, `updated_at`.

#### **Order**
- Representa os pedidos realizados pelos clientes.
- **Campos**: `order_id`, `order_status`, `total_amount`, `shipping_cost`, `discount`, `coupon_code`, `customer_id`, `created_at`, `delivery_id`.

#### **Product**
- Contém os detalhes dos produtos disponíveis no e-commerce.
- **Campos**: `product_id`, `category_id`, `seller_id`, `name`, `description`, `price`, `stock_quantity`, `rating`, `is_active`, `created_at`, `updated_at`.

#### **Supplier**
- Gerencia os fornecedores de produtos.
- **Campos**: `supplier_id`, `business_name`, `document`, `contact_email`, `contact_phone`, `created_at`.

#### **Seller**
- Representa os vendedores associados aos produtos.
- **Campos**: `seller_id`, `business_name`, `location`, `commission_rate`, `created_at`.

---

### **Tabelas de Relacionamento**

#### **ProductAvailability**
- Associa produtos aos seus fornecedores.
- **Campos**: `availability_id`, `supplier_id`, `product_id`, `available_quantity`.

#### **ProductInventory**
- Gerencia a relação entre produtos e estoques.
- **Campos**: `inventory_id`, `stock_id`, `product_id`, `quantity`.

#### **ProductOrder**
- Associa produtos aos pedidos.
- **Campos**: `product_order_id`, `order_id`, `product_id`, `quantity`, `unit_price`.

#### **SellerProduct**
- Vincula produtos aos seus respectivos vendedores.
- **Campos**: `seller_product_id`, `seller_id`, `product_id`, `quantity`, `created_at`.

---

### **Tabelas de Suporte**

#### **ProductCategory**
- Organiza os produtos em categorias hierárquicas.
- **Campos**: `category_id`, `parent_category_id`, `name`, `description`, `created_at`.

#### **ProductReview**
- Armazena as avaliações e comentários dos clientes sobre os produtos.
- **Campos**: `review_id`, `product_id`, `customer_id`, `rating`, `comment`, `created_at`.

#### **Coupon**
- Gerencia os cupons de desconto disponíveis no sistema.
- **Campos**: `coupon_code`, `discount_type`, `discount_value`, `minimum_order_value`, `valid_from`, `valid_until`, `max_usage`, `used_count`, `created_at`.

#### **ShoppingCart**
- Representa os carrinhos de compras dos clientes.
- **Campos**: `cart_id`, `customer_id`, `created_at`, `updated_at`.

#### **Wishlist**
- Gerencia as listas de desejos dos clientes.
- **Campos**: `wishlist_id`, `customer_id`, `created_at`, `updated_at`.

#### **Promotion**
- Controla as campanhas promocionais aplicáveis aos produtos.
- **Campos**: `promotion_id`, `name`, `description`, `discount_type`, `discount_value`, `valid_from`, `valid_until`, `created_at`.

---

## **Funcionalidades Implementadas**

1. **Cadastro de Clientes**: Suporte para clientes PF e PJ.
2. **Gestão de Produtos**: Categorias, estoque, fornecedores e vendedores.
3. **Pedidos e Pagamentos**: Processamento de pedidos, formas de pagamento e histórico.
4. **Entregas**: Status e rastreamento de entregas.
5. **Cupons e Promoções**: Descontos personalizados e campanhas promocionais.
6. **Avaliações de Produtos**: Feedback dos clientes sobre os produtos.
7. **Carrinho de Compras e Lista de Desejos**: Experiência de compra intuitiva.
8. **Histórico de Navegação**: Recomendações baseadas no comportamento do cliente.