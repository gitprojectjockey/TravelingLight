USE [RRD]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 4/29/2018 11:55:11 AM ******/
DROP TABLE [dbo].[Company]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 4/29/2018 11:55:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[UID] [uniqueidentifier] NOT NULL,
	[SCAC] [char](4) NOT NULL,
	[StreetNumber] [nvarchar](200) NULL,
	[Street] [nvarchar](2000) NULL,
	[City] [nvarchar](20) NULL,
	[State] [nvarchar](20) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[Email] [nvarchar](2000) NULL,
	[Phone] [nvarchar](20) NULL,
	[Fax] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([ID], [Name], [UID], [SCAC], [StreetNumber], [Street], [City], [State], [ZipCode], [Email], [Phone], [Fax]) VALUES (1, N'Wood Grove Widgets Inc.', N'273ed2a0-46c5-4dab-830f-8018576e8f92', N'WGWI', N'Sweet Water Way', N'4598', N'Springfield', N'WI', N'12476', N'customercare@woodgrovewWidgets.com', N'1-800-123-2345', NULL)
INSERT [dbo].[Company] ([ID], [Name], [UID], [SCAC], [StreetNumber], [Street], [City], [State], [ZipCode], [Email], [Phone], [Fax]) VALUES (2, N'Olympia Widgets International', N'12b66128-e054-4d21-a194-e751a2d799dc', N'OWII', N'Tuscatoon', N'112', N'Castle Rock', N'CO', N'80109', N'servicecenter@olympiawidgetsint.com', N'1-800-555-5555', N'333-234-4576')
INSERT [dbo].[Company] ([ID], [Name], [UID], [SCAC], [StreetNumber], [Street], [City], [State], [ZipCode], [Email], [Phone], [Fax]) VALUES (3, N'Striker Widget Group', N'9aab92fd-feed-448c-b705-2fb87bc97bb5', N'SKWG', N'Adams ST', N'4598', N'Amherst', N'MA', N'01002', N'contactus@strikerwidgetgroup.com', N'1-800-111-1234', NULL)
INSERT [dbo].[Company] ([ID], [Name], [UID], [SCAC], [StreetNumber], [Street], [City], [State], [ZipCode], [Email], [Phone], [Fax]) VALUES (4, N'Parnell Widget Specialists', N'521113ca-1dd1-4858-ace2-6cb72c3e0403', N'PLWS', N'Parnell Circle', N'67', N'Bakersfield', N'CA', N'11025', N'contactus@parnellwidget.com', N'1-800-333-7654', N'323-987-2222')
INSERT [dbo].[Company] ([ID], [Name], [UID], [SCAC], [StreetNumber], [Street], [City], [State], [ZipCode], [Email], [Phone], [Fax]) VALUES (5, N'Humongous Global Widget Manufacturing', N'913c32a3-28b5-4025-b6f9-d01e6a6d96db', N'HGWM', N'Granger PL', N'11234', N'Parker', N'CA', N'22201', N'customercare@woodgrovewWidgets.com', N'784-222-3456', N'777-987-5556')
INSERT [dbo].[Company] ([ID], [Name], [UID], [SCAC], [StreetNumber], [Street], [City], [State], [ZipCode], [Email], [Phone], [Fax]) VALUES (6, N'Big Widgets', N'ccd2d3d9-b755-4699-9733-db4298ae8b8f', N'BGWT', N'Telegraph Way', N'1751', N'Rifle', N'CO', N'78912', N'servicecenter@bigwidgets.com', N'1-800-123-4535', NULL)
INSERT [dbo].[Company] ([ID], [Name], [UID], [SCAC], [StreetNumber], [Street], [City], [State], [ZipCode], [Email], [Phone], [Fax]) VALUES (7, N'Expert Widget Design & Manufacturing', N'b28510b4-80a2-4bea-b99e-e043d6c9d06f', N'EWDM', N'Tuscun ST', N'556611', N'Breckenridge', N'CO', N'99087', N'customercare@expertwidget.com', N'303-987-2324', NULL)
SET IDENTITY_INSERT [dbo].[Company] OFF
