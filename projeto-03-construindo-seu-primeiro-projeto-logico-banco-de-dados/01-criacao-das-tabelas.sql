-- Tabela Tipo de Cliente (PF ou PJ)
CREATE TABLE CustomerType (
  customer_type_id SERIAL PRIMARY KEY,
  description VARCHAR(255) NOT NULL
);

-- Tabela Cliente
CREATE TABLE Customer (
  customer_id SERIAL PRIMARY KEY,
  customer_type_id INT REFERENCES CustomerType(customer_type_id),
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(20),
  address TEXT,
  identification VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Categoria de Produto
CREATE TABLE ProductCategory (
  category_id SERIAL PRIMARY KEY,
  parent_category_id INT REFERENCES ProductCategory(category_id),
  name VARCHAR(255) NOT NULL,
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Fornecedor
CREATE TABLE Supplier (
  supplier_id SERIAL PRIMARY KEY,
  business_name VARCHAR(255) NOT NULL,
  document VARCHAR(20) UNIQUE NOT NULL,
  contact_email VARCHAR(255),
  contact_phone VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Vendedor
CREATE TABLE Seller (
  seller_id SERIAL PRIMARY KEY,
  business_name VARCHAR(255) NOT NULL,
  location VARCHAR(255),
  commission_rate DECIMAL(5, 2),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Produto
CREATE TABLE Product (
  product_id SERIAL PRIMARY KEY,
  category_id INT REFERENCES ProductCategory(category_id),
  seller_id INT REFERENCES Seller(seller_id),
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  stock_quantity INT DEFAULT 0,
  rating DECIMAL(3, 2),
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Disponibilização de Produto (Relação entre Produto e Fornecedor)
CREATE TABLE ProductAvailability (
  availability_id SERIAL PRIMARY KEY,
  supplier_id INT REFERENCES Supplier(supplier_id),
  product_id INT REFERENCES Product(product_id),
  available_quantity INT NOT NULL
);

-- Tabela Estoque
CREATE TABLE Stock (
  stock_id SERIAL PRIMARY KEY,
  location VARCHAR(255) NOT NULL
);

-- Tabela Produto no Estoque (Relação entre Produto e Estoque)
CREATE TABLE ProductInventory (
  inventory_id SERIAL PRIMARY KEY,
  stock_id INT REFERENCES Stock(stock_id),
  product_id INT REFERENCES Product(product_id),
  quantity INT NOT NULL
);

-- Tabela Pedido
CREATE TABLE "Order" (
  order_id SERIAL PRIMARY KEY,
  order_status VARCHAR(50) NOT NULL,
  total_amount DECIMAL(10, 2),
  shipping_cost FLOAT,
  discount DECIMAL(10, 2),
  coupon_code VARCHAR(50),
  customer_id INT REFERENCES Customer(customer_id),
  delivery_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Entrega
CREATE TABLE Delivery (
  delivery_id SERIAL PRIMARY KEY,
  order_id INT REFERENCES "Order"(order_id),
  delivery_status VARCHAR(50),
  tracking_code VARCHAR(50),
  shipped_at TIMESTAMP,
  delivered_at TIMESTAMP
);

-- Tabela Produto no Pedido (Relação entre Produto e Pedido)
CREATE TABLE ProductOrder (
  product_order_id SERIAL PRIMARY KEY,
  order_id INT REFERENCES "Order"(order_id),
  product_id INT REFERENCES Product(product_id),
  quantity INT NOT NULL,
  unit_price DECIMAL(10, 2) NOT NULL
);

-- Tabela Produto do Vendedor (Relação entre Vendedor e Produto)
CREATE TABLE SellerProduct (
  seller_product_id SERIAL PRIMARY KEY,
  seller_id INT REFERENCES Seller(seller_id),
  product_id INT REFERENCES Product(product_id),
  quantity INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Forma de Pagamento
CREATE TABLE PaymentMethod (
  payment_method_id SERIAL PRIMARY KEY,
  description VARCHAR(255) NOT NULL
);

-- Tabela Pagamento
CREATE TABLE Payment (
  payment_id SERIAL PRIMARY KEY,
  order_id INT REFERENCES "Order"(order_id),
  payment_method_id INT REFERENCES PaymentMethod(payment_method_id),
  amount DECIMAL(10, 2) NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Histórico de Preços do Produto
CREATE TABLE ProductPriceHistory (
  price_history_id SERIAL PRIMARY KEY,
  product_id INT REFERENCES Product(product_id),
  previous_price DECIMAL(10, 2),
  current_price DECIMAL(10, 2),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Avaliação de Produto
CREATE TABLE ProductReview (
  review_id SERIAL PRIMARY KEY,
  product_id INT REFERENCES Product(product_id),
  customer_id INT REFERENCES Customer(customer_id),
  rating INT CHECK (rating >= 1 AND rating <= 5),
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Cupom de Desconto
CREATE TABLE Coupon (
  coupon_code VARCHAR(50) PRIMARY KEY,
  discount_type VARCHAR(50),
  discount_value DECIMAL(10, 2),
  minimum_order_value DECIMAL(10, 2),
  valid_from TIMESTAMP,
  valid_until TIMESTAMP,
  max_usage INT,
  used_count INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Carrinho de Compras
CREATE TABLE ShoppingCart (
  cart_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES Customer(customer_id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Item do Carrinho
CREATE TABLE CartItem (
  cart_item_id SERIAL PRIMARY KEY,
  cart_id INT REFERENCES ShoppingCart(cart_id),
  product_id INT REFERENCES Product(product_id),
  quantity INT NOT NULL,
  added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Lista de Desejos (Wishlist)
CREATE TABLE Wishlist (
  wishlist_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES Customer(customer_id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Item da Lista de Desejos
CREATE TABLE WishlistItem (
  wishlist_item_id SERIAL PRIMARY KEY,
  wishlist_id INT REFERENCES Wishlist(wishlist_id),
  product_id INT REFERENCES Product(product_id),
  added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Histórico de Navegação
CREATE TABLE BrowsingHistory (
  browsing_history_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES Customer(customer_id),
  product_id INT REFERENCES Product(product_id),
  viewed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Promoção
CREATE TABLE Promotion (
  promotion_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  discount_type VARCHAR(50),
  discount_value DECIMAL(10, 2),
  valid_from TIMESTAMP,
  valid_until TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Produto na Promoção
CREATE TABLE PromotionProduct (
  promotion_product_id SERIAL PRIMARY KEY,
  promotion_id INT REFERENCES Promotion(promotion_id),
  product_id INT REFERENCES Product(product_id),
  original_price DECIMAL(10, 2),
  discounted_price DECIMAL(10, 2)
);
