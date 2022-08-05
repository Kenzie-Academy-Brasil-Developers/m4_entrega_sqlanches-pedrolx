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
('Georgia', (SELECT id FROM clientes WHERE clientes.nome = 'Georgia'));

-- 3)

SELECT pedidos.id FROM pedidos
JOIN clientes ON clientes.id = pedidos.id AND clientes.nome = 'Georgia'; 

INSERT INTO produtos_pedidos
(pedido_id, produto_id)
VALUES
(6, 1),
(6, 2),
(6, 1),
(6, 6),
(6, 8);

-- Leitura

-- 1)

SELECT * FROM clientes
JOIN pedidos ON pedidos.cliente_id = clientes.id AND clientes.nome = 'Georgia'
JOIN produtos_pedidos ON produtos_pedidos.pedido_id = pedidos.id
JOIN produtos ON produtos.id = produtos_pedidos.produto_id;

-- Atualização

-- 1)



-- Deleção

-- 1)


