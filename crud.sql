-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

INSERT INTO clientes
(nome, lealdade)
VALUES 
('Georgia', 0);

-- 2)

INSERT INTO pedidos
(status, cliente_id)
VALUES 
('Recebido', (SELECT id FROM clientes WHERE clientes.nome = 'Georgia'));

-- 3)

INSERT INTO produtos_pedidos
(pedido_id, produto_id)
VALUES
((SELECT pedidos.id FROM clientes 
JOIN pedidos ON pedidos.cliente_id = clientes.id
WHERE clientes.nome = 'Georgia'), 1),
((SELECT pedidos.id FROM clientes 
JOIN pedidos ON pedidos.cliente_id = clientes.id
WHERE clientes.nome = 'Georgia'), 2),
((SELECT pedidos.id FROM clientes 
JOIN pedidos ON pedidos.cliente_id = clientes.id
WHERE clientes.nome = 'Georgia'), 1),
((SELECT pedidos.id FROM clientes 
JOIN pedidos ON pedidos.cliente_id = clientes.id
WHERE clientes.nome = 'Georgia'), 6),
((SELECT pedidos.id FROM clientes 
JOIN pedidos ON pedidos.cliente_id = clientes.id
WHERE clientes.nome = 'Georgia'), 8);

-- Leitura

-- 1)

SELECT * FROM clientes
JOIN pedidos ON pedidos.cliente_id = clientes.id AND clientes.nome = 'Georgia'
JOIN produtos_pedidos ON produtos_pedidos.pedido_id = pedidos.id
JOIN produtos ON produtos.id = produtos_pedidos.produto_id;

-- Atualização

-- 1)

UPDATE clientes 
	SET lealdade = (SELECT SUM(produtos.pts_de_lealdade) FROM produtos
		JOIN produtos_pedidos ON produtos_pedidos.produto_id = produtos.id
		JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id
		JOIN clientes ON clientes.id = pedidos.cliente_id
		WHERE clientes.nome = 'Georgia')
WHERE clientes.nome = 'Georgia';

-- Deleção

-- 1)

DELETE FROM clientes
	WHERE clientes.id IN (SELECT clientes.id FROM clientes WHERE clientes.nome = 'Marcelo');
