USE [master]
GO
/****** Object:  Database [25-Abril]    Script Date: 27/01/2024 21:03:55 ******/
CREATE DATABASE [25-Abril]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'25-Abril', FILENAME = N'c:\users\public\25-Abril.mdf' , SIZE = 10240KB , MAXSIZE = 30720KB , FILEGROWTH = 2048KB )
 LOG ON 
( NAME = N'25-Abril-LOG', FILENAME = N'c:\users\public\25-Abril_log.ldf' , SIZE = 5120KB , MAXSIZE = 20480KB , FILEGROWTH = 1024KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [25-Abril] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [25-Abril].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [25-Abril] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [25-Abril] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [25-Abril] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [25-Abril] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [25-Abril] SET ARITHABORT OFF 
GO
ALTER DATABASE [25-Abril] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [25-Abril] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [25-Abril] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [25-Abril] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [25-Abril] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [25-Abril] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [25-Abril] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [25-Abril] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [25-Abril] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [25-Abril] SET  ENABLE_BROKER 
GO
ALTER DATABASE [25-Abril] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [25-Abril] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [25-Abril] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [25-Abril] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [25-Abril] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [25-Abril] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [25-Abril] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [25-Abril] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [25-Abril] SET  MULTI_USER 
GO
ALTER DATABASE [25-Abril] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [25-Abril] SET DB_CHAINING OFF 
GO
ALTER DATABASE [25-Abril] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [25-Abril] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [25-Abril] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [25-Abril] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [25-Abril] SET QUERY_STORE = ON
GO
ALTER DATABASE [25-Abril] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [25-Abril]
GO
/****** Object:  Table [dbo].[Aluno]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aluno](
	[ID_Aluno] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [varchar](50) NOT NULL,
	[Turma_ID] [int] NOT NULL,
	[Conta_ID] [int] NOT NULL,
 CONSTRAINT [PK_Aluno] PRIMARY KEY CLUSTERED 
(
	[ID_Aluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ano]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ano](
	[ID_Ano] [int] IDENTITY(1,1) NOT NULL,
	[Ano] [int] NOT NULL,
 CONSTRAINT [PK_Ano] PRIMARY KEY CLUSTERED 
(
	[ID_Ano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Arte]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arte](
	[ID_Arte] [int] IDENTITY(1,1) NOT NULL,
	[Nome_Arte] [varchar](50) NOT NULL,
	[Descricao] [varchar](max) NULL,
	[Aceite] [bit] NOT NULL,
	[TipoArte_ID] [int] NOT NULL,
	[Conta_ID] [int] NOT NULL,
	[Caminho] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Arte] PRIMARY KEY CLUSTERED 
(
	[ID_Arte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[ID_Comentario] [int] IDENTITY(1,1) NOT NULL,
	[Comentario] [varchar](max) NOT NULL,
	[Data] [date] NOT NULL,
	[Aceite] [bit] NOT NULL,
	[Conta_ID] [int] NOT NULL,
	[Arte_ID] [int] NOT NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[ID_Comentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conta]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conta](
	[ID_Conta] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Conta] PRIMARY KEY CLUSTERED 
(
	[ID_Conta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gosto]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gosto](
	[ID_Gosto] [int] IDENTITY(1,1) NOT NULL,
	[Conta_ID] [int] NOT NULL,
	[Arte_ID] [int] NOT NULL,
	[Data] [date] NOT NULL,
 CONSTRAINT [PK_Like] PRIMARY KEY CLUSTERED 
(
	[ID_Gosto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo de Arte]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo de Arte](
	[ID_Tipo] [int] IDENTITY(1,1) NOT NULL,
	[Tipo_Arte] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo de Arte] PRIMARY KEY CLUSTERED 
(
	[ID_Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turma]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turma](
	[ID_Turma] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Ano_ID] [int] NOT NULL,
 CONSTRAINT [PK_Turma] PRIMARY KEY CLUSTERED 
(
	[ID_Turma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Arte] ON 

INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (2, N'Ponte 25 de Abril', N'Uma ponte construida para comemorar o 25 de abril', 0, 1, 4, N'/Imagens/Projetos/Ponte25Abril.png')
SET IDENTITY_INSERT [dbo].[Arte] OFF
GO
SET IDENTITY_INSERT [dbo].[Conta] ON 

INSERT [dbo].[Conta] ([ID_Conta], [Nome], [Email], [Password], [Image], [IsAdmin]) VALUES (4, N'Rafael', N'rafael@mail.com', N'1234', N'/Imagens/Users/270720241628-RafaelImage.png', 1)
SET IDENTITY_INSERT [dbo].[Conta] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo de Arte] ON 

INSERT [dbo].[Tipo de Arte] ([ID_Tipo], [Tipo_Arte]) VALUES (2, N'Foto')
SET IDENTITY_INSERT [dbo].[Tipo de Arte] OFF
GO
ALTER TABLE [dbo].[Aluno]  WITH CHECK ADD  CONSTRAINT [FK_Aluno_Conta] FOREIGN KEY([Conta_ID])
REFERENCES [dbo].[Conta] ([ID_Conta])
GO
ALTER TABLE [dbo].[Aluno] CHECK CONSTRAINT [FK_Aluno_Conta]
GO
ALTER TABLE [dbo].[Aluno]  WITH CHECK ADD  CONSTRAINT [FK_Aluno_Turma] FOREIGN KEY([Turma_ID])
REFERENCES [dbo].[Turma] ([ID_Turma])
GO
ALTER TABLE [dbo].[Aluno] CHECK CONSTRAINT [FK_Aluno_Turma]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Arte] FOREIGN KEY([Arte_ID])
REFERENCES [dbo].[Arte] ([ID_Arte])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Arte]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Conta] FOREIGN KEY([Conta_ID])
REFERENCES [dbo].[Conta] ([ID_Conta])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Conta]
GO
ALTER TABLE [dbo].[Gosto]  WITH CHECK ADD  CONSTRAINT [FK_Like_Arte] FOREIGN KEY([Arte_ID])
REFERENCES [dbo].[Arte] ([ID_Arte])
GO
ALTER TABLE [dbo].[Gosto] CHECK CONSTRAINT [FK_Like_Arte]
GO
ALTER TABLE [dbo].[Gosto]  WITH CHECK ADD  CONSTRAINT [FK_Like_Conta] FOREIGN KEY([Conta_ID])
REFERENCES [dbo].[Conta] ([ID_Conta])
GO
ALTER TABLE [dbo].[Gosto] CHECK CONSTRAINT [FK_Like_Conta]
GO
ALTER TABLE [dbo].[Turma]  WITH CHECK ADD  CONSTRAINT [FK_Turma_Ano] FOREIGN KEY([Ano_ID])
REFERENCES [dbo].[Ano] ([ID_Ano])
GO
ALTER TABLE [dbo].[Turma] CHECK CONSTRAINT [FK_Turma_Ano]
GO
/****** Object:  StoredProcedure [dbo].[acptArte]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[acptArte] @nome VARCHAR(50)
AS
IF EXISTS
(
SELECT * FROM Arte
WHERE Nome_Arte = @nome
)
SELECT Aceite 
FROM Arte
WHERE Nome_Arte = @nome 
UPDATE Arte 
SET Aceite = 1
GO
/****** Object:  StoredProcedure [dbo].[addAluno]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addAluno] @conta INT, @turma INT, @numero VARCHAR(50)
AS
IF EXISTS 
(
SELECT * FROM Conta
WHERE ID_Conta = @conta
)
IF EXISTS 
(
SELECT * FROM Turma
WHERE ID_Turma = @turma
)
IF NOT EXISTS
(
SELECT * FROM Aluno
WHERE Conta_ID = @conta
)
IF(
@numero != NULL
)
INSERT INTO Aluno (Conta_ID, Turma_ID, Numero)
VALUES (@conta, @turma, @numero)
GO
/****** Object:  StoredProcedure [dbo].[addAno]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addAno] @ano INT
AS
IF NOT EXISTS
(
SELECT * FROM Ano
WHERE Ano = @ano
)
INSERT INTO Ano (Ano)
VALUES (@ano)
GO
/****** Object:  StoredProcedure [dbo].[addArte]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addArte] @nome VARCHAR(50), @descricao VARCHAR(MAX), @conta INT, @tipo INT, @Caminho VARCHAR(MAX)
AS
IF NOT EXISTS 
(
SELECT * FROM Arte
WHERE Nome_Arte = @nome 
)
IF EXISTS
(
SELECT * FROM Conta, [Tipo de Arte]
WHERE Conta.ID_Conta = @conta
OR [Tipo de Arte].ID_Tipo = @tipo
)
IF(
@nome != NULL AND
@Caminho != NULL
)
INSERT INTO Arte (Nome_Arte, Descricao, Aceite, Conta_ID, TipoArte_ID, Caminho)
VALUES (@nome, @descricao, 0, @conta, @tipo, @Caminho)
GO
/****** Object:  StoredProcedure [dbo].[addComentario]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addComentario] @comentario VARCHAR(MAX), @data DATE, @conta INT, @arte INT
AS
IF EXISTS
(
SELECT * FROM Conta
WHERE ID_Conta = @conta
)
IF EXISTS
(
SELECT * FROM Arte
WHERE ID_Arte = @arte
)
IF NOT
(@comentario = '')
IF NOT EXISTS
(
SELECT * FROM Comentario
WHERE Comentario = @comentario
AND Conta_ID = @conta
AND Arte_ID = @arte
)
INSERT INTO Comentario (Comentario, [Data], Aceite, Conta_ID, Arte_ID)
VALUES (@comentario, @data, 0,@conta, @arte)
GO
/****** Object:  StoredProcedure [dbo].[addConta]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addConta] @nome VARCHAR(50), @email VARCHAR(50), @password VARCHAR(50), @admin BIT
AS
IF NOT EXISTS 
(
SELECT * FROM Conta
WHERE Nome = @nome
OR Email = @email
)
IF 
(
@nome != ''
AND @email != ''
AND @password != ''
)
INSERT INTO Conta (Nome, Email, [Password], IsAdmin, [Image])
VALUES (@nome, @email, @password, @admin, '\Imagens\Users\LoggedUser.png')
GO
/****** Object:  StoredProcedure [dbo].[addGosto]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addGosto] @conta INT, @arte INT, @data DATE
AS
IF EXISTS
(
SELECT * FROM Conta
WHERE ID_Conta = @conta
)
IF EXISTS
(
SELECT * FROM Arte
WHERE ID_Arte = @arte
)
IF NOT EXISTS
(
SELECT * FROM Gosto
WHERE Conta_ID = @conta
AND Arte_ID = @arte
)
INSERT INTO Gosto (Conta_ID, Arte_ID, [Data])
VALUES (@conta, @arte, @data)
GO
/****** Object:  StoredProcedure [dbo].[addTipoArte]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[addTipoArte] @tipo VARCHAR(50)
AS
IF NOT EXISTS (
SELECT * FROM [Tipo de Arte] 
WHERE Tipo_Arte = @tipo)
INSERT INTO [Tipo de Arte] (Tipo_Arte)
VALUES (@tipo);
GO
/****** Object:  StoredProcedure [dbo].[addTurma]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addTurma] @nome VARCHAR(50), @ano INT
AS
IF EXISTS
(
SELECT * FROM Ano
WHERE ID_Ano = @ano
)
IF NOT EXISTS
(
SELECT * FROM Turma
WHERE Nome = @nome
)
INSERT INTO Turma (Nome, Ano_ID)
VALUES (@nome, @ano)
GO
/****** Object:  StoredProcedure [dbo].[delAluno]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[delAluno] @conta INT
AS
IF EXISTS
(
SELECT * FROM Conta
WHERE ID_Conta = @conta
)
IF EXISTS
(
SELECT * FROM Aluno
WHERE Conta_ID = @conta
)
DELETE FROM Aluno
WHERE Conta_ID = @conta
GO
/****** Object:  StoredProcedure [dbo].[delAno]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[delAno] @ano INT
AS
IF EXISTS
(
SELECT * FROM Ano 
WHERE Ano = @ano
)
IF NOT EXISTS
(
SELECT * FROM Turma
WHERE Ano_ID = @ano
)
IF NOT EXISTS
(
SELECT * FROM Turma
WHERE Ano_ID = 
(
SELECT ID_Ano 
FROM Ano 
WHERE Ano = @ano
)
)
DELETE FROM Ano
WHERE Ano = @ano
GO
/****** Object:  StoredProcedure [dbo].[delArte]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[delArte] @nome VARCHAR(50)
AS
IF EXISTS
(
SELECT * FROM Arte 
WHERE Nome_Arte = @nome
)
IF NOT EXISTS
(
SELECT * FROM Comentario
WHERE Arte_ID = 
(
SELECT ID_Arte 
FROM Arte 
WHERE Nome_Arte = @nome
)
)
IF NOT EXISTS
(
SELECT * FROM Gosto
WHERE Arte_ID = 
(
SELECT ID_Arte 
FROM Arte 
WHERE Nome_Arte = @nome
)
)
DELETE FROM Arte
WHERE Nome_Arte = @nome
GO
/****** Object:  StoredProcedure [dbo].[delComentario]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[delComentario] @comentario VARCHAR(MAX), @data DATE, @conta INT, @arte INT
AS
IF EXISTS
(
SELECT * FROM Comentario
WHERE Comentario = @comentario
AND [Data] = @data
AND Conta_ID = @conta
AND Arte_ID = @arte
)
DELETE TOP (1)
FROM Comentario
WHERE Comentario = @comentario
AND [Data] = @data
AND Conta_ID = @conta
AND Arte_ID = @arte
GO
/****** Object:  StoredProcedure [dbo].[delConta]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[delConta] @nome VARCHAR(50)
AS
IF EXISTS 
(
SELECT * FROM CONTA
WHERE Nome = @nome
)
IF NOT EXISTS
(
SELECT * FROM Gosto
WHERE Conta_ID = 
(
SELECT ID_Conta 
FROM Conta 
WHERE Nome = @nome
)
)
IF NOT EXISTS
(
SELECT * FROM Comentario
WHERE Conta_ID = 
(
SELECT ID_Conta 
FROM Conta 
WHERE Nome = @nome
)
)
IF NOT EXISTS
(
SELECT * FROM Arte
WHERE Conta_ID = 
(
SELECT ID_Conta 
FROM Conta 
WHERE Nome = @nome
)
)
IF NOT EXISTS
(
SELECT * FROM Aluno
WHERE Conta_ID = 
(
SELECT ID_Conta 
FROM Conta 
WHERE Nome = @nome
)
)
DELETE FROM Conta
WHERE Nome = @nome
GO
/****** Object:  StoredProcedure [dbo].[delGosto]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[delGosto] @conta INT, @arte INT
AS
IF EXISTS
(
SELECT * FROM Gosto
WHERE Conta_ID = @conta
AND Arte_ID = @arte
)
DELETE FROM Gosto 
WHERE Conta_ID = @conta
AND Arte_ID = @arte
GO
/****** Object:  StoredProcedure [dbo].[delTipoArte]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[delTipoArte] @tipo VARCHAR(50)
AS
IF NOT EXISTS ( 
SELECT * FROM Arte
WHERE TipoArte_ID IN 
(
SELECT ID_Tipo
FROM [Tipo de Arte]
WHERE Tipo_Arte = @tipo
)
)
DELETE FROM [Tipo de Arte]
WHERE Tipo_Arte = @tipo
GO
/****** Object:  StoredProcedure [dbo].[delTurma]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[delTurma] @nome VARCHAR(50)
AS
IF EXISTS
(
SELECT * FROM Turma
WHERE Nome = @nome
)
IF NOT EXISTS
(
SELECT * FROM Aluno
WHERE Turma_ID = 
(
SELECT ID_Turma 
FROM Turma 
WHERE Nome = @nome
)
)
DELETE FROM Turma
WHERE Nome = @nome
GO
/****** Object:  StoredProcedure [dbo].[getAlunos]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getAlunos] @turma VARCHAR(50)
AS
SELECT * FROM Aluno
WHERE Turma_ID = 
(
SELECT ID_Turma 
FROM Turma 
WHERE Nome = @turma
)
GO
/****** Object:  StoredProcedure [dbo].[getArtes]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getArtes] @nome VARCHAR(50)
AS
IF EXISTS
(
SELECT * FROM Conta
WHERE Nome = @nome
)
SELECT * FROM Arte
WHERE Conta_ID = 
(
SELECT ID_Conta
FROM Conta
WHERE Nome = @nome
)
GO
/****** Object:  StoredProcedure [dbo].[getArtesTipo]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getArtesTipo] @tipo VARCHAR(50)
AS
SELECT * FROM Arte
WHERE TipoArte_ID =
(
SELECT ID_Tipo
FROM [Tipo de Arte]
WHERE Tipo_Arte = @tipo
)
GO
/****** Object:  StoredProcedure [dbo].[getComentarios]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getComentarios] @nome VARCHAR(50)
AS
IF EXISTS
(
SELECT * FROM Conta
WHERE Nome = @nome
)
SELECT * FROM Comentario
WHERE Conta_ID = 
(
SELECT ID_Conta
FROM Conta
WHERE Nome = @nome
)
GO
/****** Object:  StoredProcedure [dbo].[getComentariosArte]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getComentariosArte] @nome VARCHAR(50)
AS
SELECT * FROM Comentario
WHERE Arte_ID = 
(
SELECT ID_Arte
FROM Arte
WHERE Nome_Arte = @nome
)
GO
/****** Object:  StoredProcedure [dbo].[getConta]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[getConta] @conta INT
AS
SELECT * FROM Conta 
WHERE ID_Conta = @conta
GO
/****** Object:  StoredProcedure [dbo].[getContaAlunos]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getContaAlunos] @turma VARCHAR(50)
AS
SELECT * FROM Conta
WHERE ID_Conta =
(
SELECT Conta_ID FROM Aluno
WHERE Turma_ID = 
(
SELECT ID_Turma 
FROM Turma 
WHERE Nome = @turma
)
)
GO
/****** Object:  StoredProcedure [dbo].[getGostos]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getGostos] @nome VARCHAR(50)
AS
IF EXISTS
(
SELECT * FROM Conta
WHERE Nome = @nome
)
SELECT * FROM Gosto
WHERE Conta_ID = 
(
SELECT ID_Conta
FROM Conta
WHERE Nome = @nome
)
GO
/****** Object:  StoredProcedure [dbo].[getGostosArte]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getGostosArte] @nome VARCHAR(50)
AS
SELECT * FROM Gosto
WHERE Arte_ID = 
(
SELECT ID_Arte
FROM Arte
WHERE Nome_Arte = @nome
)
GO
/****** Object:  StoredProcedure [dbo].[getOrderComentarios]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getOrderComentarios] @nome VARCHAR(50)
AS
SELECT * FROM Comentario
WHERE Arte_ID =
(
SELECT ID_Arte
FROM Arte
WHERE Nome_Arte = @nome
)
ORDER BY Data
GO
/****** Object:  StoredProcedure [dbo].[getRfvArtes]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getRfvArtes] 
AS
SELECT * FROM Arte
WHERE Aceite = 0
GO
/****** Object:  StoredProcedure [dbo].[getRvfComentarios]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getRvfComentarios] @nome VARCHAR(50)
AS
SELECT * FROM Comentario
WHERE Arte_ID =
(
SELECT ID_Arte
FROM Arte
WHERE Nome_Arte = @nome
)
AND Aceite = 0
GO
/****** Object:  StoredProcedure [dbo].[getTipoArtes]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getTipoArtes]
AS
SELECT Tipo_Arte FROM [Tipo de Arte]
GO
/****** Object:  StoredProcedure [dbo].[getTurmas]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[getTurmas] @ano INT
AS
SELECT * FROM Turma
WHERE Ano_ID =
(
SELECT ID_Ano
FROM Ano
WHERE Ano = @ano
)
GO
/****** Object:  StoredProcedure [dbo].[rfvArte]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[rfvArte] @nome VARCHAR(50)
AS
IF EXISTS
(
SELECT * FROM Arte
WHERE Nome_Arte = @nome
)
SELECT Aceite 
FROM Arte
WHERE Nome_Arte = @nome 
UPDATE Arte 
SET Aceite = 0
GO
/****** Object:  StoredProcedure [dbo].[rmvAdm]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[rmvAdm] @nome VARCHAR(50)
AS
IF EXISTS
(
SELECT * FROM Conta
WHERE Nome = @nome
)
UPDATE Conta
SET IsAdmin = 0
WHERE Nome = @nome
GO
/****** Object:  StoredProcedure [dbo].[stAdm]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[stAdm] @nome VARCHAR(50)
AS
IF EXISTS
(
SELECT * FROM Conta
WHERE Nome = @nome
)
UPDATE Conta
SET IsAdmin = 1
WHERE Nome = @nome
GO
/****** Object:  StoredProcedure [dbo].[updAluno]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updAluno] @conta INT, @NEWconta INT, @turma INT
AS
IF EXISTS
(
SELECT * FROM Conta
WHERE ID_Conta = @conta
AND ID_Conta = @NEWconta
)
IF EXISTS 
(
SELECT * FROM Turma
WHERE ID_Turma = @turma
)
UPDATE Aluno
SET Conta_ID = @NEWconta,
Turma_ID = @turma
GO
/****** Object:  StoredProcedure [dbo].[updAno]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[updAno] @ano INT, @NEWano INT
AS
IF EXISTS
(
SELECT * FROM Ano
WHERE Ano = @ano
)
IF NOT EXISTS
(
SELECT * FROM Ano
WHERE Ano = @NEWano
AND @ano != @NEWano
)
UPDATE Ano
SET Ano = @NEWano
WHERE Ano = @ano
GO
/****** Object:  StoredProcedure [dbo].[updArte]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[updArte] @nome VARCHAR(50), @newNome VARCHAR(50), @descricao VARCHAR(50), @conta INT, @tipo INT
AS
IF EXISTS
(
SELECT * FROM Arte
WHERE Nome_Arte = @nome
)
IF EXISTS
(
SELECT * FROM Conta
WHERE Conta.ID_Conta = @conta
)
IF EXISTS
(
SELECT * FROM [Tipo de Arte]
WHERE ID_Tipo = @tipo
)
UPDATE Arte 
SET Nome_Arte = @newNome,
Descricao = @descricao,
Conta_ID = @conta,
TipoArte_ID = @tipo
GO
/****** Object:  StoredProcedure [dbo].[updComentario]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updComentario] @comentario VARCHAR(MAX), @NEWcomentario VARCHAR(MAX), @data DATE, @conta INT, @arte INT
AS
IF EXISTS
(
SELECT * FROM Comentario
WHERE Comentario = @comentario
AND [Data] = @data
AND Conta_ID = @conta
AND Arte_ID = @arte
)
UPDATE Comentario
SET Comentario = @NEWcomentario
WHERE Comentario = @comentario
GO
/****** Object:  StoredProcedure [dbo].[updConta]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updConta] @nome VARCHAR(50), @newNome VARCHAR(50), @email VARCHAR(50), @password VARCHAR(50)
AS
IF NOT EXISTS 
(
SELECT * 
FROM Conta
WHERE Nome = @newNome
AND @nome != @newNome
)
IF NOT EXISTS
(
SELECT * 
FROM Conta 
WHERE Email = @email
AND @email != 
(
SELECT Email
FROM Conta
WHERE Nome = @nome
)
)
UPDATE Conta
SET Nome = @newNome,
Email = Email,
[Password] = @password
WHERE Nome = @nome
GO
/****** Object:  StoredProcedure [dbo].[updTipoArte]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updTipoArte] @tipo VARCHAR(50), @new VARCHAR(50)
AS
IF EXISTS
(
SELECT * FROM [Tipo de Arte]
WHERE Tipo_Arte = @tipo
)
UPDATE [Tipo de Arte] 
SET Tipo_Arte = @new
GO
/****** Object:  StoredProcedure [dbo].[updTurma]    Script Date: 27/01/2024 21:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updTurma] @nome VARCHAR(50), @NEWnome VARCHAR(50), @ano INT
AS
IF EXISTS
(
SELECT * FROM Turma
WHERE Nome = @nome
)
IF NOT EXISTS
(
SELECT * FROM Turma
WHERE Nome = @NEWnome
AND @nome != @NEWnome
)
IF EXISTS
(
SELECT * FROM Ano 
WHERE ID_Ano = @ano
)
UPDATE Turma 
SET Nome = @NEWnome, 
Ano_ID = @ano
GO
USE [master]
GO
ALTER DATABASE [25-Abril] SET  READ_WRITE 
GO
