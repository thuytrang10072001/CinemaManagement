USE [master]
GO
/****** Object:  Database [CinemaManagement]    Script Date: 2023-10-22 11:32:03 AM ******/
CREATE DATABASE [CinemaManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CinemaManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CinemaManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CinemaManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CinemaManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CinemaManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CinemaManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CinemaManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CinemaManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CinemaManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CinemaManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CinemaManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [CinemaManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CinemaManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CinemaManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CinemaManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CinemaManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CinemaManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CinemaManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CinemaManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CinemaManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CinemaManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CinemaManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CinemaManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CinemaManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CinemaManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CinemaManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CinemaManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CinemaManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CinemaManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [CinemaManagement] SET  MULTI_USER 
GO
ALTER DATABASE [CinemaManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CinemaManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CinemaManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CinemaManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CinemaManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CinemaManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CinemaManagement', N'ON'
GO
ALTER DATABASE [CinemaManagement] SET QUERY_STORE = OFF
GO
USE [CinemaManagement]
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDBRA]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDBRA]()
RETURNS NCHAR(10)
AS
BEGIN
	DECLARE @ID NCHAR(10)
	IF (SELECT COUNT(idBra)
	FROM BRANCH) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(idBra, 8))
	FROM BRANCH
	SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'BR0000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'BR000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDFAC]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDFAC]()
RETURNS NCHAR(10)
AS
BEGIN
	DECLARE @ID NCHAR(10)
	IF (SELECT COUNT(idFac)
	FROM FACILITIES) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(idFac, 8))
	FROM FACILITIES
	SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'FT0000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'FT000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDMV]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDMV]()
RETURNS NCHAR(10)
AS
BEGIN
	DECLARE @ID NCHAR(10)
	IF (SELECT COUNT(idMovie)
	FROM MOVIE) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(idMovie, 8))
	FROM MOVIE
	SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'MV0000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'MV000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDPOS]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDPOS]()
RETURNS NCHAR(10)
AS
BEGIN
	DECLARE @ID NCHAR(10)
	IF (SELECT COUNT(idPos)
	FROM POSITION) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(idPos, 8))
	FROM POSITION
	SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'PS0000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'PS000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDRM]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDRM]()
RETURNS NCHAR(10)
AS
BEGIN
	DECLARE @ID NCHAR(10)
	IF (SELECT COUNT(idRoom)
	FROM ROOM) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(idRoom, 8))
	FROM ROOM
	SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'RM0000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'RM000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDST]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDST]()
RETURNS NCHAR(10)
AS
BEGIN
	DECLARE @ID NCHAR(10)
	IF (SELECT COUNT(idST)
	FROM SHOWTIME) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(idST, 8))
	FROM SHOWTIME
	SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'ST0000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'ST000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDSTAFF]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDSTAFF]()
RETURNS NCHAR(10)
AS
BEGIN
	DECLARE @ID NCHAR(10)
	IF (SELECT COUNT(idStaff)
	FROM STAFF) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(idStaff, 8))
	FROM STAFF
	SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'SF0000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'SF000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDTIC]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDTIC]()
RETURNS NCHAR(10)
AS
BEGIN
	DECLARE @ID NCHAR(10)
	IF (SELECT COUNT(idTic)
	FROM TICKET) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(idTic, 8))
	FROM TICKET
	SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'TK0000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'TK000000' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  Table [dbo].[BRANCH]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRANCH](
	[idBra] [nchar](10) NOT NULL,
	[nameBra] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idBra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROOM]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROOM](
	[idRoom] [nchar](10) NOT NULL,
	[nameRoom] [nvarchar](20) NOT NULL,
	[idStatus] [int] NOT NULL,
	[img] [text] NOT NULL,
	[idBra] [nchar](10) NOT NULL,
	[note] [nvarchar](1000) NULL,
	[capacity] [int] NULL,
	[row] [int] NULL,
	[col] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHOWTIME]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHOWTIME](
	[idST] [nchar](10) NOT NULL,
	[idMovie] [nchar](10) NOT NULL,
	[idTic] [nchar](10) NOT NULL,
	[idStatus] [int] NOT NULL,
	[showDateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idST] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HISTORY]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HISTORY](
	[idST] [nchar](10) NOT NULL,
	[idRoom] [nchar](10) NOT NULL,
	[dateHis] [datetime] NOT NULL,
	[timeHis] [varchar](10) NOT NULL,
	[idStatus] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_CHART_BRANCH]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CHART_BRANCH]
AS 
		SELECT DISTINCT s.idStatus, s.showDateTime, b.idBra, s.idST
		FROM SHOWTIME AS s
		INNER JOIN HISTORY AS h ON s.idST = h.idST
		INNER JOIN ROOM AS r ON r.idRoom = h.idRoom
		INNER JOIN BRANCH AS b ON r.idBra = b.idBra
GO
/****** Object:  Table [dbo].[MOVIE]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOVIE](
	[idMovie] [nchar](10) NOT NULL,
	[nameMovie] [nvarchar](100) NOT NULL,
	[proCountry] [nvarchar](20) NOT NULL,
	[preDate] [date] NOT NULL,
	[director] [nvarchar](100) NOT NULL,
	[actor] [nvarchar](100) NOT NULL,
	[genre] [nvarchar](100) NOT NULL,
	[idStatus] [int] NOT NULL,
	[img] [text] NOT NULL,
	[duration] [int] NOT NULL,
	[describe] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMovie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SHOWTIME_MOVIE]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SHOWTIME_MOVIE]
AS 
      SELECT ST.showDateTime, ST.idST, ST.idMovie, ST.idStatus, MV.duration
	  FROM SHOWTIME AS ST INNER JOIN MOVIE AS MV ON ST.idMovie = MV.idMovie
GO
/****** Object:  Table [dbo].[FACILITIES]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACILITIES](
	[idFac] [nchar](10) NOT NULL,
	[nameFac] [nvarchar](30) NOT NULL,
	[idRoom] [nchar](10) NOT NULL,
	[img] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HIS_FAC]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_FAC](
	[idFac] [nchar](10) NOT NULL,
	[dateHis] [datetime] NOT NULL,
	[idStatus] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POSITION]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POSITION](
	[idPos] [nchar](10) NOT NULL,
	[namePos] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEAT]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEAT](
	[idSeat] [int] NOT NULL,
	[idRow] [char](1) NOT NULL,
	[idRoom] [nchar](10) NOT NULL,
	[idStatus] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STAFF]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STAFF](
	[idStaff] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[dateBirth] [date] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[citiIden] [char](12) NOT NULL,
	[phone] [char](12) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[sex] [bit] NOT NULL,
	[pass] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idStaff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STAFF_POS]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STAFF_POS](
	[idPos] [nchar](10) NULL,
	[idStaff] [nchar](10) NOT NULL,
	[dayPro] [datetime] NOT NULL,
	[timePro] [varchar](10) NOT NULL,
	[idStatus] [int] NOT NULL,
	[idBra] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STATUS]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATUS](
	[idStatus] [int] NOT NULL,
	[nameStatus] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TICKET]    Script Date: 2023-10-22 11:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TICKET](
	[idTic] [nchar](10) NOT NULL,
	[nameTic] [nvarchar](20) NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BRANCH] ([idBra], [nameBra]) VALUES (N'BR00000001', N'Chi nhánh 1')
INSERT [dbo].[BRANCH] ([idBra], [nameBra]) VALUES (N'BR00000002', N'Chi nhánh 2')
INSERT [dbo].[BRANCH] ([idBra], [nameBra]) VALUES (N'BR00000003', N'Chi nhánh 3')
INSERT [dbo].[BRANCH] ([idBra], [nameBra]) VALUES (N'BR00000004', N'Chi nhánh 4')
GO
INSERT [dbo].[FACILITIES] ([idFac], [nameFac], [idRoom], [img]) VALUES (N'FT00000001', N'Máy lạnh 1', N'RM00000001', N'https://i.ibb.co/4wkT5d9/download-3.jpg')
INSERT [dbo].[FACILITIES] ([idFac], [nameFac], [idRoom], [img]) VALUES (N'FT00000002', N'Máy lạnh 2', N'RM00000001', N'https://i.ibb.co/4wkT5d9/download-3.jpg')
INSERT [dbo].[FACILITIES] ([idFac], [nameFac], [idRoom], [img]) VALUES (N'FT00000003', N'Màn hình', N'RM00000001', N'https://i.ibb.co/4wkT5d9/download-3.jpg')
INSERT [dbo].[FACILITIES] ([idFac], [nameFac], [idRoom], [img]) VALUES (N'FT00000004', N'Máy chiếu', N'RM00000001', N'https://i.ibb.co/4wkT5d9/download-3.jpg')
INSERT [dbo].[FACILITIES] ([idFac], [nameFac], [idRoom], [img]) VALUES (N'FT00000005', N'Máy lạnh 1', N'RM00000002', N'https://i.ibb.co/4wkT5d9/download-3.jpg')
INSERT [dbo].[FACILITIES] ([idFac], [nameFac], [idRoom], [img]) VALUES (N'FT00000006', N'Máy lạnh 2', N'RM00000002', N'https://i.ibb.co/4wkT5d9/download-3.jpg')
INSERT [dbo].[FACILITIES] ([idFac], [nameFac], [idRoom], [img]) VALUES (N'FT00000007', N'Máy chiếu', N'RM00000002', N'https://i.ibb.co/4wkT5d9/download-3.jpg')
INSERT [dbo].[FACILITIES] ([idFac], [nameFac], [idRoom], [img]) VALUES (N'FT00000008', N'Màn hình', N'RM00000002', N'https://i.ibb.co/4wkT5d9/download-3.jpg')
INSERT [dbo].[FACILITIES] ([idFac], [nameFac], [idRoom], [img]) VALUES (N'FT00000009', N'Rèm cửa', N'RM00000001', N'https://i.ibb.co/4wkT5d9/download-3.jpg')
GO
INSERT [dbo].[HIS_FAC] ([idFac], [dateHis], [idStatus]) VALUES (N'FT00000001', CAST(N'2023-10-21T17:44:56.333' AS DateTime), 0)
INSERT [dbo].[HIS_FAC] ([idFac], [dateHis], [idStatus]) VALUES (N'FT00000001', CAST(N'2023-10-21T17:44:56.337' AS DateTime), 1)
INSERT [dbo].[HIS_FAC] ([idFac], [dateHis], [idStatus]) VALUES (N'FT00000001', CAST(N'2023-10-21T17:44:56.337' AS DateTime), 0)
INSERT [dbo].[HIS_FAC] ([idFac], [dateHis], [idStatus]) VALUES (N'FT00000005', CAST(N'2023-10-21T17:44:56.337' AS DateTime), 0)
INSERT [dbo].[HIS_FAC] ([idFac], [dateHis], [idStatus]) VALUES (N'FT00000006', CAST(N'2023-10-21T17:44:56.337' AS DateTime), 0)
INSERT [dbo].[HIS_FAC] ([idFac], [dateHis], [idStatus]) VALUES (N'FT00000001', CAST(N'2023-10-21T17:44:56.340' AS DateTime), 1)
GO
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000002', N'RM00000001', CAST(N'2023-07-25T13:21:29.383' AS DateTime), N' 1:21PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000001', N'RM00000002', CAST(N'2023-07-25T13:50:01.467' AS DateTime), N' 1:50PM', 0)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000004', N'RM00000002', CAST(N'2023-07-25T14:34:31.930' AS DateTime), N' 2:34PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000003', N'RM00000003', CAST(N'2023-07-25T14:36:07.503' AS DateTime), N' 2:36PM', 0)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000003', N'RM00000002', CAST(N'2023-07-25T14:36:08.527' AS DateTime), N' 2:36PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000004', N'RM00000002', CAST(N'2023-07-25T14:37:37.423' AS DateTime), N' 2:37PM', 0)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000006', N'RM00000002', CAST(N'2023-07-26T11:36:23.337' AS DateTime), N'11:36AM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000011', N'RM00000002', CAST(N'2023-07-29T19:46:51.450' AS DateTime), N' 7:46PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000013', N'RM00000001', CAST(N'2023-07-31T21:46:41.483' AS DateTime), N' 9:46PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000015', N'RM00000003', CAST(N'2023-07-31T21:47:27.787' AS DateTime), N' 9:47PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000017', N'RM00000002', CAST(N'2023-07-31T21:48:38.967' AS DateTime), N' 9:48PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000018', N'RM00000003', CAST(N'2023-07-31T21:49:15.220' AS DateTime), N' 9:49PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000019', N'RM00000001', CAST(N'2023-08-01T17:52:51.973' AS DateTime), N' 5:52PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000021', N'RM00000003', CAST(N'2023-08-01T17:53:42.797' AS DateTime), N' 5:53PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000022', N'RM00000003', CAST(N'2023-08-01T17:59:25.270' AS DateTime), N' 5:59PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000023', N'RM00000002', CAST(N'2023-08-01T18:00:26.920' AS DateTime), N' 6:00PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000024', N'RM00000001', CAST(N'2023-08-01T18:01:23.377' AS DateTime), N' 6:01PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000027', N'RM00000001', CAST(N'2023-08-01T18:05:59.817' AS DateTime), N' 6:05PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000030', N'RM00000001', CAST(N'2023-08-01T18:12:15.647' AS DateTime), N' 6:12PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000031', N'RM00000001', CAST(N'2023-08-03T15:21:47.747' AS DateTime), N' 3:21PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000031', N'RM00000001', CAST(N'2023-08-03T15:22:08.993' AS DateTime), N' 3:22PM', 0)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000031', N'RM00000002', CAST(N'2023-08-03T15:22:10.003' AS DateTime), N' 3:22PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000032', N'RM00000003', CAST(N'2023-08-03T15:26:07.060' AS DateTime), N' 3:26PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000033', N'RM00000001', CAST(N'2023-08-03T15:58:37.340' AS DateTime), N' 3:58PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000036', N'RM00000003', CAST(N'2023-08-03T16:36:19.993' AS DateTime), N' 4:36PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000037', N'RM00000002', CAST(N'2023-08-03T19:55:25.837' AS DateTime), N' 7:55PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000040', N'RM00000001', CAST(N'2023-08-10T16:27:43.150' AS DateTime), N' 4:27PM', 0)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000042', N'RM00000001', CAST(N'2023-08-21T10:03:03.180' AS DateTime), N'10:03AM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000044', N'RM00000001', CAST(N'2023-08-23T14:08:09.083' AS DateTime), N' 2:08PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000045', N'RM00000002', CAST(N'2023-08-23T14:09:57.923' AS DateTime), N' 2:09PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000046', N'RM00000001', CAST(N'2023-09-27T14:08:02.920' AS DateTime), N' 2:08PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000047', N'RM00000003', CAST(N'2023-09-27T14:09:10.120' AS DateTime), N' 2:09PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000048', N'RM00000001', CAST(N'2023-09-27T14:09:42.220' AS DateTime), N' 2:09PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000051', N'RM00000001', CAST(N'2023-10-12T13:34:26.403' AS DateTime), N' 1:34PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000052', N'RM00000002', CAST(N'2023-10-20T16:17:37.437' AS DateTime), N' 4:17PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000053', N'RM00000002', CAST(N'2023-10-20T16:23:49.167' AS DateTime), N' 4:23PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000054', N'RM00000002', CAST(N'2023-10-20T16:26:14.017' AS DateTime), N' 4:26PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000054', N'RM00000002', CAST(N'2023-10-20T16:31:23.203' AS DateTime), N' 4:31PM', 0)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000055', N'RM00000001', CAST(N'2023-10-22T10:55:06.840' AS DateTime), N'10:55AM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000001', N'RM00000001', CAST(N'2023-07-25T13:06:22.060' AS DateTime), N' 1:06PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000001', N'RM00000001', CAST(N'2023-07-25T13:06:45.803' AS DateTime), N' 1:06PM', 0)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000001', N'RM00000002', CAST(N'2023-07-25T13:06:46.807' AS DateTime), N' 1:06PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000005', N'RM00000001', CAST(N'2023-07-26T11:23:46.810' AS DateTime), N'11:23AM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000009', N'RM00000001', CAST(N'2023-07-28T20:16:27.640' AS DateTime), N' 8:16PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000010', N'RM00000001', CAST(N'2023-07-29T19:37:15.177' AS DateTime), N' 7:37PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000011', N'RM00000002', CAST(N'2023-07-29T19:47:17.347' AS DateTime), N' 7:47PM', 0)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000011', N'RM00000003', CAST(N'2023-07-29T19:47:18.363' AS DateTime), N' 7:47PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000012', N'RM00000001', CAST(N'2023-07-30T19:52:37.430' AS DateTime), N' 7:52PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000014', N'RM00000002', CAST(N'2023-07-31T21:47:09.177' AS DateTime), N' 9:47PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000016', N'RM00000001', CAST(N'2023-07-31T21:48:11.060' AS DateTime), N' 9:48PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000020', N'RM00000002', CAST(N'2023-08-01T17:53:15.517' AS DateTime), N' 5:53PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000025', N'RM00000003', CAST(N'2023-08-01T18:04:00.500' AS DateTime), N' 6:04PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000026', N'RM00000002', CAST(N'2023-08-01T18:04:48.483' AS DateTime), N' 6:04PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000028', N'RM00000002', CAST(N'2023-08-01T18:06:13.613' AS DateTime), N' 6:06PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000029', N'RM00000003', CAST(N'2023-08-01T18:06:40.087' AS DateTime), N' 6:06PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000030', N'RM00000001', CAST(N'2023-08-01T18:13:42.767' AS DateTime), N' 6:13PM', 0)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000030', N'RM00000002', CAST(N'2023-08-01T18:13:43.773' AS DateTime), N' 6:13PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000038', N'RM00000001', CAST(N'2023-08-10T16:19:00.103' AS DateTime), N' 4:19PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000039', N'RM00000002', CAST(N'2023-08-10T16:20:10.870' AS DateTime), N' 4:20PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000040', N'RM00000001', CAST(N'2023-08-10T16:26:36.093' AS DateTime), N' 4:26PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000041', N'RM00000001', CAST(N'2023-08-10T16:30:02.540' AS DateTime), N' 4:30PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000003', N'RM00000003', CAST(N'2023-07-25T13:22:43.850' AS DateTime), N' 1:22PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000007', N'RM00000001', CAST(N'2023-07-26T22:18:30.890' AS DateTime), N'10:18PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000008', N'RM00000002', CAST(N'2023-07-26T22:18:55.650' AS DateTime), N'10:18PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000034', N'RM00000003', CAST(N'2023-08-03T16:22:27.323' AS DateTime), N' 4:22PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000034', N'RM00000003', CAST(N'2023-08-03T16:22:37.283' AS DateTime), N' 4:22PM', 0)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000035', N'RM00000002', CAST(N'2023-08-03T16:23:13.680' AS DateTime), N' 4:23PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000038', N'RM00000001', CAST(N'2023-08-10T16:21:38.220' AS DateTime), N' 4:21PM', 0)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000038', N'RM00000003', CAST(N'2023-08-10T16:21:39.227' AS DateTime), N' 4:21PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000043', N'RM00000002', CAST(N'2023-08-21T10:03:26.763' AS DateTime), N'10:03AM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000049', N'RM00000001', CAST(N'2023-10-10T12:23:32.240' AS DateTime), N'12:23PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000050', N'RM00000001', CAST(N'2023-10-10T12:29:35.233' AS DateTime), N'12:29PM', 1)
INSERT [dbo].[HISTORY] ([idST], [idRoom], [dateHis], [timeHis], [idStatus]) VALUES (N'ST00000050', N'RM00000001', CAST(N'2023-10-10T12:45:31.600' AS DateTime), N'12:45PM', 0)
GO
INSERT [dbo].[MOVIE] ([idMovie], [nameMovie], [proCountry], [preDate], [director], [actor], [genre], [idStatus], [img], [duration], [describe]) VALUES (N'MV00000001', N'NHIỆM VỤ BẤT KHẢ THI', N'Mỹ', CAST(N'2023-07-23' AS Date), N'Christopher McQuarrie', N'Tom Cruise, Rebecca Ferguson, Vanessa Kirby', N'Hành Động, Phiêu Lưu', 1, N'https://i.ibb.co/LgWB1DG/700x1000-7.jpg', 125, N'Phần phim thứ 7 của loạt phim Nhiệm Vụ Bất Khả Thi')
INSERT [dbo].[MOVIE] ([idMovie], [nameMovie], [proCountry], [preDate], [director], [actor], [genre], [idStatus], [img], [duration], [describe]) VALUES (N'MV00000002', N'XỨ SỞ CỦA CÁC NGUYÊN TỐ', N'Mỹ', CAST(N'2023-06-23' AS Date), N'Peter Sohn', N'Leah Lewis, Mamoudou Athie', N'Gia đình, Hài, Hoạt Hình', 1, N'https://i.ibb.co/Hzc6dmW/poster-official-preiview.jpg', 109, N'Xứ Sở Các Nguyên Tố từ Disney và Pixar lấy bối cảnh tại thành phố các nguyên tố, nơi lửa, nước, đất và không khí cùng chung sống với nhau. Câu chuyện xoay quanh nhân vật Ember, một cô nàng cá tính, thông minh, mạnh mẽ và đầy sức hút. Tuy nhiên, mối quan hệ của cô với Wade - một anh chàng hài hước, luôn thuận thế đẩy dòng - khiến Ember cảm thấy ngờ vực với thế giới này. Được đạo diễn bởi Peter Sohn, sản xuất bởi Denise Ream, và lồng tiếng bởi Leah Lewis (Ember) và Mamoudou Athie (Wade), phim dự kiến khởi chiếu tại rạp vào tháng 23.06.2023.')
INSERT [dbo].[MOVIE] ([idMovie], [nameMovie], [proCountry], [preDate], [director], [actor], [genre], [idStatus], [img], [duration], [describe]) VALUES (N'MV00000003', N'QUÝ CÔNG TỬ', N'Hàn Quốc', CAST(N'2023-06-23' AS Date), N'Park Hoon-jung', N'Kim Seon-Ho, Kang Tae-Ju, Go Ara, Kang-woo Kim', N'Hành Động', 1, N'https://i.ibb.co/k8Gz0Wv/poster-1-3-2.jpg', 109, N'Quý Công Tử xoay quanh người đàn ông bí ẩn được biết đến với tên gọi “Quý Công Tử”. Gã đột nhiên xuất hiện trước mắt Marco, một thanh niên người Philippines mơ ước trở thành vận động viên boxing chuyên nghiệp, lang thang khắp các sàn đấu bất hợp pháp tại đây. Nhằm chi trả cho viện phí của mẹ, Marco đến Hàn Quốc để tìm người cha đã bỏ rơi hai mẹ con cậu từ lâu. Đụng độ Quý Công Tử cùng hàng loạt những con người bí hiểm trong thế giới ngầm, Marco trở thành mục tiêu duy nhất của những thế lực mang nhiều mục đích khác nhau. Cuộc truy đuổi điên cuồng bắt đầu.')
INSERT [dbo].[MOVIE] ([idMovie], [nameMovie], [proCountry], [preDate], [director], [actor], [genre], [idStatus], [img], [duration], [describe]) VALUES (N'MV00000004', N'PHIM ĐIỆN ẢNH THÁM TỬ LỪNG DANH CONAN: TÀU NGẦM SẮT MÀU ĐEN', N'Nhật Bản', CAST(N'2023-07-21' AS Date), N'Yuzuru Tachikawa', N'Ran, Conan, Akai,...', N'Hành Động, Hoạt Hình, Phiêu Lưu', 1, N'https://i.ibb.co/NybZyRX/conan-movie-26-vietnamese-poster.jpg', 98, N'Thám Tử Lừng Danh Conan: Tàu Ngầm Sắt Màu Đen lấy bối cảnh tại Pacific Buoy - một trụ sở hàng hải của Interpol có nhiệm vụ kết nối các camera an ninh trên toàn thế giới. Nhóm của Conan, theo lời mời của Sonoko, cũng đến đảo Hachijo để xem cá voi. Tại đây, Conan nhận được thông tin về một nhân viên Europol bị ám sát. Cùng với đó, tính mạng Haibara bị đe dọa, phải chăng thân phận của cô đã bị bại lộ trước Gin…')
INSERT [dbo].[MOVIE] ([idMovie], [nameMovie], [proCountry], [preDate], [director], [actor], [genre], [idStatus], [img], [duration], [describe]) VALUES (N'MV00000005', N'DINH THỰ MA ÁM', N'Mỹ', CAST(N'2023-07-28' AS Date), N'Justin Simien', N'Jamie Lee Curtis, Owen Wilson, Rosario Dawson', N'Gia đình, Hài, Tâm Lý', 1, N'https://i.ibb.co/31nyR5Z/rsz-haunted-mansion-teaser-poster.jpg', 123, N'Nhà là nơi ma ám. Cùng xem đoạn trailer của bộ phim Dinh Thự Ma Ám sẽ được trình chiếu tại các cụm rạp vào ngày 28.07 này.')
INSERT [dbo].[MOVIE] ([idMovie], [nameMovie], [proCountry], [preDate], [director], [actor], [genre], [idStatus], [img], [duration], [describe]) VALUES (N'MV00000006', N'RESIDENT EVIL: ĐẢO TỬ THẦN', N'Mỹ', CAST(N'2023-07-07' AS Date), N'Eiichirō Hasumi', N'Erin Cahill, Kevin Dorman,', N'Hành động', 1, N'https://i.ibb.co/jVt2pnW/700x1000-9.jpg', 58, N'Sau bao ngày chờ đợi, dự án điện ảnh gợi ký ức tuổi thơ của nhiều thế hệ người Việt chính thức tung hình ảnh đầu tiên đầy cảm xúc. First look poster khắc họa hình ảnh đối lập: bé An đang ôm chặt mẹ giữa một khung cảnh chạy giặc loạn lạc. Cùng chờ đợi và theo dõi thêm hành trình bé An đi tìm cha khắp nam kỳ lục tỉnh cùng các người bạn đồng hành nhé!')
INSERT [dbo].[MOVIE] ([idMovie], [nameMovie], [proCountry], [preDate], [director], [actor], [genre], [idStatus], [img], [duration], [describe]) VALUES (N'MV00000007', N'ĐẤT RỪNG PHƯƠNG NAM', N'Việt Nam', CAST(N'2023-10-20' AS Date), N'Nguyễn Quang Dũng', N'Hồng Ánh, Huỳnh Hạo Khang, Mai Tài Phến, Công Ninh, Hứa Vĩ Văn, Tuyền Mập, Tuấn Trần.', N'Tâm lý', 1, N'https://i.ibb.co/Jty5FjX/rsz-first-look-social.jpg', 98, N'Sau bao ngày chờ đợi, dự án điện ảnh gợi ký ức tuổi thơ của nhiều thế hệ người Việt chính thức tung hình ảnh đầu tiên đầy cảm xúc. First look poster khắc họa hình ảnh đối lập: bé An đang ôm chặt mẹ giữa một khung cảnh chạy giặc loạn lạc. Cùng chờ đợi và theo dõi thêm hành trình bé An đi tìm cha khắp nam kỳ lục tỉnh cùng các người bạn đồng hành nhé!')
INSERT [dbo].[MOVIE] ([idMovie], [nameMovie], [proCountry], [preDate], [director], [actor], [genre], [idStatus], [img], [duration], [describe]) VALUES (N'MV00000008', N'OPPENHEIMER', N'Mỹ', CAST(N'2023-08-04' AS Date), N'Christopher Nolan', N'Cillian Murphy, Robert Downey Jr., Florence Pugh...', N'Hồi hộp, Lịch Sử, Tâm Lý', 1, N'https://i.ibb.co/JBxtvRJ/470x700-oppenheimer-1.jpg', 112, N'Với nhân vật trung tâm là J. Robert Oppenheimer, nhà vật lý lý thuyết người đứng đầu phòng thí nghiệm Los Alamos, thời kỳ Thế chiến II. Ông đóng vai trò quan trọng trong Dự án Manhattan, tiên phong trong nhiệm vụ phát triển vũ khí hạt nhân, và được coi là một trong những “cha đẻ của bom nguyên tử”.')
INSERT [dbo].[MOVIE] ([idMovie], [nameMovie], [proCountry], [preDate], [director], [actor], [genre], [idStatus], [img], [duration], [describe]) VALUES (N'MV00000009', N'THANH TRA SÁT NHÂN', N'Hàn Quốc', CAST(N'2023-07-28' AS Date), N'Kim Jae-hoon', N'Oh Dae-hwan, Jang Dong-yoon', N'Hồi hộp', 1, N'https://i.ibb.co/gF30Jbv/devils-main-poster.jpg', 102, N'Phim điện ảnh Thanh Tra Sát Nhân (tên tiếng Anh: Devils) của đạo diễn Kim Jae-hoon xoay quanh màn tráo đổi thân phận bí ẩn, ly kỳ của thanh tra Jae-hwan (Oh Dae-hwan thủ vai) và tên giết người hàng loạt Jin-hyuk (Jang Dong-yoon thủ vai). Kẻ phản diện sống cuộc đời chính nghĩa, người lương thiện lại bất đắc dĩ trở thành sát nhân, những tình tiết không tưởng liên tục xảy ra khiến người xem không thể rời mắt khỏi cuộc truy đuổi nghẹt thở giữa hai nhân vật.')
INSERT [dbo].[MOVIE] ([idMovie], [nameMovie], [proCountry], [preDate], [director], [actor], [genre], [idStatus], [img], [duration], [describe]) VALUES (N'MV00000010', N'TRĂM NĂM HẠNH PHÚC!', N'Thái Lan', CAST(N'2023-07-21' AS Date), N'Mook-Piyakarn Bootprasert', N'Chompoo Araya A. Hargate, Sunny Suwanmethanont, Becky Rebecca', N'Hài, Tâm Lý', 1, N'https://i.ibb.co/48zqrjG/700x1000-livelaughlove-1.jpg', 135, N'Chuyện tình sóng gió của Sati (Sunny Suwanmethanont) và Meta (Chompoo Araya) ngỡ chỉ còn thiếu 1 giọt nước...mắt nữa sẽ tràn ly thì Sati đã “suy” Meta sau cú “hôn đất” nhẹ tựa mây hồng, chỉ gây mất trí nhớ sương sương về quá khứ khá “bad” của mình. Sau khi cố chấp muốn lội về ngày xưa để lý giải cho hiện tại bất ổn của mình…Sati đã “lôi kéo” thêm vợ cũ và con gái Namo (Becky Rebecca) chung vui bằng cách cùng anh du hành thông qua những tấm hình được chụp bằng “chiếc máy ảnh xuyên không” mà Sati vô tình tìm được.. Từ đây, nhà có 3 người đã tạo ra những tình huống bá đạo tưởng hơi twist mà twist hơi nhiều!!')
INSERT [dbo].[MOVIE] ([idMovie], [nameMovie], [proCountry], [preDate], [director], [actor], [genre], [idStatus], [img], [duration], [describe]) VALUES (N'MV00000011', N'Đất Rừng Phương Nam', N'Việt Nam', CAST(N'2023-08-25' AS Date), N'An', N'An', N'Hài', 1, N'https://i.ibb.co/PmQKjpf/700x1000-7.jpg', 120, N'ebbewibuiewegg4g4y')
GO
INSERT [dbo].[POSITION] ([idPos], [namePos]) VALUES (N'PS00000001', N'Admin')
INSERT [dbo].[POSITION] ([idPos], [namePos]) VALUES (N'PS00000002', N'Quản lý')
INSERT [dbo].[POSITION] ([idPos], [namePos]) VALUES (N'PS00000003', N'Nhân viên')
INSERT [dbo].[POSITION] ([idPos], [namePos]) VALUES (N'PS00000004', N'Giám sát')
GO
INSERT [dbo].[ROOM] ([idRoom], [nameRoom], [idStatus], [img], [idBra], [note], [capacity], [row], [col]) VALUES (N'RM00000001', N'Phòng số 01', 0, N'https://i.ibb.co/4wkT5d9/download-3.jpg', N'BR00000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[ROOM] ([idRoom], [nameRoom], [idStatus], [img], [idBra], [note], [capacity], [row], [col]) VALUES (N'RM00000002', N'Phòng số 02', 0, N'https://i.ibb.co/WDSZ6PR/images.jpg', N'BR00000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[ROOM] ([idRoom], [nameRoom], [idStatus], [img], [idBra], [note], [capacity], [row], [col]) VALUES (N'RM00000003', N'Phòng số 03', 1, N'https://i.ibb.co/zFSMYnZ/download-4.jpg', N'BR00000003', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'A', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'A', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'A', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'A', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'A', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'A', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'A', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'A', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'B', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'B', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'B', N'RM00000001', 0)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'B', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'B', N'RM00000001', 0)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'B', N'RM00000001', 0)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'B', N'RM00000001', 0)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'B', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'C', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'C', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'C', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'C', N'RM00000001', 0)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'C', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'C', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'C', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'C', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'D', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'D', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'D', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'D', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'D', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'D', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'D', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'D', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'E', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'E', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'E', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'E', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'E', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'E', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'E', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'E', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'F', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'F', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'F', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'F', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'F', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'F', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'F', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'F', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'G', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'G', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'G', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'G', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'G', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'G', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'G', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'G', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'H', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'H', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'H', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'H', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'H', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'H', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'H', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'H', N'RM00000001', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'A', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'A', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'A', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'A', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'A', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'A', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'A', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'A', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'B', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'B', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'B', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'B', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'B', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'B', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'B', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'B', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'C', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'C', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'C', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'C', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'C', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'C', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'C', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'C', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'D', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'D', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'D', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'D', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'D', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'D', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'D', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'D', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'E', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'E', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'E', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'E', N'RM00000002', 1)
GO
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'E', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'E', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'E', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'E', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'F', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'F', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'F', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'F', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'F', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'F', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'F', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'F', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'G', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'G', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'G', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'G', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'G', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'G', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'G', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'G', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'H', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'H', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'H', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'H', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'H', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'H', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'H', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'H', N'RM00000002', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'A', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'A', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'A', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'A', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'A', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'A', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'A', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'A', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'B', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'B', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'B', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'B', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'B', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'B', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'B', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'B', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'C', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'C', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'C', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'C', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'C', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'C', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'C', N'RM00000003', 0)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'C', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'D', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'D', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'D', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'D', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'D', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'D', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'D', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'D', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'E', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'E', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'E', N'RM00000003', 0)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'E', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'E', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'E', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'E', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'E', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'F', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'F', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'F', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'F', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'F', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'F', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'F', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'F', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'G', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'G', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'G', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'G', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'G', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'G', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'G', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'G', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (1, N'H', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (2, N'H', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (3, N'H', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (4, N'H', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (5, N'H', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (6, N'H', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (7, N'H', N'RM00000003', 1)
INSERT [dbo].[SEAT] ([idSeat], [idRow], [idRoom], [idStatus]) VALUES (8, N'H', N'RM00000003', 1)
GO
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000001', N'MV00000006', N'TK00000001', 0, CAST(N'2023-07-25T17:10:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000002', N'MV00000002', N'TK00000001', 3, CAST(N'2023-07-25T10:50:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000003', N'MV00000004', N'TK00000001', 3, CAST(N'2023-07-25T13:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000004', N'MV00000007', N'TK00000001', 0, CAST(N'2023-07-25T20:30:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000005', N'MV00000001', N'TK00000001', 3, CAST(N'2023-07-26T12:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000006', N'MV00000004', N'TK00000001', 3, CAST(N'2023-07-26T11:40:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000007', N'MV00000002', N'TK00000001', 3, CAST(N'2023-07-26T22:20:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000008', N'MV00000005', N'TK00000001', 3, CAST(N'2023-07-26T22:30:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000009', N'MV00000007', N'TK00000001', 3, CAST(N'2023-07-28T20:20:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000010', N'MV00000001', N'TK00000002', 3, CAST(N'2023-07-29T22:40:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000011', N'MV00000002', N'TK00000002', 3, CAST(N'2023-07-29T19:35:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000012', N'MV00000001', N'TK00000001', 3, CAST(N'2023-07-30T19:40:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000013', N'MV00000001', N'TK00000001', 3, CAST(N'2023-07-31T21:50:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000014', N'MV00000004', N'TK00000001', 3, CAST(N'2023-07-31T21:50:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000015', N'MV00000010', N'TK00000001', 3, CAST(N'2023-07-31T21:50:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000016', N'MV00000009', N'TK00000001', 3, CAST(N'2023-08-01T10:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000017', N'MV00000005', N'TK00000001', 3, CAST(N'2023-08-01T10:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000018', N'MV00000006', N'TK00000001', 3, CAST(N'2023-08-01T10:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000019', N'MV00000002', N'TK00000001', 3, CAST(N'2023-08-01T18:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000020', N'MV00000007', N'TK00000001', 3, CAST(N'2023-08-01T18:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000021', N'MV00000006', N'TK00000001', 3, CAST(N'2023-08-01T18:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000022', N'MV00000003', N'TK00000001', 3, CAST(N'2023-08-01T19:30:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000023', N'MV00000004', N'TK00000001', 3, CAST(N'2023-08-01T20:10:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000024', N'MV00000002', N'TK00000001', 3, CAST(N'2023-08-01T20:20:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000025', N'MV00000009', N'TK00000001', 3, CAST(N'2023-08-01T21:50:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000026', N'MV00000004', N'TK00000001', 3, CAST(N'2023-08-01T22:20:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000027', N'MV00000001', N'TK00000001', 3, CAST(N'2023-08-02T10:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000028', N'MV00000005', N'TK00000001', 3, CAST(N'2023-08-02T10:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000029', N'MV00000008', N'TK00000001', 3, CAST(N'2023-08-02T10:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000030', N'MV00000003', N'TK00000001', 3, CAST(N'2023-08-01T00:30:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000031', N'MV00000001', N'TK00000001', 3, CAST(N'2023-08-03T15:30:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000032', N'MV00000002', N'TK00000001', 3, CAST(N'2023-08-03T15:30:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000033', N'MV00000004', N'TK00000001', 3, CAST(N'2023-08-03T16:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000034', N'MV00000005', N'TK00000001', 0, CAST(N'2023-08-03T17:50:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000035', N'MV00000007', N'TK00000001', 3, CAST(N'2023-08-03T17:40:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000036', N'MV00000010', N'TK00000001', 3, CAST(N'2023-08-03T17:40:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000037', N'MV00000004', N'TK00000001', 3, CAST(N'2023-08-03T20:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000038', N'MV00000001', N'TK00000001', 3, CAST(N'2023-08-10T16:20:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000039', N'MV00000002', N'TK00000001', 3, CAST(N'2023-08-10T16:25:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000040', N'MV00000002', N'TK00000001', 0, CAST(N'2023-08-10T16:30:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000041', N'MV00000001', N'TK00000001', 3, CAST(N'2023-08-11T16:30:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000042', N'MV00000001', N'TK00000001', 3, CAST(N'2023-08-21T21:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000043', N'MV00000005', N'TK00000001', 3, CAST(N'2023-08-21T22:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000044', N'MV00000011', N'TK00000001', 3, CAST(N'2023-08-24T07:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000045', N'MV00000011', N'TK00000001', 3, CAST(N'2023-08-24T09:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000046', N'MV00000011', N'TK00000001', 3, CAST(N'2023-09-28T09:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000047', N'MV00000011', N'TK00000001', 3, CAST(N'2023-09-28T09:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000048', N'MV00000011', N'TK00000001', 3, CAST(N'2023-09-27T17:00:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000049', N'MV00000002', N'TK00000002', 3, CAST(N'2023-10-10T00:45:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000050', N'MV00000002', N'TK00000001', 0, CAST(N'2023-10-10T12:32:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000051', N'MV00000003', N'TK00000001', 3, CAST(N'2023-10-12T13:35:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000052', N'MV00000002', N'TK00000001', 3, CAST(N'2023-10-20T00:10:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000053', N'MV00000002', N'TK00000001', 3, CAST(N'2023-10-20T20:21:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000054', N'MV00000001', N'TK00000002', 0, CAST(N'2023-10-20T16:27:00.000' AS DateTime))
INSERT [dbo].[SHOWTIME] ([idST], [idMovie], [idTic], [idStatus], [showDateTime]) VALUES (N'ST00000055', N'MV00000001', N'TK00000002', 1, CAST(N'2023-10-22T10:56:00.000' AS DateTime))
GO
INSERT [dbo].[STAFF] ([idStaff], [name], [dateBirth], [email], [citiIden], [phone], [address], [sex], [pass]) VALUES (N'SF00000001', N'nhat', CAST(N'2023-07-20' AS Date), N'lethithuytrang20070805@gmail.com', N'060301012077', N'+84923122952', N'97 Man Thien, Hiep Phu', 0, N'$2a$10$eIv1Ghy4u6Tb4G0v3YQgyubVelAYRCb9lZQF2qajdjffSKA6QoCSO')
INSERT [dbo].[STAFF] ([idStaff], [name], [dateBirth], [email], [citiIden], [phone], [address], [sex], [pass]) VALUES (N'SF00000002', N'Thuy Trang', CAST(N'2005-11-20' AS Date), N'lethithuytrang10072001@gmail.com', N'100000001212', N'+84917057613', N'Duc Long', 1, N'$2a$10$UdeyQ8SSVI1cxXVyw0HKwOttabo.Ym/zr8ec2bexapndA6WawEC5G')
INSERT [dbo].[STAFF] ([idStaff], [name], [dateBirth], [email], [citiIden], [phone], [address], [sex], [pass]) VALUES (N'SF00000003', N'Lê Thị Thùy Trang', CAST(N'2001-07-10' AS Date), N'myloveisyoona530@gmail.com', N'1413525526  ', N'+84917057613', N'97 Man Thien, Hiep Phu', 1, N'$2a$10$Uvq2UOyV4OFhqZGAVqdWPOPDtYcUGSr0tRMvicYXgZ03yRWig0Rd2')
INSERT [dbo].[STAFF] ([idStaff], [name], [dateBirth], [email], [citiIden], [phone], [address], [sex], [pass]) VALUES (N'SF00000004', N'Lê Thị Thùy Trang', CAST(N'2001-06-23' AS Date), N'thuyan054@gmail.com', N'1413525526  ', N'+84917057613', N'97 Man Thien, Hiep Phu', 1, N'$2a$10$d3WcYUQquEk.G5FoRVmtLe3Ie/L6zSvQvNP.dgsitCv40KbaJPsa6')
INSERT [dbo].[STAFF] ([idStaff], [name], [dateBirth], [email], [citiIden], [phone], [address], [sex], [pass]) VALUES (N'SF00000005', N'Lê Thị Thùy Trang', CAST(N'2023-10-20' AS Date), N'caothanhnhan2001@gmail.com', N'141352552634', N'+09170576136', N'97 Man Thien, Hiep Phu', 0, N'$2a$10$4jEdDy/doyMOpng/tvAycuYsOoqxNcHSPE2dwmusjMGeHfuXS9TTa')
INSERT [dbo].[STAFF] ([idStaff], [name], [dateBirth], [email], [citiIden], [phone], [address], [sex], [pass]) VALUES (N'SF00000006', N'Lùn', CAST(N'2023-10-18' AS Date), N'n19dccn125@student.ptithcm.edu.vn', N'141352552612', N'+84917057613', N'97 Man Thien, Hiep Phu', 1, N'$2a$10$Zug9Q71oW0I1L2XDmggDbeDa4N57T4t3Kb5lmedSCTEE4xo6XHca.')
INSERT [dbo].[STAFF] ([idStaff], [name], [dateBirth], [email], [citiIden], [phone], [address], [sex], [pass]) VALUES (N'SF00000007', N'Cố Vấn', CAST(N'2023-10-02' AS Date), N'n19dccn230@student.ptithcm.edu.vn', N'141352552612', N'+84917057613', N'97 Man Thien, Hiep Phu', 1, N'$2a$10$SgdZc/ZT./x1LCVKbuWskeQ8TU4kMKz7yJXTfwstgzE.1aPpDSesa')
GO
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000001', N'SF00000001', CAST(N'2023-07-12T00:00:00.000' AS DateTime), N'12:12AM', 1, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000002', N'SF00000002', CAST(N'2023-07-12T00:00:00.000' AS DateTime), N'12:12AM', 1, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000003', N'SF00000003', CAST(N'2023-08-10T16:00:27.137' AS DateTime), N' 4:00PM', 2, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000003', N'SF00000002', CAST(N'2023-07-16T00:00:00.000' AS DateTime), N' 4:54PM', 1, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000002', N'SF00000002', CAST(N'2023-07-19T00:00:00.000' AS DateTime), N' 1:23PM', 1, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000003', N'SF00000002', CAST(N'2023-08-01T17:07:53.430' AS DateTime), N' 5:07PM', 1, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000002', N'SF00000002', CAST(N'2023-08-01T17:09:43.697' AS DateTime), N' 5:09PM', 1, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000003', N'SF00000003', CAST(N'2023-08-10T16:02:10.217' AS DateTime), N' 4:02PM', 1, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000002', N'SF00000002', CAST(N'2023-08-10T16:06:50.020' AS DateTime), N' 4:06PM', 0, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000003', N'SF00000004', CAST(N'2023-08-23T13:56:25.900' AS DateTime), N' 1:56PM', 2, N'BR00000002')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000003', N'SF00000004', CAST(N'2023-08-23T13:57:33.620' AS DateTime), N' 1:57PM', 1, N'BR00000002')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000002', N'SF00000004', CAST(N'2023-08-23T14:02:43.370' AS DateTime), N' 2:02PM', 1, NULL)
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000002', N'SF00000002', CAST(N'2023-10-04T17:39:38.420' AS DateTime), N' 5:39PM', 1, N'BR00000003')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000003', N'SF00000002', CAST(N'2023-10-09T22:55:12.673' AS DateTime), N'10:55PM', 1, N'BR00000003')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000002', N'SF00000003', CAST(N'2023-10-10T01:03:15.600' AS DateTime), N' 1:03AM', 1, NULL)
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000002', N'SF00000002', CAST(N'2023-10-10T01:57:35.620' AS DateTime), N' 1:57AM', 1, NULL)
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000004', N'SF00000003', CAST(N'2023-10-19T12:53:30.733' AS DateTime), N'12:53PM', 0, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (NULL, N'SF00000005', CAST(N'2023-10-19T13:12:40.980' AS DateTime), N' 1:12PM', 2, NULL)
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000003', N'SF00000005', CAST(N'2023-10-19T14:17:39.600' AS DateTime), N' 2:17PM', 1, N'BR00000002')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (NULL, N'SF00000006', CAST(N'2023-10-20T15:25:29.197' AS DateTime), N' 3:25PM', 2, NULL)
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000002', N'SF00000006', CAST(N'2023-10-20T15:26:45.473' AS DateTime), N' 3:26PM', 1, NULL)
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (NULL, N'SF00000007', CAST(N'2023-10-20T15:32:11.040' AS DateTime), N' 3:32PM', 2, NULL)
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000003', N'SF00000007', CAST(N'2023-10-20T15:33:45.403' AS DateTime), N' 3:33PM', 1, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000003', N'SF00000005', CAST(N'2023-10-20T15:35:22.260' AS DateTime), N' 3:35PM', 0, N'BR00000002')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000004', N'SF00000004', CAST(N'2023-10-20T15:38:05.800' AS DateTime), N' 3:38PM', 1, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000004', N'SF00000004', CAST(N'2023-10-20T15:38:41.127' AS DateTime), N' 3:38PM', 1, N'BR00000002')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000004', N'SF00000004', CAST(N'2023-10-20T15:39:01.370' AS DateTime), N' 3:39PM', 1, N'BR00000003')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000004', N'SF00000003', CAST(N'2023-10-22T10:49:59.223' AS DateTime), N'10:49AM', 1, N'BR00000002')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000004', N'SF00000003', CAST(N'2023-10-22T10:50:44.107' AS DateTime), N'10:50AM', 1, N'BR00000003')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000004', N'SF00000003', CAST(N'2023-10-22T10:53:17.980' AS DateTime), N'10:53AM', 1, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000004', N'SF00000003', CAST(N'2023-10-20T16:16:12.200' AS DateTime), N' 4:16PM', 1, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000004', N'SF00000003', CAST(N'2023-10-10T11:37:41.490' AS DateTime), N'11:37AM', 1, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000003', N'SF00000004', CAST(N'2023-10-11T14:04:07.283' AS DateTime), N' 2:04PM', 1, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000002', N'SF00000002', CAST(N'2023-10-10T00:59:40.760' AS DateTime), N'12:59AM', 1, NULL)
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000003', N'SF00000002', CAST(N'2023-10-10T01:57:06.283' AS DateTime), N' 1:57AM', 1, N'BR00000001')
INSERT [dbo].[STAFF_POS] ([idPos], [idStaff], [dayPro], [timePro], [idStatus], [idBra]) VALUES (N'PS00000004', N'SF00000002', CAST(N'2023-10-10T01:57:23.560' AS DateTime), N' 1:57AM', 1, N'BR00000001')
GO
INSERT [dbo].[STATUS] ([idStatus], [nameStatus]) VALUES (0, N'Khóa(Nhân viên) , Ngừng chiếu(Phim), Đã hủy(Lịch chiếu-Lịch sử), Hỏng(Phòng-Ghế)')
INSERT [dbo].[STATUS] ([idStatus], [nameStatus]) VALUES (1, N'Đang hoạt động(Nhân viên), Đang chiếu(Lịch chiếu-Phim), Đã đặt(Lịch sử), Ổn(Phòng-Ghế)')
INSERT [dbo].[STATUS] ([idStatus], [nameStatus]) VALUES (2, N'Sắp chiếu(Lịch chiếu), Chưa cấp(Nhân viên-Lịch sử)')
INSERT [dbo].[STATUS] ([idStatus], [nameStatus]) VALUES (3, N'Đã chiếu(Lịch chiếu)')
GO
INSERT [dbo].[TICKET] ([idTic], [nameTic], [price]) VALUES (N'TK00000001', N'Ngày thường', 60000)
INSERT [dbo].[TICKET] ([idTic], [nameTic], [price]) VALUES (N'TK00000002', N'Cuối tuần', 95000)
INSERT [dbo].[TICKET] ([idTic], [nameTic], [price]) VALUES (N'TK00000003', N'Lễ ', 125000)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uc_seatId]    Script Date: 2023-10-22 11:32:04 AM ******/
ALTER TABLE [dbo].[SEAT] ADD  CONSTRAINT [uc_seatId] UNIQUE NONCLUSTERED 
(
	[idSeat] ASC,
	[idRow] ASC,
	[idRoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BRANCH] ADD  CONSTRAINT [DF_BRANCH_idBra]  DEFAULT ([dbo].[AUTO_IDBRA]()) FOR [idBra]
GO
ALTER TABLE [dbo].[FACILITIES] ADD  CONSTRAINT [DF_FACILITIES_idFac]  DEFAULT ([dbo].[AUTO_IDFAC]()) FOR [idFac]
GO
ALTER TABLE [dbo].[HIS_FAC] ADD  CONSTRAINT [DF__HIS_FAC__dateHis__48CFD27E]  DEFAULT (getdate()) FOR [dateHis]
GO
ALTER TABLE [dbo].[HISTORY] ADD  CONSTRAINT [DF__HISTORY__dateHis__48CFD27E]  DEFAULT (getdate()) FOR [dateHis]
GO
ALTER TABLE [dbo].[HISTORY] ADD  DEFAULT (right(CONVERT([varchar],getdate(),(100)),(7))) FOR [timeHis]
GO
ALTER TABLE [dbo].[MOVIE] ADD  CONSTRAINT [DF_MOVIE_idMovie]  DEFAULT ([dbo].[AUTO_IDMV]()) FOR [idMovie]
GO
ALTER TABLE [dbo].[POSITION] ADD  CONSTRAINT [DF_POSITION_idPos]  DEFAULT ([dbo].[AUTO_IDPOS]()) FOR [idPos]
GO
ALTER TABLE [dbo].[ROOM] ADD  CONSTRAINT [DF_ROOM_idRoom]  DEFAULT ([dbo].[AUTO_IDRM]()) FOR [idRoom]
GO
ALTER TABLE [dbo].[SHOWTIME] ADD  CONSTRAINT [DF_SHOWTIME_idST]  DEFAULT ([dbo].[AUTO_IDST]()) FOR [idST]
GO
ALTER TABLE [dbo].[STAFF] ADD  CONSTRAINT [DF_STAFF_idStaff]  DEFAULT ([dbo].[AUTO_IDSTAFF]()) FOR [idStaff]
GO
ALTER TABLE [dbo].[STAFF_POS] ADD  CONSTRAINT [DF__STAFF_POS__dayPro__48CFD27E]  DEFAULT (getdate()) FOR [dayPro]
GO
ALTER TABLE [dbo].[STAFF_POS] ADD  DEFAULT (right(CONVERT([varchar],getdate(),(100)),(7))) FOR [timePro]
GO
ALTER TABLE [dbo].[TICKET] ADD  CONSTRAINT [DF_TICKET_idTic]  DEFAULT ([dbo].[AUTO_IDTIC]()) FOR [idTic]
GO
ALTER TABLE [dbo].[FACILITIES]  WITH CHECK ADD FOREIGN KEY([idRoom])
REFERENCES [dbo].[ROOM] ([idRoom])
GO
ALTER TABLE [dbo].[HIS_FAC]  WITH CHECK ADD FOREIGN KEY([idFac])
REFERENCES [dbo].[FACILITIES] ([idFac])
GO
ALTER TABLE [dbo].[HIS_FAC]  WITH CHECK ADD FOREIGN KEY([idStatus])
REFERENCES [dbo].[STATUS] ([idStatus])
GO
ALTER TABLE [dbo].[HISTORY]  WITH CHECK ADD FOREIGN KEY([idRoom])
REFERENCES [dbo].[ROOM] ([idRoom])
GO
ALTER TABLE [dbo].[HISTORY]  WITH CHECK ADD FOREIGN KEY([idST])
REFERENCES [dbo].[SHOWTIME] ([idST])
GO
ALTER TABLE [dbo].[HISTORY]  WITH CHECK ADD FOREIGN KEY([idStatus])
REFERENCES [dbo].[STATUS] ([idStatus])
GO
ALTER TABLE [dbo].[MOVIE]  WITH CHECK ADD FOREIGN KEY([idStatus])
REFERENCES [dbo].[STATUS] ([idStatus])
GO
ALTER TABLE [dbo].[ROOM]  WITH CHECK ADD FOREIGN KEY([idBra])
REFERENCES [dbo].[BRANCH] ([idBra])
GO
ALTER TABLE [dbo].[ROOM]  WITH CHECK ADD FOREIGN KEY([idStatus])
REFERENCES [dbo].[STATUS] ([idStatus])
GO
ALTER TABLE [dbo].[SEAT]  WITH CHECK ADD FOREIGN KEY([idRoom])
REFERENCES [dbo].[ROOM] ([idRoom])
GO
ALTER TABLE [dbo].[SEAT]  WITH CHECK ADD FOREIGN KEY([idStatus])
REFERENCES [dbo].[STATUS] ([idStatus])
GO
ALTER TABLE [dbo].[SHOWTIME]  WITH CHECK ADD FOREIGN KEY([idMovie])
REFERENCES [dbo].[MOVIE] ([idMovie])
GO
ALTER TABLE [dbo].[SHOWTIME]  WITH CHECK ADD FOREIGN KEY([idStatus])
REFERENCES [dbo].[STATUS] ([idStatus])
GO
ALTER TABLE [dbo].[SHOWTIME]  WITH CHECK ADD FOREIGN KEY([idTic])
REFERENCES [dbo].[TICKET] ([idTic])
GO
ALTER TABLE [dbo].[STAFF_POS]  WITH CHECK ADD FOREIGN KEY([idBra])
REFERENCES [dbo].[BRANCH] ([idBra])
GO
ALTER TABLE [dbo].[STAFF_POS]  WITH CHECK ADD FOREIGN KEY([idPos])
REFERENCES [dbo].[POSITION] ([idPos])
GO
ALTER TABLE [dbo].[STAFF_POS]  WITH CHECK ADD FOREIGN KEY([idStatus])
REFERENCES [dbo].[STATUS] ([idStatus])
GO
ALTER TABLE [dbo].[STAFF_POS]  WITH CHECK ADD FOREIGN KEY([idStaff])
REFERENCES [dbo].[STAFF] ([idStaff])
GO
/****** Object:  StoredProcedure [dbo].[SP_CHART_ROOM ]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CHART_ROOM ]
  @Month INT,
  @Year INT,
  @Key INT, 
  @Fac Nchar(10)
AS
BEGIN
  -- Tạo bảng tạm để lưu trữ kết quả
  CREATE TABLE #TempResult (ScheduleDate DATE, CanceledSchedulesCount INT)

  -- Biến ngày đầu và ngày cuối của tháng
  DECLARE @StartDate DATE, @EndDate DATE
  SET @StartDate = DATEFROMPARTS(@Year, @Month, 1)
  SET @EndDate = DATEADD(DAY, -1, DATEADD(MONTH, 1, @StartDate))

  -- Biến dùng để lặp qua các ngày trong tháng
  DECLARE @CurrentDate DATE
  SET @CurrentDate = @StartDate

  -- Lặp qua các ngày trong tháng và tính số lượng lịch chiếu bị hủy cho từng ngày
  /*IF @key = 1
  BEGIN
	  WHILE @CurrentDate <= @EndDate
	  BEGIN
		INSERT INTO #TempResult (ScheduleDate, CanceledSchedulesCount)
		SELECT @CurrentDate, COUNT(*) AS CanceledSchedulesCount
		FROM HISTORY
		WHERE CAST(dateHis AS DATE) = @CurrentDate AND idStatus = 1;

		SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate)
	  END
  END
  ELSE
  BEGIN
  	  WHILE @CurrentDate <= @EndDate
	  BEGIN
		INSERT INTO #TempResult (ScheduleDate, CanceledSchedulesCount)
		SELECT @CurrentDate, COUNT(*) AS CanceledSchedulesCount
		FROM HISTORY
		WHERE CAST(dateHis AS DATE) = @CurrentDate AND idStatus = 0;

		SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate)
	  END
  END*/
  IF @key = 1
  BEGIN
	  WHILE @CurrentDate <= @EndDate
	  BEGIN
		INSERT INTO #TempResult (ScheduleDate, CanceledSchedulesCount)
		SELECT @CurrentDate, COUNT(*) AS CanceledSchedulesCount
		FROM HIS_FAC
		WHERE CAST(dateHis AS DATE) = @CurrentDate AND idStatus = 1 AND idFac = @Fac;

		SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate)
	  END
  END
  ELSE
  BEGIN
  	  WHILE @CurrentDate <= @EndDate
	  BEGIN
		INSERT INTO #TempResult (ScheduleDate, CanceledSchedulesCount)
		SELECT @CurrentDate, COUNT(*) AS CanceledSchedulesCount
		FROM HIS_FAC
		WHERE CAST(dateHis AS DATE) = @CurrentDate AND idStatus = 0  AND idFac = @Fac;

		SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate)
	  END
  END
  -- Trả về kết quả từ bảng tạm
  SELECT CanceledSchedulesCount
  FROM #TempResult

  -- Xóa bảng tạm sau khi sử dụng xong
  DROP TABLE #TempResult

END
GO
/****** Object:  StoredProcedure [dbo].[SP_CHART_SHOWTIME]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CHART_SHOWTIME]
  @Month INT,
  @Year INT,
  @Key INT, 
  @Bra Nchar(10)
AS
BEGIN
  -- Tạo bảng tạm để lưu trữ kết quả
  CREATE TABLE #TempResult (ScheduleDate DATE, CanceledSchedulesCount INT)

  -- Biến ngày đầu và ngày cuối của tháng
  DECLARE @StartDate DATE, @EndDate DATE
  SET @StartDate = DATEFROMPARTS(@Year, @Month, 1)
  SET @EndDate = DATEADD(DAY, -1, DATEADD(MONTH, 1, @StartDate))

  -- Biến dùng để lặp qua các ngày trong tháng
  DECLARE @CurrentDate DATE
  SET @CurrentDate = @StartDate

  -- Lặp qua các ngày trong tháng và tính số lượng lịch chiếu bị hủy cho từng ngày
  IF @key = 1
  BEGIN
  IF @Bra = ''
  BEGIN
	  WHILE @CurrentDate <= @EndDate
	  BEGIN
		INSERT INTO #TempResult (ScheduleDate, CanceledSchedulesCount)
		SELECT @CurrentDate, COUNT(*) AS CanceledSchedulesCount
		FROM SHOWTIME
		WHERE CAST(showDateTime AS DATE) = @CurrentDate AND idStatus = 3;

		SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate)
	  END
  END
  ELSE
  BEGIN
	WHILE @CurrentDate <= @EndDate
	  BEGIN
		INSERT INTO #TempResult (ScheduleDate, CanceledSchedulesCount)
		SELECT @CurrentDate, COUNT(*) AS CanceledSchedulesCount
		FROM V_CHART_BRANCH
		WHERE CAST(showDateTime AS DATE) = @CurrentDate AND idStatus = 3 AND idBra = @Bra;

		SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate)
	  END
  END
  END
  ELSE
  IF @Bra = ''
  BEGIN
  	  WHILE @CurrentDate <= @EndDate
	  BEGIN
		INSERT INTO #TempResult (ScheduleDate, CanceledSchedulesCount)
		SELECT @CurrentDate, COUNT(*) AS CanceledSchedulesCount
		FROM SHOWTIME
		WHERE CAST(showDateTime AS DATE) = @CurrentDate AND idStatus = 0;

		SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate)
	  END
  END
  ELSE
  BEGIN
  	  WHILE @CurrentDate <= @EndDate
	  BEGIN
		INSERT INTO #TempResult (ScheduleDate, CanceledSchedulesCount)
		SELECT @CurrentDate, COUNT(*) AS CanceledSchedulesCount
		FROM V_CHART_BRANCH
		WHERE CAST(showDateTime AS DATE) = @CurrentDate AND idStatus = 0 AND idBra = @Bra;

		SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate)
	  END
  END
  -- Trả về kết quả từ bảng tạm
  SELECT CanceledSchedulesCount
  FROM #TempResult

  -- Xóa bảng tạm sau khi sử dụng xong
  DROP TABLE #TempResult

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_BRANCH]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DELETE_BRANCH]
	@idBra nchar(10)
AS
BEGIN
	IF EXISTS (SELECT * FROM ROOM WHERE @idBra = idBra ) 
	BEGIN
		RETURN 0;
	END
	IF EXISTS (SELECT * FROM STAFF_POS WHERE @idBra = idBra ) 
	BEGIN
		RETURN 0;
	END
	DELETE FROM BRANCH WHERE idBra = @idBra
	RETURN 1;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_LIST_BRANCH]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GET_LIST_BRANCH]
	@keyword NVARCHAR(100)
AS
BEGIN
	/*IF @keyword = null
	BEGIN 
		SELECT *
		FROM BRANCH
	END
	ELSE
	BEGIN
		SELECT *
		FROM BRANCH AS b
		WHERE (b.nameBra LIKE '%' + @keyword + '%'
			   OR b.idBra LIKE '%' + @keyword + '%')
	END	*/
	SELECT *
	FROM BRANCH AS b
	WHERE (b.nameBra LIKE '%' + @keyword + '%'
		OR b.idBra LIKE '%' + @keyword + '%')
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_LIST_SHOWTIME]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[SP_GET_LIST_SHOWTIME]
	@key Bit,
	@start Datetime, 
	@end Datetime,
	@keyword Nvarchar(100),
	@idBra Nchar(10)
AS
BEGIN
	--Update status showtime
    UPDATE V_SHOWTIME_MOVIE
    SET idStatus = 
        CASE 
            WHEN GETDATE() BETWEEN showDateTime  AND (DATEADD(MINUTE, duration + 15, showDateTime))  AND idStatus != 0 THEN 1 -- Đang chiếu
			WHEN GETDATE() < showDateTime AND idStatus != 0 THEN 2 -- Sắp chiếu			
			WHEN GETDATE() >  (DATEADD(MINUTE, duration + 15, showDateTime)) AND idStatus != 0 THEN 3 -- Đã chiếu
			ELSE 0 --Đã hủy
        END;

	-- Select list showtime in day
	IF @idBra = ''
	BEGIN
	IF @key = 0
	BEGIN
	SELECT ST.idST, ST.idTic, ST.idMovie, ST.idStatus,MV.nameMovie, MV.img, MV.duration, RM.nameRoom,RM.idRoom, RM.idStatus AS statusRoom, TK.nameTic,ST.showDateTime
    FROM SHOWTIME AS ST
      INNER JOIN MOVIE AS MV ON ST.idMovie = MV.idMovie
      INNER JOIN TICKET AS TK ON ST.idTic = TK.idTic
      INNER JOIN HISTORY AS HT ON ST.idST = HT.idST 
      INNER JOIN ROOM AS RM ON HT.idRoom = RM.idRoom 
    WHERE (ST.idST LIKE '%' + @keyword + '%' OR RM.nameRoom LIKE '%' + @keyword + '%'
       OR MV.nameMovie LIKE '%' + @keyword + '%') 
	   AND CAST(ST.showDateTime AS DATE) = CAST(GETDATE() AS DATE) 
	   AND HT.dateHis IN (
		SELECT MAX(dateHis)
		FROM HISTORY AS HT
		WHERE idST = ST.idST
    )
    ORDER BY ST.idST ASC 
	END
	ELSE -- Select list showtime from ... to ...
	BEGIN
	SELECT ST.idST, ST.idTic, ST.idMovie, ST.idStatus,MV.nameMovie, MV.img, MV.duration, RM.nameRoom,RM.idRoom, RM.idStatus AS statusRoom, TK.nameTic,ST.showDateTime
      FROM SHOWTIME AS ST
        INNER JOIN MOVIE AS MV ON ST.idMovie = MV.idMovie
        INNER JOIN TICKET AS TK ON ST.idTic = TK.idTic
        INNER JOIN HISTORY AS HT ON ST.idST = HT.idST 
        INNER JOIN ROOM AS RM ON HT.idRoom = RM.idRoom 
      WHERE  (ST.idST LIKE '%' + @keyword + '%' OR RM.nameRoom LIKE '%' + @keyword + '%'
       OR MV.nameMovie LIKE '%' + @keyword + '%')
	   AND CAST(showDateTime AS DATE) <= CAST(@end AS DATE) AND CAST(showDateTime AS DATE) >= CAST(@start AS DATE) 
	   AND HT.dateHis IN (
        SELECT MAX(dateHis)
        FROM HISTORY AS HT
        WHERE idST = ST.idST
      )
      ORDER BY ST.idST ASC 
	END
	END
	ELSE 
	BEGIN
	IF @key = 0
	BEGIN
	SELECT ST.idST, ST.idTic, ST.idMovie, ST.idStatus,MV.nameMovie, MV.img, MV.duration, RM.nameRoom,RM.idRoom, RM.idStatus AS statusRoom, TK.nameTic,ST.showDateTime
    FROM SHOWTIME AS ST
      INNER JOIN MOVIE AS MV ON ST.idMovie = MV.idMovie
      INNER JOIN TICKET AS TK ON ST.idTic = TK.idTic
      INNER JOIN HISTORY AS HT ON ST.idST = HT.idST 
      INNER JOIN ROOM AS RM ON HT.idRoom = RM.idRoom 
    WHERE (ST.idST LIKE '%' + @keyword + '%' OR RM.nameRoom LIKE '%' + @keyword + '%'
       OR MV.nameMovie LIKE '%' + @keyword + '%') 
	   AND CAST(ST.showDateTime AS DATE) = CAST(GETDATE() AS DATE) 
	   AND RM.idBra = @idBra
	   AND HT.dateHis IN (
		SELECT MAX(dateHis)
		FROM HISTORY AS HT
		WHERE idST = ST.idST
    )
    ORDER BY ST.idST ASC 
	END
	ELSE -- Select list showtime from ... to ...
	BEGIN
	SELECT ST.idST, ST.idTic, ST.idMovie, ST.idStatus,MV.nameMovie, MV.img, MV.duration, RM.nameRoom,RM.idRoom, RM.idStatus AS statusRoom, TK.nameTic,ST.showDateTime
      FROM SHOWTIME AS ST
        INNER JOIN MOVIE AS MV ON ST.idMovie = MV.idMovie
        INNER JOIN TICKET AS TK ON ST.idTic = TK.idTic
        INNER JOIN HISTORY AS HT ON ST.idST = HT.idST 
        INNER JOIN ROOM AS RM ON HT.idRoom = RM.idRoom 
      WHERE  (ST.idST LIKE '%' + @keyword + '%' OR RM.nameRoom LIKE '%' + @keyword + '%'
       OR MV.nameMovie LIKE '%' + @keyword + '%')
	   AND CAST(showDateTime AS DATE) <= CAST(@end AS DATE) AND CAST(showDateTime AS DATE) >= CAST(@start AS DATE) 
	   AND RM.idBra = @idBra
	   AND HT.dateHis IN (
        SELECT MAX(dateHis)
        FROM HISTORY AS HT
        WHERE idST = ST.idST
      )
      ORDER BY ST.idST ASC 
	END
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_LIST_STAFF]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GET_LIST_STAFF]
AS
BEGIN
SELECT s.idStaff,s.name, s.phone, s.email, h.idPos, h.idStatus
FROM STAFF as s
LEFT JOIN STAFF_POS h ON s.idStaff  = h.idStaff
WHERE s.idStaff != 'SF00000001' and h.dayPro = (
    SELECT MAX(dayPro)
    FROM STAFF_POS
    WHERE idStaff = s.idStaff
)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_BRANCH]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_INSERT_BRANCH]
@nameBra nvarchar(50)
AS
BEGIN
	IF EXISTS (SELECT * FROM BRANCH WHERE LOWER(nameBra) = LOWER(@nameBra)) 
	BEGIN
		return 0;
	END
	ELSE
	BEGIN 
		INSERT INTO BRANCH(nameBra) VALUES(@nameBra)
		return 1;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_DS_LICH_CHIEU_HOM_NAY]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_LAY_DS_LICH_CHIEU_HOM_NAY]

AS
BEGIN
	SELECT ST.idST, ST.idTic, ST.idMovie, ST.idStatus, MV.nameMovie, RM.nameRoom, TK.nameTic,ST.showDateTime
FROM SHOWTIME AS ST
	INNER JOIN MOVIE AS MV ON ST.idMovie = MV.idMovie
    INNER JOIN TICKET AS TK ON ST.idTic = TK.idTic
	INNER JOIN HISTORY AS HT ON ST.idST = HT.idST 
	INNER JOIN ROOM AS RM ON HT.idRoom = RM.idRoom 
WHERE CAST(ST.showDateTime AS DATE) = CAST(GETDATE() AS DATE) and HT.dateHis IN (
    SELECT MAX(dateHis)
    FROM HISTORY AS HT
    WHERE idST = ST.idST
)
ORDER BY ST.idST ASC 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_PHONG_TRONG]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LAY_PHONG_TRONG]
    @start DATETIME,
	@duration INT,
	@idST Nchar(10), 
	@idBra Nchar(10)
AS
BEGIN
    -- Chọn các phòng trống vào thời điểm mình chọn
    SELECT *
    FROM ROOM
    WHERE idStatus != 0 AND idBra = @idBra AND idRoom NOT IN (
        SELECT idRoom
        FROM HISTORY HT 
			INNER JOIN SHOWTIME ST ON HT.idST = ST.idST  AND ST.idStatus != 0
			INNER JOIN MOVIE MV ON MV.idMovie = ST.idMovie
        WHERE (ST.showDateTime = @start
            OR @start BETWEEN ST.showDateTime AND DATEADD(MINUTE, MV.duration +30, ST.showDateTime)			
			OR ST.showDateTime BETWEEN @start AND DATEADD(MINUTE, @duration + 30, @start))
		AND ST.idST != @idST AND HT.idStatus = 1 AND HT.dateHis = (SELECT MAX(dateHis) FROM HISTORY WHERE HT.idRoom = idRoom)
				--AND CAST(DATEADD(MINUTE, @duration + 15, @start) AS DATE) =  CAST(ST.showDateTime AS DATE)
    );
END;

SELECT *
FROM HISTORY
WHERE idStatus = 1 
GO
/****** Object:  StoredProcedure [dbo].[SP_SEARCH_MOVIE]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SEARCH_MOVIE]
    @keyword NVARCHAR(100)
AS
BEGIN
	SELECT * 
	FROM MOVIE
	WHERE nameMovie LIKE '%' + @keyword + '%'
       OR idMovie LIKE '%' + @keyword + '%'
       OR proCountry LIKE '%' + @keyword + '%'
       OR preDate LIKE '%' + @keyword + '%'
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SEARCH_ROOM]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SEARCH_ROOM]
    @keyword NVARCHAR(100),
	@idBranch NCHAR(10)
AS
BEGIN
   if (@idBranch='')
	SELECT * 
	FROM ROOM
	WHERE (nameRoom LIKE '%' + @keyword + '%'
       OR idRoom LIKE '%' + @keyword + '%')
else
	SELECT * 
	FROM ROOM
	WHERE (nameRoom LIKE '%' + @keyword + '%'
       OR idRoom LIKE '%' + @keyword + '%')
	   AND idBra =@idBranch
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SEARCH_STAFF]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SEARCH_STAFF]
    @keyword NVARCHAR(100),
	@idBra NCHAR(10),
	@key Int
AS
BEGIN
	IF @key = 0
	IF @idBra = ''
	BEGIN
	    SELECT s.idStaff,s.name, s.phone, s.email, s.address, s.citiIden, s.dateBirth,s.sex, h.idStatus, p.namePos, p.idPos, b.idBra, b.nameBra
		FROM STAFF as s
		LEFT JOIN STAFF_POS h ON s.idStaff  = h.idStaff 
		INNER JOIN POSITION p ON p.idPos = h.idPos
		INNER JOIN BRANCH b ON b.idBra = h.idBra
		WHERE (s.name LIKE '%' + @keyword + '%'
		   OR s.idStaff LIKE '%' + @keyword + '%' 
		   OR p.namePos LIKE '%' + @keyword + '%') 
		   AND s.idStaff != 'SF00000001' 
		   AND h.idPos != 'PS00000002'
		   AND h.dayPro = (
			SELECT MAX(dayPro)
			FROM STAFF_POS
			WHERE idStaff = s.idStaff
			)
		ORDER BY s.idStaff ASC
	END
	ELSE
	BEGIN
	    SELECT s.idStaff,s.name, s.phone, s.email, s.address, s.citiIden, s.dateBirth,s.sex, h.idStatus, p.namePos, p.idPos, b.idBra, b.nameBra
		FROM STAFF as s
		LEFT JOIN STAFF_POS h ON s.idStaff  = h.idStaff 
		INNER JOIN POSITION p ON p.idPos = h.idPos
		INNER JOIN BRANCH b ON b.idBra = h.idBra
		WHERE h.idBra = @idBra
		   /*AND (s.name LIKE '%' + @keyword + '%'
		   OR s.idStaff LIKE '%' + @keyword + '%'
		   OR p.namePos LIKE '%' + @keyword + '%') */
		   AND s.idStaff != 'SF00000001' 
		   AND h.idPos != 'PS00000002'
		   AND h.dayPro = (
			SELECT MAX(dayPro)
			FROM STAFF_POS
			WHERE idStaff = s.idStaff
			)
		ORDER BY s.idStaff ASC
	END
	ELSE IF @key = -1
	BEGIN
	    SELECT s.idStaff,s.name, s.phone, s.email, s.address, s.citiIden, s.dateBirth,s.sex, h.idStatus
		FROM STAFF as s
		LEFT JOIN STAFF_POS h ON s.idStaff  = h.idStaff 
		WHERE (s.name LIKE '%' + @keyword + '%'
		   OR s.idStaff LIKE '%' + @keyword + '%' )
		   AND s.idStaff != 'SF00000001' 
		   AND h.idStatus = 2 
		   AND h.dayPro = (
			SELECT MAX(dayPro)
			FROM STAFF_POS
			WHERE idStaff = s.idStaff
			)
		ORDER BY s.idStaff ASC
	END
	ELSE
	BEGIN
	    SELECT s.idStaff,s.name, s.phone, s.email, s.address, s.citiIden, s.dateBirth,s.sex, h.idStatus, p.namePos, p.idPos
		FROM STAFF as s
		LEFT JOIN STAFF_POS h ON s.idStaff  = h.idStaff 
		INNER JOIN POSITION p ON p.idPos = h.idPos
		WHERE (s.name LIKE '%' + @keyword + '%'
		   OR s.idStaff LIKE '%' + @keyword + '%' 
		   OR p.namePos LIKE '%' + @keyword + '%') 
		   AND s.idStaff != 'SF00000001' 
		   AND h.idPos = 'PS00000002'
		   AND h.dayPro = (
			SELECT MAX(dayPro)
			FROM STAFF_POS
			WHERE idStaff = s.idStaff
			)
		ORDER BY s.idStaff ASC
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SEARCH_TICKET]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SEARCH_TICKET]
    @keyword NVARCHAR(100)
AS
BEGIN
    SELECT *
    FROM TICKET
    WHERE nameTic LIKE '%' + @keyword + '%'
       OR idTic LIKE '%' + @keyword + '%'
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_LICH_CHIEU_LICH_SU]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEM_LICH_CHIEU_LICH_SU]
	@idMovie Nchar(10),
	@idTic Nchar(10),
	@showDateTime Datetime,
	@idRoom Nchar(10)
AS
BEGIN
	INSERT INTO SHOWTIME(idMovie, idTic, showDateTime ,idStatus) VALUES (@idMovie, @idTic, @showDateTime, 2);
	SELECT idST FROM SHOWTIME ORDER BY idST DESC
	DECLARE @ma_suat_chieu Nchar(10);
    SET @ma_suat_chieu = SCOPE_IDENTITY();
	INSERT INTO HISTORY(idST, idRoom, idStatus) VALUES (@ma_suat_chieu, @idRoom, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_NHAN_VIEN]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_THEM_NHAN_VIEN] 
	@name nvarchar(50), 
	@dateBirth date, 
	@email varchar(50), 
	@citiIden char(12), 
	@phone char(12), 
	@address nvarchar(50),
	@sex bit,
	@pass varchar(200),
	@repass varchar(200)
AS
BEGIN
	INSERT INTO STAFF (name, dateBirth, email, citiIden, phone, address, sex,pass)
		values (@name, @dateBirth, @email, @citiIden, @phone, @address, @sex, @pass)

	DECLARE @idStaff nchar(10)
	SELECT @idStaff = MAX(idStaff) 
	FROM STAFF

	INSERT INTO STAFF_POS(idStaff, idPos, idStatus) VALUES (@idStaff, NULL, 2)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_PHONG_GHE]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEM_PHONG_GHE]
	@idRoom nchar(10),
	@row int,
	@col int

AS
BEGIN
DECLARE @first AS INT = 0

DECLARE @last AS INT = @row * @col

WHILE(@first < @last)
BEGIN
if(@first < @col)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first+1,'A',@idRoom,1)
if(@first <= @col*2-1 and @first>=@col)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first+1-@col,'B',@idRoom,1)
if(@first <= @col*3-1 and @first>@col*2-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*2+1,'C',@idRoom,1)
if(@first <= @col*4-1 and @first>@col*3-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*3+1,'D',@idRoom,1)
if(@first <= @col*5-1 and @first>@col*4-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*4+1,'E',@idRoom,1)
if(@first <= @col*6-1 and @first>@col*5-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*5+1,'F',@idRoom,1)
if(@first <= @col*7-1 and @first>@col*6-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*6+1,'G',@idRoom,1)
if(@first <= @col*8-1 and @first>@col*7-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*7+1,'H',@idRoom,1)
if(@first <= @col*9-1 and @first>@col*8-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*8+1,'I',@idRoom,1)
if(@first <= @col*10-1 and @first>@col*9-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*9+1,'J',@idRoom,1)
if(@first <= @col*11-1 and @first>@col*10-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*10+1,'K',@idRoom,1)
if(@first <= @col*12-1 and @first>@col*11-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*11+1,'L',@idRoom,1)
if(@first <= @col*13-1 and @first>@col*12-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*12+1,'M',@idRoom,1)
if(@first <= @col*14-1 and @first>@col*13-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*13+1,'N',@idRoom,1)
if(@first <= @col*15-1 and @first>@col*14-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*14+1,'O',@idRoom,1)
if(@first <= @col*16-1 and @first>@col*15-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*15+1,'P',@idRoom,1)
if(@first <= @col*17-1 and @first>@col*16-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*16+1,'Q',@idRoom,1)
if(@first <= @col*18-1 and @first>@col*17-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*17+1,'R',@idRoom,1)
if(@first <= @col*19-1 and @first>@col*18-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*18+1,'S',@idRoom,1)
if(@first <= @col*20-1 and @first>@col*19-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*19+1,'T',@idRoom,1)
if(@first <= @col*21-1 and @first>@col*20-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*20+1,'U',@idRoom,1)
if(@first <= @col*22-1 and @first>@col*21-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*21+1,'V',@idRoom,1)
if(@first <= @col*23-1 and @first>@col*22-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*22+1,'W',@idRoom,1)
if(@first <= @col*24-1 and @first>@col*23-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*23+1,'X',@idRoom,1)
if(@first <= @col*25-1 and @first>@col*24-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*24+1,'Y',@idRoom,1)
if(@first <= @col*26-1 and @first>@col*25-1)
    INSERT INTO [dbo].[SEAT] ([idSeat],[idRow],[idRoom],[idStatus]) VALUES (@first-@col*25+1,'Z',@idRoom,1)
SET @first += 1
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_BRANCH]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UPDATE_BRANCH]
	@idBra nchar(10),
	@nameBra nvarchar(50)
AS
BEGIN
	IF EXISTS (SELECT * FROM BRANCH WHERE @idBra != idBra AND LOWER(nameBra) = LOWER(@nameBra)) 
	BEGIN
		RETURN 0;
	END
	ELSE
	BEGIN 
		UPDATE BRANCH SET nameBra = @nameBra WHERE idBra = @idBra
		RETURN 1;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_SHOWTIME_STATUS]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UPDATE_SHOWTIME_STATUS]
		@idST Nchar(10),
		@duration Int
AS
BEGIN
	DECLARE @check Int
    SELECT @check = 
		CASE 
			WHEN idStatus = 0 THEN -2 
			WHEN (GETDATE() >  DATEADD(MINUTE, @duration + 30, showDateTime)) AND idStatus != 0  THEN -1
			WHEN (GETDATE() BETWEEN showDateTime  AND DATEADD(MINUTE, @duration + 30, showDateTime)) AND idStatus != 0 THEN 0 
			WHEN (GETDATE() < showDateTime) AND idStatus != 0 THEN 1 
		END
    FROM SHOWTIME 
    WHERE @idST = idST;
	
	IF @check = 0 -- Phim đang chiếu, chỉ được đổi phòng, không được hủy
	BEGIN
		UPDATE SHOWTIME SET idStatus = 1 WHERE idST = @idST
	END
	ELSE IF @check = 1 -- Phim sắp chiếu, được thay đổi toàn thông tin, được hủy
	BEGIN 
		UPDATE SHOWTIME SET idStatus = 2 WHERE idST = @idST
	END
	ELSE IF @check = -1 -- Phim đã chiếu xong, không được thay đổi gì hết 
	BEGIN
		UPDATE SHOWTIME SET idStatus = 3 WHERE idST = @idST
	END
	RETURN @check;
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_STATUS_STAFF]    Script Date: 2023-10-22 11:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UPDATE_STATUS_STAFF] 
	@idStaff nchar(10),
	@idStatus int,
	@idPos nchar(10),
	@idBra nchar(10)
AS
BEGIN
	IF @idBra = ''
	BEGIN
		--UPDATE STAFF SET idStatus = @idStatus, idBra = NULL where idStaff = @idStaff
		INSERT INTO STAFF_POS(idStaff, idPos, idStatus, idBra) VALUES (@idStaff,@idPos, @idStatus, NULL)  
	END
	ELSE
	BEGIN
		--UPDATE STAFF SET idStatus = @idStatus, idBra = @idBra where idStaff = @idStaff
		INSERT INTO STAFF_POS(idStaff, idPos, idStatus, idBra) VALUES (@idStaff,@idPos, @idStatus, @idBra)  
	END
END
GO
USE [master]
GO
ALTER DATABASE [CinemaManagement] SET  READ_WRITE 
GO
