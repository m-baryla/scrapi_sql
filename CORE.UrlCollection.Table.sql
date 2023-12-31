USE [scrapi]
GO
/****** Object:  Table [CORE].[UrlCollection]    Script Date: 11.07.2023 17:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CORE].[UrlCollection](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScrapItem] [nvarchar](max) NULL,
	[Make] [nvarchar](max) NULL,
	[Model] [nvarchar](max) NULL,
	[UrlBase] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_UrlCollection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
