-- Tabela Customer (Cliente)
CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(255) UNIQUE,
    address TEXT NOT NULL,
    cpf_cnpj VARCHAR(20) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Plan (Plano de Internet)
CREATE TABLE Plan (
    plan_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    speed VARCHAR(50), -- Ex.: "100 Mbps", "200 Mbps"
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Sale (Venda)
CREATE TABLE Sale (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id),
    plan_id INT REFERENCES Plan(plan_id),
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL, -- Ex.: "Pendente", "Concluída", "Cancelada"
    total_amount DECIMAL(10, 2),
    notes TEXT
);

-- Tabela Technician (Técnico)
CREATE TABLE Technician (
    technician_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(255) UNIQUE,
    specialization VARCHAR(255), -- Ex.: "Fibra óptica", "Redes Wi-Fi"
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Installation (Instalação)
CREATE TABLE Installation (
    installation_id SERIAL PRIMARY KEY,
    sale_id INT REFERENCES Sale(sale_id),
    technician_id INT REFERENCES Technician(technician_id),
    scheduled_date TIMESTAMP,
    completion_date TIMESTAMP,
    status VARCHAR(50) NOT NULL, -- Ex.: "Agendada", "Em andamento", "Concluída"
    notes TEXT
);

-- Tabela Payment (Pagamento)
CREATE TABLE Payment (
    payment_id SERIAL PRIMARY KEY,
    sale_id INT REFERENCES Sale(sale_id),
    amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50), -- Ex.: "Cartão", "Boleto", "PIX"
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL -- Ex.: "Pago", "Pendente", "Cancelado"
);

-- Tabela Equipment (Equipamento)
CREATE TABLE Equipment (
    equipment_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    model VARCHAR(255),
    serial_number VARCHAR(255) UNIQUE NOT NULL,
    status VARCHAR(50) NOT NULL, -- Ex.: "Disponível", "Instalado", "Manutenção"
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela CustomerEquipment (Equipamentos do Cliente)
CREATE TABLE CustomerEquipment (
    customer_equipment_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id),
    equipment_id INT REFERENCES Equipment(equipment_id),
    installation_id INT REFERENCES Installation(installation_id),
    assigned_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL -- Ex.: "Ativo", "Devolvido", "Danificado"
);

-- Tabela ServiceOrder (Ordem de Serviço)
CREATE TABLE ServiceOrder (
    service_order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id),
    technician_id INT REFERENCES Technician(technician_id),
    description TEXT NOT NULL,
    status VARCHAR(50) NOT NULL, -- Ex.: "Aberta", "Em andamento", "Concluída"
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP
);

-- Tabela Report (Relatório de Desempenho)
CREATE TABLE Report (
    report_id SERIAL PRIMARY KEY,
    technician_id INT REFERENCES Technician(technician_id),
    report_date DATE NOT NULL,
    installations_completed INT DEFAULT 0,
    service_orders_completed INT DEFAULT 0,
    revenue_generated DECIMAL(10, 2)
);