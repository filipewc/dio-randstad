# **Sistema de Gerenciamento de Oficina Mecânica**

Este projeto consiste em um modelo de banco de dados para um sistema de controle e gerenciamento de ordens de serviço (OS) em uma oficina mecânica. O sistema permite registrar clientes, veículos, mecânicos, serviços, peças e ordens de serviço, além de controlar o estoque e o status das OS.

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

O objetivo deste projeto é fornecer uma estrutura robusta para o gerenciamento de uma oficina mecânica. O modelo inclui tabelas para clientes, veículos, mecânicos, serviços, peças, ordens de serviço, pagamentos e controle de estoque. Ele foi projetado para ser escalável e flexível, permitindo futuras expansões.

---

## **Premissas do Projeto**

1. **Clientes**: Podem cadastrar seus dados e seus veículos.
2. **Veículos**: Cada veículo é vinculado a um cliente e pode passar por revisões ou reparos.
3. **Ordens de Serviço (OS)**:
   - Incluem informações sobre os serviços e peças necessárias, além de data de entrega e status.
   - O valor total é calculado com base em uma tabela de referência de mão-de-obra.
4. **Mecânicos**: Cada OS é designada a uma equipe de mecânicos.
5. **Peças**: O sistema controla o estoque de peças e registra seu uso em OS.
6. **Pagamentos**: Os pagamentos são registrados e podem ser realizados por diferentes métodos.

---

## **Diagrama do Modelo**

O diagrama ER (Entidade-Relacionamento) pode ser visualizado abaixo:

![Diagrama ER](https://github.com/filipewc/dio-randstad/blob/main/projeto-02-construindo-um-esquema-conceitual-para-banco-de-dados/diagrama-er-projeto-oficina.png)

---

## **Descrição das Tabelas**

### **Tabelas Principais**

#### **Customer**
- Armazena informações sobre os clientes.
- **Campos**: `customer_id`, `name`, `phone`, `email`, `address`, `created_at`.

#### **Vehicle**
- Representa os veículos dos clientes.
- **Campos**: `vehicle_id`, `customer_id`, `license_plate`, `brand`, `model`, `year`, `color`, `created_at`.

#### **Mechanic**
- Gerencia os mecânicos da oficina.
- **Campos**: `mechanic_id`, `code`, `name`, `address`, `specialization`, `created_at`.

#### **ServiceReference**
- Lista os serviços oferecidos pela oficina com preços de referência.
- **Campos**: `service_ref_id`, `description`, `labor_cost`, `estimated_time`, `created_at`.

---

### **Tabelas de Relacionamento**

#### **WorkOrder**
- Representa as ordens de serviço criadas para os veículos.
- **Campos**: `work_order_id`, `vehicle_id`, `customer_id`, `issue_description`, `authorization_status`, `total_amount`, `status`, `issue_date`, `delivery_date`, `created_at`.

#### **WorkOrderTeam**
- Associa uma equipe de mecânicos a uma OS.
- **Campos**: `team_id`, `work_order_id`, `mechanic_id`, `assigned_at`.

#### **WorkOrderItem**
- Detalha os serviços realizados em uma OS.
- **Campos**: `item_id`, `work_order_id`, `service_ref_id`, `quantity`, `unit_price`, `subtotal`, `completed_at`.

---

### **Tabelas de Suporte**

#### **Part**
- Gerencia as peças disponíveis no estoque.
- **Campos**: `part_id`, `description`, `stock_quantity`, `unit_price`, `created_at`.

#### **WorkOrderPart**
- Registra as peças utilizadas em uma OS.
- **Campos**: `usage_id`, `work_order_id`, `part_id`, `quantity`, `unit_price`, `subtotal`, `used_at`.

#### **Payment**
- Controla os pagamentos realizados pelos clientes.
- **Campos**: `payment_id`, `work_order_id`, `amount`, `payment_method`, `payment_date`.

#### **WorkOrderStatusHistory**
- Rastreia as alterações de status de uma OS.
- **Campos**: `status_history_id`, `work_order_id`, `status`, `updated_at`.

---

## **Funcionalidades Implementadas**

1. **Cadastro de Clientes e Veículos**.
2. **Gestão de Mecânicos**.
3. **Criação de Ordens de Serviço (OS)**.
4. **Consulta de Valores de Mão-de-Obra**.
5. **Controle de Estoque de Peças**.
6. **Autorização de Serviços**.
7. **Pagamentos**.
8. **Histórico de Status**.