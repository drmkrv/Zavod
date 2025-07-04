/****** Object:  Database [Factory]    Script Date: 08.06.2025 18:26:39 ******/
CREATE DATABASE [Factory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Factory', FILENAME = N'C:\Users\ssmlnsk\Factory.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Factory_log', FILENAME = N'C:\Users\ssmlnsk\Factory_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Factory] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Factory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Factory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Factory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Factory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Factory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Factory] SET ARITHABORT OFF 
GO
ALTER DATABASE [Factory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Factory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Factory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Factory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Factory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Factory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Factory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Factory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Factory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Factory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Factory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Factory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Factory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Factory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Factory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Factory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Factory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Factory] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Factory] SET  MULTI_USER 
GO
ALTER DATABASE [Factory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Factory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Factory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Factory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Factory] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Factory] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Factory] SET QUERY_STORE = OFF
GO
USE [Factory]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 08.06.2025 18:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID_Employee] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NULL,
	[Post] [int] NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID_Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model]    Script Date: 08.06.2025 18:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[ID_Model] [int] IDENTITY(1,1) NOT NULL,
	[NameModel] [nvarchar](max) NOT NULL,
	[Class] [nvarchar](max) NOT NULL,
	[Weight] [float] NOT NULL,
	[MaxRange] [float] NOT NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[ID_Model] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model_SparePart]    Script Date: 08.06.2025 18:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model_SparePart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Model] [int] NOT NULL,
	[SparePart] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Appointment] [nvarchar](max) NULL,
 CONSTRAINT [PK_Model_SparePart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 08.06.2025 18:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[ID_Post] [int] IDENTITY(1,1) NOT NULL,
	[NamePost] [nvarchar](max) NOT NULL,
	[Salary] [float] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[ID_Post] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 08.06.2025 18:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ID_Provider] [int] IDENTITY(1,1) NOT NULL,
	[NameProvider] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ID_Provider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rocket]    Script Date: 08.06.2025 18:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rocket](
	[ID_Rocket] [int] IDENTITY(1,1) NOT NULL,
	[ModelRocket] [int] NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[DateStartBuild] [nvarchar](max) NOT NULL,
	[DateEndBuild] [nvarchar](max) NULL,
 CONSTRAINT [PK_Rocket] PRIMARY KEY CLUSTERED 
(
	[ID_Rocket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SparePart]    Script Date: 08.06.2025 18:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SparePart](
	[ID_SparePart] [int] IDENTITY(1,1) NOT NULL,
	[NameSparePart] [nvarchar](max) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_SparePart] PRIMARY KEY CLUSTERED 
(
	[ID_SparePart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply]    Script Date: 08.06.2025 18:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply](
	[SupplyNumber] [int] IDENTITY(1,1) NOT NULL,
	[SparePart] [int] NOT NULL,
	[Provider] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[DateOrder] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[SupplyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 08.06.2025 18:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[NumberTest] [int] IDENTITY(1,1) NOT NULL,
	[Rocket] [int] NOT NULL,
	[TypeTest] [nvarchar](max) NOT NULL,
	[Result] [nvarchar](max) NOT NULL,
	[DateTest] [nvarchar](max) NOT NULL,
	[Employee] [int] NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[NumberTest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transportation]    Script Date: 08.06.2025 18:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportation](
	[ID_Transportation] [int] IDENTITY(1,1) NOT NULL,
	[Rocket] [int] NOT NULL,
	[DateSend] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Transportation] PRIMARY KEY CLUSTERED 
(
	[ID_Transportation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([ID_Employee], [Surname], [Name], [LastName], [Post], [Login], [Password]) VALUES (11, N'Иванов', N'Иван', N'Иванович', 2, N'2', N'2')
GO
INSERT [dbo].[Employee] ([ID_Employee], [Surname], [Name], [LastName], [Post], [Login], [Password]) VALUES (12, N'Петров', N'Петр', N'Петрович', 1, N'1', N'1')
GO
INSERT [dbo].[Employee] ([ID_Employee], [Surname], [Name], [LastName], [Post], [Login], [Password]) VALUES (13, N'Сидорова', N'Анна', N'Сергеевна', 3, N'3', N'3')
GO
INSERT [dbo].[Employee] ([ID_Employee], [Surname], [Name], [LastName], [Post], [Login], [Password]) VALUES (14, N'Кузнецов', N'Дмитрий', N'Алексеевич', 1, N'kuznetsov.da', N'P@ssw0rd4')
GO
INSERT [dbo].[Employee] ([ID_Employee], [Surname], [Name], [LastName], [Post], [Login], [Password]) VALUES (15, N'Смирнова', N'Елена', N'Владимировна', 1, N'smirnova.ev', N'P@ssw0rd5')
GO
INSERT [dbo].[Employee] ([ID_Employee], [Surname], [Name], [LastName], [Post], [Login], [Password]) VALUES (16, N'Федоров', N'Михаил', N'Олегович', 1, N'fedorov.mo', N'P@ssw0rd6')
GO
INSERT [dbo].[Employee] ([ID_Employee], [Surname], [Name], [LastName], [Post], [Login], [Password]) VALUES (17, N'Николаева', N'Ольга', N'Дмитриевна', 1, N'nikolaeva.od', N'P@ssw0rd7')
GO
INSERT [dbo].[Employee] ([ID_Employee], [Surname], [Name], [LastName], [Post], [Login], [Password]) VALUES (18, N'Волков', N'Александр', N'Игоревич', 3, N'volkov.ai', N'P@ssw0rd8')
GO
INSERT [dbo].[Employee] ([ID_Employee], [Surname], [Name], [LastName], [Post], [Login], [Password]) VALUES (19, N'Зайцева', N'Татьяна', N'Викторовна', 1, N'zaitseva.tv', N'P@ssw0rd9')
GO
INSERT [dbo].[Employee] ([ID_Employee], [Surname], [Name], [LastName], [Post], [Login], [Password]) VALUES (20, N'Соколов', N'Артем', N'Геннадьевич', 1, N'sokolov.ag', N'P@ssw0rd10')
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Model] ON 
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (1, N'Союз-2.1а', N'Средний класс', 312000, 9000)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (2, N'Протон-М', N'Тяжелый класс', 705000, 36000)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (3, N'Ангара-А5', N'Тяжелый класс', 773000, 35000)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (4, N'Зенит-3SL', N'Средний класс', 462200, 4500)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (5, N'Р-7', N'Легкий класс', 280000, 8800)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (6, N'Энергия', N'Сверхтяжелый класс', 2400000, 40000)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (7, N'Буран', N'Орбитальный корабль', 105000, 200000)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (8, N'Циклон-4М', N'Средний класс', 192000, 5500)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (9, N'Старшип', N'Сверхтяжелый класс', 5000000, 100000)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (10, N'Фалькон-9', N'Средний класс', 549000, 8500)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (11, N'Атлас-5', N'Тяжелый класс', 546700, 36000)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (12, N'Дельта-4', N'Тяжелый класс', 733400, 38000)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (13, N'Восток-1', N'Легкий класс', 287000, 327)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (14, N'Восход', N'Легкий класс', 530000, 1000)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (15, N'Н-1', N'Сверхтяжелый класс', 2735000, 0)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (16, N'Электрон', N'Легкий класс', 12500, 500)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (17, N'Ариан-5', N'Тяжелый класс', 777000, 40000)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (18, N'Лунный модуль', N'Посадочный модуль', 15000, 384400)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (19, N'Великий поход-5', N'Тяжелый класс', 854500, 35000)
GO
INSERT [dbo].[Model] ([ID_Model], [NameModel], [Class], [Weight], [MaxRange]) VALUES (20, N'Персеверанс', N'Марсоход', 1025, 225000000)
GO
SET IDENTITY_INSERT [dbo].[Model] OFF
GO
SET IDENTITY_INSERT [dbo].[Model_SparePart] ON 
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (1, 1, 1, 4, N'Турбонасосы для двигателей первой ступени')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (2, 1, 2, 4, N'Камеры сгорания основных двигателей')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (3, 1, 3, 4, N'Сопла двигательной установки')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (4, 1, 4, 2, N'Топливные баки первой ступени')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (5, 1, 5, 2, N'Баки окислителя')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (6, 1, 6, 3, N'Гироскопы системы навигации')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (7, 1, 7, 2, N'Бортовые компьютеры управления')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (8, 1, 8, 5, N'Аккумуляторные батареи')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (9, 1, 11, 120, N'Крепежные болты корпуса')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (10, 1, 12, 120, N'Гайки крепления')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (11, 2, 1, 6, N'Турбонасосы двигателей')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (12, 2, 2, 6, N'Камеры сгорания')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (13, 2, 3, 6, N'Сопла двигателей')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (14, 2, 4, 3, N'Основные топливные баки')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (15, 2, 5, 3, N'Баки окислителя')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (16, 2, 15, 12, N'Топливные насосы')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (17, 2, 19, 18, N'Топливные клапаны')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (18, 2, 20, 12, N'Фильтры топливной системы')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (19, 3, 1, 5, N'Турбонасосы УРМ')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (20, 3, 2, 5, N'Камеры сгорания')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (21, 3, 4, 4, N'Универсальные ракетные модули')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (22, 3, 6, 4, N'Навигационные системы')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (23, 3, 9, 200, N'Термозащитные элементы')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (24, 3, 13, 25, N'Датчики давления')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (25, 3, 14, 25, N'Датчики температуры')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (26, 4, 1, 4, N'Турбонасосы РД-171')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (27, 4, 3, 4, N'Сопловые аппараты')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (28, 4, 7, 3, N'Системы управления')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (29, 4, 16, 150, N'Электропроводка')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (30, 4, 17, 3, N'Антенны связи')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (31, 4, 18, 6, N'Солнечные панели')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (32, 5, 1, 5, N'Турбонасосы РД-107/108')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (33, 5, 2, 5, N'Камеры сгорания')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (34, 5, 10, 4, N'Парашютная система')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (35, 5, 11, 200, N'Крепежные элементы')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (36, 5, 12, 200, N'Крепежные элементы')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (37, 6, 1, 8, N'Турбонасосы РД-0120')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (38, 6, 4, 6, N'Основные топливные баки')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (39, 6, 5, 6, N'Баки окислителя')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (40, 6, 9, 400, N'Термозащитное покрытие')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (41, 6, 15, 20, N'Топливные насосы')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (42, 7, 6, 5, N'Навигационные системы')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (43, 7, 7, 4, N'Компьютеры управления')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (44, 7, 8, 10, N'Аккумуляторные батареи')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (45, 7, 9, 1200, N'Термозащитные плитки')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (46, 7, 10, 6, N'Парашютная система')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (47, 7, 17, 5, N'Антенны связи')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (48, 8, 1, 4, N'Турбонасосы РД-861К')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (49, 8, 3, 4, N'Сопла двигателей')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (50, 8, 13, 20, N'Датчики давления')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (51, 8, 14, 20, N'Датчики температуры')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (52, 8, 16, 100, N'Электропроводка')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (53, 9, 1, 6, N'Турбонасосы Raptor')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (54, 9, 2, 6, N'Камеры сгорания')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (55, 9, 3, 6, N'Сопла двигателей')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (56, 9, 4, 8, N'Топливные баки')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (57, 9, 5, 8, N'Баки окислителя')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (58, 9, 7, 8, N'Компьютеры управления')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (59, 9, 18, 20, N'Солнечные панели')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (60, 10, 1, 9, N'Турбонасосы Merlin')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (61, 10, 3, 9, N'Сопла двигателей')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (62, 10, 6, 4, N'Навигационные системы')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (63, 10, 10, 3, N'Парашютная система посадки')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (64, 10, 19, 30, N'Топливные клапаны')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (65, 11, 1, 4, N'Турбонасосы первой ступени')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (66, 11, 4, 2, N'Топливные баки')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (67, 12, 1, 6, N'Турбонасосы двигателей')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (68, 12, 3, 6, N'Сопла двигателей')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (69, 13, 5, 3, N'Баки окислителя')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (70, 13, 7, 2, N'Бортовые компьютеры')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (71, 14, 6, 3, N'Системы навигации')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (72, 14, 8, 4, N'Источники питания')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (73, 15, 9, 120, N'Термозащита корпуса')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (74, 15, 10, 3, N'Посадочные системы')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (75, 16, 11, 200, N'Крепежные элементы')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (76, 16, 12, 200, N'Крепежные элементы')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (77, 17, 13, 15, N'Контроль давления')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (78, 17, 14, 15, N'Контроль температуры')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (79, 18, 15, 8, N'Топливные системы')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (80, 18, 16, 5, N'Электропроводка')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (81, 19, 17, 2, N'Системы связи')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (82, 19, 18, 4, N'Энергоснабжение')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (83, 20, 19, 10, N'Топливные клапаны')
GO
INSERT [dbo].[Model_SparePart] ([ID], [Model], [SparePart], [Count], [Appointment]) VALUES (84, 20, 20, 8, N'Фильтры топливной системы')
GO
SET IDENTITY_INSERT [dbo].[Model_SparePart] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 
GO
INSERT [dbo].[Post] ([ID_Post], [NamePost], [Salary]) VALUES (1, N'Инженер-конструктор ракетных двигателей', 150000)
GO
INSERT [dbo].[Post] ([ID_Post], [NamePost], [Salary]) VALUES (2, N'Администратор', 200000)
GO
INSERT [dbo].[Post] ([ID_Post], [NamePost], [Salary]) VALUES (3, N'Инженер-испытатель', 140000)
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 
GO
INSERT [dbo].[Provider] ([ID_Provider], [NameProvider], [Country], [Email], [Phone]) VALUES (1, N'Космические комплектующие ООО', N'Россия', N'info@spaceparts.ru', N'+7 (495) 123-45-67')
GO
INSERT [dbo].[Provider] ([ID_Provider], [NameProvider], [Country], [Email], [Phone]) VALUES (2, N'Галактик Компонентс', N'США', N'sales@galactic-components.com', N'+1 (213) 555-01-23')
GO
INSERT [dbo].[Provider] ([ID_Provider], [NameProvider], [Country], [Email], [Phone]) VALUES (3, N'Аэрокосмические технологии', N'Франция', N'contact@aerotech-fr.com', N'+33 1 23 45 67 89')
GO
INSERT [dbo].[Provider] ([ID_Provider], [NameProvider], [Country], [Email], [Phone]) VALUES (4, N'Старлайт Детали', N'Германия', N'order@starlight-parts.de', N'+49 30 12345678')
GO
INSERT [dbo].[Provider] ([ID_Provider], [NameProvider], [Country], [Email], [Phone]) VALUES (5, N'Орбитал Снабжение', N'Китай', N'service@orbital-supply.cn', N'+86 10 8765 4321')
GO
INSERT [dbo].[Provider] ([ID_Provider], [NameProvider], [Country], [Email], [Phone]) VALUES (6, N'Ракетные системы Лтд', N'Великобритания', N'info@rocketsystems.uk', N'+44 20 7946 0958')
GO
INSERT [dbo].[Provider] ([ID_Provider], [NameProvider], [Country], [Email], [Phone]) VALUES (7, N'КосмоИмпекс', N'Япония', N'sales@cosmoimpex.jp', N'+81 3-1234-5678')
GO
INSERT [dbo].[Provider] ([ID_Provider], [NameProvider], [Country], [Email], [Phone]) VALUES (8, N'Интеркосмос Снаб', N'Индия', N'contact@intercosmos.in', N'+91 11 2345 6789')
GO
INSERT [dbo].[Provider] ([ID_Provider], [NameProvider], [Country], [Email], [Phone]) VALUES (9, N'АстроТех', N'Канада', N'support@astrotech.ca', N'+1 416 555 01 23')
GO
INSERT [dbo].[Provider] ([ID_Provider], [NameProvider], [Country], [Email], [Phone]) VALUES (10, N'Восточные космические технологии', N'Южная Корея', N'order@eastspace.kr', N'+82 2 123 4567')
GO
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[Rocket] ON 
GO
INSERT [dbo].[Rocket] ([ID_Rocket], [ModelRocket], [Status], [DateStartBuild], [DateEndBuild]) VALUES (11, 1, N'В производстве', N'2024.01.15', N'2024.06.20')
GO
INSERT [dbo].[Rocket] ([ID_Rocket], [ModelRocket], [Status], [DateStartBuild], [DateEndBuild]) VALUES (12, 2, N'Готов', N'2023.11.10', N'2024.05.15')
GO
INSERT [dbo].[Rocket] ([ID_Rocket], [ModelRocket], [Status], [DateStartBuild], [DateEndBuild]) VALUES (13, 3, N'На тестировании', N'2024.02.20', NULL)
GO
INSERT [dbo].[Rocket] ([ID_Rocket], [ModelRocket], [Status], [DateStartBuild], [DateEndBuild]) VALUES (14, 5, N'В производстве', N'2024.03.01', NULL)
GO
INSERT [dbo].[Rocket] ([ID_Rocket], [ModelRocket], [Status], [DateStartBuild], [DateEndBuild]) VALUES (15, 7, N'Отменен', N'2023.09.05', N'2024.01.10')
GO
INSERT [dbo].[Rocket] ([ID_Rocket], [ModelRocket], [Status], [DateStartBuild], [DateEndBuild]) VALUES (16, 2, N'Готов', N'2024.01.10', N'2024.07.01')
GO
INSERT [dbo].[Rocket] ([ID_Rocket], [ModelRocket], [Status], [DateStartBuild], [DateEndBuild]) VALUES (17, 3, N'На хранении', N'2022.12.15', N'2023.06.30')
GO
INSERT [dbo].[Rocket] ([ID_Rocket], [ModelRocket], [Status], [DateStartBuild], [DateEndBuild]) VALUES (18, 1, N'Списан', N'2020.05.20', N'2023.12.31')
GO
INSERT [dbo].[Rocket] ([ID_Rocket], [ModelRocket], [Status], [DateStartBuild], [DateEndBuild]) VALUES (19, 4, N'В производстве', N'2024.04.01', NULL)
GO
SET IDENTITY_INSERT [dbo].[Rocket] OFF
GO
SET IDENTITY_INSERT [dbo].[SparePart] ON 
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (1, N'Турбонасос двигателя РД-107', 18)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (2, N'Камера сгорания основная', 12)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (3, N'Сопло двигателя композитное', 9)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (4, N'Топливный бак алюминиевый', 7)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (5, N'Бак окислителя стальной', 7)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (6, N'Гироскоп системы навигации', 25)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (7, N'Бортовой компьютер управления', 6)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (8, N'Аккумуляторная батарея 24В', 35)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (9, N'Термозащитная плитка 150x150', 800)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (10, N'Парашют тормозной основной', 12)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (11, N'Болт крепежный М10х50', 1500)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (12, N'Гайка М10 оцинкованная', 1500)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (13, N'Датчик давления топлива', 60)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (14, N'Датчик температуры корпуса', 60)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (15, N'Топливный насос высокого давления', 22)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (16, N'Электропроводка силовая', 250)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (17, N'Антенна УКВ-диапазона', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (18, N'Солнечная панель 1x1м', 15)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (19, N'Клапан топливный электромагнитный', 45)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (20, N'Фильтр топливный тонкой очистки', 45)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (21, N'Редуктор давления топлива', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (22, N'Клапан сброса аварийный', 12)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (23, N'Датчик вибрации двигателя', 18)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (24, N'Кабель силовой 50мм²', 120)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (25, N'Разъем электрический 24-конт.', 300)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (26, N'Трансформатор бортовой', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (27, N'Реле управления 30А', 50)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (28, N'Предохранитель 10А', 200)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (29, N'Вентилятор системы охлаждения', 15)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (30, N'Радиатор охлаждения', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (31, N'Датчик уровня топлива', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (32, N'Клапан заправочный', 15)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (33, N'Фильтр воздушный', 25)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (34, N'Насос гидравлический', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (35, N'Цилиндр гидравлический', 6)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (36, N'Шланг высокого давления', 30)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (37, N'Манометр топливной системы', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (38, N'Термопара выхлопных газов', 12)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (39, N'Изолятор высоковольтный', 25)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (40, N'Диод силовой', 100)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (41, N'Конденсатор пусковой', 80)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (42, N'Резистор регулировочный', 150)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (43, N'Микросхема управления', 40)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (44, N'Датчик положения клапана', 35)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (45, N'Привод исполнительного механизма', 9)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (46, N'Подшипник турбонасоса', 14)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (47, N'Уплотнение вала', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (48, N'Сальник гидравлический', 18)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (49, N'Фланец соединения труб', 25)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (50, N'Хомут крепежный', 200)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (51, N'Кронштейн крепления', 50)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (52, N'Плата контроллера', 12)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (53, N'Разъем антенный', 15)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (54, N'Кабель телеметрии', 80)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (55, N'Датчик ускорения', 16)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (56, N'Акселерометр трехосевой', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (57, N'Гирогоризонт', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (58, N'Блок питания 5В', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (59, N'Преобразователь напряжения', 12)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (60, N'Стабилизатор тока', 18)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (61, N'Инвертор 220В', 6)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (62, N'Выключатель аварийный', 15)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (63, N'Кнопка пуска', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (64, N'Панель управления', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (65, N'Дисплей бортовой', 4)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (66, N'Лампа сигнальная', 30)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (67, N'Зуммер аварийный', 12)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (68, N'Розетка сервисная', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (69, N'Разъем диагностики', 6)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (70, N'Кабель заземления', 25)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (71, N'Шина питания', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (72, N'Блок предохранителей', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (73, N'Реле времени', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (74, N'Таймер циклический', 6)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (75, N'Датчик солнечного излучения', 7)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (76, N'Фотоэлемент', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (77, N'Лампа аварийного освещения', 15)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (78, N'Батарея резервная', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (79, N'Контроллер заряда', 6)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (80, N'Индикатор уровня заряда', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (81, N'Разъем зарядный', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (82, N'Кабель USB диагностики', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (83, N'Адаптер интерфейсный', 4)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (84, N'Модем телеметрии', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (85, N'Антенна GPS', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (86, N'Приемник ГЛОНАСС', 4)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (87, N'Датчик крена', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (88, N'Датчик тангажа', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (89, N'Датчик рыскания', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (90, N'Блок обработки данных', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (91, N'Контроллер двигателя', 4)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (92, N'Плата усилителя', 6)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (93, N'Фильтр радиопомех', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (94, N'Разъем экранированный', 15)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (95, N'Кабель коаксиальный', 40)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (96, N'Трансформатор импульсный', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (97, N'Дроссель фильтра', 12)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (98, N'Конденсатор сглаживающий', 30)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (99, N'Резистор балластный', 50)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (100, N'Диод защитный', 60)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (101, N'Стабилитрон', 40)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (102, N'Тиристор силовой', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (103, N'Симистор управления', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (104, N'Оптрон развязки', 15)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (105, N'Микросхема драйвера', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (106, N'Процессор обработки', 4)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (107, N'Память FLASH', 6)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (108, N'Контроллер шины', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (109, N'Преобразователь интерфейса', 4)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (110, N'Адаптер сети', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (111, N'Модуль Wi-Fi', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (112, N'Датчик влажности', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (113, N'Датчик загазованности', 4)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (114, N'Сигнализатор аварийный', 6)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (115, N'Сирена тревоги', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (116, N'Лампа стробоскопа', 4)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (117, N'Фара подсветки', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (118, N'Выключатель освещения', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (119, N'Диммер регулировки', 4)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (120, N'Трансформатор осветительный', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (121, N'Лампа светодиодная', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (122, N'Блок аварийного питания', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (123, N'Розетка силовая', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (124, N'Вилка соединительная', 6)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (125, N'Кабель питания 3x1.5', 50)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (126, N'Трубка термоусадочная', 100)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (127, N'Изолента', 200)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (128, N'Клемма соединительная', 300)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (129, N'Наконечник кабельный', 400)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (130, N'Втулка изолирующая', 150)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (131, N'Прокладка уплотнительная', 80)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (132, N'Шайба пружинная', 500)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (133, N'Гровер М8', 500)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (134, N'Болт анкерный', 30)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (135, N'Шпилька резьбовая', 40)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (136, N'Гайка корончатая', 60)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (137, N'Шплинт', 200)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (138, N'Скоба крепежная', 50)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (139, N'Хомут нейлоновый', 100)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (140, N'Ремень стяжной', 80)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (141, N'Планка монтажная', 30)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (142, N'Кронштейн поворотный', 15)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (143, N'Основание крепления', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (144, N'Пластина соединительная', 25)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (145, N'Проставка дистанционная', 40)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (146, N'Втулка переходная', 35)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (147, N'Фланец ответный', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (148, N'Муфта соединительная', 15)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (149, N'Переходник резьбовой', 30)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (150, N'Тройник распределительный', 12)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (151, N'Клапан обратный', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (152, N'Фильтр грубой очистки', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (153, N'Сетка фильтрующая', 15)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (154, N'Прокладка фланцевая', 50)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (155, N'Уплотнение резьбовое', 100)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (156, N'Лента ФУМ', 30)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (157, N'Паста герметизирующая', 25)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (158, N'Герметик силиконовый', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (159, N'Клей термостойкий', 15)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (160, N'Краска защитная', 40)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (161, N'Грунтовка антикоррозийная', 30)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (162, N'Растворитель', 25)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (163, N'Смазка графитовая', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (164, N'Масло гидравлическое', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (165, N'Жидкость тормозная', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (166, N'Антифриз', 12)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (167, N'Очиститель контактов', 15)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (168, N'Спрей смазывающий', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (169, N'Набор отверток', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (170, N'Ключ гаечный', 8)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (171, N'Головка торцевая', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (172, N'Трещотка', 4)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (173, N'Динамометрический ключ', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (174, N'Шестигранник', 6)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (175, N'Плоскогубцы', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (176, N'Кусачки', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (177, N'Нож монтажный', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (178, N'Измеритель напряжения', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (179, N'Мультиметр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (180, N'Осциллограф', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (181, N'Генератор сигналов', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (182, N'Источник питания', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (183, N'Нагрузочный резистор', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (184, N'Модуль тестирования', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (185, N'Стенд проверки', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (186, N'Программатор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (187, N'Кабель программатора', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (188, N'Адаптер диагностический', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (189, N'Программное обеспечение', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (190, N'Лицензия ПО', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (191, N'Ключ защиты', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (192, N'Инструкция по эксплуатации', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (193, N'Паспорт изделия', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (194, N'Сертификат соответствия', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (195, N'Упаковка транспортная', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (196, N'Ящик инструментальный', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (197, N'Чехол защитный', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (198, N'Ремень для переноски', 4)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (199, N'Кейс для приборов', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (200, N'Сумка для инструментов', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (201, N'Органайзер', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (202, N'Полка для хранения', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (203, N'Стеллаж инструментальный', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (204, N'Тележка транспортировочная', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (205, N'Лебедка монтажная', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (206, N'Таль ручная', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (207, N'Домкрат гидравлический', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (208, N'Подставка регулируемая', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (209, N'Козлы монтажные', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (210, N'Лестница-стремянка', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (211, N'Подмости', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (212, N'Ограждение', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (213, N'Знак безопасности', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (214, N'Табличка предупредительная', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (215, N'Инструкция по ТБ', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (216, N'Журнал учета', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (217, N'Бланк акта', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (218, N'Накладная', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (219, N'Упаковка пустая', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (220, N'Пакет полиэтиленовый', 50)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (221, N'Коробка картонная', 15)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (222, N'Пленка упаковочная', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (223, N'Скотч упаковочный', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (224, N'Шпагат', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (225, N'Наклейка маркировочная', 100)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (226, N'Бирка', 50)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (227, N'Маркер', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (228, N'Ручка', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (229, N'Карандаш', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (230, N'Блокнот', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (231, N'Калькулятор', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (232, N'Линейка', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (233, N'Угольник', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (234, N'Транспортир', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (235, N'Циркуль', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (236, N'Шаблон', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (237, N'Лекало', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (238, N'Масштабная линейка', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (239, N'Планшет чертежный', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (240, N'Бумага миллиметровая', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (241, N'Калька', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (242, N'Файл документов', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (243, N'Папка-скоросшиватель', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (244, N'Архивная коробка', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (245, N'Шкаф для документов', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (246, N'Сейф', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (247, N'Огнетушитель', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (248, N'Аптечка', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (249, N'Знак аптечки', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (250, N'Жилет сигнальный', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (251, N'Каска защитная', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (252, N'Очки защитные', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (253, N'Перчатки защитные', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (254, N'Респиратор', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (255, N'Наушники противошумные', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (256, N'Фартук защитный', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (257, N'Бахилы', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (258, N'Халат защитный', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (259, N'Комбинезон', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (260, N'Коврик антистатический', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (261, N'Браслет антистатический', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (262, N'Чехол антистатический', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (263, N'Салфетка чистящая', 50)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (264, N'Тряпка ветошь', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (265, N'Ведро', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (266, N'Щетка', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (267, N'Совок', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (268, N'Веник', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (269, N'Швабра', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (270, N'Мешок для мусора', 20)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (271, N'Урна', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (272, N'Лопата', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (273, N'Грабли', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (274, N'Лом', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (275, N'Кувалда', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (276, N'Молоток', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (277, N'Зубило', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (278, N'Пробойник', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (279, N'Напильник', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (280, N'Надфиль', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (281, N'Ножовка', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (282, N'Полотно ножовочное', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (283, N'Ножницы по металлу', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (284, N'Круг отрезной', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (285, N'Круг шлифовальный', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (286, N'Щетка металлическая', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (287, N'Паста притирочная', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (288, N'Припой', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (289, N'Флюс', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (290, N'Паяльник', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (291, N'Горелка', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (292, N'Баллон газовый', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (293, N'Редуктор газовый', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (294, N'Шланг газовый', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (295, N'Факел', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (296, N'Электрод сварочный', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (297, N'Маска сварщика', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (298, N'Краги', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (299, N'Щиток защитный', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (300, N'Экран защитный', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (301, N'Шумомер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (302, N'Люксметр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (303, N'Термометр', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (304, N'Барометр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (305, N'Гигрометр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (306, N'Анемометр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (307, N'Пылемер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (308, N'Газоанализатор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (309, N'Дозиметр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (310, N'Вибратомер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (311, N'Толщиномер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (312, N'Твердомер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (313, N'Профилометр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (314, N'Микроскоп', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (315, N'Эндоскоп', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (316, N'Дефектоскоп', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (317, N'Термопара', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (318, N'Пирометр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (319, N'Термограф', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (320, N'Регистратор данных', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (321, N'Логгер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (322, N'Датчик деформации', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (323, N'Тензометр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (324, N'Акселерометр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (325, N'Вискозиметр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (326, N'Расходомер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (327, N'Манометр дифференциальный', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (328, N'Вакуумметр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (329, N'Тягомер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (330, N'Счетчик частиц', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (331, N'Анализатор спектра', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (332, N'Генератор импульсов', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (333, N'Осциллятор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (334, N'Фазометр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (335, N'Частотомер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (336, N'Мостовой измеритель', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (337, N'Мегомметр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (338, N'Кабельный локатор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (339, N'Тестер изоляции', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (340, N'Детектор скрытой проводки', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (341, N'Индикатор напряжения', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (342, N'Пробник', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (343, N'Тестер цепей', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (344, N'Имитатор сигналов', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (345, N'Кабель контрольный', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (346, N'Переходник измерительный', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (347, N'Щуп измерительный', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (348, N'Клещи токоизмерительные', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (349, N'Клещи диэлектрические', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (350, N'Отвертка-индикатор', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (351, N'Фонарь переносной', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (352, N'Прожектор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (353, N'Лампа переноска', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (354, N'Светильник аварийный', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (355, N'Люминесцентная лампа', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (356, N'Лампа накаливания', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (357, N'Светодиодная лента', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (358, N'Драйвер светодиодный', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (359, N'Блок аварийного света', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (360, N'Аккумулятор для фонаря', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (361, N'Зарядное устройство', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (362, N'Адаптер питания', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (363, N'Кабель удлинительный', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (364, N'Розетка переносная', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (365, N'Вилочный соединитель', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (366, N'Тройник электрический', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (367, N'Удлинитель сетевой', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (368, N'Фильтр сетевой', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (369, N'Стабилизатор напряжения', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (370, N'ИБП', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (371, N'Генератор электрический', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (372, N'Двигатель-генератор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (373, N'Преобразователь частоты', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (374, N'Инвертор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (375, N'Выпрямитель', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (376, N'Трансформатор разделительный', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (377, N'Дроссель', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (378, N'Реактор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (379, N'Конденсатор силовой', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (380, N'Батарея конденсаторов', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (381, N'Разрядник', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (382, N'Варистор', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (383, N'Терморезистор', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (384, N'Фоторезистор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (385, N'Тензорезистор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (386, N'Потенциометр', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (387, N'Реостат', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (388, N'Шунт измерительный', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (389, N'Добавочное сопротивление', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (390, N'Балласт', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (391, N'Нагрузка эквивалентная', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (392, N'Стенд испытательный', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (393, N'Пульт управления', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (394, N'Панель индикации', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (395, N'Монитор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (396, N'Клавиатура', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (397, N'Мышь', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (398, N'Джойстик', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (399, N'Графический планшет', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (400, N'Сканер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (401, N'Принтер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (402, N'Плоттер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (403, N'Копир', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (404, N'Факс', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (405, N'Телефон', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (406, N'Радиостанция', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (407, N'Пейджер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (408, N'Модем', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (409, N'Роутер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (410, N'Коммутатор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (411, N'Хаб', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (412, N'Патч-корд', 5)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (413, N'Кабель сетевой', 3)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (414, N'Коннектор RJ45', 10)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (415, N'Кримпер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (416, N'Тестер кабельный', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (417, N'Анализатор протоколов', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (418, N'Маршрутизатор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (419, N'Файрвол', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (420, N'Сервер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (421, N'Рабочая станция', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (422, N'Ноутбук', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (423, N'Планшет', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (424, N'Смартфон', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (425, N'Часы электронные', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (426, N'Диктофон', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (427, N'Фотоаппарат', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (428, N'Видеокамера', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (429, N'Проектор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (430, N'Экран проекционный', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (431, N'Микрофон', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (432, N'Колонки', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (433, N'Наушники', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (434, N'Усилитель звука', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (435, N'Микшер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (436, N'Процессор эффектов', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (437, N'Синтезатор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (438, N'Метроном', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (439, N'Тюнер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (440, N'Осциллятор звуковой', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (441, N'Генератор шума', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (442, N'Анализатор спектра звука', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (443, N'Шумомер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (444, N'Вибрационная платформа', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (445, N'Вибратор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (446, N'Динамометр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (447, N'Тензодатчик', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (448, N'Акселерометр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (449, N'Гироскоп', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (450, N'Магнитометр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (451, N'Компас', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (452, N'GPS-приемник', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (453, N'ГЛОНАСС-приемник', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (454, N'Антенна спутниковая', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (455, N'Модем спутниковый', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (456, N'Терминал', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (457, N'Контроллер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (458, N'ПЛК', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (459, N'Модуль ввода-вывода', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (460, N'Блок релейный', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (461, N'Блок дискретных входов', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (462, N'Блок аналоговых входов', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (463, N'Блок выходных сигналов', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (464, N'Интерфейсный модуль', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (465, N'Модуль связи', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (466, N'Шина данных', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (467, N'Контроллер шины', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (468, N'Арбитр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (469, N'Мост', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (470, N'Концентратор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (471, N'Повторитель', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (472, N'Трансивер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (473, N'Модем', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (474, N'Адаптер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (475, N'Конвертер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (476, N'Сплиттер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (477, N'Мультиплексор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (478, N'Демультиплексор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (479, N'Компаратор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (480, N'Шифратор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (481, N'Дешифратор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (482, N'Сумматор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (483, N'Регистр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (484, N'Счетчик', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (485, N'Триггер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (486, N'Дешифратор адреса', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (487, N'Буфер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (488, N'Драйвер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (489, N'Приемник', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (490, N'Передатчик', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (491, N'Трансивер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (492, N'Модулятор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (493, N'Демодулятор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (494, N'Синтезатор частоты', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (495, N'Гетеродин', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (496, N'Фазовращатель', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (497, N'Аттенюатор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (498, N'Усилитель', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (499, N'Предусилитель', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (500, N'Оконечный усилитель', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (501, N'Усилитель мощности', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (502, N'Усилитель промежуточной частоты', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (503, N'Усилитель низкой частоты', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (504, N'Усилитель высокой частоты', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (505, N'Усилитель постоянного тока', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (506, N'Дифференциальный усилитель', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (507, N'Инструментальный усилитель', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (508, N'Изолирующий усилитель', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (509, N'Логарифмический усилитель', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (510, N'Операционный усилитель', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (511, N'Компаратор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (512, N'Источник опорного напряжения', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (513, N'Источник тока', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (514, N'Стабилизатор напряжения', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (515, N'Стабилизатор тока', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (516, N'Преобразователь напряжение-ток', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (517, N'Преобразователь ток-напряжение', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (518, N'ЦАП', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (519, N'АЦП', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (520, N'Цифровой потенциометр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (521, N'Цифровой реостат', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (522, N'Цифровой аттенюатор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (523, N'Цифровой фазовращатель', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (524, N'Цифровой синтезатор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (525, N'Цифровой фильтр', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (526, N'Цифровой процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (527, N'Цифровой сигнальный процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (528, N'Микроконтроллер', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (529, N'Микропроцессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (530, N'Сопроцессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (531, N'Графический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (532, N'Физический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (533, N'Нейропроцессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (534, N'Тензорный процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (535, N'Квантовый процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (536, N'Оптический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (537, N'Биологический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (538, N'Химический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (539, N'Механический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (540, N'Пневматический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (541, N'Гидравлический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (542, N'Термический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (543, N'Акустический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (544, N'Электромагнитный процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (545, N'Гравитационный процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (546, N'Ядерный процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (547, N'Атомный процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (548, N'Молекулярный процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (549, N'Нано-процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (550, N'Пико-процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (551, N'Фемто-процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (552, N'Атто-процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (553, N'Зепто-процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (554, N'Иокто-процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (555, N'Планковский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (556, N'Космический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (557, N'Галактический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (558, N'Вселенский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (559, N'Метавселенский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (560, N'Квантово-вселенский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (561, N'Гипервселенский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (562, N'Омнивселенский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (563, N'Абсолютный процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (564, N'Идеальный процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (565, N'Совершенный процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (566, N'Божественный процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (567, N'Мифический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (568, N'Легендарный процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (569, N'Эпический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (570, N'Фантастический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (571, N'Футуристический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (572, N'Утопический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (573, N'Дистопический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (574, N'Апокалиптический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (575, N'Постапокалиптический процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (576, N'Киберпанковский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (577, N'Стимпанковский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (578, N'Дизельпанковский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (579, N'Атомпанковский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (580, N'Биопанковский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (581, N'Нанопанковский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (582, N'Космопанковский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (583, N'Соларпанковский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (584, N'Лунапанковский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (585, N'Марсианский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (586, N'Венерианский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (587, N'Юпитерианский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (588, N'Сатурнианский процессор', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (592, N'test', 1)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (593, N'test2', 2)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (594, N'test3', 0)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (595, N'test4', 0)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (596, N'test5', 0)
GO
INSERT [dbo].[SparePart] ([ID_SparePart], [NameSparePart], [Count]) VALUES (597, N'testtest', 100)
GO
SET IDENTITY_INSERT [dbo].[SparePart] OFF
GO
SET IDENTITY_INSERT [dbo].[Supply] ON 
GO
INSERT [dbo].[Supply] ([SupplyNumber], [SparePart], [Provider], [Count], [DateOrder], [Status]) VALUES (1, 1, 1, 1, N'2025.06.01', N'?????')
GO
SET IDENTITY_INSERT [dbo].[Supply] OFF
GO
SET IDENTITY_INSERT [dbo].[Test] ON 
GO
INSERT [dbo].[Test] ([NumberTest], [Rocket], [TypeTest], [Result], [DateTest], [Employee]) VALUES (1002, 11, N'2. Вибрационные и ударные испытания', N'Тест отменён', N'08.06.2025', 11)
GO
INSERT [dbo].[Test] ([NumberTest], [Rocket], [TypeTest], [Result], [DateTest], [Employee]) VALUES (1003, 15, N'15. Комплексные предпусковые проверки', N'Не пройдено (критическая ошибка)', N'08.06.2025', 11)
GO
INSERT [dbo].[Test] ([NumberTest], [Rocket], [TypeTest], [Result], [DateTest], [Employee]) VALUES (1004, 15, N'5. Функциональные проверки бортовых систем', N'Требуется повторное тестирование', N'27.05.2025', 11)
GO
INSERT [dbo].[Test] ([NumberTest], [Rocket], [TypeTest], [Result], [DateTest], [Employee]) VALUES (1005, 19, N'1. Статические (огневые) испытания двигателей', N'Успешно пройдено', N'13.05.2025', 11)
GO
SET IDENTITY_INSERT [dbo].[Test] OFF
GO
SET IDENTITY_INSERT [dbo].[Transportation] ON 
GO
INSERT [dbo].[Transportation] ([ID_Transportation], [Rocket], [DateSend], [Status]) VALUES (2, 11, N'01.06.2025', N'Готово')
GO
SET IDENTITY_INSERT [dbo].[Transportation] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Post] FOREIGN KEY([Post])
REFERENCES [dbo].[Post] ([ID_Post])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Post]
GO
ALTER TABLE [dbo].[Model_SparePart]  WITH CHECK ADD  CONSTRAINT [FK_Model_SparePart_Model] FOREIGN KEY([Model])
REFERENCES [dbo].[Model] ([ID_Model])
GO
ALTER TABLE [dbo].[Model_SparePart] CHECK CONSTRAINT [FK_Model_SparePart_Model]
GO
ALTER TABLE [dbo].[Model_SparePart]  WITH CHECK ADD  CONSTRAINT [FK_Model_SparePart_SparePart] FOREIGN KEY([SparePart])
REFERENCES [dbo].[SparePart] ([ID_SparePart])
GO
ALTER TABLE [dbo].[Model_SparePart] CHECK CONSTRAINT [FK_Model_SparePart_SparePart]
GO
ALTER TABLE [dbo].[Rocket]  WITH CHECK ADD  CONSTRAINT [FK_Rocket_Model] FOREIGN KEY([ModelRocket])
REFERENCES [dbo].[Model] ([ID_Model])
GO
ALTER TABLE [dbo].[Rocket] CHECK CONSTRAINT [FK_Rocket_Model]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_SparePart] FOREIGN KEY([SparePart])
REFERENCES [dbo].[SparePart] ([ID_SparePart])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_SparePart]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_Supply] FOREIGN KEY([Provider])
REFERENCES [dbo].[Provider] ([ID_Provider])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_Supply]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_Employee] FOREIGN KEY([Employee])
REFERENCES [dbo].[Employee] ([ID_Employee])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_Employee]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_Rocket] FOREIGN KEY([Rocket])
REFERENCES [dbo].[Rocket] ([ID_Rocket])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_Rocket]
GO
ALTER TABLE [dbo].[Transportation]  WITH CHECK ADD  CONSTRAINT [FK_Transportation_Rocket] FOREIGN KEY([Rocket])
REFERENCES [dbo].[Rocket] ([ID_Rocket])
GO
ALTER TABLE [dbo].[Transportation] CHECK CONSTRAINT [FK_Transportation_Rocket]
GO
USE [master]
GO
ALTER DATABASE [Factory] SET  READ_WRITE 
GO
