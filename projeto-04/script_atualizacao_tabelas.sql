-- Criação da Tabela Seller (Vendedor)
CREATE TABLE Seller (
    seller_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(255) UNIQUE,
    specialization VARCHAR(255), -- Ex.: "Vendas Corporativas", "Vendas Residenciais"
    channel VARCHAR(50), -- Ex.: "Digital", "PAP", "Loja", "Terceiros"
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Adicionar Coluna seller_id à Tabela Sale
ALTER TABLE Sale ADD COLUMN seller_id INT REFERENCES Seller(seller_id);

-- Inserção de Dados na Tabela Seller
INSERT INTO Seller (name, phone, email, specialization, channel) VALUES
('Marcos Silva', '11987654321', 'marcos.silva@isp.com', 'Vendas Residenciais', 'Digital'),
('Ana Costa', '21987654321', 'ana.costa@isp.com', 'Vendas Corporativas', 'PAP'),
('Rafael Almeida', '31987654321', 'rafael.almeida@isp.com', 'Vendas Residenciais', 'Loja'),
('Juliana Lima', '41987654321', 'juliana.lima@isp.com', 'Vendas Corporativas', 'Terceiros'),
('Carlos Mendes', '51987654321', 'carlos.mendes@isp.com', 'Vendas Residenciais', 'Digital');

-- Atualização das Vendas para Associar Vendedores
UPDATE Sale SET seller_id = 1 WHERE sale_id IN (1, 2, 3);
UPDATE Sale SET seller_id = 2 WHERE sale_id IN (4, 5);
UPDATE Sale SET seller_id = 3 WHERE sale_id IN (6, 7);
UPDATE Sale SET seller_id = 4 WHERE sale_id IN (8, 9);
UPDATE Sale SET seller_id = 5 WHERE sale_id = 10;

-- Consulta para Verificar Relação entre Vendas e Vendedores
SELECT s.sale_id, c.name AS customer_name, p.name AS plan_name, sl.name AS seller_name, sl.channel
FROM Sale s
JOIN Customer c ON s.customer_id = c.customer_id
JOIN Plan p ON s.plan_id = p.plan_id
JOIN Seller sl ON s.seller_id = sl.seller_id;

-- Tabela PlanUpgrade: Registra upgrades ou downgrades de planos
CREATE TABLE PlanUpgrade (
    upgrade_id SERIAL PRIMARY KEY,
    sale_id INT REFERENCES Sale(sale_id), -- Venda original
    old_plan_id INT REFERENCES Plan(plan_id), -- Plano anterior
    new_plan_id INT REFERENCES Plan(plan_id), -- Novo plano
    upgrade_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reason TEXT -- Motivo do upgrade/downgrade
);

-- Tabela SVA: Serviços adicionais disponíveis
CREATE TABLE SVA (
    sva_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL, -- Nome do serviço
    description TEXT, -- Descrição do serviço
    price DECIMAL(10, 2) NOT NULL, -- Preço mensal do serviço
    is_active BOOLEAN DEFAULT TRUE -- Status do serviço
);

-- Tabela SaleSVA: Relaciona serviços adicionais às vendas
CREATE TABLE SaleSVA (
    sale_sva_id SERIAL PRIMARY KEY,
    sale_id INT REFERENCES Sale(sale_id), -- Venda associada
    sva_id INT REFERENCES SVA(sva_id), -- Serviço adicional
    start_date DATE NOT NULL, -- Data de início do serviço
    end_date DATE, -- Data de término (opcional)
    status VARCHAR(50) NOT NULL -- Ex.: "Ativo", "Cancelado"
);

INSERT INTO PlanUpgrade (sale_id, old_plan_id, new_plan_id, reason) VALUES
(1, 1, 2, 'Cliente solicitou mais velocidade'),
(2, 2, 3, 'Melhor custo-benefício'),
(3, 3, 4, 'Necessidade de plano empresarial'),
(4, 4, 5, 'Cliente queria o plano premium'),
(5, 5, 1, 'Downgrade por redução de custos');

INSERT INTO SVA (name, description, price, is_active) VALUES
('Antivírus Premium', 'Proteção avançada contra vírus e malware', 19.90, TRUE),
('Backup em Nuvem', 'Armazenamento seguro de arquivos na nuvem', 29.90, TRUE),
('Suporte Prioritário', 'Atendimento técnico prioritário 24/7', 49.90, TRUE),
('Controle Parental', 'Ferramentas para controle de acesso à internet', 9.90, TRUE),
('Firewall Avançado', 'Proteção avançada contra ataques cibernéticos', 39.90, TRUE);

SELECT 
    c.name AS customer_name,
    old_p.name AS old_plan,
    new_p.name AS new_plan,
    pu.upgrade_date,
    pu.reason
FROM PlanUpgrade pu
JOIN Sale s ON pu.sale_id = s.sale_id
JOIN Customer c ON s.customer_id = c.customer_id
JOIN Plan old_p ON pu.old_plan_id = old_p.plan_id
JOIN Plan new_p ON pu.new_plan_id = new_p.plan_id;


INSERT INTO SaleSVA (sale_id, sva_id, start_date, end_date, status) VALUES
(1, 1, '2023-10-01', NULL, 'Ativo'), -- Antivírus Premium
(1, 2, '2023-10-01', '2024-09-30', 'Ativo'), -- Backup em Nuvem
(2, 3, '2023-10-02', NULL, 'Ativo'), -- Suporte Prioritário
(3, 4, '2023-10-03', NULL, 'Ativo'), -- Controle Parental
(4, 5, '2023-10-04', '2024-03-01', 'Cancelado'); -- Firewall Avançado

SELECT 
    c.name AS customer_name,
    old_p.name AS old_plan,
    new_p.name AS new_plan,
    pu.upgrade_date,
    pu.reason
FROM PlanUpgrade pu
JOIN Sale s ON pu.sale_id = s.sale_id
JOIN Customer c ON s.customer_id = c.customer_id
JOIN Plan old_p ON pu.old_plan_id = old_p.plan_id
JOIN Plan new_p ON pu.new_plan_id = new_p.plan_id;

SELECT 
    c.name AS customer_name,
    sva.name AS sva_name,
    ss.status,
    ss.start_date,
    ss.end_date
FROM SaleSVA ss
JOIN Sale s ON ss.sale_id = s.sale_id
JOIN Customer c ON s.customer_id = c.customer_id
JOIN SVA sva ON ss.sva_id = sva.sva_id;

SELECT 
    name, description, price, is_active
FROM SVA
WHERE is_active = TRUE;

SELECT 
    c.name AS customer_name,
    sva.name AS sva_name,
    ss.status,
    ss.start_date,
    ss.end_date
FROM SaleSVA ss
JOIN Sale s ON ss.sale_id = s.sale_id
JOIN Customer c ON s.customer_id = c.customer_id
JOIN SVA sva ON ss.sva_id = sva.sva_id
WHERE ss.status = 'Cancelado';

CREATE TABLE CustomerJourney (
    journey_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id), -- Cliente associado
    event_type VARCHAR(50) NOT NULL, -- Tipo de evento (ex.: "Contratação", "Upgrade", "Instalação", etc.)
    event_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data do evento
    description TEXT, -- Descrição detalhada do evento
    related_table VARCHAR(50), -- Tabela relacionada ao evento (ex.: "Sale", "PlanUpgrade", "Installation")
    related_id INT -- ID do registro relacionado (ex.: sale_id, upgrade_id, installation_id)
);

-- Evento de Contratação
INSERT INTO CustomerJourney (customer_id, event_type, event_date, description, related_table, related_id)
VALUES (1, 'Contratação', '2023-10-01 10:00:00', 'Cliente contratou o Plano Básico', 'Sale', 1);

-- Evento de Upgrade de Plano
INSERT INTO CustomerJourney (customer_id, event_type, event_date, description, related_table, related_id)
VALUES (1, 'Upgrade', '2023-10-15 14:30:00', 'Cliente solicitou mais velocidade', 'PlanUpgrade', 1);

-- Evento de Instalação
INSERT INTO CustomerJourney (customer_id, event_type, event_date, description, related_table, related_id)
VALUES (1, 'Instalação', '2023-10-02 09:00:00', 'Serviço instalado com sucesso', 'Installation', 1);

-- Evento de Pagamento
INSERT INTO CustomerJourney (customer_id, event_type, event_date, description, related_table, related_id)
VALUES (1, 'Pagamento', '2023-10-10 16:00:00', 'Pagamento realizado via Cartão', 'Payment', 1);

-- Evento de Ordem de Serviço
INSERT INTO CustomerJourney (customer_id, event_type, event_date, description, related_table, related_id)
VALUES (1, 'Ordem de Serviço', '2023-10-20 11:00:00', 'Problema com conexão Wi-Fi', 'ServiceOrder', 1);

-- Evento de Cancelamento
INSERT INTO CustomerJourney (customer_id, event_type, event_date, description, related_table, related_id)
VALUES (1, 'Cancelamento', '2023-11-01 08:00:00', 'Cliente cancelou o serviço devido a mudança de endereço', NULL, NULL);

SELECT 
    cj.event_type,
    cj.event_date,
    cj.description,
    c.name AS customer_name
FROM CustomerJourney cj
JOIN Customer c ON cj.customer_id = c.customer_id
WHERE c.customer_id = 1
ORDER BY cj.event_date;

SELECT 
    c.name AS customer_name,
    cj.event_date,
    cj.description
FROM CustomerJourney cj
JOIN Customer c ON cj.customer_id = c.customer_id
WHERE cj.event_type = 'Upgrade';

SELECT 
    c.name AS customer_name,
    cj.event_date,
    cj.description
FROM CustomerJourney cj
JOIN Customer c ON cj.customer_id = c.customer_id
WHERE cj.event_type = 'Cancelamento';
