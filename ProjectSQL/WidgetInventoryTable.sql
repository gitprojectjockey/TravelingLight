USE [RRD]
GO

/****** Object:  Table [dbo].[WidgetInventory]    Script Date: 5/16/2018 7:41:26 PM ******/
DROP TABLE [dbo].[WidgetInventory]
GO

/****** Object:  Table [dbo].[WidgetInventory]    Script Date: 5/16/2018 7:41:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WidgetInventory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [uniqueidentifier] NOT NULL,
	[WAREHOUSEID] [uniqueidentifier] NOT NULL,
	[WIDGETID] [uniqueidentifier] NOT NULL,
	[WIDGETLOCATIONID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_WidgetInventory] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


