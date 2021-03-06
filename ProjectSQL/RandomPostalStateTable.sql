USE [RRD]
GO
/****** Object:  Table [dbo].[State]    Script Date: 4/29/2018 2:42:46 PM ******/
DROP TABLE [dbo].[RandomPostalState]
GO
/****** Object:  Table [dbo].[RandomPostalState]    Script Date: 4/29/2018 2:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RandomPostalState](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[Abbreviation] [varchar](2) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IsPrimaryState] [bit] NULL,
	[SSCode] [varchar](4) NULL,
	[USRegion] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RandomPostalState] ON 

INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (1, N'AL', N'Alabama', 1, N'WTTR', N'South.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (2, N'AK', N'Alaska', 1, N'LLTY', N'Non.Contiguous')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (3, N'AZ', N'Arizona', 1, N'QWER', N'South.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (4, N'AR', N'Arkansas', 1, N'PPTT', N'South.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (5, N'CA', N'California', 1, N'LXTT', N'Pacific')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (6, N'CO', N'Colorado', 1, N'45ZZ', N'RockyMountains')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (7, N'CT', N'Connecticut', 1, N'88TT', N'North.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (8, N'DE', N'Delaware', 1, N'LO3T', N'South.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (9, N'DC', N'District of Columbia', 0, NULL, N'North.East ')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (10, N'FL', N'Florida', 1, NULL, N'South.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (11, N'GA', N'Georgia', 1, NULL, N'South.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (12, N'HI', N'Hawaii', 1, NULL, N'Non.Contiguous')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (13, N'ID', N'Idaho', 1, NULL, N'RockyMountains')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (14, N'IL', N'Illinois', 1, NULL, N'Mid.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (15, N'IN', N'Indiana', 1, NULL, N'Mid.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (16, N'IA', N'Iowa', 1, NULL, N'Mid.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (17, N'KS', N'Kansas', 1, NULL, N'Mid.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (18, N'KY', N'Kentucky', 1, NULL, N'South.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (19, N'LA', N'Louisiana', 1, NULL, N'South.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (20, N'ME', N'Maine', 1, NULL, N'North.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (21, N'MD', N'Maryland', 1, NULL, N'South.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (22, N'MA', N'Massachusetts', 1, NULL, N'North.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (23, N'MI', N'Michigan', 1, NULL, N'Mid.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (24, N'MN', N'Minnesota', 1, NULL, N'Mid.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (25, N'MS', N'Mississippi', 1, NULL, N'South.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (26, N'MO', N'Missouri', 1, NULL, N'Mid.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (27, N'MT', N'Montana', 1, NULL, N'RockyMountains')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (28, N'NE', N'Nebraska', 1, NULL, N'Mid.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (29, N'NV', N'Nevada', 1, NULL, N'RockyMountains')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (30, N'NH', N'New Hampshire', 1, NULL, N'North.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (31, N'NJ', N'New Jersey', 1, NULL, N'North.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (32, N'NM', N'New Mexico', 1, NULL, N'South.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (33, N'NY', N'New York', 1, NULL, N'North.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (34, N'NC', N'North Carolina', 1, NULL, N'South.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (35, N'ND', N'North Dakota', 1, NULL, N'Mid.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (36, N'OH', N'Ohio', 1, NULL, N'Mid.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (37, N'OK', N'Oklahoma', 1, NULL, N'South.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (38, N'OR', N'Oregon', 1, NULL, N'Pacific')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (39, N'PA', N'Pennsylvania', 1, NULL, N'North.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (40, N'RI', N'Rhode Island', 1, NULL, N'North.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (41, N'SC', N'South Carolina', 1, NULL, N'South.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (42, N'SD', N'South Dakota', 1, NULL, N'Mid.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (43, N'TN', N'Tennessee', 1, NULL, N'South.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (44, N'TX', N'Texas', 1, NULL, N'South.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (45, N'UT', N'Utah', 1, NULL, N'RockyMountains')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (46, N'VT', N'Vermont', 1, NULL, N'North.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (47, N'VA', N'Virginia', 1, NULL, N'South.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (48, N'WA', N'Washington', 1, NULL, N'Pacific')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (49, N'WV', N'West Virginia', 1, NULL, N'South.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (50, N'WI', N'Wisconsin', 1, NULL, N'Mid.West')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (51, N'WY', N'Wyoming', 1, NULL, N'RockyMountains')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (177, N'CA', N'California', 1, NULL, N'Pacific')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (178, N'NJ', N'New Jersey', 1, NULL, N'North.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (185, N'NJ', N'New Jersey', 1, NULL, N'North.East')
INSERT [dbo].[RandomPostalState] ([StateId], [Abbreviation], [Name], [IsPrimaryState], [SSCode], [USRegion]) VALUES (186, N'FL', N'Florida', 1, NULL, N'South.East')
SET IDENTITY_INSERT [dbo].[RandomPostalState] OFF
