-- 1. Recuperações Simples
SELECT * FROM Customer;

-- 2. Filtros com WHERE
SELECT name, price FROM Product WHERE price > 500.00;
SELECT order_id, order_status, total_amount FROM public.order WHERE order_status = 'Em processamento';

-- 3. Expressões para Atributos Derivados
SELECT order_id, total_amount, discount, (total_amount - COALESCE(discount, 0)) AS final_amount FROM public.order;
SELECT promotion_id, product_id, original_price, discounted_price, (original_price - discounted_price) AS savings FROM PromotionProduct;

-- 4. Ordenações com ORDER BY
SELECT name, price FROM Product ORDER BY price DESC;
SELECT order_id, created_at FROM public.order ORDER BY created_at DESC;

-- 5. Condições de Filtros aos Grupos (HAVING)
SELECT category_id, COUNT(*) AS product_count FROM Product GROUP BY category_id HAVING COUNT(*) > 2;
SELECT customer_id, COUNT(*) AS order_count FROM public.order GROUP BY customer_id HAVING COUNT(*) > 1;

-- 6. Junções entre Tabelas
SELECT o.order_id, o.total_amount, c.name AS customer_name, d.delivery_status
FROM public.order o
JOIN Customer c ON o.customer_id = c.customer_id
LEFT JOIN Delivery d ON o.delivery_id = d.delivery_id;

SELECT p.name AS product_name, pc.name AS category_name
FROM Product p
JOIN ProductCategory pc ON p.category_id = pc.category_id;

SELECT ci.cart_item_id, p.name AS product_name, ci.quantity, p.price
FROM CartItem ci
JOIN Product p ON ci.product_id = p.product_id;

SELECT pr.review_id, p.name AS product_name, c.name AS customer_name, pr.rating, pr.comment
FROM ProductReview pr
JOIN Product p ON pr.product_id = p.product_id
JOIN Customer c ON pr.customer_id = c.customer_id;

SELECT pp.promotion_id, p.name AS product_name, pp.original_price, pp.discounted_price
FROM PromotionProduct pp
JOIN Product p ON pp.product_id = p.product_id;