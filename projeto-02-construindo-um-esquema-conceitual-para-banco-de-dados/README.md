# **Sistema de Gerenciamento de Oficina Mecânica**

Este projeto consiste em um modelo de banco de dados para um sistema de controle e gerenciamento de ordens de serviço em uma oficina mecânica. O sistema permite registrar clientes, veículos, mecânicos, serviços, peças e ordens de serviço, além de controlar o estoque e o status das ordens.

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

O objetivo deste projeto é fornecer uma estrutura robusta e bem planejada para o gerenciamento de uma oficina mecânica. O modelo inclui tabelas para clientes, veículos, mecânicos, serviços, peças, ordens de serviço, pagamentos e controle de estoque. Ele foi projetado para ser escalável e flexível, permitindo futuras expansões.

---

## **Premissas do Projeto**

1. **Clientes**: Podem cadastrar seus dados e seus veículos.
2. **Veículos**: Cada veículo é vinculado a um cliente e pode passar por revisões ou reparos.
3. **Ordens de Serviço**: Cada ordem de serviço inclui informações sobre os serviços e peças necessárias, além de data de entrega e status.
4. **Mecânicos**: Cada ordem de serviço é designada a uma equipe de mecânicos.
5. **Peças**: O sistema controla o estoque de peças e registra seu uso em ordens de serviço.
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
- **Campos**: `mechanic_id`, `name`, `phone`, `specialization`, `created_at`.

#### **Service**
- Lista os serviços oferecidos pela oficina.
- **Campos**: `service_id`, `description`, `price`, `estimated_time`, `created_at`.

---

### **Tabelas de Relacionamento**

#### **WorkOrder**
- Representa as ordens de serviço criadas para os veículos.
- **Campos**: `work_order_id`, `vehicle_id`, `customer_id`, `status`, `entry_date`, `delivery_date`, `total_amount`, `notes`, `created_at`.

#### **WorkOrderTeam**
- Associa uma equipe de mecânicos a uma ordem de serviço.
- **Campos**: `team_id`, `work_order_id`, `mechanic_id`, `assigned_at`.

#### **WorkOrderItem**
- Detalha os serviços realizados em uma ordem de serviço.
- **Campos**: `item_id`, `work_order_id`, `service_id`, `quantity`, `unit_price`, `subtotal`, `completed_at`.

---

### **Tabelas de Suporte**

#### **Part**
- Gerencia as peças disponíveis no estoque.
- **Campos**: `part_id`, `description`, `stock_quantity`, `unit_price`, `created_at`.

#### **WorkOrderPart**
- Registra as peças utilizadas em uma ordem de serviço.
- **Campos**: `usage_id`, `work_order_id`, `part_id`, `quantity`, `unit_price`, `subtotal`, `used_at`.

#### **Payment**
- Controla os pagamentos realizados pelos clientes.
- **Campos**: `payment_id`, `work_order_id`, `amount`, `payment_method`, `payment_date`.

#### **WorkOrderStatusHistory**
- Rastreia as alterações de status de uma ordem de serviço.
- **Campos**: `status_history_id`, `work_order_id`, `status`, `updated_at`.

---

## **Funcionalidades Implementadas**

1. **Cadastro de Clientes e Veículos**:
   - Permite registrar clientes e seus respectivos veículos.

2. **Gestão de Mecânicos**:
   - Facilita o cadastro e alocação de mecânicos em ordens de serviço.

3. **Criação de Ordens de Serviço**:
   - Gera ordens de serviço com informações sobre os serviços e peças necessárias.

4. **Controle de Estoque de Peças**:
   - Gerencia o estoque de peças e rastreia seu uso em ordens de serviço.

5. **Histórico de Status**:
   - Mantém um registro detalhado das alterações de status de cada ordem de serviço.

6. **Pagamentos**:
   - Registra os pagamentos efetuados pelos clientes, com suporte para diferentes métodos de pagamento