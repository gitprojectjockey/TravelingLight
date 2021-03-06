USE [RRD]
GO
/****** Object:  StoredProcedure [dbo].[GenerateWidgetInventoryLocation]    Script Date: 5/16/2018 7:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[GenerateWidgetInventoryLocation]
 @WidgetUID uniqueidentifier,
 @WarehouseUID uniqueidentifier,
 @PackageTypeUID uniqueidentifier
AS
BEGIN
    DECLARE @Random INT;
	DECLARE @Lower INT;
	
	DECLARE @WidgetPackageType [nvarchar](20);
	DECLARE @WidgetPackageQuantity smallint;
	DECLARE @ShelfLetter [nvarchar](10);
	DECLARE @BinNumber tinyint;
	DECLARE @LocationExists int;


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

	
	SET @Lower = 1; ---- The lowest random number
	SET @ShelfLetter = (Select Char(cast((69 - 65)*rand() + 5 as integer)));
	SET @BinNumber = ROUND(((5 - @Lower) * RAND() + @Lower), 0);					
	SELECT @WidgetPackageType = (Select Type From WidgetPackageType where UID =  @PackageTypeUID);
	SELECT @WidgetPackageQuantity = (Select [COUNT] from WidgetPackageType where UID = @PackageTypeUID);

BEGIN TRY  

		INSERT INTO [RRD].[dbo].[WidgetInventory]([UID],[WAREHOUSEID],[WIDGETID])
		SELECT NEWID(),@WarehouseUID,@WidgetUID;

		 SET @LocationExists = 
		 (SELECT COUNT(LOCATIONUID) FROM [RRD].[dbo].[WidgetInventoryLocation]
		 WHERE [WAREHOUSEID] = @WarehouseUID
		 AND [PACKAGETYPEID] = @PackageTypeUID
		 AND [BIN] = @BinNumber
		 AND [SHELF] = @ShelfLetter);
		 
		 -- GET LOCATIONID FOR INSERT
		 -- GET QUANTITY TO INCREMENT

		 IF(@LocationExists > 0)
			UPDATE [RRD].[dbo].[WidgetInventoryLocation] SET Quantity = Quantity + 1
			WHERE [WAREHOUSEID] = @WarehouseUID
			AND [PACKAGETYPEID] = @PackageTypeUID
			AND [BIN] = @BinNumber
			AND [SHELF] = @ShelfLetter;
		 ELSE
		 INSERT INTO [RRD].[dbo].[WidgetInventoryLocation](LOCATIONUID,WAREHOUSEID,PACKAGETYPEID,[TYPE],Shelf,Bin,Quantity)
		 SELECT NEWID(),@WarehouseUID,@PackageTypeUID, @WidgetPackageType,@ShelfLetter,@BinNumber,1;

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


