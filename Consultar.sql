
SELECT *
FROM PessoaFisica
JOIN Pessoas ON PessoaFisica.idPessoasFisicas = Pessoas.idPessoas;

SELECT *
FROM PessoaJuridica
JOIN Pessoas ON PessoaJuridica.idPessoasJuridicas = Pessoas.idPessoas;

SELECT M.Movimentacao, P.NomeProdutos AS Produto, U.NomeUsuarios AS Fornecedor, M.QuantidadeMovimento, M.PreçoMovimento AS PreçoUnitário, M.QuantidadeMovimento * M.PreçoMovimento AS ValorTotal
FROM Movimentos M
JOIN Produtos P ON M.ProdutoID = P.idProdutos
JOIN Usuarios U ON M.OperadorID = U.idUsuarios
WHERE M.Movimentacao = 'Entrada';

SELECT M.Movimentacao, P.NomeProdutos AS Produto, U.NomeUsuarios AS Comprador, M.QuantidadeMovimento, M.PreçoMovimento AS PreçoUnitário, M.QuantidadeMovimento * M.PreçoMovimento AS ValorTotal
FROM Movimentos M
JOIN Produtos P ON M.ProdutoID = P.idProdutos
JOIN Usuarios U ON M.OperadorID = U.idUsuarios
WHERE M.Movimentacao = 'Saida';

SELECT P.NomeProdutos AS Produto, SUM(M.QuantidadeMovimento * M.PreçoMovimento) AS ValorTotalEntradas
FROM Movimentos M
JOIN Produtos P ON M.ProdutoID = P.idProdutos
WHERE M.Movimentacao = 'Entrada'
GROUP BY P.NomeProdutos;

SELECT P.NomeProdutos AS Produto, SUM(M.QuantidadeMovimento * M.PreçoMovimento) AS ValorTotalSaidas
FROM Movimentos M
JOIN Produtos P ON M.ProdutoID = P.idProdutos
WHERE M.Movimentacao = 'Saida'
GROUP BY P.NomeProdutos;

SELECT U.NomeUsuarios AS Operador
FROM Usuarios U
LEFT JOIN Movimentos M ON U.idUsuarios = M.OperadorID
WHERE M.idMovimento IS NULL;

SELECT U.NomeUsuarios AS Operador, SUM(M.QuantidadeMovimento * M.PreçoMovimento) AS ValorTotalEntradas
FROM Movimentos M
JOIN Usuarios U ON M.OperadorID = U.idUsuarios
WHERE M.Movimentacao = 'Entrada'
GROUP BY U.NomeUsuarios;

SELECT U.NomeUsuarios AS Operador, SUM(M.QuantidadeMovimento * M.PreçoMovimento) AS ValorTotalSaidas
FROM Movimentos M
JOIN Usuarios U ON M.OperadorID = U.idUsuarios
WHERE M.Movimentacao = 'Saida'
GROUP BY U.NomeUsuarios;

SELECT P.NomeProdutos AS Produto, SUM(M.QuantidadeMovimento * M.PreçoMovimento) / SUM(M.QuantidadeMovimento) AS ValorMedio
FROM Movimentos M
JOIN Produtos P ON M.ProdutoID = P.idProdutos
WHERE M.Movimentacao = 'Saida'
GROUP BY P.NomeProdutos;
