USE [master]
GO
/****** Object:  Database [NLHDataBase]    Script Date: 2021-07-11 16:01:11 ******/
CREATE DATABASE [NLHDataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LNHDataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LNHDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LNHDataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LNHDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NLHDataBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NLHDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NLHDataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NLHDataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NLHDataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NLHDataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NLHDataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [NLHDataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NLHDataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NLHDataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NLHDataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NLHDataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NLHDataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NLHDataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NLHDataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NLHDataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NLHDataBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NLHDataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NLHDataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NLHDataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NLHDataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NLHDataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NLHDataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NLHDataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NLHDataBase] SET RECOVERY FULL 
GO
ALTER DATABASE [NLHDataBase] SET  MULTI_USER 
GO
ALTER DATABASE [NLHDataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NLHDataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NLHDataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NLHDataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NLHDataBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NLHDataBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NLHDataBase', N'ON'
GO
ALTER DATABASE [NLHDataBase] SET QUERY_STORE = OFF
GO
USE [NLHDataBase]
GO
/****** Object:  Table [dbo].[Admission]    Script Date: 2021-07-11 16:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admission](
	[IDAdmission] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[ChirurgiePrograme] [bit] NULL,
	[DateAdmission] [date] NULL,
	[DateChirurgie] [date] NULL,
	[DateConge] [date] NULL,
	[Televiseur] [bit] NULL,
	[Telephone] [bit] NULL,
	[Nss] [numeric](10, 0) NOT NULL,
	[NumeroLit] [numeric](10, 0) NOT NULL,
	[IDMedecin] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_Admission] PRIMARY KEY CLUSTERED 
(
	[IDAdmission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assurance]    Script Date: 2021-07-11 16:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assurance](
	[IDAssurance] [numeric](10, 0) NOT NULL,
	[NomCompanie] [nvarchar](max) NULL,
 CONSTRAINT [PK_Assurance] PRIMARY KEY CLUSTERED 
(
	[IDAssurance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departement]    Script Date: 2021-07-11 16:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departement](
	[IDDepartement] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[NomDepartement] [nvarchar](max) NULL,
 CONSTRAINT [PK_Departement] PRIMARY KEY CLUSTERED 
(
	[IDDepartement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lit]    Script Date: 2021-07-11 16:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lit](
	[NumeroLit] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[Occupe] [bit] NULL,
	[IDType] [numeric](2, 0) NOT NULL,
	[IDDepartement] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_Lit] PRIMARY KEY CLUSTERED 
(
	[NumeroLit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medecin]    Script Date: 2021-07-11 16:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medecin](
	[IDMedecin] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[NomMedecin] [nvarchar](max) NULL,
	[PrenomMedecin] [nvarchar](max) NULL,
 CONSTRAINT [PK_Medecin] PRIMARY KEY CLUSTERED 
(
	[IDMedecin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 2021-07-11 16:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Nss] [numeric](10, 0) NOT NULL,
	[Nom] [nvarchar](max) NULL,
	[Prenom] [nvarchar](max) NULL,
	[DateNaissance] [date] NULL,
	[Adresse] [nvarchar](max) NULL,
	[Ville] [nvarchar](max) NULL,
	[Province] [nvarchar](max) NULL,
	[CodePostal] [nvarchar](10) NULL,
	[Telephone] [nvarchar](20) NULL,
	[IDAssurance] [numeric](10, 0) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Nss] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeLit]    Script Date: 2021-07-11 16:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeLit](
	[IDType] [numeric](2, 0) IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_TypeLit] PRIMARY KEY CLUSTERED 
(
	[IDType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admission] ON 

INSERT [dbo].[Admission] ([IDAdmission], [ChirurgiePrograme], [DateAdmission], [DateChirurgie], [DateConge], [Televiseur], [Telephone], [Nss], [NumeroLit], [IDMedecin]) VALUES (CAST(1 AS Numeric(10, 0)), 0, CAST(N'2021-07-10' AS Date), NULL, CAST(N'2021-07-11' AS Date), 1, 0, CAST(321654 AS Numeric(10, 0)), CAST(1 AS Numeric(10, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Admission] ([IDAdmission], [ChirurgiePrograme], [DateAdmission], [DateChirurgie], [DateConge], [Televiseur], [Telephone], [Nss], [NumeroLit], [IDMedecin]) VALUES (CAST(2 AS Numeric(10, 0)), 0, CAST(N'2021-07-11' AS Date), NULL, NULL, 1, 1, CAST(222 AS Numeric(10, 0)), CAST(11 AS Numeric(10, 0)), CAST(3 AS Numeric(10, 0)))
SET IDENTITY_INSERT [dbo].[Admission] OFF
GO
INSERT [dbo].[Assurance] ([IDAssurance], [NomCompanie]) VALUES (CAST(1 AS Numeric(10, 0)), N'assu public')
INSERT [dbo].[Assurance] ([IDAssurance], [NomCompanie]) VALUES (CAST(101 AS Numeric(10, 0)), N'croix bleu')
GO
SET IDENTITY_INSERT [dbo].[Departement] ON 

INSERT [dbo].[Departement] ([IDDepartement], [NomDepartement]) VALUES (CAST(1 AS Numeric(10, 0)), N'médecine générale')
INSERT [dbo].[Departement] ([IDDepartement], [NomDepartement]) VALUES (CAST(2 AS Numeric(10, 0)), N'pédiatrie')
INSERT [dbo].[Departement] ([IDDepartement], [NomDepartement]) VALUES (CAST(3 AS Numeric(10, 0)), N'chirurgie')
INSERT [dbo].[Departement] ([IDDepartement], [NomDepartement]) VALUES (CAST(4 AS Numeric(10, 0)), N'Urgence')
SET IDENTITY_INSERT [dbo].[Departement] OFF
GO
SET IDENTITY_INSERT [dbo].[Lit] ON 

INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(1 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(1 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(2 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(1 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(3 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(1 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(4 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(1 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(5 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(1 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(6 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(1 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(7 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(1 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(8 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(1 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(9 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(1 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(10 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(1 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(11 AS Numeric(10, 0)), 1, CAST(1 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(12 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(13 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(14 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(15 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(16 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(17 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(18 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(19 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(20 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(21 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(22 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(24 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(25 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(26 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(27 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(28 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(2 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(29 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(32 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(33 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(34 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(35 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(36 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(1 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(37 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(38 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(39 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(40 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(41 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(42 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(43 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(44 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(45 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(46 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(47 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(48 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(49 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(50 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(51 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(52 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(53 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(54 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(55 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(56 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(3 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(57 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(59 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(60 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(61 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(62 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(63 AS Numeric(10, 0)), 0, CAST(1 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(64 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(65 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(66 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(67 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(68 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(69 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(70 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(71 AS Numeric(10, 0)), 0, CAST(2 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(72 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(73 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(74 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(75 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(76 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(77 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(78 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(79 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
INSERT [dbo].[Lit] ([NumeroLit], [Occupe], [IDType], [IDDepartement]) VALUES (CAST(80 AS Numeric(10, 0)), 0, CAST(3 AS Numeric(2, 0)), CAST(4 AS Numeric(10, 0)))
SET IDENTITY_INSERT [dbo].[Lit] OFF
GO
SET IDENTITY_INSERT [dbo].[Medecin] ON 

INSERT [dbo].[Medecin] ([IDMedecin], [NomMedecin], [PrenomMedecin]) VALUES (CAST(1 AS Numeric(10, 0)), N'silvain', N'trapnard')
INSERT [dbo].[Medecin] ([IDMedecin], [NomMedecin], [PrenomMedecin]) VALUES (CAST(2 AS Numeric(10, 0)), N'farid', N'ferragui')
INSERT [dbo].[Medecin] ([IDMedecin], [NomMedecin], [PrenomMedecin]) VALUES (CAST(3 AS Numeric(10, 0)), N'anais', N'morisette')
INSERT [dbo].[Medecin] ([IDMedecin], [NomMedecin], [PrenomMedecin]) VALUES (CAST(4 AS Numeric(10, 0)), N'martin', N'pasquet')
INSERT [dbo].[Medecin] ([IDMedecin], [NomMedecin], [PrenomMedecin]) VALUES (CAST(5 AS Numeric(10, 0)), N'jackie', N'chan')
INSERT [dbo].[Medecin] ([IDMedecin], [NomMedecin], [PrenomMedecin]) VALUES (CAST(6 AS Numeric(10, 0)), N'stalone', N'silvester')
SET IDENTITY_INSERT [dbo].[Medecin] OFF
GO
INSERT [dbo].[Patient] ([Nss], [Nom], [Prenom], [DateNaissance], [Adresse], [Ville], [Province], [CodePostal], [Telephone], [IDAssurance]) VALUES (CAST(111 AS Numeric(10, 0)), N'louis', N'lecompte', CAST(N'2021-07-14' AS Date), N'32 rue de brouillare', N'sainte anne des près', N'Toronto', N'3J5H9E', N'2587', CAST(1 AS Numeric(10, 0)))
INSERT [dbo].[Patient] ([Nss], [Nom], [Prenom], [DateNaissance], [Adresse], [Ville], [Province], [CodePostal], [Telephone], [IDAssurance]) VALUES (CAST(222 AS Numeric(10, 0)), N'ergrerg', N'ergerg', CAST(N'2021-07-15' AS Date), N'charle', N'laval', N'qc', N'3g6t5h', N'4353', CAST(1 AS Numeric(10, 0)))
INSERT [dbo].[Patient] ([Nss], [Nom], [Prenom], [DateNaissance], [Adresse], [Ville], [Province], [CodePostal], [Telephone], [IDAssurance]) VALUES (CAST(333 AS Numeric(10, 0)), N'salvador', N'fouentes', CAST(N'2021-06-16' AS Date), N'rue alpre', N'laval', N'qc', N'9d5t6r', N'6587', CAST(101 AS Numeric(10, 0)))
INSERT [dbo].[Patient] ([Nss], [Nom], [Prenom], [DateNaissance], [Adresse], [Ville], [Province], [CodePostal], [Telephone], [IDAssurance]) VALUES (CAST(444 AS Numeric(10, 0)), N'said', N'moh', CAST(N'2021-04-14' AS Date), N'rue alpes', N'laval', N'Qc', N'8g2f7m', N'4587', CAST(1 AS Numeric(10, 0)))
INSERT [dbo].[Patient] ([Nss], [Nom], [Prenom], [DateNaissance], [Adresse], [Ville], [Province], [CodePostal], [Telephone], [IDAssurance]) VALUES (CAST(555 AS Numeric(10, 0)), N'sarah', N'louane', CAST(N'2021-05-06' AS Date), N'rue esperance', N'montreal', N'qc', N'6j8u5g', N'9245', CAST(101 AS Numeric(10, 0)))
INSERT [dbo].[Patient] ([Nss], [Nom], [Prenom], [DateNaissance], [Adresse], [Ville], [Province], [CodePostal], [Telephone], [IDAssurance]) VALUES (CAST(321654 AS Numeric(10, 0)), N'filipe', N'totti', CAST(N'1985-05-05' AS Date), N'32 rue albert camus', N'montréal', N'qc', N'5k6l2l', N'6847', CAST(101 AS Numeric(10, 0)))
GO
SET IDENTITY_INSERT [dbo].[TypeLit] ON 

INSERT [dbo].[TypeLit] ([IDType], [Description]) VALUES (CAST(1 AS Numeric(2, 0)), N'standard')
INSERT [dbo].[TypeLit] ([IDType], [Description]) VALUES (CAST(2 AS Numeric(2, 0)), N'semi-privée')
INSERT [dbo].[TypeLit] ([IDType], [Description]) VALUES (CAST(3 AS Numeric(2, 0)), N'privée')
SET IDENTITY_INSERT [dbo].[TypeLit] OFF
GO
ALTER TABLE [dbo].[Admission]  WITH CHECK ADD  CONSTRAINT [FK_Admission_Lit] FOREIGN KEY([NumeroLit])
REFERENCES [dbo].[Lit] ([NumeroLit])
GO
ALTER TABLE [dbo].[Admission] CHECK CONSTRAINT [FK_Admission_Lit]
GO
ALTER TABLE [dbo].[Admission]  WITH CHECK ADD  CONSTRAINT [FK_Admission_Medecin] FOREIGN KEY([IDMedecin])
REFERENCES [dbo].[Medecin] ([IDMedecin])
GO
ALTER TABLE [dbo].[Admission] CHECK CONSTRAINT [FK_Admission_Medecin]
GO
ALTER TABLE [dbo].[Admission]  WITH CHECK ADD  CONSTRAINT [FK_Admission_Patient] FOREIGN KEY([Nss])
REFERENCES [dbo].[Patient] ([Nss])
GO
ALTER TABLE [dbo].[Admission] CHECK CONSTRAINT [FK_Admission_Patient]
GO
ALTER TABLE [dbo].[Lit]  WITH CHECK ADD  CONSTRAINT [FK_Lit_Departement] FOREIGN KEY([IDDepartement])
REFERENCES [dbo].[Departement] ([IDDepartement])
GO
ALTER TABLE [dbo].[Lit] CHECK CONSTRAINT [FK_Lit_Departement]
GO
ALTER TABLE [dbo].[Lit]  WITH CHECK ADD  CONSTRAINT [FK_Lit_TypeLit] FOREIGN KEY([IDType])
REFERENCES [dbo].[TypeLit] ([IDType])
GO
ALTER TABLE [dbo].[Lit] CHECK CONSTRAINT [FK_Lit_TypeLit]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Assurance] FOREIGN KEY([IDAssurance])
REFERENCES [dbo].[Assurance] ([IDAssurance])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Assurance]
GO
USE [master]
GO
ALTER DATABASE [NLHDataBase] SET  READ_WRITE 
GO
