USE [RRD]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 4/29/2018 12:20:44 PM ******/
DROP TABLE [dbo].[Employee]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 4/29/2018 12:20:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[UID] [uniqueidentifier] NOT NULL,
	[CompanyUID] [uniqueidentifier] NOT NULL,
	[StreetNumber] [nvarchar](200) NULL,
	[Street] [nvarchar](2000) NULL,
	[City] [nvarchar](20) NULL,
	[State] [nvarchar](20) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[Email] [nvarchar](2000) NULL,
	[Phone] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


