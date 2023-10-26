CREATE TABLE Usuarios (
    idUsuarios INT PRIMARY KEY IDENTITY(1,1),
    NomeUsuarios NVARCHAR(255),
    SenhaUsuarios NVARCHAR(255)
);

CREATE TABLE Pessoas (
    idPessoas INT PRIMARY KEY IDENTITY(1,1),
    NomePessoas NVARCHAR(255),
    EndereçoPessoas NVARCHAR(255),
    ContatoPessoas NVARCHAR(20)
);

CREATE TABLE PessoaFisica (
    idPessoasFisicas INT PRIMARY KEY,
    Cpf NVARCHAR(14) UNIQUE,
    FOREIGN KEY (idPessoasFisicas) REFERENCES Pessoas(idPessoas)
);

CREATE TABLE PessoaJuridica (
    idPessoasJuridicas INT PRIMARY KEY,
    Cnpj NVARCHAR(18) UNIQUE,
    FOREIGN KEY (idPessoasJuridicas) REFERENCES Pessoas(idPessoas)
);

CREATE TABLE Produtos (
    idProdutos INT PRIMARY KEY IDENTITY(1,1),
    NomeProdutos NVARCHAR(255),
    QuantidadeProdutos INT,
    PreçoProdutos DECIMAL(10, 2)
);

CREATE TABLE Movimentos (
    idMovimento INT PRIMARY KEY IDENTITY(1,1),
    Movimentacao NVARCHAR(50),
    OperadorID INT,
    ProdutoID INT,
    QuantidadeMovimento INT,
    PreçoMovimento DECIMAL(10, 2),
    FOREIGN KEY (OperadorID) REFERENCES Usuarios(idUsuarios),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(idProdutos)
);

CREATE SEQUENCE PessoaIDSequence
    START WITH 1
    INCREMENT BY 1;