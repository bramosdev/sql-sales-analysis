# Projeto Final SQL — Análise de Vendas

Projeto de prática com SQL e SQLite para organizar dados de clientes, produtos, pedidos e itens de pedidos, e responder perguntas simples de negócio.

## Objetivo
Montar um banco relacional pequeno e usar consultas SQL para analisar pedidos, valores vendidos, produtos e estoque.

## Estrutura do banco
- `clientes`: cadastro dos clientes.
- `produtos`: descrição, categoria, preço e estoque.
- `pedidos`: cliente, data e status.
- `itens_pedido`: produtos, quantidades e preços registrados em cada pedido.

Relacionamentos:
- Um cliente pode ter vários pedidos.
- Um pedido pode ter vários itens.
- Cada item referencia um produto.

## Tecnologias
- SQLite
- SQL
- VS Code com extensão SQLite (ou outro cliente SQLite)

## Como executar
1. Abra `main.sql` em um editor compatível com SQLite.
2. Selecione o banco SQLite correto.
3. Execute o script completo em um banco de projeto novo ou descartável.

**Atenção:** o script começa apagando e recriando as quatro tabelas. Não execute em um banco com dados importantes.

As consultas ficam no final do arquivo. Execute uma por vez para visualizar cada resultado.

## Análises incluídas
1. Listar pedidos com o nome do cliente.
2. Calcular o valor total de cada pedido.
3. Calcular faturamento por cliente, considerando pedidos concluídos.
4. Calcular o faturamento geral dos pedidos concluídos.
5. Encontrar os produtos mais vendidos por quantidade.
6. Contar pedidos por status.
7. Listar clientes com mais pedidos.
8. Encontrar produtos com estoque baixo.
9. Identificar pedidos acima da média com CTE e subquery.
10. Encontrar clientes sem pedidos.

## Conceitos praticados
`CREATE TABLE`, chaves primárias e estrangeiras, `NOT NULL`, `UNIQUE`, `DEFAULT`, `CHECK`, `INSERT`, `SELECT`, `INNER JOIN`, `LEFT JOIN`, `WHERE`, `GROUP BY`, `ORDER BY`, `LIMIT`, `COUNT`, `SUM`, `AVG`, `ROUND`, subquery e CTE (`WITH`).

## Observação sobre os dados
Os registros são fictícios e servem apenas para estudo. O valor de cada item é `quantidade * preco_unitario`. As análises de faturamento consideram apenas pedidos com status `Concluído`.

## Próximos passos
- Conectar o banco ao Python.
- Consultar os dados com Python.
- Transformar resultados em DataFrames com pandas.
- Exportar uma análise para CSV ou Excel.
