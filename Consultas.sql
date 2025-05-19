-- Distribuição de indivíduos por faixa de escolaridade:

SELECT Escolaridade, COUNT(*) AS Total
FROM socio_economico
GROUP BY Escolaridade
ORDER BY Total DESC;

-- Existe correlação entre escolaridade e renda mensal?

SELECT Escolaridade, Renda_Mensal, COUNT(*) AS Total
FROM socio_economico
GROUP BY Escolaridade, Renda_Mensal
ORDER BY Total desc;

-- Média de idade por ocupação:

SELECT Ocupacao, AVG(Idade) AS Media_Idade
FROM socio_economico
GROUP BY Ocupacao
ORDER BY Media_Idade DESC;

-- Proporção de gêneros por estado civil:

SELECT Estado_Civil, Genero, COUNT(*) AS Total
FROM socio_economico
GROUP BY Estado_Civil, Genero
ORDER BY Estado_Civil, Genero;

-- Cinco cidades com maior número de indivíduos com renda acima de 5 salários mínimos:

SELECT Cidade, COUNT(*) AS Total
FROM socio_economico
WHERE Renda_Mensal IN ('5 a 10 SM', '> 10 SM')
GROUP BY Cidade
ORDER BY Total DESC
LIMIT 5;

-- Estados com maior concentração de indivíduos com nível superior completo:

SELECT Estado, COUNT(*) AS Total
FROM socio_economico
WHERE Escolaridade = 'Superior Completo'
GROUP BY Estado
ORDER BY Total DESC;

-- Ocupação mais comum entre indivíduos com ensino médio completo:

SELECT Ocupacao, COUNT(*) AS Total
FROM socio_economico
WHERE Escolaridade = 'Médio Completo'
GROUP BY Ocupacao
ORDER BY Total DESC
LIMIT 1;

-- Mais indivíduos solteiros ou casados entre os desempregados:

SELECT Estado_Civil, COUNT(*) AS Total
FROM socio_economico
WHERE Ocupacao = 'Desempregado'
GROUP BY Estado_Civil
ORDER BY Total DESC;

-- Média de idade dos aposentados e casados em cada estado:

SELECT Estado, AVG(Idade) AS Media_Idade
FROM socio_economico
WHERE Ocupacao = 'Aposentado' AND Estado_Civil = 'Casado'
GROUP BY Estado
ORDER BY Media_Idade DESC;

-- Perfil médio do “cidadão brasileiro” com base na amostra:
-- O cidadão médio brasileiro nesta amostra é um homem de cerca de 49 anos, com escolaridade superior completa, trabalhando com carteira assinada (CLT) e residindo no estado de Pernambuco (PE).

-- Escolaridade mais comum:
SELECT Escolaridade, COUNT(*) AS Total
FROM socio_economico
GROUP BY Escolaridade
ORDER BY Total DESC
LIMIT 1;

-- Ocupação mais frequente:
SELECT Ocupacao, COUNT(*) AS Total
FROM socio_economico
GROUP BY Ocupacao
ORDER BY Total DESC
LIMIT 1;

-- Estado mais representado:
SELECT Estado, COUNT(*) AS Total
FROM socio_economico
GROUP BY Estado
ORDER BY Total DESC
LIMIT 1;

-- Média de idade geral:
SELECT AVG(Idade) AS Media_Idade
FROM socio_economico;

-- Gênero predominante:
SELECT Genero, COUNT(*) AS Total
FROM socio_economico
GROUP BY Genero
ORDER BY Total DESC
LIMIT 1;