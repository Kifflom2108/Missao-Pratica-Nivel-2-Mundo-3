CREATE TABLE PessoasJuridicas (
  idPessoasJuridicas INTEGER  NOT NULL   IDENTITY ,
  Cnpj CHAR(14)      ,
PRIMARY KEY(idPessoasJuridicas));
GO




CREATE TABLE Produtos (
  idProdutos INTEGER  NOT NULL   IDENTITY ,
  NomeProdutos CHAR(20)    ,
  QuantidadeProdutos INTEGER    ,
  PreçoProdutos NUMERIC      ,
PRIMARY KEY(idProdutos));
GO




CREATE TABLE PessoasFisicas (
  idPessoasFisicas INTEGER  NOT NULL   IDENTITY ,
  Cpf CHAR(11)      ,
PRIMARY KEY(idPessoasFisicas));
GO




CREATE TABLE Pessoas (
  idPessoas INTEGER  NOT NULL   IDENTITY ,
  PessoasFisicas_idPessoasFisicas INTEGER  NOT NULL  ,
  PessoasJuridicas_idPessoasJuridicas INTEGER  NOT NULL  ,
  NomePessoas CHAR(20)    ,
  EndereçoPessoas CHAR(20)    ,
  ContatoPessoas CHAR(20)      ,
PRIMARY KEY(idPessoas, PessoasFisicas_idPessoasFisicas, PessoasJuridicas_idPessoasJuridicas)    ,
  FOREIGN KEY(PessoasFisicas_idPessoasFisicas)
    REFERENCES PessoasFisicas(idPessoasFisicas),
  FOREIGN KEY(PessoasJuridicas_idPessoasJuridicas)
    REFERENCES PessoasJuridicas(idPessoasJuridicas));
GO


CREATE INDEX Pessoas_FKIndex1 ON Pessoas (PessoasFisicas_idPessoasFisicas);
GO
CREATE INDEX Pessoas_FKIndex2 ON Pessoas (PessoasJuridicas_idPessoasJuridicas);
GO


CREATE INDEX IFK_Rel_02 ON Pessoas (PessoasFisicas_idPessoasFisicas);
GO
CREATE INDEX IFK_Rel_03 ON Pessoas (PessoasJuridicas_idPessoasJuridicas);
GO


CREATE TABLE Usuarios (
  idUsuarios INTEGER  NOT NULL   IDENTITY ,
  Pessoas_idPessoas INTEGER  NOT NULL  ,
  Pessoas_PessoasFisicas_idPessoasFisicas INTEGER  NOT NULL  ,
  Pessoas_PessoasJuridicas_idPessoasJuridicas INTEGER  NOT NULL  ,
  NomeUsuarios CHAR(15)    ,
  SenhaUsuarios CHAR(15)      ,
PRIMARY KEY(idUsuarios, Pessoas_idPessoas, Pessoas_PessoasFisicas_idPessoasFisicas, Pessoas_PessoasJuridicas_idPessoasJuridicas)  ,
  FOREIGN KEY(Pessoas_idPessoas, Pessoas_PessoasFisicas_idPessoasFisicas, Pessoas_PessoasJuridicas_idPessoasJuridicas)
    REFERENCES Pessoas(idPessoas, PessoasFisicas_idPessoasFisicas, PessoasJuridicas_idPessoasJuridicas));
GO


CREATE INDEX Usuarios_FKIndex1 ON Usuarios (Pessoas_idPessoas, Pessoas_PessoasFisicas_idPessoasFisicas, Pessoas_PessoasJuridicas_idPessoasJuridicas);
GO


CREATE INDEX IFK_Rel_01 ON Usuarios (Pessoas_idPessoas, Pessoas_PessoasFisicas_idPessoasFisicas, Pessoas_PessoasJuridicas_idPessoasJuridicas);
GO


CREATE TABLE Movimento (
  idMovimento INTEGER  NOT NULL   IDENTITY ,
  Produtos_idProdutos INTEGER  NOT NULL  ,
  Pessoas_PessoasJuridicas_idPessoasJuridicas INTEGER  NOT NULL  ,
  Pessoas_PessoasFisicas_idPessoasFisicas INTEGER  NOT NULL  ,
  Pessoas_idPessoas INTEGER  NOT NULL  ,
  TipoMovimento CHAR(10)    ,
  QuantidadeMovimento INTEGER    ,
  PreçoMovimento NUMERIC      ,
PRIMARY KEY(idMovimento, Produtos_idProdutos, Pessoas_PessoasJuridicas_idPessoasJuridicas, Pessoas_PessoasFisicas_idPessoasFisicas, Pessoas_idPessoas)    ,
  FOREIGN KEY(Produtos_idProdutos)
    REFERENCES Produtos(idProdutos),
  FOREIGN KEY(Pessoas_idPessoas, Pessoas_PessoasFisicas_idPessoasFisicas, Pessoas_PessoasJuridicas_idPessoasJuridicas)
    REFERENCES Pessoas(idPessoas, PessoasFisicas_idPessoasFisicas, PessoasJuridicas_idPessoasJuridicas));
GO


CREATE INDEX Movimento_FKIndex1 ON Movimento (Produtos_idProdutos);
GO
CREATE INDEX Movimento_FKIndex2 ON Movimento (Pessoas_idPessoas, Pessoas_PessoasFisicas_idPessoasFisicas, Pessoas_PessoasJuridicas_idPessoasJuridicas);
GO


CREATE INDEX IFK_Movimentacao ON Movimento (Produtos_idProdutos);
GO
CREATE INDEX IFK_Acao ON Movimento (Pessoas_idPessoas, Pessoas_PessoasFisicas_idPessoasFisicas, Pessoas_PessoasJuridicas_idPessoasJuridicas);
GO


