USE [Development]
GO
/****** Object:  Table [dbo].[RG_Recovery_1_S3Data1]    Script Date: 30-04-2021 18:08:47 ******/
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
/****** Object:  Table [dbo].[S3]    Script Date: 30-04-2021 18:08:47 ******/
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
/****** Object:  Table [dbo].[S3Data1]    Script Date: 30-04-2021 18:08:47 ******/
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
/****** Object:  Table [dbo].[Test]    Script Date: 30-04-2021 18:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](10) NULL,
	[address] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [tSQLt].[CaptureOutputLog]    Script Date: 30-04-2021 18:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tSQLt].[CaptureOutputLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OutputText] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [tSQLt].[Private_AssertEqualsTableSchema_Actual]    Script Date: 30-04-2021 18:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tSQLt].[Private_AssertEqualsTableSchema_Actual](
	[name] [nvarchar](256) NULL,
	[RANK(column_id)] [int] NULL,
	[system_type_id] [nvarchar](max) NULL,
	[user_type_id] [nvarchar](max) NULL,
	[max_length] [smallint] NULL,
	[precision] [tinyint] NULL,
	[scale] [tinyint] NULL,
	[collation_name] [nvarchar](256) NULL,
	[is_nullable] [bit] NULL,
	[is_identity] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [tSQLt].[Private_AssertEqualsTableSchema_Expected]    Script Date: 30-04-2021 18:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tSQLt].[Private_AssertEqualsTableSchema_Expected](
	[name] [nvarchar](256) NULL,
	[RANK(column_id)] [int] NULL,
	[system_type_id] [nvarchar](max) NULL,
	[user_type_id] [nvarchar](max) NULL,
	[max_length] [smallint] NULL,
	[precision] [tinyint] NULL,
	[scale] [tinyint] NULL,
	[collation_name] [nvarchar](256) NULL,
	[is_nullable] [bit] NULL,
	[is_identity] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [tSQLt].[Private_Configurations]    Script Date: 30-04-2021 18:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tSQLt].[Private_Configurations](
	[Name] [nvarchar](100) NOT NULL,
	[Value] [sql_variant] NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tSQLt].[Private_ExpectException]    Script Date: 30-04-2021 18:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tSQLt].[Private_ExpectException](
	[i] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [tSQLt].[Private_NewTestClassList]    Script Date: 30-04-2021 18:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tSQLt].[Private_NewTestClassList](
	[ClassName] [nvarchar](450) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tSQLt].[Private_NullCellTable]    Script Date: 30-04-2021 18:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tSQLt].[Private_NullCellTable](
	[I] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [tSQLt].[Private_RenamedObjectLog]    Script Date: 30-04-2021 18:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tSQLt].[Private_RenamedObjectLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ObjectId] [int] NOT NULL,
	[OriginalName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Private_RenamedObjectLog__Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [tSQLt].[Run_LastExecution]    Script Date: 30-04-2021 18:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tSQLt].[Run_LastExecution](
	[TestName] [nvarchar](max) NULL,
	[SessionId] [int] NULL,
	[LoginTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [tSQLt].[TestMessage]    Script Date: 30-04-2021 18:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tSQLt].[TestMessage](
	[Msg] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [tSQLt].[TestResult]    Script Date: 30-04-2021 18:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tSQLt].[TestResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Class] [nvarchar](max) NOT NULL,
	[TestCase] [nvarchar](max) NOT NULL,
	[Name]  AS ((quotename([Class])+'.')+quotename([TestCase])),
	[TranName] [nvarchar](max) NOT NULL,
	[Result] [nvarchar](max) NULL,
	[Msg] [nvarchar](max) NULL,
	[TestStartTime] [datetime] NOT NULL,
	[TestEndTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [tSQLt].[TestResult] ADD  CONSTRAINT [DF:TestResult(TestStartTime)]  DEFAULT (getdate()) FOR [TestStartTime]
GO
