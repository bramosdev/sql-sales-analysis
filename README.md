# Análise de Vendas com SQL

## Sobre o projeto

Projeto desenvolvido para praticar SQL e análise de dados utilizando SQLite. O banco de dados simula o sistema de vendas de uma loja, organizando informações sobre clientes, produtos, pedidos e itens de cada pedido.

O objetivo é consultar e relacionar dados para obter informações relevantes sobre as vendas.

## Objetivos

* Desenvolver e organizar um banco de dados relacional.
* Aplicar consultas SQL para extração e análise de dados.
* Utilizar chaves primárias e estrangeiras para estruturar os relacionamentos.
* Relacionar informações de diferentes tabelas.
* Calcular valores totais e quantidades de produtos vendidos.
* Elaborar consultas para gerar relatórios de vendas.

## Tecnologias utilizadas

* SQL
* SQLite
* Visual Studio Code

## Estrutura do banco de dados

| Tabela         | Descrição                                                                      |
| -------------- | ------------------------------------------------------------------------------ |
| `clientes`     | Armazena os dados dos clientes.                                                |
| `produtos`     | Armazena informações sobre os produtos, incluindo preços e estoque.            |
| `pedidos`      | Registra os pedidos realizados e seus respectivos status.                      |
| `itens_pedido` | Relaciona os pedidos aos produtos, registrando quantidades e preços unitários. |

## Conceitos SQL aplicados

* Criação e manipulação de tabelas.
* Inserção de dados e restrições de integridade.
* Chaves primárias e estrangeiras.
* Consultas com `SELECT` e filtros.
* Junções com `INNER JOIN` e `LEFT JOIN`.
* Agrupamento com `GROUP BY` e ordenação com `ORDER BY`.
* Funções de agregação, como `COUNT()`, `SUM()` e `AVG()`.
* Subconsultas e CTEs com `WITH`.
* Cálculo do valor total dos pedidos.

## Análises incluídas

1. Listagem de pedidos com o nome do cliente.
2. Cálculo do valor total de cada pedido.
3. Faturamento por cliente, considerando pedidos concluídos.
4. Faturamento geral dos pedidos concluídos.
5. Identificação dos produtos mais vendidos por quantidade.
6. Contagem de pedidos por status.
7. Identificação de clientes com mais pedidos.
8. Identificação de produtos com estoque baixo.
9. Identificação de pedidos acima da média usando CTE e subconsulta.
10. Identificação de clientes sem pedidos.

## Como executar

1. Clone este repositório.
2. Abra a pasta do projeto no Visual Studio Code.
3. Abra o banco de dados `banco.db` utilizando uma extensão compatível com SQLite.
4. Consulte o arquivo `main.sql` e execute as consultas individualmente.

**Atenção:** o script SQL recria as tabelas. Execute-o apenas em um banco de teste ou em uma cópia descartável, pois os dados existentes nessas tabelas podem ser apagados.

## Arquivos

* `main.sql`: estrutura do banco, dados de exemplo e consultas SQL.
* `banco.db`: banco de dados SQLite utilizado no projeto.
* `README.md`: documentação do projeto.

## Observação sobre os dados

Os registros são fictícios e servem apenas para estudo. O valor de cada item é calculado multiplicando a quantidade pelo preço unitário. As análises de faturamento consideram apenas pedidos com status `Concluído`.

## Próximos passos

* Conectar o banco de dados ao Python.
* Consultar dados utilizando Python.
* Transformar resultados em DataFrames com pandas.
* Exportar análises para CSV ou Excel.

## Autor

Bryan Ramos

Projeto desenvolvido como parte dos estudos em SQL e análise de dados.

---

# Sales Analysis with SQL

## About the Project

A project developed to practice SQL and data analysis using SQLite. The database simulates a store's sales system, organizing information about customers, products, orders, and order items.

The goal is to query and relate data to extract relevant sales insights.

## Objectives

* Develop and organize a relational database.
* Apply SQL queries for data extraction and analysis.
* Use primary and foreign keys to structure relationships.
* Combine information from different tables.
* Calculate total values and quantities of products sold.
* Generate sales reports.

## Technologies Used

* SQL
* SQLite
* Visual Studio Code

## Database Structure

| Table          | Description                                                     |
| -------------- | --------------------------------------------------------------- |
| `clientes`     | Stores customer information.                                    |
| `produtos`     | Stores product information, including prices and stock levels.  |
| `pedidos`      | Records orders and their respective statuses.                   |
| `itens_pedido` | Links orders to products, recording quantities and unit prices. |

## SQL Concepts Applied

* Table creation and data manipulation.
* Data insertion and integrity constraints.
* Primary and foreign keys.
* Queries using `SELECT` and filters.
* Table joins using `INNER JOIN` and `LEFT JOIN`.
* Data grouping with `GROUP BY` and sorting with `ORDER BY`.
* Aggregate functions such as `COUNT()`, `SUM()`, and `AVG()`.
* Subqueries and common table expressions (CTEs) using `WITH`.
* Calculation of total order values.

## Included Analyses

1. Listing orders with customer names.
2. Calculating the total value of each order.
3. Calculating revenue by customer for completed orders.
4. Calculating total revenue from completed orders.
5. Identifying the best-selling products by quantity.
6. Counting orders by status.
7. Identifying customers with the most orders.
8. Identifying products with low stock.
9. Identifying orders above average using a CTE and subquery.
10. Identifying customers without orders.

## How to Run

1. Clone this repository.
2. Open the project folder in Visual Studio Code.
3. Open the `banco.db` database using a compatible SQLite extension.
4. Review `main.sql` and execute the queries individually.

**Warning:** the SQL script recreates the tables. Run it only on a test database or a disposable copy, as existing data in those tables may be deleted.

## Files

* `main.sql`: database structure, sample data, and SQL queries.
* `banco.db`: SQLite database used in the project.
* `README.md`: project documentation.

## Data Notes

The records are fictional and intended for practice only. Each item's value is calculated by multiplying its quantity by its unit price. Revenue analyses consider only orders with the `Concluído` status.

## Next Steps

* Connect the database to Python.
* Query data using Python.
* Convert results into pandas DataFrames.
* Export analyses to CSV or Excel.

## Author

Bryan Ramos

Project developed as part of ongoing studies in SQL and data analysis.