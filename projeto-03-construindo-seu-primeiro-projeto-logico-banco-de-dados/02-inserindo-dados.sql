-- Inserir dados na tabela CustomerType
INSERT INTO CustomerType (description) VALUES
('Pessoa Física'),
('Pessoa Jurídica');

-- Inserir dados na tabela Customer
INSERT INTO Customer (customer_type_id, name, email, phone, address, identification) VALUES
(1, 'João Silva', 'joao.silva@example.com', '123456789', 'Rua A, 123', '123.456.789-00'),
(2, 'Empresa ABC Ltda', 'contato@empresaabc.com', '987654321', 'Av. B, 456', '12.345.678/0001-00'),
(1, 'Maria Souza', 'maria.souza@example.com', '555555555', 'Rua C, 789', '987.654.321-00'),
(1, 'Pedro Almeida', 'pedro.almeida@example.com', '444444444', 'Rua D, 101', '111.222.333-44'),
(2, 'Indústria XYZ S.A.', 'industria@xyz.com', '333333333', 'Av. E, 202', '99.888.777/0001-99');

-- Inserir dados na tabela ProductCategory
INSERT INTO ProductCategory (name, description) VALUES
('Eletrônicos', 'Produtos eletrônicos como smartphones e laptops'),
('Roupas', 'Vestuário masculino e feminino'),
('Alimentos', 'Itens alimentícios diversos'),
('Livros', 'Livros de ficção e não-ficção'),
('Móveis', 'Móveis para casa e escritório');

-- Inserir dados na tabela Supplier
INSERT INTO Supplier (business_name, document, contact_email, contact_phone) VALUES
('Fornecedor Eletrônicos SA', '12.345.678/0001-01', 'eletronicos@fornecedor.com', '111111111'),
('Tecidos e Roupas Ltda', '22.333.444/0001-22', 'roupas@fornecedor.com', '222222222'),
('Alimentos Gourmet Ltda', '33.444.555/0001-33', 'gourmet@fornecedor.com', '333333333'),
('Editora Livros SA', '44.555.666/0001-44', 'livros@editora.com', '444444444'),
('Móveis Modernos Ltda', '55.666.777/0001-55', 'moveis@fornecedor.com', '555555555');

-- Inserir dados na tabela Seller
INSERT INTO Seller (business_name, location, commission_rate) VALUES
('Loja Eletrônicos Online', 'São Paulo', 0.10),
('Boutique de Roupas', 'Rio de Janeiro', 0.15),
('Supermercado Gourmet', 'Brasília', 0.05),
('Livraria Central', 'Curitiba', 0.12),
('Móveis Design', 'Porto Alegre', 0.08);

-- Inserir dados na tabela Stock
INSERT INTO Stock (location) VALUES
('Depósito SP'),
('Depósito RJ'),
('Depósito DF'),
('Depósito PR'),
('Depósito RS');

-- Inserir dados na tabela Product
INSERT INTO Product (category_id, seller_id, name, description, price, stock_quantity, rating, is_active) VALUES
(1, 1, 'Smartphone X10', 'Smartphone com 128GB e câmera de 48MP', 1500.00, 50, 4.5, TRUE),
(2, 2, 'Camiseta Basica', 'Camiseta 100% algodão', 50.00, 200, 4.2, TRUE),
(3, 3, 'Café Premium', 'Café gourmet torrado', 30.00, 100, 4.7, TRUE),
(4, 4, 'Livro de Ficção', 'Best-seller de ficção científica', 40.00, 30, 4.6, TRUE),
(5, 5, 'Sofá Retrátil', 'Sofá moderno com sistema retrátil', 1200.00, 10, 4.3, TRUE);

-- Inserir dados na tabela ProductAvailability
INSERT INTO ProductAvailability (supplier_id, product_id, available_quantity) VALUES
(1, 1, 50),
(2, 2, 200),
(3, 3, 100),
(4, 4, 30),
(5, 5, 10);

-- Inserir dados na tabela ProductInventory
INSERT INTO ProductInventory (stock_id, product_id, quantity) VALUES
(1, 1, 50),
(2, 2, 200),
(3, 3, 100),
(4, 4, 30),
(5, 5, 10);

-- Inserir dados na tabela "Order"
INSERT INTO public.order (order_status, total_amount, shipping_cost, discount, coupon_code, customer_id, delivery_id) VALUES
('Em processamento', 1500.00, 20.00, 0.00, NULL, 1, 1),
('Enviado', 50.00, 10.00, 5.00, 'DESCONTO10', 2, 2),
('Concluído', 30.00, 5.00, 0.00, NULL, 3, 3),
('Cancelado', 40.00, 8.00, 0.00, NULL, 4, 4),
('Em análise', 1200.00, 30.00, 0.00, NULL, 5, 5);

-- Inserir dados na tabela Delivery
INSERT INTO Delivery (order_id, delivery_status, tracking_code, shipped_at, delivered_at) VALUES
(1, 'Em trânsito', 'TRACK12345', '2023-10-01 10:00:00', NULL),
(2, 'Entregue', 'TRACK67890', '2023-10-02 12:00:00', '2023-10-05 15:00:00'),
(3, 'Em trânsito', 'TRACK11223', '2023-10-03 09:00:00', NULL),
(4, 'Cancelado', NULL, NULL, NULL),
(5, 'Em análise', NULL, NULL, NULL);

-- Inserir dados na tabela ProductOrder
INSERT INTO ProductOrder (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1500.00),
(2, 2, 2, 50.00),
(3, 3, 1, 30.00),
(4, 4, 1, 40.00),
(5, 5, 1, 1200.00);

-- Inserir dados na tabela SellerProduct
INSERT INTO SellerProduct (seller_id, product_id, quantity) VALUES
(1, 1, 50),
(2, 2, 200),
(3, 3, 100),
(4, 4, 30),
(5, 5, 10);

-- Inserir dados na tabela PaymentMethod
INSERT INTO PaymentMethod (description) VALUES
('Cartão de Crédito'),
('Boleto Bancário'),
('PIX'),
('Transferência Bancária'),
('Dinheiro');

-- Inserir dados na tabela Payment
INSERT INTO Payment (order_id, payment_method_id, amount) VALUES
(1, 1, 1500.00),
(2, 3, 50.00),
(3, 2, 30.00),
(4, 5, 40.00),
(5, 4, 1200.00);

-- Inserir dados na tabela ProductPriceHistory
INSERT INTO ProductPriceHistory (product_id, previous_price, current_price) VALUES
(1, 1400.00, 1500.00),
(2, 45.00, 50.00),
(3, 28.00, 30.00),
(4, 38.00, 40.00),
(5, 1100.00, 1200.00);

-- Inserir dados na tabela ProductReview
INSERT INTO ProductReview (product_id, customer_id, rating, comment) VALUES
(1, 1, 5, 'Excelente produto, entrega rápida!'),
(2, 2, 4, 'Produto bom, mas a cor é diferente da imagem.'),
(3, 3, 5, 'Adorei o café, qualidade incrível!'),
(4, 4, 4, 'Livro interessante, recomendo.'),
(5, 5, 3, 'Sofá bonito, mas difícil de montar.');

-- Inserir dados na tabela Coupon
INSERT INTO Coupon (coupon_code, discount_type, discount_value, minimum_order_value, valid_from, valid_until, max_usage) VALUES
('DESCONTO10', 'Percentual', 10.00, 100.00, '2023-01-01 00:00:00', '2023-12-31 23:59:59', 100),
('FRETEGRATIS', 'Valor Fixo', 20.00, 200.00, '2023-02-01 00:00:00', '2023-11-30 23:59:59', 50),
('BLACKFRIDAY', 'Percentual', 20.00, 500.00, '2023-11-24 00:00:00', '2023-11-27 23:59:59', 200);

-- Inserir dados na tabela ShoppingCart
INSERT INTO ShoppingCart (customer_id) VALUES
(1),
(2),
(3),
(4),
(5);

-- Inserir dados na tabela CartItem
INSERT INTO CartItem (cart_id, product_id, quantity) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);

-- Inserir dados na tabela Wishlist
INSERT INTO Wishlist (customer_id) VALUES
(1),
(2),
(3),
(4),
(5);

-- Inserir dados na tabela WishlistItem
INSERT INTO WishlistItem (wishlist_id, product_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserir dados na tabela BrowsingHistory
INSERT INTO BrowsingHistory (customer_id, product_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserir dados na tabela Promotion
INSERT INTO Promotion (name, description, discount_type, discount_value, valid_from, valid_until) VALUES
('Promoção de Verão', 'Desconto especial em produtos de verão', 'Percentual', 15.00, '2023-06-01 00:00:00', '2023-08-31 23:59:59'),
('Black Friday', 'Grandes descontos na Black Friday', 'Percentual', 20.00, '2023-11-24 00:00:00', '2023-11-27 23:59:59'),
('Liquidação de Inverno', 'Descontos em roupas de inverno', 'Valor Fixo', 50.00, '2023-07-01 00:00:00', '2023-07-31 23:59:59');

-- Inserir dados na tabela PromotionProduct
INSERT INTO PromotionProduct (promotion_id, product_id, original_price, discounted_price) VALUES
(1, 1, 1500.00, 1275.00),
(2, 2, 50.00, 40.00),
(3, 3, 30.00, 25.00);