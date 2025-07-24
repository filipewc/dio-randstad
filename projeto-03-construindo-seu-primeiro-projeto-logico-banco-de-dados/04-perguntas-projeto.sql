-- 1. Quantos pedidos foram feitos por cada cliente?
SELECT 
    c.name AS customer_name,
    COUNT(o.order_id) AS order_count
FROM 
    Customer c
LEFT JOIN 
    public.order o ON c.customer_id = o.customer_id
GROUP BY 
    c.name
ORDER BY 
    order_count DESC;

-- 2. Algum vendedor também é fornecedor?
SELECT 
    s.business_name AS seller_name,
    su.business_name AS supplier_name
FROM 
    Seller s
JOIN 
    Supplier su ON s.business_name = su.business_name;

-- 3. Relação de produtos, fornecedores e estoques
SELECT 
    p.name AS product_name,
    su.business_name AS supplier_name,
    pa.available_quantity AS supplier_stock,
    st.location AS stock_location,
    pi.quantity AS inventory_quantity
FROM 
    Product p
JOIN 
    ProductAvailability pa ON p.product_id = pa.product_id
JOIN 
    Supplier su ON pa.supplier_id = su.supplier_id
JOIN 
    ProductInventory pi ON p.product_id = pi.product_id
JOIN 
    Stock st ON pi.stock_id = st.stock_id;

-- 4. Relação de nomes dos fornecedores e nomes dos produtos
SELECT 
    su.business_name AS supplier_name,
    p.name AS product_name
FROM 
    Supplier su
JOIN 
    ProductAvailability pa ON su.supplier_id = pa.supplier_id
JOIN 
    Product p ON pa.product_id = p.product_id;