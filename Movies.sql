USE [master]
GO
/****** Object:  Database [PRN221_Project]    Script Date: 3/16/2023 11:59:38 PM ******/
CREATE DATABASE [PRN221_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRN221_Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRN221_Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRN221_Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRN221_Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRN221_Project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN221_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRN221_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRN221_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRN221_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRN221_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRN221_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRN221_Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRN221_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRN221_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRN221_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRN221_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRN221_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRN221_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRN221_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRN221_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRN221_Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRN221_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRN221_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRN221_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRN221_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRN221_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRN221_Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRN221_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRN221_Project] SET RECOVERY FULL 
GO
ALTER DATABASE [PRN221_Project] SET  MULTI_USER 
GO
ALTER DATABASE [PRN221_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRN221_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRN221_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRN221_Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRN221_Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRN221_Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRN221_Project', N'ON'
GO
ALTER DATABASE [PRN221_Project] SET QUERY_STORE = OFF
GO
USE [PRN221_Project]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/16/2023 11:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CateId] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 3/16/2023 11:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [nvarchar](50) NOT NULL,
	[CateId] [int] NOT NULL,
	[Time] [float] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Cost] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seat]    Script Date: 3/16/2023 11:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seat](
	[SeatId] [int] NOT NULL,
	[SeatName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Seat] PRIMARY KEY CLUSTERED 
(
	[SeatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/16/2023 11:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[BookingTime] [datetime] NOT NULL,
	[MovieId] [int] NOT NULL,
	[SeatId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CateId], [CateName]) VALUES (1, N'Marvel')
INSERT [dbo].[Category] ([CateId], [CateName]) VALUES (2, N'DC')
INSERT [dbo].[Category] ([CateId], [CateName]) VALUES (3, N'Pixar')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([MovieId], [MovieName], [CateId], [Time], [Description], [Cost], [Quantity]) VALUES (1, N'Doctor Strange ', 1, 90, N'Phù thuỷ tối thượng trong Đa Vũ trụ hỗn loạn', 125, 10)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [CateId], [Time], [Description], [Cost], [Quantity]) VALUES (2, N'End Game', 1, 120, N'Biệt Đội Siêu Anh Hùng: Hồi Kết', 200, 0)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [CateId], [Time], [Description], [Cost], [Quantity]) VALUES (3, N'Ironman3', 1, 150, N'Ironman Tái xuất', 129, 0)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [CateId], [Time], [Description], [Cost], [Quantity]) VALUES (4, N'BatMan', 2, 126, N'Batman đại chiến Superman: Ánh sáng công lý', 160, 0)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [CateId], [Time], [Description], [Cost], [Quantity]) VALUES (7, N'Superman', 2, 110, N'Superman:Người Đàn Ông Thép', 145, 0)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [CateId], [Time], [Description], [Cost], [Quantity]) VALUES (8, N'Gấu Đỏ Biến Hình', 3, 112, N'Gấu Đỏ Phưu lưu ký', 135, 0)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [CateId], [Time], [Description], [Cost], [Quantity]) VALUES (9, N'Công Chúa', 3, 85, N'Công Chúa Tóc Xù', 150, 0)
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
INSERT [dbo].[Seat] ([SeatId], [SeatName]) VALUES (1, N'A1')
INSERT [dbo].[Seat] ([SeatId], [SeatName]) VALUES (2, N'A2')
INSERT [dbo].[Seat] ([SeatId], [SeatName]) VALUES (3, N'B1')
INSERT [dbo].[Seat] ([SeatId], [SeatName]) VALUES (4, N'B2')
INSERT [dbo].[Seat] ([SeatId], [SeatName]) VALUES (5, N'C1')
INSERT [dbo].[Seat] ([SeatId], [SeatName]) VALUES (6, N'C2')
INSERT [dbo].[Seat] ([SeatId], [SeatName]) VALUES (7, N'D1')
INSERT [dbo].[Seat] ([SeatId], [SeatName]) VALUES (8, N'D2')
INSERT [dbo].[Seat] ([SeatId], [SeatName]) VALUES (9, N'E1')
INSERT [dbo].[Seat] ([SeatId], [SeatName]) VALUES (10, N'E2')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [Phone], [BookingTime], [MovieId], [SeatId]) VALUES (1, N'Nguyễn Lê Hùng', N'0353612090', CAST(N'2023-03-16T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[User] ([UserId], [UserName], [Phone], [BookingTime], [MovieId], [SeatId]) VALUES (3, N'Nguyễn Quỳnh Anh', N'0356469235', CAST(N'2023-02-16T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[User] ([UserId], [UserName], [Phone], [BookingTime], [MovieId], [SeatId]) VALUES (4, N'Nguyễn Phương Thảo', N'0365462335', CAST(N'2023-03-16T00:00:00.000' AS DateTime), 1, 3)
INSERT [dbo].[User] ([UserId], [UserName], [Phone], [BookingTime], [MovieId], [SeatId]) VALUES (5, N'Bùi Anh Đức', N'0364113313', CAST(N'2023-03-16T00:00:00.000' AS DateTime), 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Phone], [BookingTime], [MovieId], [SeatId]) VALUES (7, N'Lê Thu Phương', N'0315661616', CAST(N'2023-03-16T00:00:00.000' AS DateTime), 1, 5)
INSERT [dbo].[User] ([UserId], [UserName], [Phone], [BookingTime], [MovieId], [SeatId]) VALUES (8, N'Nguyễn Phương Thảo', N'0231131313', CAST(N'2023-03-16T00:00:00.000' AS DateTime), 1, 6)
INSERT [dbo].[User] ([UserId], [UserName], [Phone], [BookingTime], [MovieId], [SeatId]) VALUES (9, N'Trần Thu Uyên', N'0231303445', CAST(N'2023-03-16T00:00:00.000' AS DateTime), 1, 7)
INSERT [dbo].[User] ([UserId], [UserName], [Phone], [BookingTime], [MovieId], [SeatId]) VALUES (10, N'Lê Thị Hòa', N'0313561615', CAST(N'2023-03-16T00:00:00.000' AS DateTime), 1, 8)
INSERT [dbo].[User] ([UserId], [UserName], [Phone], [BookingTime], [MovieId], [SeatId]) VALUES (11, N'Bùi Văn An', N'2311651230', CAST(N'2023-03-16T00:00:00.000' AS DateTime), 1, 9)
INSERT [dbo].[User] ([UserId], [UserName], [Phone], [BookingTime], [MovieId], [SeatId]) VALUES (12, N'Nguyễn Lê Bình', N'0215416164', CAST(N'2023-03-16T00:00:00.000' AS DateTime), 1, 10)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Category] FOREIGN KEY([CateId])
REFERENCES [dbo].[Category] ([CateId])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Movie] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([MovieId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Movie]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Seat] FOREIGN KEY([SeatId])
REFERENCES [dbo].[Seat] ([SeatId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Seat]
GO
USE [master]
GO
ALTER DATABASE [PRN221_Project] SET  READ_WRITE 
GO
