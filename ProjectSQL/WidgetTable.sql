USE [RRD]
GO

ALTER TABLE [dbo].[Widget] DROP CONSTRAINT [FK_Widget_WidgetPackageType]
GO

ALTER TABLE [dbo].[Widget] DROP CONSTRAINT [FK_Widget_Company1]
GO

/****** Object:  Table [dbo].[Widget]    Script Date: 5/5/2018 4:39:53 PM ******/
DROP TABLE [dbo].[Widget]
GO

/****** Object:  Table [dbo].[Widget]    Script Date: 5/5/2018 4:39:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Widget](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [uniqueidentifier] NOT NULL,
	[COMPANYUID] [uniqueidentifier] NOT NULL,
	[NAME] [nvarchar](200) NULL,
	[COLOR] [nvarchar](50) NULL,
	[MANUFACTUREDDATE] [datetime] NULL,
	[WAREHOUSEID] [uniqueidentifier] NOT NULL,
	[PACKAGETYPEID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__Widget__3214EC278B8D71E7] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Widget]  WITH CHECK ADD  CONSTRAINT [FK_Widget_Company1] FOREIGN KEY([COMPANYUID])
REFERENCES [dbo].[Company] ([UID])
GO

ALTER TABLE [dbo].[Widget] CHECK CONSTRAINT [FK_Widget_Company1]
GO

ALTER TABLE [dbo].[Widget]  WITH CHECK ADD  CONSTRAINT [FK_Widget_WidgetPackageType] FOREIGN KEY([PACKAGETYPEID])
REFERENCES [dbo].[WidgetPackageType] ([UID])
GO

ALTER TABLE [dbo].[Widget] CHECK CONSTRAINT [FK_Widget_WidgetPackageType]
GO


