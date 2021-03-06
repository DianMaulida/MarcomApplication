USE [master]
GO
/****** Object:  Database [db_marcom]    Script Date: 25/09/2020 16:55:47 ******/
CREATE DATABASE [db_marcom]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_marcom', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\db_marcom.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_marcom_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\db_marcom_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_marcom] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_marcom].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_marcom] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_marcom] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_marcom] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_marcom] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_marcom] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_marcom] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_marcom] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_marcom] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_marcom] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_marcom] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_marcom] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_marcom] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_marcom] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_marcom] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_marcom] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_marcom] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_marcom] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_marcom] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_marcom] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_marcom] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_marcom] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_marcom] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_marcom] SET RECOVERY FULL 
GO
ALTER DATABASE [db_marcom] SET  MULTI_USER 
GO
ALTER DATABASE [db_marcom] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_marcom] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_marcom] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_marcom] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [db_marcom] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_marcom', N'ON'
GO
USE [db_marcom]
GO
/****** Object:  Table [dbo].[master_company]    Script Date: 25/09/2020 16:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[master_company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[address] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[is_delete] [bit] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[updated_by] [varchar](50) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_master_company] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[master_employee]    Script Date: 25/09/2020 16:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[master_employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_number] [varchar](50) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NULL,
	[m_company_id] [int] NULL,
	[email] [varchar](50) NULL,
	[is_delete] [bit] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[updated_by] [varchar](50) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_master_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[master_product]    Script Date: 25/09/2020 16:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[master_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](255) NULL,
	[is_delete] [bit] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[updated_by] [varchar](50) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_master_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[master_role]    Script Date: 25/09/2020 16:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[master_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[is_delete] [bit] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[updated_by] [varchar](50) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_master_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[master_souvenir]    Script Date: 25/09/2020 16:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[master_souvenir](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](50) NULL,
	[m_unit_id] [int] NOT NULL,
	[is_delete] [bit] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[updated_by] [varchar](50) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_master_souvenir] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[master_unit]    Script Date: 25/09/2020 16:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[master_unit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](255) NULL,
	[is_delete] [bit] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[updated_by] [varchar](50) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_master_unit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transaksi_event]    Script Date: 25/09/2020 16:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transaksi_event](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[event_name] [varchar](255) NOT NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[place] [varchar](255) NULL,
	[budget] [bigint] NULL,
	[request_by] [varchar](50) NULL,
	[request_date] [datetime] NOT NULL,
	[approved_by] [int] NULL,
	[approved_date] [datetime] NULL,
	[assign_to] [int] NULL,
	[closed_date] [datetime] NULL,
	[note] [varchar](255) NULL,
	[status] [int] NULL,
	[reject_reason] [varchar](50) NULL,
	[is_delete] [bit] NULL,
	[created_by] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [varchar](50) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_transaksi_event] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transaksi_souvenir]    Script Date: 25/09/2020 16:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transaksi_souvenir](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[type] [varchar](50) NULL,
	[t_event_id] [int] NULL,
	[request_by] [int] NULL,
	[request_date] [datetime] NULL,
	[request_due_date] [datetime] NULL,
	[approved_by] [int] NULL,
	[approved_date] [datetime] NULL,
	[received_by] [int] NULL,
	[received_date] [datetime] NULL,
	[settlement_by] [int] NULL,
	[settlement_date] [datetime] NULL,
	[settlement_approved_by] [int] NULL,
	[settlement_approved_date] [datetime] NULL,
	[status] [int] NULL,
	[note] [varchar](50) NULL,
	[reject_reason] [varchar](255) NULL,
	[is_delete] [bit] NULL,
	[created_by] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [varchar](50) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_transaksi_souvenir] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transaksi_souvenir_item]    Script Date: 25/09/2020 16:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transaksi_souvenir_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[t_souvenir_id] [int] NOT NULL,
	[m_souvenir_id] [int] NOT NULL,
	[qty] [bigint] NULL,
	[qty_settlement] [bigint] NULL,
	[note] [varchar](255) NOT NULL,
	[is_delete] [bit] NOT NULL,
	[created_by] [bigint] NULL,
	[created_date] [datetime] NULL,
	[updated_by] [bigint] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_transaksi_souvenir_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[master_company] ON 

INSERT [dbo].[master_company] ([id], [code], [name], [address], [phone], [email], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (1, N'CP0001', N'PT.Xsis Mitra Utama', N'Satrio Tower lantai 25', N'78999989', N'xsis@co.id', 0, N'Administrator', CAST(N'2020-09-10 15:38:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[master_company] ([id], [code], [name], [address], [phone], [email], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (2, N'CP0002', N'Equine Global', N'Jl.Satrio Tower LT.25', N'0210777679', N'equineglobal@equine.co.id', 1, N'Administrator', CAST(N'2020-09-20 12:57:46.590' AS DateTime), NULL, NULL)
INSERT [dbo].[master_company] ([id], [code], [name], [address], [phone], [email], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (3, N'CP0003', N'XSIS Academy', N'Jl.Langsat III', N'0897897778', N'xsisacademy@gmail.com', 0, N'Administrator', CAST(N'2020-09-20 15:00:42.880' AS DateTime), N'Administrator', CAST(N'2020-09-20 15:06:10.737' AS DateTime))
INSERT [dbo].[master_company] ([id], [code], [name], [address], [phone], [email], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (4, N'CP0004', N'PT.Dian Grup', N'Jl.Kweni', N'0898899', N'dianmaulida07@gmail.com', 0, N'Administrator', CAST(N'2020-09-25 13:43:33.410' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[master_company] OFF
SET IDENTITY_INSERT [dbo].[master_employee] ON 

INSERT [dbo].[master_employee] ([id], [employee_number], [first_name], [last_name], [m_company_id], [email], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (1, N'18.03.26.01', N'Sahid', N'Triambudhi', 1, N'sahid@gmail.com', 0, N'Administrator', CAST(N'2020-09-20 14:16:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[master_employee] ([id], [employee_number], [first_name], [last_name], [m_company_id], [email], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (2, N'18.03.26.02', N'Erick', N'Agustian', 1, N'eric@gmail.com', 0, N'Administrator', CAST(N'2020-09-20 15:07:09.433' AS DateTime), N'Administrator', CAST(N'2020-09-20 15:07:26.673' AS DateTime))
SET IDENTITY_INSERT [dbo].[master_employee] OFF
SET IDENTITY_INSERT [dbo].[master_product] ON 

INSERT [dbo].[master_product] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (1, N'PR0001', N'Sendok', N'Sendok', 0, N'Administrator', CAST(N'2020-09-10 15:35:00.000' AS DateTime), N'Administrator', CAST(N'2020-09-11 19:49:30.400' AS DateTime))
INSERT [dbo].[master_product] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (2, N'PR0002', N'piring', N'piring', 1, N'Administrator', CAST(N'2020-09-11 09:44:31.683' AS DateTime), NULL, NULL)
INSERT [dbo].[master_product] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (3, N'PR0003', N'Gelas', N'Gelas', 1, N'Administrator', CAST(N'2020-09-11 19:47:57.703' AS DateTime), N'Administrator', CAST(N'2020-09-11 19:48:06.543' AS DateTime))
INSERT [dbo].[master_product] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (4, N'PR0004', N'Kaca', N'Kaca', 0, N'Administrator', CAST(N'2020-09-15 19:14:47.690' AS DateTime), NULL, NULL)
INSERT [dbo].[master_product] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (5, N'PR0005', N'Gelas', N'Gelas', 0, N'Administrator', CAST(N'2020-09-15 19:14:59.940' AS DateTime), NULL, NULL)
INSERT [dbo].[master_product] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (6, N'PR0006', N'Dompet', N'Dompet', 0, N'Administrator', CAST(N'2020-09-15 19:15:18.547' AS DateTime), NULL, NULL)
INSERT [dbo].[master_product] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (7, N'PR0007', N'Sendok', NULL, 0, N'Administrator', CAST(N'2020-09-16 09:37:24.867' AS DateTime), NULL, NULL)
INSERT [dbo].[master_product] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (8, N'PR0008', N'Kaca', NULL, 1, N'Administrator', CAST(N'2020-09-16 09:37:58.110' AS DateTime), NULL, NULL)
INSERT [dbo].[master_product] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (9, N'PR0009', N'dian', N'dian', 1, N'Administrator', CAST(N'2020-09-16 12:21:42.730' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[master_product] OFF
SET IDENTITY_INSERT [dbo].[master_role] ON 

INSERT [dbo].[master_role] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (1, N'RO0001', N'Administrator', N'Administrator', 0, N'Administrator', CAST(N'2020-09-20 16:17:00.000' AS DateTime), N'Administrator', CAST(N'2020-09-20 16:24:45.020' AS DateTime))
INSERT [dbo].[master_role] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (2, N'RO0002', N'Staff', N'Staff', 0, N'Administrator', CAST(N'2020-09-20 16:28:28.743' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[master_role] OFF
SET IDENTITY_INSERT [dbo].[master_souvenir] ON 

INSERT [dbo].[master_souvenir] ([id], [code], [name], [description], [m_unit_id], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (1, N'SV0001', N'Kacamata', N'Kacamata', 85, 0, N'Administrator', CAST(N'2020-09-10 15:37:00.000' AS DateTime), N'Administrator', CAST(N'2020-09-16 10:04:47.307' AS DateTime))
INSERT [dbo].[master_souvenir] ([id], [code], [name], [description], [m_unit_id], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (2, N'SV0002', N'dfdfd', N'fdfdf', 4, 1, N'Administrator', CAST(N'2020-09-11 09:45:00.673' AS DateTime), NULL, NULL)
INSERT [dbo].[master_souvenir] ([id], [code], [name], [description], [m_unit_id], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (3, N'SV0003', N'sdsd', N'dfd', 3, 1, N'Administrator', CAST(N'2020-09-11 09:46:16.043' AS DateTime), NULL, NULL)
INSERT [dbo].[master_souvenir] ([id], [code], [name], [description], [m_unit_id], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (4, N'SV0004', N'dfdf', N'dsdff', 3, 1, N'Administrator', CAST(N'2020-09-11 09:46:48.073' AS DateTime), NULL, NULL)
INSERT [dbo].[master_souvenir] ([id], [code], [name], [description], [m_unit_id], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (5, N'SV0005', N'dian', N'Kilogram', 86, 1, N'Administrator', CAST(N'2020-09-11 19:30:35.087' AS DateTime), N'Administrator', CAST(N'2020-09-11 19:31:21.777' AS DateTime))
INSERT [dbo].[master_souvenir] ([id], [code], [name], [description], [m_unit_id], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (6, N'SV0006', N'Tempat Minum', N'Tempat Minum', 86, 0, N'Administrator', CAST(N'2020-09-15 19:35:23.923' AS DateTime), NULL, NULL)
INSERT [dbo].[master_souvenir] ([id], [code], [name], [description], [m_unit_id], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (7, N'SV0007', N'Box Lunch', N'Box Lunch', 89, 0, N'Administrator', CAST(N'2020-09-15 19:35:43.797' AS DateTime), N'Administrator', CAST(N'2020-09-16 12:33:33.960' AS DateTime))
SET IDENTITY_INSERT [dbo].[master_souvenir] OFF
SET IDENTITY_INSERT [dbo].[master_unit] ON 

INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (1, N'UN0001', N'Lusin', N'Lusin', 1, N'Administrator', CAST(N'2020-09-10 15:32:00.000' AS DateTime), N'Administrator', CAST(N'2020-09-11 10:11:02.393' AS DateTime))
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (2, N'UN0002', N'Picies', N'Picies', 1, N'Administrator', CAST(N'2020-09-10 16:33:46.460' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (3, N'UN0003', N'Kilogram', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 09:39:38.783' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (4, N'UN0004', N'Kodi', N'Kodi', 1, N'Administrator', CAST(N'2020-09-11 09:40:54.873' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (5, N'UN0005', N'Karung', N'Karung', 1, N'Administrator', CAST(N'2020-09-11 09:41:31.947' AS DateTime), N'Administrator', CAST(N'2020-09-11 10:09:09.827' AS DateTime))
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (6, N'UN0006', N'sdsd', N'kdljsd', 1, N'Administrator', CAST(N'2020-09-11 09:47:05.610' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (7, N'UN0007', N'rererew', N'ererer', 1, N'Administrator', CAST(N'2020-09-11 09:47:17.120' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (8, N'UN0008', N'asasas', N'adsasa', 1, N'Administrator', CAST(N'2020-09-11 09:47:44.097' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (9, N'UN0009', N'sasas', N'dsdsd', 1, N'Administrator', CAST(N'2020-09-11 09:47:55.047' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (10, N'UN0010', N'qwqe', N'qwqw', 1, N'Administrator', CAST(N'2020-09-11 09:51:07.120' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (11, N'UN0011', N'asas', N'asas', 1, N'Administrator', CAST(N'2020-09-11 09:52:10.387' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (12, N'UN0012', N'dfdf', N'sasa', 1, N'Administrator', CAST(N'2020-09-11 09:55:21.243' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (13, N'UN0013', N'sdsd', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 09:56:05.077' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (14, N'UN0014', N'sdsd', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 09:57:32.790' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (15, N'UN0015', N'erer', N'erer', 1, N'Administrator', CAST(N'2020-09-11 09:57:53.420' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (16, N'UN0016', N'sdsd', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 09:58:54.687' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (17, N'UN0017', N'dian', N'dian', 1, N'Administrator', CAST(N'2020-09-11 09:59:24.670' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (18, N'UN0018', N'anisa', N'anisa', 1, N'Administrator', CAST(N'2020-09-11 10:00:53.267' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (19, N'UN0019', N'dfdf', N'Kodi', 1, N'Administrator', CAST(N'2020-09-11 10:09:49.617' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (20, N'UN0020', N'kilogram', N'kilogram', 1, N'Administrator', CAST(N'2020-09-11 11:02:59.910' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (21, N'UN0021', N'dian', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 11:13:57.030' AS DateTime), N'Administrator', CAST(N'2020-09-11 13:29:36.140' AS DateTime))
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (22, N'UN0022', N'dfdf', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 11:14:16.537' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (23, N'UN0023', N'dfdf', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 11:14:23.760' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (24, N'UN0024', N'dfdf', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 11:14:25.057' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (25, N'UN0025', N'dfdf', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 11:14:45.653' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (26, N'UN0026', N'dfdf', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 11:14:53.540' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (27, N'UN0027', N'ere', N'ere', 1, N'Administrator', CAST(N'2020-09-11 11:26:53.240' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (28, N'UN0028', N'qqqqqqqq', N'qqqqqqqqqqq', 1, N'Administrator', CAST(N'2020-09-11 11:28:56.943' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (29, N'UN0029', N'qwee', N'qwee', 1, N'Administrator', CAST(N'2020-09-11 11:42:07.530' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (30, N'UN0030', N'dfdf', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 11:44:06.000' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (31, N'UN0031', N'picies', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 11:44:23.460' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (32, N'UN0032', N'dianmau', N'dianmau', 1, N'Administrator', CAST(N'2020-09-11 12:02:31.863' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (33, N'UN0033', N'sdsd', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 12:03:24.460' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (34, N'UN0034', N'dfdf', N'Kodi', 1, N'Administrator', CAST(N'2020-09-11 12:05:47.253' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (35, N'UN0035', N'coba1', N'coba2', 1, N'Administrator', CAST(N'2020-09-11 12:07:23.737' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (36, N'UN0036', N'dfdfdfdf', N'sdsdsd', 1, N'Administrator', CAST(N'2020-09-11 12:11:29.290' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (37, N'UN0037', N'dfdfdf', N'fdfdf', 1, N'Administrator', CAST(N'2020-09-11 12:12:33.123' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (38, N'UN0038', N'sendi', N'sendi', 1, N'Administrator', CAST(N'2020-09-11 12:24:00.950' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (39, N'UN0039', N'abc', N'abc', 1, N'Administrator', CAST(N'2020-09-11 12:33:58.390' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (40, N'UN0040', N'maulida', N'maulida', 1, N'Administrator', CAST(N'2020-09-11 12:36:39.567' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (41, N'UN0041', N'maulida', N'maulida', 1, N'Administrator', CAST(N'2020-09-11 12:36:52.860' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (42, N'UN0042', N'dian', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 12:51:51.643' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (43, N'UN0043', N'dein', N'dein', 1, N'Administrator', CAST(N'2020-09-11 12:53:30.647' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (44, N'UN0044', N'dian', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 12:59:23.710' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (45, N'UN0045', N'dian', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 12:59:26.967' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (46, N'UN0046', N'dian', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 12:59:37.583' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (47, N'UN0047', N'dian', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 12:59:55.897' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (48, N'UN0048', N'dian', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 12:59:57.090' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (49, N'UN0049', N'dian', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 12:59:57.710' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (50, N'UN0050', N'dian', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 13:00:37.407' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (51, N'UN0051', N'sdsd', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 13:03:10.227' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (52, N'UN0052', N'sdsd', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 13:03:12.480' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (53, N'UN0053', N'sdsd', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 13:03:14.043' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (54, N'UN0054', N'sdsd', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 13:03:14.373' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (55, N'UN0055', N'sdsd', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 13:03:14.553' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (56, N'UN0056', N'sdsd', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 13:03:14.757' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (57, N'UN0057', N'sdsd', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 13:03:15.360' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (58, N'UN0058', N'sdsd', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 13:03:15.510' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (59, N'UN0059', N'sdsd', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 13:03:15.663' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (60, N'UN0060', N'shampoo', N'shampoo', 1, N'Administrator', CAST(N'2020-09-11 13:04:07.597' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (61, N'UN0061', N'dian', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 13:13:59.713' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (62, N'UN0062', N'dfdf', N'Kodi', 1, N'Administrator', CAST(N'2020-09-11 13:14:59.580' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (63, N'UN0063', N'dfdf', N'Kodi', 1, N'Administrator', CAST(N'2020-09-11 13:15:01.003' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (64, N'UN0064', N'dfdf', N'Kodi', 1, N'Administrator', CAST(N'2020-09-11 13:15:01.573' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (65, N'UN0065', N'dfdf', N'Kodi', 1, N'Administrator', CAST(N'2020-09-11 13:15:01.907' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (66, N'UN0066', N'dfdf', N'Kodi', 1, N'Administrator', CAST(N'2020-09-11 13:15:02.117' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (67, N'UN0067', N'dfdf', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 13:17:25.610' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (68, N'UN0068', N'LusinA', N'LusinA', 1, N'Administrator', CAST(N'2020-09-11 13:42:11.150' AS DateTime), N'Administrator', CAST(N'2020-09-11 14:35:31.997' AS DateTime))
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (69, N'UN0069', N'sdsd', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 13:43:13.013' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (70, N'UN0070', N'dfdf', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 13:45:57.277' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (71, N'UN0071', N'qwee', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 13:50:56.620' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (72, N'UN0072', N'sdsd', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 14:17:01.167' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (73, N'UN0073', N'maulida', N'maulida', 1, N'Administrator', CAST(N'2020-09-11 14:17:56.217' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (74, N'UN0074', N'qwee', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 14:18:49.920' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (75, N'UN0075', N'Kilogram', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 14:33:15.147' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (76, N'UN0076', N'Lusina', N'Lusin', 1, N'Administrator', CAST(N'2020-09-11 14:38:27.727' AS DateTime), N'Administrator', CAST(N'2020-09-11 14:45:38.783' AS DateTime))
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (77, N'UN0077', N'Lusin', N'Lusin', 1, N'Administrator', CAST(N'2020-09-11 17:27:16.970' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (78, N'UN0078', N'Lusin', N'Lusin', 1, N'Administrator', CAST(N'2020-09-11 17:32:18.750' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (79, N'UN0079', N'Kilogram', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 17:33:12.580' AS DateTime), N'Administrator', CAST(N'2020-09-11 17:33:26.883' AS DateTime))
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (80, N'UN0080', N'Lusin', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 17:36:49.313' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (81, N'UN0081', N'Lusin', N'Kodi', 1, N'Administrator', CAST(N'2020-09-11 17:45:08.213' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (82, N'UN0082', N'Lusin', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-11 17:46:54.097' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (83, N'UN0083', N'Lusininan', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 17:48:31.887' AS DateTime), N'Administrator', CAST(N'2020-09-11 17:50:40.757' AS DateTime))
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (84, N'UN0084', N'Lusin', N'Lusin', 1, N'Administrator', CAST(N'2020-09-11 17:58:34.620' AS DateTime), N'Administrator', CAST(N'2020-09-11 18:00:21.857' AS DateTime))
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (85, N'UN0085', N'Lusina', N'Lusina', 0, N'Administrator', CAST(N'2020-09-11 18:04:48.607' AS DateTime), N'Administrator', CAST(N'2020-09-16 12:25:04.800' AS DateTime))
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (86, N'UN0086', N'Lusin', N'Lusin', 1, N'Administrator', CAST(N'2020-09-11 18:04:51.013' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (87, N'UN0087', N'sdsd', N'Picies', 1, N'Administrator', CAST(N'2020-09-11 18:05:01.167' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (88, N'UN0088', N'dian', N'Kodi', 1, N'Administrator', CAST(N'2020-09-11 18:05:14.520' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (89, N'UN0089', N'Kodi', N'Kodi', 0, N'Administrator', CAST(N'2020-09-15 17:44:42.733' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (90, N'UN0090', N'Kodi', N'Kodi', 1, N'Administrator', CAST(N'2020-09-15 17:44:52.690' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (91, N'UN0091', N'Kilogram', N'Kilogram', 1, N'Administrator', CAST(N'2020-09-15 17:45:44.400' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (92, N'UN0092', N'Lusin', N'Lusin', 1, N'Administrator', CAST(N'2020-09-16 09:29:20.053' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (93, N'UN0093', N'Picies', N'Picies', 1, N'Administrator', CAST(N'2020-09-16 11:47:09.387' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (94, N'UN0094', N'Kaca', N'Kaca', 0, N'Administrator', CAST(N'2020-09-16 12:14:11.787' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (95, N'UN0095', N'Kilogram', N'Kilogram', 0, N'Administrator', CAST(N'2020-09-16 12:15:11.103' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (96, N'UN0096', N'Picies', N'Picies', 0, N'Administrator', CAST(N'2020-09-16 12:15:38.220' AS DateTime), NULL, NULL)
INSERT [dbo].[master_unit] ([id], [code], [name], [description], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (97, N'UN0097', N'Grams', N'Grams', 0, N'Administrator', CAST(N'2020-09-16 12:16:11.657' AS DateTime), N'Administrator', CAST(N'2020-09-16 12:18:42.593' AS DateTime))
SET IDENTITY_INSERT [dbo].[master_unit] OFF
SET IDENTITY_INSERT [dbo].[transaksi_event] ON 

INSERT [dbo].[transaksi_event] ([id], [code], [event_name], [start_date], [end_date], [place], [budget], [request_by], [request_date], [approved_by], [approved_date], [assign_to], [closed_date], [note], [status], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (13, N'TRWOEV18092000001', N'Campus Hiring', CAST(N'2020-09-20 09:00:00.000' AS DateTime), CAST(N'2020-09-25 09:00:00.000' AS DateTime), N'Universitas Brawijaya', 30000000, N'Sahid Triambudhi', CAST(N'2020-09-18 09:00:00.000' AS DateTime), 1, CAST(N'2020-09-18 17:25:15.123' AS DateTime), NULL, CAST(N'2020-09-18 17:25:26.787' AS DateTime), NULL, 3, NULL, 0, N'Sahid Triambudhi', CAST(N'2020-09-18 09:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_event] ([id], [code], [event_name], [start_date], [end_date], [place], [budget], [request_by], [request_date], [approved_by], [approved_date], [assign_to], [closed_date], [note], [status], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (14, N'TRWOEV18092000014', N'Pelatihan TNI/POLRI', CAST(N'2020-09-28 00:00:00.000' AS DateTime), CAST(N'2020-09-30 00:00:00.000' AS DateTime), N'Universitas Brawijaya', 20000000, N'Sahid Triambudhi', CAST(N'2020-09-18 17:26:17.723' AS DateTime), 1, CAST(N'2020-09-18 17:33:48.847' AS DateTime), NULL, NULL, NULL, 2, NULL, 0, N'Sahid Triambudhi', CAST(N'2020-09-18 17:26:17.723' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_event] ([id], [code], [event_name], [start_date], [end_date], [place], [budget], [request_by], [request_date], [approved_by], [approved_date], [assign_to], [closed_date], [note], [status], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (15, N'TRWOEV18092000015', N'Campus Hiring', CAST(N'2020-10-01 00:00:00.000' AS DateTime), CAST(N'2020-10-05 00:00:00.000' AS DateTime), N'Universitas Negeri Jakarta', 10000000, N'Sahid Triambudhi', CAST(N'2020-09-18 17:27:35.160' AS DateTime), 1, CAST(N'2020-09-18 17:27:46.623' AS DateTime), NULL, NULL, NULL, 2, NULL, 0, N'Sahid Triambudhi', CAST(N'2020-09-18 17:27:35.160' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_event] ([id], [code], [event_name], [start_date], [end_date], [place], [budget], [request_by], [request_date], [approved_by], [approved_date], [assign_to], [closed_date], [note], [status], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (16, N'TRWOEV18092000016', N'Campus Hiring', CAST(N'2020-10-05 00:00:00.000' AS DateTime), CAST(N'2020-10-07 00:00:00.000' AS DateTime), N'Universitas Indonesia', 10000000, N'Sahid Triambudhi', CAST(N'2020-09-18 17:28:37.497' AS DateTime), NULL, NULL, NULL, NULL, NULL, 0, N'gagal event', 0, N'Sahid Triambudhi', CAST(N'2020-09-18 17:28:37.497' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_event] ([id], [code], [event_name], [start_date], [end_date], [place], [budget], [request_by], [request_date], [approved_by], [approved_date], [assign_to], [closed_date], [note], [status], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (17, N'TRWOEV18092000017', N'Seminar Workshop', CAST(N'2020-10-06 00:00:00.000' AS DateTime), CAST(N'2020-10-07 00:00:00.000' AS DateTime), N'Universitas Brawijaya', 10000000, N'Sahid Triambudhi', CAST(N'2020-09-18 17:33:29.790' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, N'Sahid Triambudhi', CAST(N'2020-09-18 17:33:29.790' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[transaksi_event] OFF
SET IDENTITY_INSERT [dbo].[transaksi_souvenir] ON 

INSERT [dbo].[transaksi_souvenir] ([id], [code], [type], [t_event_id], [request_by], [request_date], [request_due_date], [approved_by], [approved_date], [received_by], [received_date], [settlement_by], [settlement_date], [settlement_approved_by], [settlement_approved_date], [status], [note], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (1, N'TRSV21092000001', N'Additional', NULL, 1, CAST(N'2020-09-21 15:52:00.000' AS DateTime), NULL, NULL, NULL, 1, CAST(N'2020-09-21 15:52:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'Administrator', CAST(N'2020-09-21 15:52:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir] ([id], [code], [type], [t_event_id], [request_by], [request_date], [request_due_date], [approved_by], [approved_date], [received_by], [received_date], [settlement_by], [settlement_date], [settlement_approved_by], [settlement_approved_date], [status], [note], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (2, N'TRSV21092000002', N'Additional', NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-09-15 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'seswe', NULL, 0, N'Administrator', CAST(N'2020-09-21 16:04:05.287' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir] ([id], [code], [type], [t_event_id], [request_by], [request_date], [request_due_date], [approved_by], [approved_date], [received_by], [received_date], [settlement_by], [settlement_date], [settlement_approved_by], [settlement_approved_date], [status], [note], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (3, N'TRSV21092000003', N'Additional', NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-09-27 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'aaaaaaaaaaaaaaa', NULL, 0, N'Administrator', CAST(N'2020-09-21 17:18:19.260' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir] ([id], [code], [type], [t_event_id], [request_by], [request_date], [request_due_date], [approved_by], [approved_date], [received_by], [received_date], [settlement_by], [settlement_date], [settlement_approved_by], [settlement_approved_date], [status], [note], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (4, N'TRSV21092000004', N'Additional', NULL, NULL, NULL, NULL, NULL, NULL, 2, CAST(N'2020-09-22 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'sdsdsd', NULL, 0, N'Administrator', CAST(N'2020-09-21 17:19:52.173' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir] ([id], [code], [type], [t_event_id], [request_by], [request_date], [request_due_date], [approved_by], [approved_date], [received_by], [received_date], [settlement_by], [settlement_date], [settlement_approved_by], [settlement_approved_date], [status], [note], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (5, N'TRSV21092000005', N'Additional', NULL, NULL, NULL, NULL, NULL, NULL, 2, CAST(N'2020-09-22 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'qqqqqqqq', NULL, 0, N'Administrator', CAST(N'2020-09-21 17:27:50.893' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir] ([id], [code], [type], [t_event_id], [request_by], [request_date], [request_due_date], [approved_by], [approved_date], [received_by], [received_date], [settlement_by], [settlement_date], [settlement_approved_by], [settlement_approved_date], [status], [note], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (6, N'TRSV22092000006', N'Additional', NULL, NULL, NULL, NULL, NULL, NULL, 2, CAST(N'2020-09-23 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'jkj', NULL, 0, N'Administrator', CAST(N'2020-09-22 11:25:55.777' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir] ([id], [code], [type], [t_event_id], [request_by], [request_date], [request_due_date], [approved_by], [approved_date], [received_by], [received_date], [settlement_by], [settlement_date], [settlement_approved_by], [settlement_approved_date], [status], [note], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (7, N'TRSV22092000007', N'Additional', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'Administrator', CAST(N'2020-09-22 13:13:53.700' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir] ([id], [code], [type], [t_event_id], [request_by], [request_date], [request_due_date], [approved_by], [approved_date], [received_by], [received_date], [settlement_by], [settlement_date], [settlement_approved_by], [settlement_approved_date], [status], [note], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (8, N'TRSV22092000008', N'Additional', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'Administrator', CAST(N'2020-09-22 13:22:11.183' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir] ([id], [code], [type], [t_event_id], [request_by], [request_date], [request_due_date], [approved_by], [approved_date], [received_by], [received_date], [settlement_by], [settlement_date], [settlement_approved_by], [settlement_approved_date], [status], [note], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (9, N'TRSV22092000009', N'Additional', NULL, NULL, CAST(N'2020-09-22 13:35:56.493' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'Administrator', CAST(N'2020-09-22 13:35:56.493' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir] ([id], [code], [type], [t_event_id], [request_by], [request_date], [request_due_date], [approved_by], [approved_date], [received_by], [received_date], [settlement_by], [settlement_date], [settlement_approved_by], [settlement_approved_date], [status], [note], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (10, N'TRSV22092000010', N'Additional', NULL, NULL, CAST(N'2020-09-22 13:44:48.867' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'Administrator', CAST(N'2020-09-22 13:44:48.867' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir] ([id], [code], [type], [t_event_id], [request_by], [request_date], [request_due_date], [approved_by], [approved_date], [received_by], [received_date], [settlement_by], [settlement_date], [settlement_approved_by], [settlement_approved_date], [status], [note], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (11, N'TRSV22092000011', N'Additional', NULL, NULL, CAST(N'2020-09-22 13:47:52.430' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'Administrator', CAST(N'2020-09-22 13:47:51.610' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir] ([id], [code], [type], [t_event_id], [request_by], [request_date], [request_due_date], [approved_by], [approved_date], [received_by], [received_date], [settlement_by], [settlement_date], [settlement_approved_by], [settlement_approved_date], [status], [note], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (12, N'TRSV22092000012', N'Additional', NULL, 1, CAST(N'2020-09-22 14:18:33.303' AS DateTime), NULL, NULL, NULL, 1, CAST(N'2020-09-30 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'dsfdf', NULL, 0, N'Administrator', CAST(N'2020-09-22 14:18:32.383' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir] ([id], [code], [type], [t_event_id], [request_by], [request_date], [request_due_date], [approved_by], [approved_date], [received_by], [received_date], [settlement_by], [settlement_date], [settlement_approved_by], [settlement_approved_date], [status], [note], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (13, N'TRSV22092000013', N'Additional', NULL, 1, CAST(N'2020-09-22 14:25:56.480' AS DateTime), NULL, NULL, NULL, 1, CAST(N'2020-09-24 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'fgfg', NULL, 0, N'Administrator', CAST(N'2020-09-22 14:25:53.403' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir] ([id], [code], [type], [t_event_id], [request_by], [request_date], [request_due_date], [approved_by], [approved_date], [received_by], [received_date], [settlement_by], [settlement_date], [settlement_approved_by], [settlement_approved_date], [status], [note], [reject_reason], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (14, N'TRSV22092000014', N'Additional', NULL, 1, CAST(N'2020-09-22 14:28:05.387' AS DateTime), NULL, NULL, NULL, 1, CAST(N'2020-09-30 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'dfd', NULL, 0, N'Administrator', CAST(N'2020-09-22 14:28:04.593' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[transaksi_souvenir] OFF
SET IDENTITY_INSERT [dbo].[transaksi_souvenir_item] ON 

INSERT [dbo].[transaksi_souvenir_item] ([id], [t_souvenir_id], [m_souvenir_id], [qty], [qty_settlement], [note], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (1, 0, 1, 20, NULL, N'ada', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[transaksi_souvenir_item] ([id], [t_souvenir_id], [m_souvenir_id], [qty], [qty_settlement], [note], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (2, 0, 1, 30, NULL, N'qwqwq', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[transaksi_souvenir_item] ([id], [t_souvenir_id], [m_souvenir_id], [qty], [qty_settlement], [note], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (3, 0, 1, 50, NULL, N'wewew', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[transaksi_souvenir_item] ([id], [t_souvenir_id], [m_souvenir_id], [qty], [qty_settlement], [note], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (4, 0, 1, 1, NULL, N'bolakaki', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[transaksi_souvenir_item] ([id], [t_souvenir_id], [m_souvenir_id], [qty], [qty_settlement], [note], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (5, 0, 2, 2, NULL, N'sdsd', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[transaksi_souvenir_item] ([id], [t_souvenir_id], [m_souvenir_id], [qty], [qty_settlement], [note], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (6, 0, 1, 50, NULL, N'asasa', 0, NULL, CAST(N'2020-09-22 13:35:56.523' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir_item] ([id], [t_souvenir_id], [m_souvenir_id], [qty], [qty_settlement], [note], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (7, 0, 1, 10, NULL, N'ini', 0, NULL, CAST(N'2020-09-22 13:44:52.110' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir_item] ([id], [t_souvenir_id], [m_souvenir_id], [qty], [qty_settlement], [note], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (8, 0, 1, 11, NULL, N'apaja', 0, NULL, CAST(N'2020-09-22 13:47:58.817' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir_item] ([id], [t_souvenir_id], [m_souvenir_id], [qty], [qty_settlement], [note], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (9, 0, 2, 1, NULL, N'ini', 0, NULL, CAST(N'2020-09-22 14:18:51.067' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir_item] ([id], [t_souvenir_id], [m_souvenir_id], [qty], [qty_settlement], [note], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (10, 13, 1, 1000, NULL, N'apasih', 0, NULL, CAST(N'2020-09-22 14:26:17.697' AS DateTime), NULL, NULL)
INSERT [dbo].[transaksi_souvenir_item] ([id], [t_souvenir_id], [m_souvenir_id], [qty], [qty_settlement], [note], [is_delete], [created_by], [created_date], [updated_by], [updated_date]) VALUES (11, 14, 1, 50, NULL, N'dfdf', 0, NULL, CAST(N'2020-09-22 14:28:11.213' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[transaksi_souvenir_item] OFF
USE [master]
GO
ALTER DATABASE [db_marcom] SET  READ_WRITE 
GO
