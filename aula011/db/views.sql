--Quantos Clientes cadastrados
SELECT
  COUNT(*) as Total_Registros_Clientes
FROM
  pizzaria.clientes;

--Quantas pizzas Cadastradas
SELECT
  COUNT(*) as Total_Registros_Pizzas
FROM
  pizzaria.pizzas;

--Quantas pizzas o pedido nº 3 possui
SELECT
  SUM(quantidade) as qtd_pizza_pedido
FROM
  pizzaria.itens_pedido
WHERE
  pedido_id = 3;

--Qual nome do cliente que fez o pedido nº 3
SELECT
  c.nome AS nome_cliente
FROM
  pizzaria.pedidos p
  INNER JOIN pizzaria.clientes c ON p.cliente_id = c.Cliente_id
WHERE
  p.pedido_id = 3;

--Quais os nomes das pizzas do pedido nº 3
SELECT
  piz.nome AS nome_pizza
FROM
  pizzaria.itens_pedido ped
  INNER JOIN pizzaria.pizzas piz ON ped.pizza_id = piz.pizza_id
WHERE
  ped.pedido_id = 3;

SELECT
  p.*,
  i.*,
  c.nome,
  piz.nome
FROM
  pedidos p,
  itens_pedido i
  INNER JOIN clientes c ON p.cliente_id = c.Cliente_id
  INNER JOIN pizzas piz ON i.pizza_id = piz.pizza_id;