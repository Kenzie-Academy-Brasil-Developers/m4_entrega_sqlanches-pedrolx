-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT * FROM pedidos pe
JOIN produtos pr ON pr.id = pe.id;
-- 2)
SELECT pe.id FROM pedidos pe
JOIN produtos_pedidos pp ON pe.id = pp.pedido_id
JOIN produtos pr ON pr.id = pp.produto_id
WHERE pr.nome = 'Fritas';
-- 3)
SELECT cl.nome gostam_de_fritas FROM pedidos pe
JOIN produtos_pedidos pp ON pe.id = pp.pedido_id
JOIN produtos pr ON pr.id = pp.produto_id
JOIN clientes cl ON pe.cliente_id = cl.id
WHERE pr.nome = 'Fritas';
-- 4)
SELECT SUM(produtos."preço") FROM pedidos 
JOIN clientes ON clientes.id = pedidos.cliente_id
JOIN produtos_pedidos ON produtos_pedidos.pedido_id = pedidos.id
JOIN produtos ON produtos.id = produtos_pedidos.produto_id
WHERE clientes.nome = 'Laura';
-- 5)
SELECT COUNT(*) vezes_pedido, produtos.nome FROM produtos_pedidos
JOIN produtos ON produtos_pedidos.produto_id = produtos.id
GROUP BY produtos.nome, produto_id;