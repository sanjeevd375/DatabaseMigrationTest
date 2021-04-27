USE [Development]
GO
/****** Object:  Table [dbo].[RG_Recovery_1_S3Data1]    Script Date: 27-04-2021 19:50:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RG_Recovery_1_S3Data1](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[file_id] [nvarchar](500) NOT NULL,
	[name] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S3]    Script Date: 27-04-2021 19:50:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S3](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[is_linc] [nvarchar](50) NOT NULL,
	[is_active] [smallint] NULL,
	[name] [nchar](10) NULL,
	[address] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S3Data1]    Script Date: 27-04-2021 19:50:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S3Data1](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[file_id] [nvarchar](500) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[email] [nchar](10) NULL,
	[phone] [nvarchar](50) NULL
) ON [PRIMARY]
GO
