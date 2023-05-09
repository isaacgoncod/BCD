CREATE INDEX i_nome ON clientes (nome);

SELECT
  *
FROM
  clientes
WHERE
  nome LIKE 'ana%';