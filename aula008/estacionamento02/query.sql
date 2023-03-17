-- 1. Crie uma query que mostre todos os dados da tabela de estacionamentos e uma coluna que calcule o tempo_total em horas
-- Salve o resultado desta consulta como um relatório/view chamado vw_estacionamento
CREATE VIEW
  vw_estacionamento AS
SELECT
  *,
  TIMESTAMPDIFF (HOUR, entrada, COALESCE(saida, NOW ())) AS tempo_total
FROM
  estacionamento;

SELECT
  *
FROM
  vw_estacionamento;

-- 2. crie uma query altere o campo 'saída' do estacionamento id=168 para "2022-03-08 18:00:00"
UPDATE estacionamento
SET
  saida = "2022-03-08 18:00:00"
WHERE
  id = 168;

-- 3. crie uma query altere o campo 'valor' conforme a seguinte regra de negócio
-- (Primeira hora = valor da vaga + 3.00 reais por hora adicional)
UPDATE estacionamento
SET
  valor = CASE
    WHEN TIMESTAMPDIFF (HOUR, entrada, saida) <= 1
    AND EXISTS (
      SELECT
        1
      FROM
        vaga
      WHERE
        id = estacionamento.id_vaga
        AND tipo = 'Moto'
    ) THEN 5
    WHEN TIMESTAMPDIFF (HOUR, entrada, saida) <= 1
    AND EXISTS (
      SELECT
        1
      FROM
        vaga
      WHERE
        id = estacionamento.id_vaga
        AND tipo = 'Carro'
    ) THEN 10
    WHEN TIMESTAMPDIFF (HOUR, entrada, saida) > 1
    AND EXISTS (
      SELECT
        1
      FROM
        vaga
      WHERE
        id = estacionamento.id_vaga
        AND tipo = 'Moto'
    ) THEN 5 + ((TIMESTAMPDIFF (HOUR, entrada, saida)) * 3)
    WHEN TIMESTAMPDIFF (HOUR, entrada, saida) > 1
    AND EXISTS (
      SELECT
        1
      FROM
        vaga
      WHERE
        id = estacionamento.id_vaga
        AND tipo = 'Carro'
    ) THEN 10 + ((TIMESTAMPDIFF (HOUR, entrada, saida)) * 3)
  END;

-- 4. Crie uma query que mostre todos os dados da view vw_estacionamento em ordem de saída decrescente
-- também acrescente as colunas nome do cliente, modelo e cor do veículo e tipo da vaga
-- Salve esta consulta como vw_estacionamento_full
CREATE VIEW
  vw_estacionamento_full AS
SELECT
  e.*,
  c.nome,
  v.modelo,
  v.cor,
  va.tipo
FROM
  vw_estacionamento e
  LEFT JOIN cliente c ON e.cpf = c.cpf
  LEFT JOIN veiculo v ON e.placa = v.placa
  LEFT JOIN vaga va ON e.id_vaga = va.id
ORDER BY
  e.saida DESC;

SELECT
  *
FROM
  vw_estacionamento_full;