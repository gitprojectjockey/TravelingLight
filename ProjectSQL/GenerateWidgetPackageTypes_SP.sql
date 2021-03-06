USE [RRD]
GO
/****** Object:  StoredProcedure [dbo].[GenerateWidgetPackageTypes]    Script Date: 5/6/2018 1:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GenerateWidgetPackageTypes]
AS
	BEGIN TRY  
	    DELETE [RRD].[dbo].[Widget];
		DELETE [RRD].[dbo].[WidgetPackageType];
	    DELETE FROM [RRD].[dbo].[WidgetPackageType]
		INSERT INTO [RRD].[dbo].[WidgetPackageType]( [UID],[TYPE],[COUNT]) values(NewID(),'Crate',32);
		INSERT INTO [RRD].[dbo].[WidgetPackageType]( [UID],[TYPE],[COUNT]) values(NewID(),'Box',12);
		INSERT INTO [RRD].[dbo].[WidgetPackageType]( [UID],[TYPE],[COUNT]) values(NewID(),'Single',1);
		INSERT INTO [RRD].[dbo].[WidgetPackageType]( [UID],[TYPE],[COUNT]) values(NewID(),'Pallet',164);
		INSERT INTO [RRD].[dbo].[WidgetPackageType]( [UID],[TYPE],[COUNT]) values(NewID(),'Truck',3000);
		INSERT INTO [RRD].[dbo].[WidgetPackageType]( [UID],[TYPE],[COUNT]) values(NewID(),'Car',9000);
		RETURN 1
    END TRY  
	BEGIN CATCH  
		SELECT ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage;
		RETURN 2
	END CATCH  
