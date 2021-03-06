USE [master]
GO
/****** Object:  Database [ApplyFunctionalPrinciple]    Script Date: 6/16/2020 9:45:29 PM ******/
CREATE DATABASE [ApplyFunctionalPrinciple]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ApplyFunctionalPrinciple', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ApplyFunctionalPrinciple.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ApplyFunctionalPrinciple_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ApplyFunctionalPrinciple_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ApplyFunctionalPrinciple].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET ARITHABORT OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET RECOVERY FULL 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET  MULTI_USER 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ApplyFunctionalPrinciple', N'ON'
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET QUERY_STORE = OFF
GO
USE [ApplyFunctionalPrinciple]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/16/2020 9:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[PrimaryEmail] [nvarchar](256) NOT NULL,
	[SecondaryEmail] [nvarchar](256) NULL,
	[IndustryId] [bigint] NOT NULL,
	[EmailCampaign] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ids]    Script Date: 6/16/2020 9:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ids](
	[EntityName] [nvarchar](100) NOT NULL,
	[NextHigh] [int] NOT NULL,
 CONSTRAINT [PK_Ids] PRIMARY KEY CLUSTERED 
(
	[EntityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Industry]    Script Date: 6/16/2020 9:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Industry](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Industry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Ids] ([EntityName], [NextHigh]) VALUES (N'Customer', 1)
INSERT [dbo].[Ids] ([EntityName], [NextHigh]) VALUES (N'Industry', 0)
GO
INSERT [dbo].[Industry] ([Id], [Name]) VALUES (1, N'Cars')
INSERT [dbo].[Industry] ([Id], [Name]) VALUES (2, N'Pharmacy')
INSERT [dbo].[Industry] ([Id], [Name]) VALUES (3, N'Other')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Customer_Name]    Script Date: 6/16/2020 9:45:29 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Customer_Name] ON [dbo].[Customer]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [ApplyFunctionalPrinciple] SET  READ_WRITE 
GO
