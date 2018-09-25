USE [RRD]
GO

/****** Object:  Table [dbo].[WidgetPackageType]    Script Date: 5/5/2018 10:19:45 AM ******/
DROP TABLE [dbo].[WidgetPackageType]
GO

/****** Object:  Table [dbo].[WidgetPackageType]    Script Date: 5/5/2018 10:19:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WidgetPackageType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID][uniqueIdentifier] NOT NULL,
	[TYPE] [nvarchar](200) NULL,
	[COUNT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


