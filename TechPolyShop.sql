USE [master]
GO
/****** Object:  Database [TechPolyShop]    Script Date: 6/16/2022 1:09:31 PM ******/
CREATE DATABASE [TechPolyShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TechPolyShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TechPolyShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TechPolyShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TechPolyShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TechPolyShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TechPolyShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechPolyShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechPolyShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechPolyShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechPolyShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechPolyShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechPolyShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TechPolyShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechPolyShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechPolyShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechPolyShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechPolyShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechPolyShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechPolyShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechPolyShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechPolyShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TechPolyShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechPolyShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechPolyShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechPolyShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechPolyShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechPolyShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechPolyShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechPolyShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TechPolyShop] SET  MULTI_USER 
GO
ALTER DATABASE [TechPolyShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechPolyShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechPolyShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechPolyShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TechPolyShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TechPolyShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TechPolyShop] SET QUERY_STORE = OFF
GO
USE [TechPolyShop]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 6/16/2022 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [varchar](30) NOT NULL,
	[password] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 6/16/2022 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 6/16/2022 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[phone] [varchar](10) NULL,
	[registered_date] [date] NULL,
	[status] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 6/16/2022 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[unit_price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/16/2022 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [float] NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_date] [date] NULL,
	[status] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/16/2022 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[discount] [float] NOT NULL,
	[entered_date] [date] NULL,
	[image] [varchar](200) NULL,
	[name] [nvarchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [smallint] NOT NULL,
	[unit_price] [float] NOT NULL,
	[description] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([username], [password]) VALUES (N'heeloo', N'$2a$10$6xe/8cHvIwmx2cs3TJ2NKu3b8/bDxwgPPN6pP131hovzh3CwtjoXm')
INSERT [dbo].[accounts] ([username], [password]) VALUES (N'nam', N'$2a$10$U3YhahaOEM/JHmxtBf7UFea2vX4YJ54yq8.v4Db6D9GNZWfyLPP1W')
INSERT [dbo].[accounts] ([username], [password]) VALUES (N'phuong', N'$2a$10$.AHsqJVT6gmbvuIUHYeEBudZd232pB9vhBopCPFTzEWbBBL0arU7u')
INSERT [dbo].[accounts] ([username], [password]) VALUES (N'poly', N'$2a$10$/kBDgEez.eWIZRbhYkOc3.B1mOLkyunfstSYNKyczLrNAdEmVNjqO')
INSERT [dbo].[accounts] ([username], [password]) VALUES (N'son', N'$2a$10$og88rlbqe1WFoDFbPTz6kO89fLLgHfDeWtzwIIYreF1i56SerPMBy')
INSERT [dbo].[accounts] ([username], [password]) VALUES (N'teonv', N'abc')
INSERT [dbo].[accounts] ([username], [password]) VALUES (N'txn', N'$2a$10$5PJJ3kk9Un.8AQFfo3KXIuwRCPKTZZ5gOAoS6AX7gDNIBvqw9jYv2')
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (1, N'Computer')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (2, N'Huawei')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (3, N'Nokia')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (7, N'Sony 5.0')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (9, N'Asus 5.0')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (10, N'SamSum')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (11, N'Xiaomi')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (12, N'ThinkPad')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (13, N'Dell 5.0')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (14, N'Oppo ')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (15, N' Acer 5.0')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (16, N'Iphone')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (17, N'SmartLG')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (18, N'Oppos')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (19, N'Panasonic')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [registered_date], [status]) VALUES (1, N'xuannam.140302@gmail.com', N'xuannam', N'123', N'0977828340', CAST(N'2022-06-10' AS Date), 1)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [registered_date], [status]) VALUES (2, N'txn.140301@gmail.com', N'txnn', N'123', N'0977848376', CAST(N'2022-06-12' AS Date), 1)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [registered_date], [status]) VALUES (3, N'nn@gmail.com', N'nnam', N'abc', N'0233797979', CAST(N'2022-06-12' AS Date), 1)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [registered_date], [status]) VALUES (4, N'son@gmail.com', N'sonnn', N'123', N'0898999874', CAST(N'2022-03-08' AS Date), 1)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [registered_date], [status]) VALUES (5, N'ki@gmail.com', N'ki', N'123', N'0965784534', CAST(N'2022-04-02' AS Date), 1)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [registered_date], [status]) VALUES (7, N'hi@gmail.com', N'hihi', N'123', N'0987378344', CAST(N'2022-09-09' AS Date), 1)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [registered_date], [status]) VALUES (9, N'namtxpd04205@fpt.edu.vn', N'Nam14', N'123456', N'0977828340', CAST(N'2022-06-10' AS Date), 1)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [registered_date], [status]) VALUES (10, N'adsf@gmail.com', N'kaka''s', N'123456', N'0977828341', CAST(N'2022-06-10' AS Date), 0)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [registered_date], [status]) VALUES (12, N'nam@gmail.com', N'heloo', N'abc123', N'0977828344', CAST(N'2022-06-10' AS Date), 0)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [registered_date], [status]) VALUES (14, N'hi@gmail.com', N'teo', N'123456', N'0988123123', CAST(N'2022-09-02' AS Date), 0)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [registered_date], [status]) VALUES (19, N'xuannam.140301@gmail.com', N'cuong', N'111', N'0988123124', CAST(N'2022-06-16' AS Date), 2)
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[order_details] ON 

INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1, 1, 12, 1, 10000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (2, 2, 6, 1, 1200)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (3, 3, 11, 1, 9000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (4, 4, 12, 1, 10000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (5, 5, 13, 1, 7000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (6, 6, 10, 1, 1000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (7, 7, 12, 1, 10000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (8, 8, 12, 1, 10000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (9, 9, 11, 1, 9000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1004, 1005, 14, 1, 1200)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1005, 1006, 7, 2, 10000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1006, 1006, 14, 1, 1200)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1007, 1006, 6, 1, 10000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1008, 1007, 6, 2, 10000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1009, 1015, 14, 5, 1200)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1010, 1016, 14, 1, 1200)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1011, 1016, 6, 1, 10000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1012, 1017, 7, 1, 10000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1013, 1021, 14, 1, 1200)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1014, 1021, 7, 1, 10000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1015, 1024, 12, 1, 10000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1016, 1025, 7, 1, 10000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1017, 1026, 14, 1, 1200)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1018, 1026, 12, 1, 10000)
INSERT [dbo].[order_details] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1019, 1026, 6, 1, 10000)
SET IDENTITY_INSERT [dbo].[order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1, 10000, 7, CAST(N'2022-09-30' AS Date), 1)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (2, 1200, 2, CAST(N'2022-08-02' AS Date), 1)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (3, 9000, 1, CAST(N'2022-08-02' AS Date), 1)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (4, 1, 1, CAST(N'2022-08-02' AS Date), 1)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (5, 7000, 1, CAST(N'2022-02-02' AS Date), 1)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (6, 1000, 2, CAST(N'2022-02-02' AS Date), 1)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (7, 10000, 1, CAST(N'2022-01-01' AS Date), 1)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (8, 10000, 4, CAST(N'2022-02-02' AS Date), 1)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (9, 1200, 3, CAST(N'2022-08-08' AS Date), 1)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (10, 9000, 5, CAST(N'2022-08-09' AS Date), 1)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1002, 0, 1, CAST(N'2022-06-14' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1004, 10000, 1, CAST(N'2022-06-14' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1005, 1200, 1, CAST(N'2022-06-14' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1006, 31200, 1, CAST(N'2022-06-14' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1007, 20000, 1, CAST(N'2022-06-14' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1015, 6000, 19, CAST(N'2022-06-14' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1016, 11200, 19, CAST(N'2022-06-14' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1017, 10000, 19, CAST(N'2022-06-16' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1018, 0, 19, CAST(N'2022-06-16' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1019, 0, 19, CAST(N'2022-06-16' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1020, 0, 19, CAST(N'2022-06-16' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1021, 11200, 19, CAST(N'2022-06-16' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1022, 0, 19, CAST(N'2022-06-16' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1023, 0, 19, CAST(N'2022-06-16' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1024, 10000, 19, CAST(N'2022-06-16' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1025, 10000, 19, CAST(N'2022-06-16' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (1026, 21200, 19, CAST(N'2022-06-16' AS Date), 0)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([product_id], [category_id], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [description]) VALUES (3, 1, 1000, NULL, N'pfbb8f900-9d11-4435-ae57-06e579d82631.jpg', N'Laptop Gaming Asus', 2, 1, 1000, N'mua ngay')
INSERT [dbo].[products] ([product_id], [category_id], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [description]) VALUES (6, 16, 5, NULL, N'pc2526286-5043-49e3-a414-801d1fbbb356.jpg', N'Iphone 12', 10, 1, 10000, N'Mẫu mới')
INSERT [dbo].[products] ([product_id], [category_id], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [description]) VALUES (7, 16, 4, NULL, N'p4986bb9b-f1b2-40dc-ad13-0b2586334e23.png', N'Iphone 13', 11, 1, 10000, N'mẫu mới')
INSERT [dbo].[products] ([product_id], [category_id], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [description]) VALUES (10, 1, 0, NULL, N'p40244894-05ba-4442-ae83-b8ff1c6a5b00.jpg', N'Oppo Neo 6', 1, 1, 1000, N'hi')
INSERT [dbo].[products] ([product_id], [category_id], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [description]) VALUES (11, 16, 0, NULL, N'p43d6fba2-5fe2-454e-a44d-60dc2bcfc7a9.webp', N'Iphone XS', 12, 1, 9000, N'hehe')
INSERT [dbo].[products] ([product_id], [category_id], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [description]) VALUES (12, 16, 0, NULL, N'p72d548e6-d139-4bbe-bfdb-060126b7dd33.png', N'Iphone 11', 11, 2, 10000, N'ngon')
INSERT [dbo].[products] ([product_id], [category_id], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [description]) VALUES (13, 18, 2, NULL, N'p3202145f-627a-433e-bbc2-36b9e753680e.jpg', N'Oppo Neo 9', 1, 3, 7000, N'gia re')
INSERT [dbo].[products] ([product_id], [category_id], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [description]) VALUES (14, 16, 0, CAST(N'2022-06-08' AS Date), N'p69df1090-2373-4cc7-97a2-0dc6695beb27.jpg', N'Iphone 6 Plus', 2, 3, 1200, N'hihi')
INSERT [dbo].[products] ([product_id], [category_id], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [description]) VALUES (15, 1, 0, CAST(N'2022-06-11' AS Date), N'p4eec920e-1c4a-4e83-aea7-ed83020bd892.jpg', N'Laptop Acer 3.5', 10, 1, 10000, N'mau moi')
INSERT [dbo].[products] ([product_id], [category_id], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [description]) VALUES (16, 17, 0, CAST(N'2022-06-11' AS Date), N'p55ec17e1-6395-4fb6-b14d-ee0db814cdc4.webp', N'Television LG 3', 10, 3, 20000, N'hot')
INSERT [dbo].[products] ([product_id], [category_id], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [description]) VALUES (17, 16, 0, CAST(N'2022-06-11' AS Date), N'p0ea5400c-5075-4fb9-b07b-6f8fdc11559d.jpg', N'Iphone 8 plus', 12, 3, 7500, N'')
INSERT [dbo].[products] ([product_id], [category_id], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [description]) VALUES (18, 14, 0, CAST(N'2022-06-11' AS Date), N'p0bfec5e0-28ca-41f9-a30c-2a7f832f4de9.jpg', N'Oppo Neo 5', 100, 1, 5000, N'hot')
INSERT [dbo].[products] ([product_id], [category_id], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [description]) VALUES (1002, 16, 1, CAST(N'2022-06-16' AS Date), N'p17546f6c-9593-481c-92fd-e0cb86fae158.webp', N'Iphone 14 Pro', 10, 3, 15000, N'limited')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK4q98utpd73imf4yhttm3w0eax] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK4q98utpd73imf4yhttm3w0eax]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FKjyu2qbqt8gnvno9oe9j2s2ldk] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FKjyu2qbqt8gnvno9oe9j2s2ldk]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKpxtb8awmi0dk6smoh2vp1litg] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKpxtb8awmi0dk6smoh2vp1litg]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9]
GO
USE [master]
GO
ALTER DATABASE [TechPolyShop] SET  READ_WRITE 
GO
