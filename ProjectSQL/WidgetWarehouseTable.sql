USE [RRD]
GO

/****** Object:  Table [dbo].[Widget]    Script Date: 5/5/2018 4:11:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WidgetWarehouse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [uniqueidentifier] NOT NULL,
	[COMPANYUID] [uniqueidentifier] NOT NULL,
	[NAME] [nvarchar](200) NULL,
	[StreetNumber] [nvarchar](200) NULL,
	[Street] [nvarchar](2000) NULL,
	[City] [nvarchar](20) NULL,
	[State] [nvarchar](20) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[Email] [nvarchar](2000) NULL,
	[Phone] [nvarchar](20) NULL,
)
	
