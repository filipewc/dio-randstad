-- Inserção de Dados na Tabela Customer
INSERT INTO Customer (name, phone, email, address, cpf_cnpj) VALUES
('João Silva', '11987654321', 'joao.silva@example.com', 'Rua A, 123 - SP', '123.456.789-00'),
('Maria Souza', '21987654321', 'maria.souza@example.com', 'Rua B, 456 - RJ', '987.654.321-00'),
('Pedro Almeida', '31987654321', 'pedro.almeida@example.com', 'Rua C, 789 - MG', '111.222.333-44'),
('Ana Costa', '41987654321', 'ana.costa@example.com', 'Rua D, 101 - PR', '222.333.444-55'),
('Carlos Mendes', '51987654321', 'carlos.mendes@example.com', 'Rua E, 202 - RS', '333.444.555-66'),
('Juliana Lima', '61987654321', 'juliana.lima@example.com', 'Rua F, 303 - SC', '444.555.666-77'),
('Rafael Santos', '71987654321', 'rafael.santos@example.com', 'Rua G, 404 - BA', '555.666.777-88'),
('Fernanda Oliveira', '81987654321', 'fernanda.oliveira@example.com', 'Rua H, 505 - PE', '666.777.888-99'),
('Lucas Pereira', '91987654321', 'lucas.pereira@example.com', 'Rua I, 606 - GO', '777.888.999-00'),
('Camila Rodrigues', '12987654321', 'camila.rodrigues@example.com', 'Rua J, 707 - DF', '888.999.000-11');

-- Inserção de Dados na Tabela Plan
INSERT INTO Plan (name, speed, price, description, is_active) VALUES
('Plano Básico', '50 Mbps', 99.90, 'Plano ideal para navegação básica.', TRUE),
('Plano Intermediário', '100 Mbps', 149.90, 'Plano ideal para streaming e trabalho remoto.', TRUE),
('Plano Avançado', '200 Mbps', 199.90, 'Plano ideal para famílias e gamers.', TRUE),
('Plano Empresarial', '500 Mbps', 299.90, 'Plano voltado para empresas.', TRUE),
('Plano Ultra', '1 Gbps', 499.90, 'Plano premium com velocidade máxima.', TRUE);

-- Inserção de Dados na Tabela Sale
INSERT INTO Sale (customer_id, plan_id, status, total_amount) VALUES
(1, 1, 'Concluída', 99.90),
(2, 2, 'Concluída', 149.90),
(3, 3, 'Pendente', 199.90),
(4, 4, 'Concluída', 299.90),
(5, 5, 'Concluída', 499.90),
(6, 1, 'Pendente', 99.90),
(7, 2, 'Concluída', 149.90),
(8, 3, 'Concluída', 199.90),
(9, 4, 'Pendente', 299.90),
(10, 5, 'Concluída', 499.90);

-- Inserção de Dados na Tabela Technician
INSERT INTO Technician (name, phone, email, specialization) VALUES
('Carlos Mendes', '11912345678', 'carlos.mendes@isp.com', 'Fibra óptica'),
('Roberto Silva', '21912345678', 'roberto.silva@isp.com', 'Redes Wi-Fi'),
('Marcos Alves', '31912345678', 'marcos.alves@isp.com', 'Manutenção de equipamentos'),
('Paulo Costa', '41912345678', 'paulo.costa@isp.com', 'Instalação de cabos'),
('Ricardo Sousa', '51912345678', 'ricardo.sousa@isp.com', 'Configuração de roteadores');

-- Inserção de Dados na Tabela Installation
INSERT INTO Installation (sale_id, technician_id, scheduled_date, completion_date, status) VALUES
(1, 1, '2023-10-01 10:00:00', '2023-10-01 12:00:00', 'Concluída'),
(2, 2, '2023-10-02 09:00:00', '2023-10-02 11:00:00', 'Concluída'),
(3, 3, '2023-10-03 14:00:00', NULL, 'Agendada'),
(4, 4, '2023-10-04 16:00:00', '2023-10-04 18:00:00', 'Concluída'),
(5, 5, '2023-10-05 08:00:00', '2023-10-05 10:00:00', 'Concluída'),
(6, 1, '2023-10-06 10:00:00', NULL, 'Agendada'),
(7, 2, '2023-10-07 12:00:00', '2023-10-07 14:00:00', 'Concluída'),
(8, 3, '2023-10-08 15:00:00', '2023-10-08 17:00:00', 'Concluída'),
(9, 4, '2023-10-09 09:00:00', NULL, 'Agendada'),
(10, 5, '2023-10-10 11:00:00', '2023-10-10 13:00:00', 'Concluída');

-- Inserção de Dados na Tabela Payment
INSERT INTO Payment (sale_id, amount, payment_method, status) VALUES
(1, 99.90, 'Cartão', 'Pago'),
(2, 149.90, 'PIX', 'Pago'),
(3, 199.90, 'Boleto', 'Pendente'),
(4, 299.90, 'Cartão', 'Pago'),
(5, 499.90, 'PIX', 'Pago'),
(6, 99.90, 'Boleto', 'Pendente'),
(7, 149.90, 'Cartão', 'Pago'),
(8, 199.90, 'PIX', 'Pago'),
(9, 299.90, 'Boleto', 'Pendente'),
(10, 499.90, 'Cartão', 'Pago');

-- Inserção de Dados na Tabela Equipment
INSERT INTO Equipment (name, model, serial_number, status) VALUES
('Roteador Wi-Fi', 'Modelo X100', 'SN123456789', 'Disponível'),
('Modem Fibra', 'Modelo Y200', 'SN987654321', 'Instalado'),
('Switch Gigabit', 'Modelo Z300', 'SN112233445', 'Disponível'),
('Access Point', 'Modelo A400', 'SN556677889', 'Manutenção'),
('Repetidor Wi-Fi', 'Modelo B500', 'SN998877665', 'Instalado');

-- Inserção de Dados na Tabela CustomerEquipment
INSERT INTO CustomerEquipment (customer_id, equipment_id, installation_id, status) VALUES
(1, 1, 1, 'Ativo'),
(2, 2, 2, 'Ativo'),
(3, 3, 3, 'Ativo'),
(4, 4, 4, 'Ativo'),
(5, 5, 5, 'Ativo'),
(6, 1, 6, 'Ativo'),
(7, 2, 7, 'Ativo'),
(8, 3, 8, 'Ativo'),
(9, 4, 9, 'Ativo'),
(10, 5, 10, 'Ativo');

-- Inserção de Dados na Tabela ServiceOrder
INSERT INTO ServiceOrder (customer_id, technician_id, description, status) VALUES
(1, 1, 'Problema com conexão Wi-Fi', 'Concluída'),
(2, 2, 'Troca de roteador defeituoso', 'Concluída'),
(3, 3, 'Configuração de rede empresarial', 'Em andamento'),
(4, 4, 'Instalação de ponto adicional', 'Concluída'),
(5, 5, 'Manutenção de fibra óptica', 'Concluída'),
(6, 1, 'Atualização de firmware', 'Pendente'),
(7, 2, 'Diagnóstico de rede lenta', 'Em andamento'),
(8, 3, 'Substituição de modem', 'Concluída'),
(9, 4, 'Configuração de VLAN', 'Pendente'),
(10, 5, 'Instalação de repetidor Wi-Fi', 'Concluída');

-- Inserção de Dados na Tabela Report
INSERT INTO Report (technician_id, report_date, installations_completed, service_orders_completed, revenue_generated) VALUES
(1, '2023-10-01', 5, 3, 1499.70),
(2, '2023-10-02', 4, 2, 1199.60),
(3, '2023-10-03', 3, 4, 999.50),
(4, '2023-10-04', 2, 3, 799.40),
(5, '2023-10-05', 1, 5, 599.30);