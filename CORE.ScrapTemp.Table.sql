USE [scrapi]
GO
/****** Object:  Table [CORE].[ScrapTemp]    Script Date: 11.07.2023 17:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CORE].[ScrapTemp](
	[Id] [int] NOT NULL,
	[ScrapItem] [nvarchar](max) NULL,
	[Make] [nvarchar](max) NULL,
	[Model] [nvarchar](max) NULL,
	[OfferId] [nvarchar](max) NULL,
	[OfferName] [nvarchar](max) NULL,
	[PageBaseUrl] [nvarchar](max) NULL,
	[SubPageBaseUrl] [nvarchar](max) NULL,
	[Price] [nvarchar](200) NULL,
	[Location] [nvarchar](200) NULL,
	[InsertDate] [datetime] NULL,
	[AddedDate] [nvarchar](200) NULL,
	[Rev] [nvarchar](200) NULL,
	[AdditionalInfo1] [nvarchar](max) NULL,
	[AdditionalInfo2] [nvarchar](max) NULL,
	[AdditionalInfo3] [nvarchar](max) NULL,
	[AdditionalInfo4] [nvarchar](max) NULL,
	[AdditionalInfo5] [nvarchar](max) NULL,
	[AdditionalInfo6] [nvarchar](max) NULL,
	[AdditionalInfo7] [nvarchar](max) NULL,
	[AdditionalInfo8] [nvarchar](max) NULL,
	[AdditionalInfo9] [nvarchar](max) NULL,
	[AdditionalInfo10] [nvarchar](max) NULL,
 CONSTRAINT [PK_ScrapTemp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
