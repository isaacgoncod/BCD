INSERT INTO
  `pedidos` (
    `pedido_id`,
    `cliente_id`,
    `data`,
    `hora`,
    `valor`
  )
VALUES
  (98, CURDATE (), NOW (), null);

UPDATE `pedidos`
SET
  `valor` = (
    SELECT
      SUM(valor * quantidade)
    FROM
      itens_pedido
    WHERE
      pedido_id = 27
  )
WHERE
  pedido_id = 27;

UPDATE `pedidos`
SET
  `valor` = null
WHERE
  pedido_id = 27;

INSERT INTO
  `itens_pedido` (`pedido_id`, `pizza_id`, `quantidade`, `valor`)
VALUES
  (27, 5, 1, 32.29);

INSERT INTO
  `itens_pedido` (`pedido_id`, `pizza_id`, `quantidade`, `valor`)
VALUES
  (27, 28, 2, 33.41);

SELECT
  *
FROM
  pedidos
ORDER BY
  pedido_id DESC
LIMIT
  1;

SELECT
  SUM(valor * quantidade)
FROM
  itens_pedido
WHERE
  pedido_id = 27;