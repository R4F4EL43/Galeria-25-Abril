USE [master]
GO
/****** Object:  Database [25-Abril]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  Table [dbo].[Aluno]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  Table [dbo].[Ano]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  Table [dbo].[Arte]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  Table [dbo].[Comentario]    Script Date: 29/01/2024 23:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[ID_Comentario] [int] IDENTITY(1,1) NOT NULL,
	[ComentarioTexto] [varchar](max) NOT NULL,
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
/****** Object:  Table [dbo].[Conta]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  Table [dbo].[FavArtes]    Script Date: 29/01/2024 23:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavArtes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Arte_ID] [int] NOT NULL,
 CONSTRAINT [PK_FavArtes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gosto]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  Table [dbo].[Tipo de Arte]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  Table [dbo].[Turma]    Script Date: 29/01/2024 23:56:43 ******/
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

INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (2, N'Ponte 25 de Abril', N'Uma ponte construida para comemorar o 25 de abril', 1, 3, 4, N'/Imagens/Projetos/Ponte25Abril.png')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (5, N'Desenho do 25 de Abril', N'Desenho a Lápis de cor para comemoração do 25 de Abril. Em homenagem ao 25 de Abril de 1974.', 1, 3, 4, N'/Imagens/Projetos/Desenho25Abril.jpeg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (7, N'Cravos nas armas do 25 de Abril', N'Desenho intitulado “Não vivi esse dia mas agradeço que ele tenha acontecido.” O 25 de Abril explicado pelas crianças.', 1, 3, 4, N'/Imagens/Projetos/DesenhoInf25Abril.jpeg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (8, N'Desenho com poema do 25 de Abril', N'A propósito da comemoração do 25 de abril, vários alunos do 3.º ciclo e do ensino secundário da Escola B+S Bispo D. Manuel Ferreira Cabral, elaboraram desenhos alusivos à revolução dos cravos, no âmbito da disciplina de &quot;História&quot;.', 1, 3, 4, N'/Imagens/Projetos/Trabalho25Abril.jpeg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (9, N'Caricatura de Celeste Martins Caeiro', N'Celeste Martins Caeiro nasceu na Mouraria a 2 de maio de 1933. Esta mulher que, sem saber que o fazia, definiu a revolução portuguesa que libertou o país da ditadura: a revolução dos cravos.', 1, 3, 4, N'/Imagens/Projetos/Caricatura25Abril.jpeg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (10, N'Desenho de mao com cravo enviado', N'25 de Abril: a nostalgia de um bem perdido (nunca alcançado). Segundo a jornalista Melissa Lopes, Abril é a nostalgia de um bem perdido que nunca foi conquistado na plenitude', 1, 3, 4, N'/Imagens/Projetos/DesenhoMaoCravo.jpeg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (11, N'Desenho de Soldados do 25 de Abril', N'Os portuenses que saíram de casa no dia 25  para trabalhar depressa voltaram para ligar a rádio, rapidamente uma multidão se juntou na Baixa em frente a Câmara e aos jornais. O Comércio do Porto tinha um placard com notícias de última hora à porta, das poucas formas de estar na rua e ter acesso às novidades.', 1, 3, 4, N'/Imagens/Projetos/DesenhoSoldados.jpeg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (12, N'Comemoracao do 25 de Abril', N'Desenho pertencente ao Arquivo Ephemera, proveniente de doação da Associação 25 de Abril, apresentado num concurso para as crianças por ocasião do XV aniversário do 25 de Abril.', 1, 3, 4, N'/Imagens/Projetos/Comemoracao.jpeg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (13, N'Desenho de Liberdade', N'Desenho vencedor do concurso de desenhos alusivos ao 25 de Abril, promovido pela Junta de Freguesia do Samouco', 1, 3, 4, N'/Imagens/Projetos/Liberdade25Abril.jpg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (14, N'Trabalho com mensagens em cravos', N'Trabalho realizado por alunos do Centro Escolar de Lamego Sudeste para comemorar o 25 de Abril de 1974. Arranjo de cravos alusivos à Revolução dos Cravos.', 1, 3, 4, N'/Imagens/Projetos/TrabalhoCravos.jpg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (15, N'Ramo de Cravos', N'Trabalho realizado com material reciclado alusivo à Revolução dos Cravos.', 1, 3, 4, N'/Imagens/Projetos/TrabalhodeCravos.jpeg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (16, N'Cubo com azulejos de Cravos', N'Foi em 2017 que a Junta de Freguesia de Alvalade inaugurou este monumento de homenagem ao 25 de Abril. O monumento, que assinala uma data histórica para o nosso país, é composto por azulejos elaborados por alunos da licenciatura em Artes Visuais, da Universidades Lusófona. Esta obra pode ser vista no Jardim Ruy Jervis D’Athouguia, situado entre a Rua Teixeira de Pascoais e a Rua General Pimenta de Castro', 1, 3, 4, N'/Imagens/Projetos/AzuleijosCravos.jpg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (17, N'Escultura de um cravo em betão', N'Escultura em betão do artista urbano português Vhils. A escultura é alusiva ao 25 de Abril  para comemorar a liberdade e os valores democráticos conquistados pela Revolução de 25 de Abril de 1974. A peça é a homenagem a todos os rostos anónimos que fizeram a revolução e sublinha a importância de manter viva a herança e as conquistas de um momento histórico.', 1, 3, 4, N'/Imagens/Projetos/EsculturaLiberdade.jpeg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (18, N'Menumento a Liberdade', N'MONUMENTO À LIBERDADE – 25 DE ABRIL. Obra de autoria de José Núncio que se encontra na freguesia de Pombal, mandada erigir em homenagem à liberdade conquistada em 25 de Abril de 1974, pela “Revolução dos Cravos”, pondo fim a mais de quarenta anos de ditadura imposta pelo Estado Novo. Composta por uma pirâmide de grande verticalidade revestida a mármore preto, da qual avançam pombas de asas abertas perfiladas sobre uma haste, enquanto ao lado surge destacada a estátua de uma jovem mulher de braços elevados que segura na mão esquerda um ramo de cravos.', 1, 3, 4, N'/Imagens/Projetos/MonumentoLiberdade.jpeg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (19, N'Mural  temático do 25 de Abril', N'Mural "O 25 de Abril nas Escolas". Encontra-se em frente ao Museu Nacional Resistência e Liberdade, em Peniche. O mural é composto por 46 painéis de azulejos, elaborados por professores e alunos de 46 agrupamentos de escolas e escolas não agrupadas de todo o país e que foi, inicialmente, projetado para assinalar os 46 anos do 25 de Abril, em 2020.', 1, 3, 4, N'/Imagens/Projetos/Mural25Abril.jpeg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (20, N'Painel do 25 de Abril', N'Painel comemorativo do 25 de Abril. O painel é composto por azulejos a partir do tema “Cravo de Abril” realizado por alunos da Escola EB 2,3 Dr. João de Barros da Figueira da Foz.', 1, 3, 4, N'/Imagens/Projetos/Painel25Abril.jpg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (21, N'Trabalho de Portugal no 25 de Abril', N'Exposição “Gente de Abril” Comemorações do 25 de Abril na Guarda, inspirada na “Revolução dos Cravos” e relembrando a importância da comemoração do 25 de abril.', 1, 3, 4, N'/Imagens/Projetos/TrabalhoPortugal.jpeg')
INSERT [dbo].[Arte] ([ID_Arte], [Nome_Arte], [Descricao], [Aceite], [TipoArte_ID], [Conta_ID], [Caminho]) VALUES (22, N'Tela do 25 de Abril', N'Tela integrada nas Comemorações do 25 de Abril. Faz parte do desafio intitulado “Telas de Abril – 2019”, que a Junta de Freguesia de Fânzeres e São Pedro da Cova lançou às Escolas e Jardins de Infância, propondo a elaboração da decoração de telas referentes ao 25 Abril.', 1, 3, 4, N'/Imagens/Projetos/Tela25Abril.jpg')
SET IDENTITY_INSERT [dbo].[Arte] OFF
GO
SET IDENTITY_INSERT [dbo].[Comentario] ON 

INSERT [dbo].[Comentario] ([ID_Comentario], [ComentarioTexto], [Data], [Aceite], [Conta_ID], [Arte_ID]) VALUES (1, N'Muito Bom', CAST(N'2020-05-05' AS Date), 1, 4, 2)
INSERT [dbo].[Comentario] ([ID_Comentario], [ComentarioTexto], [Data], [Aceite], [Conta_ID], [Arte_ID]) VALUES (2, N'Bom', CAST(N'2024-01-28' AS Date), 1, -1, 2)
SET IDENTITY_INSERT [dbo].[Comentario] OFF
GO
SET IDENTITY_INSERT [dbo].[Conta] ON 

INSERT [dbo].[Conta] ([ID_Conta], [Nome], [Email], [Password], [Image], [IsAdmin]) VALUES (-1, N'Anonimo', N'', N'', N'/Imagens/Users/Anonimo.png', 0)
INSERT [dbo].[Conta] ([ID_Conta], [Nome], [Email], [Password], [Image], [IsAdmin]) VALUES (4, N'Rafael', N'rafael@mail.com', N'1234', N'/Imagens/Users/270720241628-RafaelImage.png', 1)
SET IDENTITY_INSERT [dbo].[Conta] OFF
GO
SET IDENTITY_INSERT [dbo].[FavArtes] ON 

INSERT [dbo].[FavArtes] ([ID], [Arte_ID]) VALUES (1, 2)
INSERT [dbo].[FavArtes] ([ID], [Arte_ID]) VALUES (2, 7)
SET IDENTITY_INSERT [dbo].[FavArtes] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo de Arte] ON 

INSERT [dbo].[Tipo de Arte] ([ID_Tipo], [Tipo_Arte]) VALUES (2, N'Foto')
INSERT [dbo].[Tipo de Arte] ([ID_Tipo], [Tipo_Arte]) VALUES (3, N'Pintura')
INSERT [dbo].[Tipo de Arte] ([ID_Tipo], [Tipo_Arte]) VALUES (4, N'Escultura')
INSERT [dbo].[Tipo de Arte] ([ID_Tipo], [Tipo_Arte]) VALUES (5, N'Diverso')
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
ALTER TABLE [dbo].[Arte]  WITH CHECK ADD  CONSTRAINT [FK_Arte_Conta] FOREIGN KEY([Conta_ID])
REFERENCES [dbo].[Conta] ([ID_Conta])
GO
ALTER TABLE [dbo].[Arte] CHECK CONSTRAINT [FK_Arte_Conta]
GO
ALTER TABLE [dbo].[Arte]  WITH CHECK ADD  CONSTRAINT [FK_Arte_Tipo de Arte] FOREIGN KEY([TipoArte_ID])
REFERENCES [dbo].[Tipo de Arte] ([ID_Tipo])
GO
ALTER TABLE [dbo].[Arte] CHECK CONSTRAINT [FK_Arte_Tipo de Arte]
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
ALTER TABLE [dbo].[FavArtes]  WITH CHECK ADD  CONSTRAINT [FK_FavArtes_Arte] FOREIGN KEY([Arte_ID])
REFERENCES [dbo].[Arte] ([ID_Arte])
GO
ALTER TABLE [dbo].[FavArtes] CHECK CONSTRAINT [FK_FavArtes_Arte]
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
/****** Object:  StoredProcedure [dbo].[acptArte]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[acptComentario]    Script Date: 29/01/2024 23:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[acptComentario] @id INT
AS
IF EXISTS
(
SELECT * FROM Comentario
WHERE ID_Comentario = @id
)
UPDATE Comentario 
SET Aceite = 1
WHERE ID_Comentario = @id
GO
/****** Object:  StoredProcedure [dbo].[acptPedido]    Script Date: 29/01/2024 23:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[acptPedido] @id INT
AS
IF EXISTS
(
SELECT * FROM PedidosAdmin
WHERE ID_Pedido = @id
)
UPDATE PedidosAdmin
SET Status = 1
WHERE ID_Pedido = @id
GO
/****** Object:  StoredProcedure [dbo].[addAluno]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[addAno]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[addArte]    Script Date: 29/01/2024 23:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addArte] @nome VARCHAR(50), @descricao VARCHAR(MAX), @conta VARCHAR(50), @tipo VARCHAR(50), @Caminho VARCHAR(MAX)
AS
IF NOT EXISTS 
(
SELECT * FROM Arte
WHERE Nome_Arte = @nome 
)
IF EXISTS
(
SELECT * FROM Conta
WHERE ID_Conta = 
(
SELECT ID_Conta FROM Conta 
WHERE Nome = @conta
)
)
IF EXISTS
(
SELECT * FROM [Tipo de Arte]
WHERE ID_Tipo = 
(
SELECT ID_Tipo FROM [Tipo de Arte]
WHERE Tipo_Arte = @tipo
)
)
IF NOT EXISTS
(
SELECT * FROM Arte 
WHERE Caminho = @Caminho
)
IF(
@nome != '' AND
@Caminho != ''
)
INSERT INTO Arte (Nome_Arte, Descricao, Aceite, Conta_ID, TipoArte_ID, Caminho)
VALUES (@nome, @descricao, 0, 
(
SELECT ID_Conta FROM Conta 
WHERE Nome = @conta
), 
(
SELECT ID_Tipo FROM [Tipo de Arte]
WHERE Tipo_Arte = @tipo
)
, @Caminho)
GO
/****** Object:  StoredProcedure [dbo].[addConta]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[addFav]    Script Date: 29/01/2024 23:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addFav] @nome VARCHAR(50)
AS 
IF EXISTS
(
SELECT * FROM Arte
WHERE Nome_Arte = @nome
)
IF NOT EXISTS
(
SELECT * FROM FavArtes
WHERE Arte_ID = 
(
SELECT ID_Arte FROM Arte 
WHERE Nome_Arte = @nome
)
)
INSERT INTO FavArtes(Arte_ID)
VALUES (
(
SELECT ID_Arte FROM Arte 
WHERE Nome_Arte = @nome
)
)
GO
/****** Object:  StoredProcedure [dbo].[addGosto]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[addPedido]    Script Date: 29/01/2024 23:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addPedido] @titulo VARCHAR(50), @imagem VARCHAR(MAX), @conta VARCHAR(50)
AS
IF EXISTS
(
SELECT * FROM Conta
WHERE Nome = @conta
)
IF
(
@titulo != '' AND
@imagem != ''
)
INSERT INTO PedidosAdmin (Titulo, Imagem, Conta_ID, [Status])
VALUES (@titulo, @imagem, 
(
SELECT ID_Conta FROM Conta
WHERE Nome = @conta
), 0)
GO
/****** Object:  StoredProcedure [dbo].[addTipoArte]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[addTurma]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[delAluno]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[delAno]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[delArte]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[delConta]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[delFav]    Script Date: 29/01/2024 23:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[delFav] @nome VARCHAR(50)
AS 
IF EXISTS
(
SELECT * FROM FavArtes
WHERE Arte_ID = 
(
SELECT ID_Arte FROM Arte 
WHERE Nome_Arte = @nome
)
)
DELETE FROM FavArtes
WHERE Arte_ID = 
(
SELECT ID_Arte FROM Arte 
WHERE Nome_Arte = @nome
)
GO
/****** Object:  StoredProcedure [dbo].[delGosto]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[delTipoArte]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[delTurma]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[getAlunos]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[getArtes]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[getArtesTipo]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[getComentarios]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[getComentariosArte]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[getConta]    Script Date: 29/01/2024 23:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[getConta] @conta INT
AS
SELECT * FROM Conta 
WHERE ID_Conta = @conta
GO
/****** Object:  StoredProcedure [dbo].[getContaAlunos]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[getGostos]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[getGostosArte]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[getOrderComentarios]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[getRfvArtes]    Script Date: 29/01/2024 23:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getRfvArtes] 
AS
SELECT * FROM Arte
WHERE Aceite = 0
GO
/****** Object:  StoredProcedure [dbo].[getRvfComentarios]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[getTipoArtes]    Script Date: 29/01/2024 23:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getTipoArtes]
AS
SELECT Tipo_Arte FROM [Tipo de Arte]
GO
/****** Object:  StoredProcedure [dbo].[getTurmas]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[rfvArte]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[rfvComentario]    Script Date: 29/01/2024 23:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[rfvComentario] @id INT
AS
IF EXISTS
(
SELECT * FROM Comentario
WHERE ID_Comentario = @id
)
UPDATE Comentario 
SET Aceite = 0
WHERE ID_Comentario = @id
GO
/****** Object:  StoredProcedure [dbo].[rfvPedido]    Script Date: 29/01/2024 23:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[rfvPedido] @id INT
AS
IF EXISTS
(
SELECT * FROM PedidosAdmin
WHERE ID_Pedido = @id
)
UPDATE PedidosAdmin
SET Status = -1
WHERE ID_Pedido = @id
GO
/****** Object:  StoredProcedure [dbo].[rmvAdm]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[stAdm]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[stImage]    Script Date: 29/01/2024 23:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[stImage] @conta VARCHAR(50), @imagem VARCHAR(MAX)
AS
IF EXISTS
(
SELECT * FROM Conta
WHERE Nome = @conta
)
IF
(
@imagem != ''
)
UPDATE Conta 
SET [Image] = @imagem
WHERE Nome = @conta
GO
/****** Object:  StoredProcedure [dbo].[updAluno]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[updAno]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[updArte]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[updConta]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[updTipoArte]    Script Date: 29/01/2024 23:56:43 ******/
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
/****** Object:  StoredProcedure [dbo].[updTurma]    Script Date: 29/01/2024 23:56:43 ******/
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
