USE [RRD]
GO
/****** Object:  StoredProcedure [dbo].[GenerateWidgets]    Script Date: 5/13/2018 2:46:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[GenerateWidgets]
 @CompanyUID uniqueidentifier,
 @CompanyName [nvarchar](200),
 @RequestedWidgetCount int
AS
BEGIN
    DECLARE @Random INT;
	DECLARE @Lower INT;
	DECLARE @Iterator INT;
	
	DECLARE @WidgetColorRowCount INT;
	DECLARE @WidgetMaterialRowCount INT;
	DECLARE @WidgetPackageTypeRowCount INT;
	DECLARE @WidgetToolRowCount INT;
	DECLARE @WidgetWarehouseRowCount INT;

	DECLARE @WarehouseId uniqueidentifier;
	DECLARE @WidgetId uniqueidentifier;
	DECLARE @ColorNamePart [nvarchar](50);
	DECLARE @MaterialNamePart [nvarchar](50);
	DECLARE @ToolNamePart [nvarchar](50);
	DECLARE @ManufacturedDate [date];
	DECLARE @PackageTypeId uniqueidentifier;
	DECLARE @FullWidgetName [nvarchar](150)
	DECLARE @WidgetPackageTypeData TABLE(Id uniqueidentifier NOT NULL, RowNumber int NOT NULL)
	DECLARE @WidgetWarehouseTypeData TABLE(Id uniqueidentifier NOT NULL, RowNumber int NOT NULL)

	DECLARE @TempWidget TABLE
	(
		[UID] [uniqueidentifier] NOT NULL,
		[COMPANYUID] [uniqueidentifier] NOT NULL,
		[NAME] [nvarchar](200) NULL,
		[COLOR] [nvarchar](50) NULL,
		[MANUFACTUREDDATE] [datetime] NULL,
		[WAREHOUSEID] uniqueidentifier NULL,
		[PACKAGETYPEID] [uniqueidentifier] NOT NULL
	);


--NOTE: CLEAR THE TABLE

DELETE FROM [RRD].[dbo].[Widget];

SET @Iterator = 1;
SET @Lower = 1; ---- The lowest random number
SET @WidgetColorRowCount = (Select Count(Id) From RandomColorNames);
SET @WidgetMaterialRowCount = (Select Count(Id) From RandomChemicalElement);
SET @WidgetToolRowCount = (Select Count(Id) From RandomToolNames);
SET @WidgetPackageTypeRowCount = (Select Count(Id) From WidgetPackageType);
SET @WidgetWarehouseRowCount = (Select Count(Id) From WidgetWarehouse where COMPANYUID = @CompanyUID);

 WHILE (@Iterator <= @RequestedWidgetCount)
    BEGIN
		SELECT @Random = ROUND(((@WidgetColorRowCount  - @Lower) * RAND() + @Lower), 0);
		SELECT @ColorNamePart = RTRIM(LTRIM((Select Name From RandomColorNames where ID in (@Random))));

		SELECT @Random = ROUND(((@WidgetMaterialRowCount  - @Lower) * RAND() + @Lower), 0)
		SELECT @MaterialNamePart = RTRIM(LTRIM((Select TOP 1 Name From RandomChemicalElement where ID in (@Random))));

		SELECT @Random = ROUND(((@WidgetToolRowCount  - @Lower) * RAND() + @Lower), 0)
		SELECT @ToolNamePart = RTRIM(LTRIM((Select TOP 1  Name From RandomToolNames where ID in (@Random))));

		SELECT  @ManufacturedDate = DATEADD(day, ROUND(DATEDIFF(day, '2017-01-01', '2017-12-31') * RAND(CHECKSUM(NEWID())), 0),
                                    DATEADD(second, CHECKSUM(NEWID()) % 48000, '2017-01-01'));

		SELECT @Random = ROUND(((@WidgetPackageTypeRowCount  - @Lower) * RAND() + @Lower), 0);

		INSERT INTO @WidgetPackageTypeData
				SELECT UID , Row_Number() Over (Order By Id) As RowNumber
				FROM WidgetPackageType
				
		SELECT @PackageTypeId = (Select TOP 1 Id From @WidgetPackageTypeData where RowNumber in (@Random));

		SELECT @FullWidgetName =  LTRIM(RTRIM(CONCAT(@ColorNamePart,'-',@MaterialNamePart,'-', @ToolNamePart)));

		INSERT INTO @WidgetWarehouseTypeData
				SELECT UID , Row_Number() Over (Order By Id) As RowNumber
				FROM WidgetWarehouse

		SELECT @Random = ROUND(((@WidgetWarehouseRowCount - @Lower) * RAND() + @Lower), 0);
		SELECT @WarehouseId = (Select TOP 1 Id From @WidgetWarehouseTypeData where RowNumber in (@Random));
		

		INSERT INTO @TempWidget([UID],[COMPANYUID], [NAME],[COLOR],[MANUFACTUREDDATE],[WAREHOUSEID],[PACKAGETYPEID])
		VALUES(NEWID(),@CompanyUID,@FullWidgetName,@ColorNamePart,@ManufacturedDate,@WarehouseId,@PackageTypeId);

		Set @Iterator = @Iterator + 1;
    END

	BEGIN TRY 
			DECLARE WidgetCursor CURSOR FOR SELECT [UID], [WAREHOUSEID], [PackageTypeId] FROM @TempWidget

			INSERT INTO [RRD].[dbo].[Widget]( [UID],[COMPANYUID],[NAME],[COLOR],[MANUFACTUREDDATE],[WAREHOUSEID],[PACKAGETYPEID])
			SELECT [UID],[COMPANYUID],[NAME],[COLOR],[MANUFACTUREDDATE],[WAREHOUSEID],[PACKAGETYPEID] FROM @TempWidget;

			OPEN WidgetCursor;
			FETCH NEXT FROM WidgetCursor INTO @WidgetId, @WarehouseId, @PackageTypeId;
			WHILE @@FETCH_STATUS = 0 BEGIN
				EXEC GenerateWidgetInventoryLocation @WidgetId, @WarehouseId, @PackageTypeId;
				FETCH NEXT FROM WidgetCursor INTO @WidgetId, @WarehouseId, @PackageTypeId;
			END
			CLOSE WidgetCursor;
			DEALLOCATE WidgetCursor;
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
END
