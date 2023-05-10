SELECT
  *
FROM
  clientes
WHERE
  nome LIKE "Sara%";

INSERT INTO
  `pedidos` (
    `pedido_id`,
    `cliente_id`,
    `data`,
    `hora`,
    `valor`
  )
VALUES
  (DEFAULT, 91, CURDATE (), NOW (), NULL);

SELECT
  *
FROM
  pedidos
ORDER BY
  pedido_id DESC
LIMIT
  1;

INSERT INTO
  `itens_pedido` (`pedido_id`, `pizza_id`, `quantidade`, `valor`)
VALUES
  (
    28,
    28,
    2,
    (
      SELECT
        valor
      FROM
        pizzas
      WHERE
        pizza_id = 28
    )
  );

SELECT
  *
FROM
  pedidos
WHERE
  pedido_id = 28;

  