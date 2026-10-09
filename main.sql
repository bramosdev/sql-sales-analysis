PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    endereco VARCHAR(255),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE produtos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    categoria VARCHAR(100),
    preco REAL NOT NULL CHECK (preco >= 0),
    estoque INTEGER NOT NULL CHECK (estoque >= 0),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL DEFAULT 'Pendente'
        CHECK (status IN ('Pendente', 'Concluído', 'Cancelado')),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_pedido (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pedido_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario REAL NOT NULL CHECK (preco_unitario >= 0),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO clientes (nome, email, telefone, endereco) VALUES
('João Silva', 'joao.silva@email.com', '11999999999', 'Rua Exemplo, 123'),
('Maria Oliveira', 'maria.oliveira@email.com', '11888888888', 'Avenida Exemplo, 456'),
('Carlos Souza', 'carlos.souza@email.com', '11777777777', 'Travessa Exemplo, 789'),
('Ana Pereira', 'ana.pereira@email.com', '11666666666', 'Praça Exemplo, 1010'),
('Pedro Lima', 'pedro.lima@email.com', '11555555555', 'Rua Exemplo, 1111');

INSERT INTO produtos (nome, descricao, categoria, preco, estoque) VALUES
('Notebook Dell Inspiron', 'Notebook Inspiron 15, Core i5, 8 GB RAM e SSD de 256 GB', 'Eletrônicos', 3500.00, 10),
('Smartphone Samsung Galaxy S21', 'Smartphone de 128 GB, cor preta', 'Eletrônicos', 4500.00, 15),
('Camiseta Polo Masculina', 'Camiseta de algodão, disponível em várias cores', 'Roupas', 120.00, 50),
('Tênis Nike Air Max', 'Tênis para corrida e caminhada', 'Calçados', 300.00, 20),
('Livro Aprendendo SQL', 'Livro introdutório sobre SQL', 'Livros', 80.00, 30);

INSERT INTO pedidos (cliente_id, status) VALUES
(1, 'Concluído'), (2, 'Pendente'), (3, 'Concluído'), (4, 'Cancelado'),
(5, 'Pendente'), (1, 'Concluído'), (3, 'Pendente'), (2, 'Concluído');

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00), (1, 3, 2, 120.00),
(2, 2, 1, 4500.00), (2, 5, 1, 80.00),
(3, 4, 1, 300.00), (3, 3, 3, 120.00),
(4, 1, 1, 3500.00),
(5, 2, 2, 4500.00), (5, 5, 1, 80.00),
(6, 3, 2, 120.00), (6, 4, 1, 300.00),
(7, 1, 1, 3500.00), (7, 5, 2, 80.00),
(8, 2, 1, 4500.00), (8, 3, 1, 120.00);

-- 1. Pedidos com o nome do cliente
SELECT p.id AS pedido_id, c.nome AS cliente, p.data_pedido, p.status
FROM pedidos AS p
INNER JOIN clientes AS c ON c.id = p.cliente_id
ORDER BY p.id;

-- 2. Valor total de cada pedido
SELECT p.id AS pedido_id, c.nome AS cliente, p.status,
       ROUND(SUM(ip.quantidade * ip.preco_unitario), 2) AS valor_total
FROM pedidos AS p
INNER JOIN clientes AS c ON c.id = p.cliente_id
INNER JOIN itens_pedido AS ip ON ip.pedido_id = p.id
GROUP BY p.id, c.nome, p.status
ORDER BY valor_total DESC;

-- 3. Faturamento por cliente (somente pedidos concluídos)
SELECT c.nome AS cliente,
       ROUND(SUM(ip.quantidade * ip.preco_unitario), 2) AS faturamento_total
FROM clientes AS c
INNER JOIN pedidos AS p ON p.cliente_id = c.id
INNER JOIN itens_pedido AS ip ON ip.pedido_id = p.id
WHERE p.status = 'Concluído'
GROUP BY c.id, c.nome
ORDER BY faturamento_total DESC;

-- 4. Faturamento geral (somente pedidos concluídos)
SELECT ROUND(SUM(ip.quantidade * ip.preco_unitario), 2) AS faturamento_total
FROM pedidos AS p
INNER JOIN itens_pedido AS ip ON ip.pedido_id = p.id
WHERE p.status = 'Concluído';

-- 5. Produtos mais vendidos por quantidade (somente pedidos concluídos)
SELECT pr.nome AS produto, SUM(ip.quantidade) AS unidades_vendidas
FROM itens_pedido AS ip
INNER JOIN produtos AS pr ON pr.id = ip.produto_id
INNER JOIN pedidos AS p ON p.id = ip.pedido_id
WHERE p.status = 'Concluído'
GROUP BY pr.id, pr.nome
ORDER BY unidades_vendidas DESC, pr.nome
LIMIT 5;

-- 6. Pedidos por status
SELECT status, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY status
ORDER BY total_pedidos DESC;

-- 7. Clientes com mais pedidos
SELECT c.nome AS cliente, COUNT(p.id) AS total_pedidos
FROM clientes AS c
LEFT JOIN pedidos AS p ON p.cliente_id = c.id
GROUP BY c.id, c.nome
ORDER BY total_pedidos DESC, c.nome;

-- 8. Produtos com estoque baixo
SELECT nome AS produto, categoria, estoque
FROM produtos
WHERE estoque <= 10
ORDER BY estoque, nome;

-- 9. Pedidos acima da média de valor (CTE + subquery)
WITH valores_pedidos AS (
    SELECT p.id AS pedido_id, c.nome AS cliente, p.status,
           SUM(ip.quantidade * ip.preco_unitario) AS valor_total
    FROM pedidos AS p
    INNER JOIN clientes AS c ON c.id = p.cliente_id
    INNER JOIN itens_pedido AS ip ON ip.pedido_id = p.id
    GROUP BY p.id, c.nome, p.status
)
SELECT pedido_id, cliente, status, ROUND(valor_total, 2) AS valor_total
FROM valores_pedidos
WHERE valor_total > (SELECT AVG(valor_total) FROM valores_pedidos)
ORDER BY valor_total DESC;

-- 10. Clientes sem pedidos (LEFT JOIN)
SELECT c.nome AS cliente, c.email
FROM clientes AS c
LEFT JOIN pedidos AS p ON p.cliente_id = c.id
WHERE p.id IS NULL
ORDER BY c.nome;
