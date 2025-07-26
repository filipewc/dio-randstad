-- Consulta 1: Listar Todos os Clientes
SELECT * FROM Customer;

-- Consulta 2: Listar Todos os Planos Disponíveis
SELECT * FROM Plan WHERE is_active = TRUE;

-- Consulta 3: Listar Todas as Vendas Concluídas
SELECT s.sale_id, c.name AS customer_name, p.name AS plan_name, sl.name AS seller_name, s.total_amount
FROM Sale s
JOIN Customer c ON s.customer_id = c.customer_id
JOIN Plan p ON s.plan_id = p.plan_id
JOIN Seller sl ON s.seller_id = sl.seller_id
WHERE s.status = 'Concluída';

-- Consulta 4: Listar Instalações Agendadas
SELECT i.installation_id, c.name AS customer_name, t.name AS technician_name, i.scheduled_date, i.status
FROM Installation i
JOIN Sale s ON i.sale_id = s.sale_id
JOIN Customer c ON s.customer_id = c.customer_id
JOIN Technician t ON i.technician_id = t.technician_id
WHERE i.status = 'Agendada';

-- Consulta 5: Listar Pagamentos Pendentes
SELECT p.payment_id, c.name AS customer_name, s.sale_id, p.amount, p.payment_method, p.status
FROM Payment p
JOIN Sale s ON p.sale_id = s.sale_id
JOIN Customer c ON s.customer_id = c.customer_id
WHERE p.status = 'Pendente';

-- Consulta 6: Listar Equipamentos Atribuídos a Clientes
SELECT ce.customer_equipment_id, c.name AS customer_name, e.name AS equipment_name, e.serial_number, ce.status
FROM CustomerEquipment ce
JOIN Customer c ON ce.customer_id = c.customer_id
JOIN Equipment e ON ce.equipment_id = e.equipment_id;

-- Consulta 7: Listar Ordens de Serviço Abertas
SELECT so.service_order_id, c.name AS customer_name, t.name AS technician_name, so.description, so.status
FROM ServiceOrder so
JOIN Customer c ON so.customer_id = c.customer_id
JOIN Technician t ON so.technician_id = t.technician_id
WHERE so.status = 'Aberta';

-- Consulta 8: Listar Upgrades de Planos Realizados
SELECT pu.upgrade_id, c.name AS customer_name, old_p.name AS old_plan, new_p.name AS new_plan, pu.upgrade_date, pu.reason
FROM PlanUpgrade pu
JOIN Sale s ON pu.sale_id = s.sale_id
JOIN Customer c ON s.customer_id = c.customer_id
JOIN Plan old_p ON pu.old_plan_id = old_p.plan_id
JOIN Plan new_p ON pu.new_plan_id = new_p.plan_id;

-- Consulta 9: Listar Serviços Adicionais (SVAs) Contratados por Cliente
SELECT ss.sale_sva_id, c.name AS customer_name, sva.name AS sva_name, ss.start_date, ss.end_date, ss.status
FROM SaleSVA ss
JOIN Sale s ON ss.sale_id = s.sale_id
JOIN Customer c ON s.customer_id = c.customer_id
JOIN SVA sva ON ss.sva_id = sva.sva_id;

-- Consulta 10: Listar Eventos da Jornada de um Cliente Específico
SELECT cj.journey_id, cj.event_type, cj.event_date, cj.description, c.name AS customer_name
FROM CustomerJourney cj
JOIN Customer c ON cj.customer_id = c.customer_id
WHERE c.customer_id = 1 -- Substitua "1" pelo ID do cliente desejado
ORDER BY cj.event_date;

-- Consulta 11: Listar Total de Vendas por Vendedor
SELECT sl.name AS seller_name, COUNT(s.sale_id) AS total_sales
FROM Sale s
JOIN Seller sl ON s.seller_id = sl.seller_id
GROUP BY sl.name
ORDER BY total_sales DESC;

-- Consulta 12: Listar Total de Instalações Concluídas por Técnico
SELECT t.name AS technician_name, COUNT(i.installation_id) AS total_installations
FROM Installation i
JOIN Technician t ON i.technician_id = t.technician_id
WHERE i.status = 'Concluída'
GROUP BY t.name
ORDER BY total_installations DESC;

-- Consulta 13: Listar Clientes com Cancelamento Registrado
SELECT c.name AS customer_name, cj.event_date, cj.description
FROM CustomerJourney cj
JOIN Customer c ON cj.customer_id = c.customer_id
WHERE cj.event_type = 'Cancelamento';

-- Consulta 14: Listar SVAs Ativos por Cliente
SELECT c.name AS customer_name, sva.name AS sva_name, ss.start_date, ss.end_date
FROM SaleSVA ss
JOIN Sale s ON ss.sale_id = s.sale_id
JOIN Customer c ON s.customer_id = c.customer_id
JOIN SVA sva ON ss.sva_id = sva.sva_id
WHERE ss.status = 'Ativo';

-- Consulta 15: Listar Clientes sem Pagamentos Registrados
SELECT c.name AS customer_name
FROM Customer c
LEFT JOIN Sale s ON c.customer_id = s.customer_id
LEFT JOIN Payment p ON s.sale_id = p.sale_id
WHERE p.payment_id IS NULL;

-- Consulta 16: Listar Equipamentos em Manutenção
SELECT e.name AS equipment_name, e.serial_number, ce.status
FROM Equipment e
JOIN CustomerEquipment ce ON e.equipment_id = ce.equipment_id
WHERE ce.status = 'Manutenção';

-- Consulta 17: Listar Média de Valor das Vendas por Plano
SELECT p.name AS plan_name, AVG(s.total_amount) AS avg_sale_value
FROM Sale s
JOIN Plan p ON s.plan_id = p.plan_id
GROUP BY p.name
ORDER BY avg_sale_value DESC;

-- Consulta 18: Listar Total de Pagamentos Recebidos por Método de Pagamento
SELECT p.payment_method, SUM(p.amount) AS total_amount_received
FROM Payment p
WHERE p.status = 'Pago'
GROUP BY p.payment_method
ORDER BY total_amount_received DESC;

-- Consulta 19: Listar Clientes com Mais de Um Equipamento Atribuído
SELECT c.name AS customer_name, COUNT(ce.customer_equipment_id) AS total_equipments
FROM CustomerEquipment ce
JOIN Customer c ON ce.customer_id = c.customer_id
GROUP BY c.name
HAVING COUNT(ce.customer_equipment_id) > 1;

-- Consulta 20: Listar Técnicos sem Instalações Agendadas
SELECT t.name AS technician_name
FROM Technician t
LEFT JOIN Installation i ON t.technician_id = i.technician_id
WHERE i.installation_id IS NULL;