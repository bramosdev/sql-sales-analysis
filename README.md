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

O banco de dados contém quatro tabelas principais:

| Tabela         | Descrição                                                                      |
| -------------- | ------------------------------------------------------------------------------ |
| `clientes`     | Armazena os dados dos clientes.                                                |
| `produtos`     | Armazena informações sobre os produtos, incluindo preços e estoque.            |
| `pedidos`      | Registra os pedidos realizados e seus respectivos status.                      |
| `itens_pedido` | Relaciona os pedidos aos produtos, registrando quantidades e preços unitários. |

## Conceitos SQL aplicados

* Criação e manipulação de tabelas.
* Inserção de dados.
* Chaves primárias e estrangeiras.
* Restrições de integridade.
* Consultas com `SELECT` e filtros.
* Junções entre tabelas com `INNER JOIN`.
* Agrupamento de dados com `GROUP BY`.
* Funções de agregação, como `SUM()` e `COUNT()`.
* Cálculo do valor total dos pedidos.

## Como executar

1. Clone este repositório.
2. Abra a pasta do projeto no Visual Studio Code.
3. Abra o banco de dados SQLite utilizando uma extensão compatível.
4. Execute as consultas disponíveis no arquivo `main.sql`.

## Arquivos

* `main.sql`: script com a estrutura do banco de dados, os dados de exemplo e as consultas SQL.
* `banco.db`: banco de dados SQLite utilizado no projeto.
* `README.md`: documentação do projeto.

## Autor

Bryan Ramos

Projeto desenvolvido como parte dos estudos em SQL e análise de dados.


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# Sales Analysis with SQL

## About the Project

Project developed to practice SQL and data analysis using SQLite. The database simulates a store's sales system, organizing information about customers, products, orders, and order items.

The goal is to query and relate data to obtain relevant sales insights.

## Objectives

* Develop and organize a relational database.
* Apply SQL queries for data extraction and analysis.
* Use primary and foreign keys to structure relationships.
* Combine information from different tables.
* Calculate total values and quantities of products sold.
* Build queries to generate sales reports.

## Technologies Used

* SQL
* SQLite
* Visual Studio Code

## Database Structure

The database contains four main tables:

| Table          | Description                                                     |
| -------------- | --------------------------------------------------------------- |
| `clientes`     | Stores customer information.                                    |
| `produtos`     | Stores product information, including prices and stock levels.  |
| `pedidos`      | Records orders and their respective statuses.                   |
| `itens_pedido` | Links orders to products, recording quantities and unit prices. |

## SQL Concepts Applied

* Table creation and manipulation.
* Data insertion.
* Primary and foreign keys.
* Integrity constraints.
* Queries using `SELECT` and filters.
* Table joins using `INNER JOIN`.
* Data grouping using `GROUP BY`.
* Aggregate functions such as `SUM()` and `COUNT()`.
* Calculation of total order values.

## How to Run

1. Clone this repository.
2. Open the project folder in Visual Studio Code.
3. Open the SQLite database using a compatible extension.
4. Execute the queries available in the `main.sql` file.

## Files

* `main.sql`: Script containing the database structure, sample data, and SQL queries.
* `banco.db`: SQLite database used in the project.
* `README.md`: Project documentation.

## Author

Bryan Ramos

Project developed as part of ongoing studies in SQL and data analysis.
