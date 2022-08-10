-- Aqui você deve colocar os códigos SQL referentes à

-- Criação das tabelas

-- Tabela clientes
CREATE TABLE IF NOT EXISTS clientes(
  id BIGSERIAL CONSTRAINT id_cliente PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  lealdade INTEGER NOT NULL
);

-- Tabela endereços
CREATE TABLE IF NOT EXISTS endereços(
  id BIGSERIAL CONSTRAINT id_endereço PRIMARY KEY,
  cep VARCHAR(9) NOT NULL,
  rua VARCHAR(50) NOT NULL,
  numero INTEGER NOT NULL,
  bairro VARCHAR(50) NOT NULL,
  complemento VARCHAR(100),
  cliente_id INTEGER NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);
-- Tabela pedidos
CREATE TABLE IF NOT EXISTS pedidos(
  id BIGSERIAL CONSTRAINT id_pedido PRIMARY KEY,
  status VARCHAR(50) NOT NULL,
  cliente_id INTEGER NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);
-- Tabela produtos
CREATE TABLE IF NOT EXISTS produtos(
  id BIGSERIAL CONSTRAINT id_produto PRIMARY KEY,
  nome VARCHAR(100) UNIQUE NOT NULL,
  tipo VARCHAR(30) NOT NULL,
  preço FLOAT(8) NOT NULL,
  pts_de_lealdade INTEGER NOT NULL
);
-- Tabela produtos_pedidos
CREATE TABLE IF NOT EXISTS produtos_pedidos(
  id BIGSERIAL CONSTRAINT id_produtos_pedido PRIMARY KEY,
  pedido_id INTEGER NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
  produto_id INTEGER NOT NULL,
  FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
);