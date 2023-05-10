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
  INNER JOIN pizzaria.clientes c ON p.cliente_id = c.cliente_id
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

-- Acrescente uma coluna chamada subtotal que seja o calculo do preco unitário da pizza vezes a quantidade
DROP VIEW IF EXISTS vw_pedidos_full;

CREATE VIEW
  vw_pedidos_full AS
SELECT
  p.*,
  i.pizza_id,
  i.quantidade,
  i.valor AS preco,
  i.valor * i.quantidade AS subtotal,
  c.nome,
  pi.nome AS pizza
FROM
  pedidos p
  INNER JOIN itens_pedido i ON p.pedido_id = i.pedido_id
  LEFT JOIN clientes c ON p.cliente_id = c.cliente_id
  LEFT JOIN pizzas pi ON i.pizza_id = pi.pizza_id;

-- Para ver o resultado
SELECT
  *
FROM
  vw_pedidos_full;

-- Agrupe os pedidos e calcule o valor total
SELECT
  *,
  SUM(subtotal) as Total
FROM
  vw_pedidos_full
GROUP BY
  pedido_id;

SELECT
  pedido_id,
  cliente_id,
  data,
  hora,
  valor,
  nome,
  SUM(quantidade) as total_pizzas
FROM
  vw_pedidos_full
GROUP BY
  pedido_id;