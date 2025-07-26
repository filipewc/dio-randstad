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