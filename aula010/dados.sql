INSERT INTO
  cliente (cpf, nome, rua, bairro, cidade, uf)
VALUES
  (
    '211.983.664-78',
    'Sara Oliveira',
    'Av. 7 de setembro',
    'Jardim Brasil',
    'Nova Odessa',
    'SP'
  ),
  (
    '258.537.606-02',
    'Queila Martins',
    'Av. Brasil',
    'Parque das Flores',
    'Amparo',
    'SP'
  ),
  (
    '726.222.683-51',
    'Marcos Silva Oliveira',
    'Praça dos Trabalhadores',
    'Jardim São Paulo',
    'Nova Odessa',
    'SP'
  ),
  (
    '226.213.963-64',
    'Evandro Silva',
    'Rua das Flores',
    'Jardim São Paulo',
    'Americana',
    'SP'
  ),
  (
    '661.025.829-50',
    'Yago Custódio',
    'Rua das Flores',
    'Parque das Flores',
    'Campinas',
    'SP'
  ),
  (
    '609.983.828-76',
    'Naiara Silva',
    'Rua do açúcar',
    'Parque das Flores',
    'Nova Odessa',
    'SP'
  ),
  (
    '487.140.614-81',
    'Tatiane Martim',
    'Rua das Flores',
    'Centro',
    'Campinas',
    'SP'
  ),
  (
    '228.160.778-02',
    'Quevin de Souza',
    'Av. 7 de setembro',
    'Jardim Brasil',
    'Americana',
    'SP'
  ),
  (
    '908.554.137-94',
    'Luciana Neto',
    'Av. Paulista',
    'Parque das Flores',
    'Nova Odessa',
    'SP'
  ),
  (
    '735.003.345-12',
    'Ursula Oliveira Custódio',
    'Rua Valter Souza',
    'Parque das Flores',
    'Amparo',
    'SP'
  );

INSERT INTO
  telefone (cliente_cpf, numero)
VALUES
  ('211.983.664-78', '19-33927-9183'),
  ('211.983.664-78', '19-58286-2572'),
  ('258.537.606-02', '19-75396-3952'),
  ('726.222.683-51', '19-11094-1727'),
  ('726.222.683-51', '19-94708-8669'),
  ('226.213.963-64', '19-78957-3905'),
  ('661.025.829-50', '19-90518-3260'),
  ('661.025.829-50', '19-72952-5097'),
  ('609.983.828-76', '19-21480-2555'),
  ('487.140.614-81', '19-83868-2612'),
  ('487.140.614-81', '19-60828-4295'),
  ('228.160.778-02', '19-20124-3304'),
  ('908.554.137-94', '19-27082-0233'),
  ('735.003.345-12', '19-33266-8531');

INSERT INTO
  veiculo (placa, modelo, marca, ano)
VALUES
  ('DEA-7981', 'Uno', 'Fiat', 2005),
  ('CBC-4945', 'Fiorino', 'Fiat', 2007),
  ('BEE-7735', 'Saveiro', 'VW', 2015),
  ('CBA-4403', 'Sandeiro', 'Renaut', 2012),
  ('BBC-8504', 'Palio', 'Fiat', 2004),
  ('BEB-5885', 'Gol', 'VW', 2013),
  ('EDB-2475', 'Ranger', 'Ford', 2005);

INSERT INTO
  aluguel
VALUES
  (
    1,
    80,
    '2022-03-17',
    '2022-03-24',
    560,
    'OK',
    '211.983.664-78',
    'DEA-7981'
  ),
  (
    2,
    120,
    '2022-04-02',
    '2022-04-10',
    960,
    'OK',
    '258.537.606-02',
    'CBC-4945'
  ),
  (
    3,
    110,
    '2022-04-18',
    '2022-04-25',
    770,
    'OK',
    '726.222.683-51',
    'BEE-7735'
  ),
  (
    4,
    100,
    '2022-05-04',
    '2022-05-14',
    1000,
    'OK',
    '226.213.963-64',
    'CBA-4403'
  ),
  (
    5,
    90,
    '2022-05-20',
    '2022-05-27',
    630,
    'OK',
    '661.025.829-50',
    'BBC-8504'
  ),
  (
    6,
    90,
    '2022-06-05',
    '2022-06-14',
    910,
    'Retrovisor direito quebrado',
    '609.983.828-76',
    'BEB-5885'
  ),
  (
    7,
    150,
    '2022-06-25',
    '2022-06-30',
    750,
    'OK',
    '487.140.614-81',
    'EDB-2475'
  ),
  (
    8,
    120,
    '2022-07-15',
    '2022-07-22',
    840,
    'OK',
    '609.983.828-76',
    'CBC-4945'
  ),
  (
    9,
    150,
    '2022-08-04',
    '2022-08-08',
    600,
    'OK',
    '211.983.664-78',
    'EDB-2475'
  ),
  (
    10,
    80,
    '2022-08-24',
    '2022-08-30',
    580,
    'Sem estepe',
    '211.983.664-78',
    'DEA-7981'
  ),
  (
    11,
    100,
    '2022-09-13',
    '2022-09-20',
    700,
    'OK',
    '487.140.614-81',
    'CBA-4403'
  ),
  (
    12,
    90,
    '2022-09-16',
    '2022-09-24',
    720,
    'OK',
    '258.537.606-02',
    'BBC-8504'
  ),
  (
    13,
    110,
    '2022-09-19',
    '2022-09-24',
    550,
    'OK',
    '228.160.778-02',
    'BEE-7735'
  ),
  (
    14,
    90,
    '2022-09-22',
    '2022-09-27',
    550,
    'Bancos sujos',
    '908.554.137-94',
    'BEB-5885'
  );

SELECT
  *
FROM
  cliente;

SELECT
  *
FROM
  telefone;

SELECT
  *
FROM
  veiculo;

SELECT
  *
FROM
  aluguel;