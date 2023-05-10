--   DELIMITER $
--   CREATE PROCEDURE atualizaValorPedido(id int)
--   BEGIN
-- UPDATE `pedidos`
-- SET
--   `valor` = (
--     SELECT
--       SUM(valor * quantidade)
--     FROM
--       itens_pedido
--     WHERE
--       pedido_id = id
--   )
-- WHERE
--   pedido_id = id;
--   END $
-- DELIMITER ;
DROP PROCEDURE IF EXISTS atualizaValorPedido;

CREATE PROCEDURE atualizaValorPedido (id int)
UPDATE `pedidos`
SET
  `valor` = (
    SELECT
      SUM(valor * quantidade)
    FROM
      itens_pedido
    WHERE
      pedido_id = id
  )
WHERE
  pedido_id = id;

CALL atualizaValorPedido (27);

SHOW PROCEDURE STATUS;