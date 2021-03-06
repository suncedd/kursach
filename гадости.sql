USE [master]
GO
/****** Object:  Database [sport]    Script Date: 18.06.2022 12:07:38 ******/
CREATE DATABASE [sport]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sport', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\sport.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'sport_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\sport_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [sport] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sport].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sport] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sport] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sport] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sport] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sport] SET ARITHABORT OFF 
GO
ALTER DATABASE [sport] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sport] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sport] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sport] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sport] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sport] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sport] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sport] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sport] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sport] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sport] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sport] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sport] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sport] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sport] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sport] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sport] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sport] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sport] SET  MULTI_USER 
GO
ALTER DATABASE [sport] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sport] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sport] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sport] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sport] SET DELAYED_DURABILITY = DISABLED 
GO
USE [sport]
GO
/****** Object:  Table [dbo].[Абонемент]    Script Date: 18.06.2022 12:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Абонемент](
	[КодАбонемента] [int] IDENTITY(1,1) NOT NULL,
	[Название] [varchar](50) NULL,
	[Длительность] [int] NULL,
	[Цена] [int] NULL,
	[КодПосещаемости] [int] NULL,
 CONSTRAINT [PK_Абонемент] PRIMARY KEY CLUSTERED 
(
	[КодАбонемента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Авторизация]    Script Date: 18.06.2022 12:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Авторизация](
	[КодПользователя] [int] IDENTITY(1,1) NOT NULL,
	[Логин] [varchar](100) NULL,
	[Пароль] [varchar](100) NULL,
	[КодРаботника] [int] NOT NULL,
 CONSTRAINT [PK_Авторизация] PRIMARY KEY CLUSTERED 
(
	[КодПользователя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Должности]    Script Date: 18.06.2022 12:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Должности](
	[КодДолжности] [int] NOT NULL,
	[Должность] [varchar](50) NULL,
 CONSTRAINT [PK_Должности] PRIMARY KEY CLUSTERED 
(
	[КодДолжности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Клиент]    Script Date: 18.06.2022 12:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Клиент](
	[КодКлиента] [int] IDENTITY(1,1) NOT NULL,
	[КодСотрудника] [int] NULL,
	[КодСтатуса] [int] NULL,
	[ФИО] [varchar](200) NULL,
	[ДатаРождения] [varchar](100) NULL,
	[КодАбонемента] [int] NULL,
	[Паспорт] [int] NULL,
 CONSTRAINT [PK_Клиент] PRIMARY KEY CLUSTERED 
(
	[КодКлиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Посещаемость]    Script Date: 18.06.2022 12:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Посещаемость](
	[КодПосещаемости] [int] NOT NULL,
	[КолВоПосещений] [int] NULL,
 CONSTRAINT [PK_Посещаемость] PRIMARY KEY CLUSTERED 
(
	[КодПосещаемости] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 18.06.2022 12:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[КодСотрудника] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [varchar](200) NULL,
	[КодДолжность] [int] NULL,
	[Статус] [varchar](50) NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[КодСотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Статус]    Script Date: 18.06.2022 12:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Статус](
	[КодСтатуса] [int] NOT NULL,
	[Статус] [varchar](50) NULL,
 CONSTRAINT [PK_Статус] PRIMARY KEY CLUSTERED 
(
	[КодСтатуса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Тренировка]    Script Date: 18.06.2022 12:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тренировка](
	[КодТренировки] [int] NOT NULL,
	[КодУслуги] [int] NULL,
	[КодКлиента] [int] NULL,
	[Дата] [date] NULL,
	[Количество] [int] NULL,
 CONSTRAINT [PK_Тренировка] PRIMARY KEY CLUSTERED 
(
	[КодТренировки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Услуги]    Script Date: 18.06.2022 12:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Услуги](
	[КодУслуги] [int] NOT NULL,
	[Название] [varchar](50) NULL,
	[КодСотрудника] [int] NULL,
 CONSTRAINT [PK_Услуги] PRIMARY KEY CLUSTERED 
(
	[КодУслуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Абонемент] ON 

INSERT [dbo].[Абонемент] ([КодАбонемента], [Название], [Длительность], [Цена], [КодПосещаемости]) VALUES (1, N'lf', 5, 500, NULL)
INSERT [dbo].[Абонемент] ([КодАбонемента], [Название], [Длительность], [Цена], [КодПосещаемости]) VALUES (2, N'ага', 30, 4000, NULL)
INSERT [dbo].[Абонемент] ([КодАбонемента], [Название], [Длительность], [Цена], [КодПосещаемости]) VALUES (3, N'ogo', 20, 2000, NULL)
INSERT [dbo].[Абонемент] ([КодАбонемента], [Название], [Длительность], [Цена], [КодПосещаемости]) VALUES (4, N'qwq', 12, 1000, NULL)
INSERT [dbo].[Абонемент] ([КодАбонемента], [Название], [Длительность], [Цена], [КодПосещаемости]) VALUES (5, N'sssss', 1, 5, NULL)
INSERT [dbo].[Абонемент] ([КодАбонемента], [Название], [Длительность], [Цена], [КодПосещаемости]) VALUES (6, N'cccccc', 4, 4, NULL)
INSERT [dbo].[Абонемент] ([КодАбонемента], [Название], [Длительность], [Цена], [КодПосещаемости]) VALUES (7, N'qwqqwww', 5, 5, NULL)
INSERT [dbo].[Абонемент] ([КодАбонемента], [Название], [Длительность], [Цена], [КодПосещаемости]) VALUES (8, N'vvvvvv', 7, 7, NULL)
SET IDENTITY_INSERT [dbo].[Абонемент] OFF
SET IDENTITY_INSERT [dbo].[Авторизация] ON 

INSERT [dbo].[Авторизация] ([КодПользователя], [Логин], [Пароль], [КодРаботника]) VALUES (1, N'admin', N'admin', 1)
INSERT [dbo].[Авторизация] ([КодПользователя], [Логин], [Пароль], [КодРаботника]) VALUES (2, N'vlad', N'vlad', 5)
INSERT [dbo].[Авторизация] ([КодПользователя], [Логин], [Пароль], [КодРаботника]) VALUES (3, N'igor', N'igor', 6)
INSERT [dbo].[Авторизация] ([КодПользователя], [Логин], [Пароль], [КодРаботника]) VALUES (4, N'dima', N'dima', 7)
SET IDENTITY_INSERT [dbo].[Авторизация] OFF
INSERT [dbo].[Должности] ([КодДолжности], [Должность]) VALUES (1, N'Администратор')
INSERT [dbo].[Должности] ([КодДолжности], [Должность]) VALUES (2, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Клиент] ON 

INSERT [dbo].[Клиент] ([КодКлиента], [КодСотрудника], [КодСтатуса], [ФИО], [ДатаРождения], [КодАбонемента], [Паспорт]) VALUES (3, 6, 1, N'Голдобин Дмитрий Юрьевич', N'1 июня 2022 г.', 1, 123124125)
INSERT [dbo].[Клиент] ([КодКлиента], [КодСотрудника], [КодСтатуса], [ФИО], [ДатаРождения], [КодАбонемента], [Паспорт]) VALUES (4, 5, 1, N'test1', N'18 июня 2022 г.', NULL, 12345567)
INSERT [dbo].[Клиент] ([КодКлиента], [КодСотрудника], [КодСтатуса], [ФИО], [ДатаРождения], [КодАбонемента], [Паспорт]) VALUES (5, 5, 1, N'test2', N'18 июня 2022 г.', NULL, 12345567)
INSERT [dbo].[Клиент] ([КодКлиента], [КодСотрудника], [КодСтатуса], [ФИО], [ДатаРождения], [КодАбонемента], [Паспорт]) VALUES (6, 5, 1, N'test3', N'18 июня 2022 г.', 2, 12345567)
INSERT [dbo].[Клиент] ([КодКлиента], [КодСотрудника], [КодСтатуса], [ФИО], [ДатаРождения], [КодАбонемента], [Паспорт]) VALUES (7, 5, 1, N'test4', N'18 июня 2022 г.', NULL, 12345567)
INSERT [dbo].[Клиент] ([КодКлиента], [КодСотрудника], [КодСтатуса], [ФИО], [ДатаРождения], [КодАбонемента], [Паспорт]) VALUES (8, 5, 1, N'test5', N'18 июня 2022 г.', NULL, 12345567)
INSERT [dbo].[Клиент] ([КодКлиента], [КодСотрудника], [КодСтатуса], [ФИО], [ДатаРождения], [КодАбонемента], [Паспорт]) VALUES (9, 5, 1, N'test6', N'18 июня 2022 г.', NULL, 12345567)
INSERT [dbo].[Клиент] ([КодКлиента], [КодСотрудника], [КодСтатуса], [ФИО], [ДатаРождения], [КодАбонемента], [Паспорт]) VALUES (10, 5, 1, N'test7', N'18 июня 2022 г.', NULL, 12345567)
INSERT [dbo].[Клиент] ([КодКлиента], [КодСотрудника], [КодСтатуса], [ФИО], [ДатаРождения], [КодАбонемента], [Паспорт]) VALUES (11, 5, 1, N'test8', N'18 июня 2022 г.', NULL, 12345567)
INSERT [dbo].[Клиент] ([КодКлиента], [КодСотрудника], [КодСтатуса], [ФИО], [ДатаРождения], [КодАбонемента], [Паспорт]) VALUES (12, 5, 1, N'test9', N'18 июня 2022 г.', NULL, 12345567)
INSERT [dbo].[Клиент] ([КодКлиента], [КодСотрудника], [КодСтатуса], [ФИО], [ДатаРождения], [КодАбонемента], [Паспорт]) VALUES (13, 5, 1, N'test10', N'18 июня 2022 г.', NULL, 12345567)
SET IDENTITY_INSERT [dbo].[Клиент] OFF
SET IDENTITY_INSERT [dbo].[Сотрудники] ON 

INSERT [dbo].[Сотрудники] ([КодСотрудника], [ФИО], [КодДолжность], [Статус]) VALUES (1, N'Иванов Иван Иванович', 1, N'Штатный')
INSERT [dbo].[Сотрудники] ([КодСотрудника], [ФИО], [КодДолжность], [Статус]) VALUES (5, N'Vlados', 2, N'Штатный')
INSERT [dbo].[Сотрудники] ([КодСотрудника], [ФИО], [КодДолжность], [Статус]) VALUES (6, N'Большаков Игорь Алексеевич', 2, N'Штатный')
INSERT [dbo].[Сотрудники] ([КодСотрудника], [ФИО], [КодДолжность], [Статус]) VALUES (7, N'нагиев дмитрий олеговнич', 2, N'Уволен')
SET IDENTITY_INSERT [dbo].[Сотрудники] OFF
INSERT [dbo].[Статус] ([КодСтатуса], [Статус]) VALUES (1, N'Активный')
INSERT [dbo].[Статус] ([КодСтатуса], [Статус]) VALUES (2, N'Неактивный')
ALTER TABLE [dbo].[Абонемент]  WITH CHECK ADD  CONSTRAINT [FK_Абонемент_Посещаемость] FOREIGN KEY([КодПосещаемости])
REFERENCES [dbo].[Посещаемость] ([КодПосещаемости])
GO
ALTER TABLE [dbo].[Абонемент] CHECK CONSTRAINT [FK_Абонемент_Посещаемость]
GO
ALTER TABLE [dbo].[Авторизация]  WITH CHECK ADD  CONSTRAINT [FK_Авторизация_Сотрудники] FOREIGN KEY([КодРаботника])
REFERENCES [dbo].[Сотрудники] ([КодСотрудника])
GO
ALTER TABLE [dbo].[Авторизация] CHECK CONSTRAINT [FK_Авторизация_Сотрудники]
GO
ALTER TABLE [dbo].[Клиент]  WITH CHECK ADD  CONSTRAINT [FK_Клиент_Абонемент] FOREIGN KEY([КодАбонемента])
REFERENCES [dbo].[Абонемент] ([КодАбонемента])
GO
ALTER TABLE [dbo].[Клиент] CHECK CONSTRAINT [FK_Клиент_Абонемент]
GO
ALTER TABLE [dbo].[Клиент]  WITH CHECK ADD  CONSTRAINT [FK_Клиент_Сотрудники] FOREIGN KEY([КодСотрудника])
REFERENCES [dbo].[Сотрудники] ([КодСотрудника])
GO
ALTER TABLE [dbo].[Клиент] CHECK CONSTRAINT [FK_Клиент_Сотрудники]
GO
ALTER TABLE [dbo].[Клиент]  WITH CHECK ADD  CONSTRAINT [FK_Клиент_Статус] FOREIGN KEY([КодСтатуса])
REFERENCES [dbo].[Статус] ([КодСтатуса])
GO
ALTER TABLE [dbo].[Клиент] CHECK CONSTRAINT [FK_Клиент_Статус]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Должности] FOREIGN KEY([КодДолжность])
REFERENCES [dbo].[Должности] ([КодДолжности])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Должности]
GO
ALTER TABLE [dbo].[Тренировка]  WITH CHECK ADD  CONSTRAINT [FK_Тренировка_Клиент] FOREIGN KEY([КодКлиента])
REFERENCES [dbo].[Клиент] ([КодКлиента])
GO
ALTER TABLE [dbo].[Тренировка] CHECK CONSTRAINT [FK_Тренировка_Клиент]
GO
ALTER TABLE [dbo].[Тренировка]  WITH CHECK ADD  CONSTRAINT [FK_Тренировка_Услуги] FOREIGN KEY([КодУслуги])
REFERENCES [dbo].[Услуги] ([КодУслуги])
GO
ALTER TABLE [dbo].[Тренировка] CHECK CONSTRAINT [FK_Тренировка_Услуги]
GO
USE [master]
GO
ALTER DATABASE [sport] SET  READ_WRITE 
GO
