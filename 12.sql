USE [master]
GO
/****** Object:  Database [Store]    Script Date: 02.01.2023 3:47:09 ******/
CREATE DATABASE [Store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Store', FILENAME = N'C:\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\Store2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Store_log', FILENAME = N'C:\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\Store2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Store] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Store] SET ARITHABORT OFF 
GO
ALTER DATABASE [Store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Store] SET RECOVERY FULL 
GO
ALTER DATABASE [Store] SET  MULTI_USER 
GO
ALTER DATABASE [Store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Store] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Store', N'ON'
GO
ALTER DATABASE [Store] SET QUERY_STORE = OFF
GO
USE [Store]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 02.01.2023 3:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](50) NULL,
	[id_city] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 02.01.2023 3:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 02.01.2023 3:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[id_region] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 02.01.2023 3:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 02.01.2023 3:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[id_supplier] [int] NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_delivery] [date] NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markup]    Script Date: 02.01.2023 3:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[percents] [int] NULL,
 CONSTRAINT [PK_Markup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurment]    Script Date: 02.01.2023 3:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Measurment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 02.01.2023 3:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_address] [int] NOT NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 02.01.2023 3:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[id_category] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[id_producer] [int] NULL,
	[id_measurement] [int] NULL,
	[id_markup] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 02.01.2023 3:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_country] [int] NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 02.01.2023 3:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_sale] [date] NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 02.01.2023 3:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (1, N'8 Марта переулок', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (2, N'Марсельская улица', 2)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (3, N'Крымский переулок', 3)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (4, N'Чапаевсий переулок', 4)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (5, N'Благоева улица', 5)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (6, N'Вознесенский переулок', 6)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (7, N'Георгия Гамова сквер', 7)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (8, N'Богадельная улица', 8)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (9, N'Богатова улица', 9)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (10, N'Головковская улица', 10)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (11, N'Грина улица', 11)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (12, N'Дальницкое шоссе
', 12)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (13, N'Достоевского переулок', 13)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (14, N'Евангелическая улица', 14)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (15, N'Ёлочная улица', 15)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Выпечка')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Молоко')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Мясо')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Сладости')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Овощи')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Фрукты')
INSERT [dbo].[Category] ([id], [name]) VALUES (7, N'Специи')
INSERT [dbo].[Category] ([id], [name]) VALUES (8, N'Ягоды')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (1, N'Одесса', 1)
INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (2, N'Беляевка', 2)
INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (3, N'	Кривой Рог', 3)
INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (4, N'Лохвица', 4)
INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (5, N'Мена', 5)
INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (6, N'Нью Йорк', 6)
INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (7, N'Вашингтон', 7)
INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (8, N'с.Бухаловка(Полтавщина)', 8)
INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (9, N'	Счастье', 9)
INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (10, N'Токмак', 10)
INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (11, N'Украинка', 11)
INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (12, N'Умань', 12)
INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (13, N'Вильнюс', 13)
INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (14, N'Варшава', 14)
INSERT [dbo].[City] ([id], [title], [id_region]) VALUES (15, N'Паланга', 15)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id], [title]) VALUES (1, N'Украина')
INSERT [dbo].[Country] ([id], [title]) VALUES (2, N'США')
INSERT [dbo].[Country] ([id], [title]) VALUES (3, N'Канада')
INSERT [dbo].[Country] ([id], [title]) VALUES (4, N'Молдова')
INSERT [dbo].[Country] ([id], [title]) VALUES (5, N'Литва')
INSERT [dbo].[Country] ([id], [title]) VALUES (6, N'Эстония')
INSERT [dbo].[Country] ([id], [title]) VALUES (7, N'Латвия')
INSERT [dbo].[Country] ([id], [title]) VALUES (8, N'Словакия')
INSERT [dbo].[Country] ([id], [title]) VALUES (9, N'Германия')
INSERT [dbo].[Country] ([id], [title]) VALUES (10, N'Польша')
INSERT [dbo].[Country] ([id], [title]) VALUES (11, N'Япония')
INSERT [dbo].[Country] ([id], [title]) VALUES (12, N'Китай')
INSERT [dbo].[Country] ([id], [title]) VALUES (13, N'Греция')
INSERT [dbo].[Country] ([id], [title]) VALUES (14, N'Нигерия')
INSERT [dbo].[Country] ([id], [title]) VALUES (15, N'Испания')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (1, 1, 1, 100, 19, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (2, 2, 2, 200, 45, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (3, 3, 3, 280, 34, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (4, 4, 4, 320, 133, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (5, 5, 5, 120, 35, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (6, 6, 6, 130, 3253, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (7, 7, 7, 250, 453, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (8, 8, 8, 300, 543, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (9, 9, 9, 400, 64, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (10, 10, 10, 100, 34, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (11, 11, 11, 228, 64332, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (12, 12, 12, 42, 4535, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (13, 13, 13, 29, 535, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (14, 14, 14, 15, 3545, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (15, 15, 15, 17, 5435, NULL)
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Markup] ON 

INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (1, N'50', 10)
INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (2, N'35', 15)
INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (3, N'21', 20)
INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (4, N'33', 25)
INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (5, N'34', 30)
INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (6, N'43', 35)
INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (7, N'49', 40)
INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (8, N'30', 45)
INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (9, N'50', 50)
INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (10, N'35', 55)
INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (11, N'25', 60)
INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (12, N'33', 65)
INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (13, N'64', 70)
INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (14, N'21', 75)
INSERT [dbo].[Markup] ([id], [name], [percents]) VALUES (15, N'20', 100)
SET IDENTITY_INSERT [dbo].[Markup] OFF
GO
SET IDENTITY_INSERT [dbo].[Measurment] ON 

INSERT [dbo].[Measurment] ([id], [title], [description]) VALUES (1, N'Кг', N'1000г')
INSERT [dbo].[Measurment] ([id], [title], [description]) VALUES (2, N'Head', N'Cured and protected by a rind block of cheese')
INSERT [dbo].[Measurment] ([id], [title], [description]) VALUES (3, N'Dozen', N'Ten pieces of stuff')
INSERT [dbo].[Measurment] ([id], [title], [description]) VALUES (4, N'Pack', N'250 gram')
INSERT [dbo].[Measurment] ([id], [title], [description]) VALUES (5, N'Kilogram', N'1000 gram')
INSERT [dbo].[Measurment] ([id], [title], [description]) VALUES (6, N'Bar', N'100 gram')
INSERT [dbo].[Measurment] ([id], [title], [description]) VALUES (7, N'Piece', N'Part of a whole')
INSERT [dbo].[Measurment] ([id], [title], [description]) VALUES (8, N'Can', N'Canned something')
SET IDENTITY_INSERT [dbo].[Measurment] OFF
GO
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (1, N'Bud', 1)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (2, N'RedBull', 2)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (3, N'CocaCola', 3)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (4, N'Наша ряба', 4)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (5, N'80085', 5)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (6, N'Бх', 6)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (7, N'Bmw', 7)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (8, N'Mersedes', 8)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (9, N'Toots', 9)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (10, N'5g', 10)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (11, N'TotalsA', 11)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (12, N'Danone', 12)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (13, N'BananaTeam', 13)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (14, N'JBL', 14)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (15, N'Боржоми', 15)
SET IDENTITY_INSERT [dbo].[Producer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (1, N'Хлуб', 1, 20, 100, 1, 1, 1)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (2, N'Сыр', 2, 60, 20, 2, 2, 8)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (3, N'Масло', 3, 80.5, 10, 3, 3, 8)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (4, N'Молоко', 2, 55, 50, 2, 4, 2)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (5, N'Яблоки', 2, 30.7, 70, 2, 4, 7)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (6, N'Яйца', 4, 45, 100, 8, 3, 7)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (7, N'Соль', 5, 75, 25, 4, 5, 6)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (8, N'Сахар', 7, 155.5, 100, 4, 6, 5)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (9, N'Шоколад', 3, 65, 200, 3, 5, 1)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (10, N'Мясо', 5, 50, 30, 4, 5, 2)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (11, N'Спаржа', 5, 35.5, 30, 4, 3, 5)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (12, N'Куриные ножки', 3, 40, 50, 3, 5, 1)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (13, N'Свинные крылышки', 3, 35, 50, 3, 5, 1)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (14, N'Бычи хвосты', 3, 150, 20, 3, 7, 4)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (15, N'Помидоры', 5, 67, 35, 4, 5, 6)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (16, N'Перец Б', 5, 24.5, 10, 4, 5, 9)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (17, N'Бананы', 5, 40.5, 30, 4, 5, 3)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (18, N'Картоха', 5, 25.5, 20, 4, 5, 12)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (19, N'Огурчики', 5, 59.99, 45, 4, 7, 15)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (20, N'Перец О', 5, 53.45, 55, 4, 7, 13)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (21, N'Семга', 8, 90.5, 15, 4, 8, 1)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (22, N'Треска', 6, 35.45, 33, 5, 5, 4)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (23, N'Лосось', 6, 45.33, 25, 5, 5, 11)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (24, N'Дети', 6, 299.99, 45, 5, 5, 14)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (25, N'Жуки', 6, 75.55, 15, 5, 5, 10)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (26, N'Тараканы', 6, 499.99, 15, 5, 7, 2)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (27, N'Тапки', 5, 20, 60, 4, 5, 3)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (28, N'Двигатель', 5, 67.84, 100, 4, 7, 1)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (29, N'Компьютер', 7, 50, 30, 6, 1, 10)
INSERT [dbo].[Product] ([id], [title], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (30, N'Тесла Н', 5, 15.5, 40, 4, 4, 9)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (1, N'Одесский р', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (2, N'Кивеский р', 2)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (3, N'Закарпатский р', 3)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (4, N'Немецкий р', 4)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (5, N'Варшавский р', 5)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (6, N'Японский р', 6)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (7, N'FАфриканский р', 7)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (8, N'Литовкий р', 8)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (9, N'Латвийский р', 9)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (10, N'Норвежский р', 10)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (11, N'Египетский р', 11)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (12, N'Турецкий р', 12)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (13, N'Испанский р', 13)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (14, N'Английский р', 14)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (15, N'Американский р', 15)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (1, 1, 200, 9, CAST(N'2022-12-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (2, 7, 350, 12, CAST(N'2022-12-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (3, 12, 24, 31, CAST(N'2022-12-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (4, 4, 24, 24, CAST(N'2022-12-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (5, 5, 245, 245, CAST(N'2022-12-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (6, 19, 534, 542, CAST(N'2022-12-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (7, 20, 523, 6422, CAST(N'2022-12-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (8, 9, 54, 24, CAST(N'2022-12-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (9, 11, 23, 32, CAST(N'2022-12-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (10, 16, 12, 424, CAST(N'2022-12-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (11, 3, 46, 244, CAST(N'2022-12-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (12, 23, 85, 211, CAST(N'2022-12-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (13, 10, 853, 4, CAST(N'2022-12-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (14, 30, 307, 20, CAST(N'2022-12-24' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (15, 29, 345, 1, CAST(N'2022-12-24' AS Date))
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (1, N'Наша Ряба', 1)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (2, N'ГМОТОП', 2)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (3, N'Нигерский совет', 3)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (4, N'Пивзавод Джагернаута', 4)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (5, N'Скитбидипапа', 5)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (6, N'лалала', 6)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (7, N'ПВ111', 7)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (8, N'СДПРОДЖЕКТРЕД', 8)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (9, N'Клавиатура', 9)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (10, N'Почка', 10)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (11, N'Космос', 11)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (12, N'Микрофон', 12)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (13, N'БМВ', 13)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (14, N'Пудж(Аэродинамический)', 14)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (15, N'КСГО', 15)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_City] FOREIGN KEY([id_city])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_City]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Region] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region] ([id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Region]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Product]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Producer_Address]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Markup] FOREIGN KEY([id_markup])
REFERENCES [dbo].[Markup] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Markup]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Measurment] FOREIGN KEY([id_measurement])
REFERENCES [dbo].[Measurment] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Measurment]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producer] FOREIGN KEY([id_producer])
REFERENCES [dbo].[Producer] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producer]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Product]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Address]
GO
USE [master]
GO
ALTER DATABASE [Store] SET  READ_WRITE 
GO
