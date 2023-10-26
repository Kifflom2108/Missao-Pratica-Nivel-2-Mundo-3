SET IDENTITY_INSERT Pessoas ON;
INSERT INTO Usuarios (NomeUsuarios, SenhaUsuarios) VALUES
('op1', 'op1'),
('op2', 'op2');

INSERT INTO Produtos (NomeProdutos, QuantidadeProdutos, PreçoProdutos) VALUES
('Xbox 360', 0, 599.99),
('Xbox One', 0, 1299.99),
('Xbox Series S', 0, 1999.99),
('Xbox Series X', 0, 3999.99);

DECLARE @ProximoID INT;
SET @ProximoID = NEXT VALUE FOR PessoaIDSequence;

INSERT INTO Pessoas (idPessoas, NomePessoas, EndereçoPessoas, ContatoPessoas) VALUES
(@ProximoID, 'Phil Spencer', 'One Microsoft Way Redmond, Washington', '800-865-9408');

INSERT INTO PessoaFisica(idPessoasFisicas, Cpf) VALUES
(@ProximoID, '000.000.000-00');

SET @ProximoID = NEXT VALUE FOR PessoaIDSequence;

INSERT INTO Pessoas (idPessoas, NomePessoas, EndereçoPessoas, ContatoPessoas) VALUES
(@ProximoID, 'Microsoft', 'Washington', '327-865-0000');

INSERT INTO PessoaJuridica(idPessoasJuridicas, Cnpj) VALUES
(@ProximoID, '05.734.142/0001-04');

INSERT INTO Movimentos (Movimentacao, OperadorID, ProdutoID, QuantidadeMovimento, PreçoMovimento) VALUES
('Entrada', 1, 1, 20, 499.99),
('Entrada', 1, 2, 5, 1099.99),
('Entrada', 2, 3, 10, 1699.99),
('Entrada', 2, 4, 5, 3399.99),
('Saida', 1, 1, 3, 599.99),
('Saida', 2, 3, 2, 1999.99),
('Saida', 2, 4, 2, 3999.99);