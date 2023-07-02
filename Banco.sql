BEGIN TRANSACTION

--TABELA DE FILMES
CREATE TABLE [dbo].[Gerenciamento_de_filmes] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [Titulo]         VARCHAR (100)  NOT NULL,
    [Descricao]      VARCHAR (5000) NOT NULL,
    [Duracao]        INT            NOT NULL,
    [Imagem]         VARCHAR (100)  NOT NULL,
    [DuracaoMinuto]  INT            NULL,
    [DuracaoSegundo] INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Titulo] ASC)
);


--TABELA DE SALAS
CREATE TABLE [dbo].[Lista_de_salas] (
    [Id]                   INT           IDENTITY (1, 1) NOT NULL,
    [Nome]                 VARCHAR (100) NOT NULL,
    [QuantidadeDeAssentos] INT           NOT NULL,
    [ImagemSala]           VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


--TABELA DE USUARIOS
CREATE TABLE [dbo].[Usuario] (
    [Id]    INT          IDENTITY (1, 1) NOT NULL,
    [Login] VARCHAR (10) NOT NULL,
    [Senha] VARCHAR (5)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Senha] ASC),
    UNIQUE NONCLUSTERED ([Login] ASC)
);

--CADASTRAR USUARIO
Insert into Usuario(Login,Senha)
Values('Mariana', 'Ma123');

--TABELA SESSÕES
CREATE TABLE [dbo].[Gerenciamento_de_sessoes] (
    [Id]                         INT             IDENTITY (1, 1) NOT NULL,
    [Data]                       DATETIME        DEFAULT (getdate()) NOT NULL,
    [Horario_de_inicio]          INT             NULL,
    [Valor_do_ingresso_reais]    DECIMAL (10, 2) NULL,
    [Tipo_de_animacao]           VARCHAR (20)    NOT NULL,
    [Tipo_de_audio]              VARCHAR (20)    NULL,
    [Id_Filme]                   INT             NOT NULL,
    [Id_Sala]                    INT             NOT NULL,
    [Horario_de_inicio_Minuto]   INT             NULL,
    [Horario_de_inicio_Segundo]  INT             NULL,
    [Valor_do_ingresso_centavos] INT             NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([Id_Sala]) REFERENCES [dbo].[Lista_de_salas] ([Id]),
    FOREIGN KEY ([Id_Filme]) REFERENCES [dbo].[Gerenciamento_de_filmes] ([Id])
);

--VIEW
CREATE View VW_Sessao_Filme_Sala
As
select gs.Id IdSessao, gf.Id IdFilme, ls.Id IdSala, gf.Titulo NomeFilme, gf.Descricao DescricaoFilme, gf.Duracao DuracaoFilme,

gf.Imagem ImagemFilme, ls.Nome NomeSala,  ls.QuantidadeDeAssentos QuantidadeDeAssentosSala,

gs.Data DiaFilme, gs.Horario_de_inicio HorarioInicioFilme,  

gs.Tipo_de_animacao TipoAnimacaoFilme, gs.Tipo_de_audio TipoAudio, gs.Valor_do_ingresso_reais Valor,

gs.Horario_de_inicio_Minuto HorarioInicioMinutoSessao, gs.Horario_de_inicio_Segundo HorarioInicioSegundoSessao,

gf.DuracaoMinuto DuracaoMinutoFilme, gf.DuracaoSegundo DuracaoSegundoFilme, 

gs.Valor_do_ingresso_centavos ValorIngressoCentavo, (gs.Horario_de_inicio_Minuto + gf.Duracao) HoraFim

from Gerenciamento_de_sessoes gs inner join Gerenciamento_de_filmes gf 

on gs.Id_Filme=gf.Id inner join Lista_de_salas ls on gs.Id_Sala=ls.Id

insert into Lista_de_salas(Nome,QuantidadeDeAssentos,ImagemSala)Values(‘	Hery Danger	',	225	,’	assentos.ingresso.png	')
insert into Lista_de_salas(Nome,QuantidadeDeAssentos,ImagemSala)Values(‘	Will Smith	',	225	,’	assentos.ingresso.png	')
insert into Lista_de_salas(Nome,QuantidadeDeAssentos,ImagemSala)Values(‘	Ethernos	',	225	,’	assentos.ingresso.png	')
insert into Lista_de_salas(Nome,QuantidadeDeAssentos,ImagemSala)Values(‘	Os vingadores	',	225	,’	assentos.ingresso.png	')
insert into Lista_de_salas(Nome,QuantidadeDeAssentos,ImagemSala)Values(‘	Capitão américa	',	225	,’	assentos.ingresso.png	')
insert into Lista_de_salas(Nome,QuantidadeDeAssentos,ImagemSala)Values(‘	Homem de ferro	',	225	,’	assentos.ingresso.png	')


COMMIT
