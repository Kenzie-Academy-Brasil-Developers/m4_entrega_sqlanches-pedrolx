-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT * FROM pedidos pe
JOIN produtos pr ON pr.id = pe.id;
-- 2)
SELECT pe.id FROM pedidos pe
JOIN produtos pr ON pr.id = pe.id 
WHERE pr.nome = 'Fritas';
-- 3)
SELECT cl.nome gostam_de_fritas FROM pedidos pe
JOIN produtos pr ON pr.id = pe.id 
JOIN clientes cl ON cl.id = pe.cliente_id
WHERE pr.nome = 'Fritas';
-- 4)
SELECT SUM(produtos.preco) FROM pedidos 
JOIN clientes ON pedidos.id = clientes.id
JOIN produtos ON produtos.id = pedidos.id
WHERE clientes.nome = 'Laura';
-- 5)
SELECT COUNT(*) vezes_pedido, produtos.nome
FROM produtos_pedidos
JOIN produtos ON produtos_pedidos.produto_id = produtos.id
GROUP BY produto_id, produtos.nome;