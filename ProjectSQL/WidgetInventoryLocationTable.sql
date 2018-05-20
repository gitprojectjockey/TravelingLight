USE [RRD]
GO

/****** Object:  Table [dbo].[WidgetInventoryLocation]    Script Date: 5/16/2018 7:04:24 PM ******/
DROP TABLE [dbo].[WidgetInventoryLocation]
GO

/****** Object:  Table [dbo].[WidgetInventoryLocation]    Script Date: 5/16/2018 7:04:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WidgetInventoryLocation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LOCATIONUID] [uniqueidentifier] NOT NULL,
	[WAREHOUSEID] [uniqueidentifier] NOT NULL,
	[PACKAGETYPEID] [uniqueidentifier] NOT NULL,
	[TYPE] [nvarchar](200) NULL,
	[Shelf] [nvarchar](10) NOT NULL,
	[Bin] [tinyint] NOT NULL,
	[Quantity] [smallint] NOT NULL
) ON [PRIMARY]
GO


