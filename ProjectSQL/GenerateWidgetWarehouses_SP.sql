USE [RRD]
GO
/****** Object:  StoredProcedure [dbo].[GenerateWidgetWarehouses]    Script Date: 5/13/2018 2:33:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GenerateWidgetWarehouses]
 @CompanyUID uniqueidentifier,
 @CompanyName [nvarchar](200),
 @RequestedWarehouseCount int

AS
BEGIN
    DECLARE @Random INT;
	DECLARE @Lower INT;
	DECLARE @Iterator INT;
	
	
	DECLARE @StreetNamesRowCount INT;
	DECLARE @CityNamesInStateRowCount INT;
	DECLARE @CompanyWarehouseName [nvarchar](200);
	
	DECLARE @EmailWarehouseName [nvarchar](200);
	DECLARE @StreetNumber INT;
	DECLARE @StreetName [nvarchar](2000);
	DECLARE @City [nvarchar](200);
	DECLARE @StateAbrv [nvarchar](2);
	DECLARE @StateName [nvarchar](20);
	DECLARE @Phone [nvarchar](12);
	DECLARE @Email [nvarchar](200);

	DECLARE @StateId int;
	DECLARE @ZipCode [nvarchar](10);
	DECLARE @CityData TABLE(Name nvarchar(200) NOT NULL,Zip nvarchar(10) NOT NULL, RowNumber int NOT NULL)

	DECLARE @TempWarehouse TABLE
	(
		[UID] [uniqueidentifier] NOT NULL,
		[COMPANYUID] [uniqueidentifier] NOT NULL,
		[NAME] [nvarchar](200) NULL,
		[StreetNumber] [nvarchar](200) NULL,
		[Street] [nvarchar](2000) NULL,
		[City] [nvarchar](20) NULL,
		[State] [nvarchar](20) NULL,
		[ZipCode] [nvarchar](20) NULL,
		[Email] [nvarchar](2000) NULL,
		[Phone] [nvarchar](20) NULL
	);

DELETE FROM WidgetInventory;
DELETE FROM WidgetWarehouse;

SET @Iterator = 1;
SET @Lower = 1; ---- The lowest random number
SET @StreetNamesRowCount = (Select Count(Id) From RandomStreetNames);

 WHILE (@Iterator <= @RequestedWarehouseCount)
    BEGIN

		SELECT @CompanyWarehouseName = REPLACE(CONCAT(@CompanyName,'_Warehouse_',@Iterator),'.', '')
		SELECT @StreetNumber = ROUND(((1000  - @Lower) * RAND() + @Lower), 0);

		SELECT @Random = ROUND(((@StreetNamesRowCount  - @Lower) * RAND() + @Lower), 0)
		SELECT @StreetName = RTRIM(LTRIM((Select TOP 1  Name From RandomStreetNames where ID in (@Random))));

		SELECT @Random = ROUND(((50  - @Lower -1) * RAND() + @Lower), 0);
		SELECT @StateAbrv = (Select TOP 1 Abbreviation From RandomPostalState where StateId in(@Random));
		SELECT @StateId = (Select TOP 1 StateId From RandomPostalState where Abbreviation in (@StateAbrv));
		SELECT @CityNamesInStateRowCount = (Select Count(StateId) From RandomZipCode where StateId = @StateId);

		SELECT @Random = ROUND(((@CityNamesInStateRowCount - @Lower) * RAND() + @Lower), 0)

		INSERT INTO @CityData
				SELECT City, Zip, Row_Number() Over (Order By City) As RowNumber
				FROM RandomZipCode
				WHERE StateId =  @StateId
				 
		SELECT @City = (Select TOP 1 Name from @CityData where RowNumber in (@Random));
		SELECT @ZipCode = (Select TOP 1 Zip From @CityData where RowNumber in (@Random));

		SELECT @Phone = CONCAT(convert(numeric(12,0),rand() * 899) + 100,'-', convert(numeric(12,0),rand() * 899) + 100,'-', convert(numeric(12,0),rand() * 8999) + 1000);

	    SELECT @EmailWarehouseName = REPLACE(LTRIM(RTRIM(@CompanyWarehouseName)), ' ', '');
		SELECT @EmailWarehouseName = REPLACE(@EmailWarehouseName, '.', '');
		SELECT @EmailWarehouseName = REPLACE(@EmailWarehouseName, ' ', '');
		SELECT @EmailWarehouseName = LOWER(@EmailWarehouseName);
		SELECT @Email = CONCAT(@EmailWarehouseName,'@','wh.com');


		INSERT INTO @TempWarehouse([UID],[COMPANYUID],[NAME],[StreetNumber],[Street],[City],[State],[ZipCode],[Email],[Phone])
		VALUES(NEWID(),@CompanyUID,@CompanyWarehouseName,@StreetNumber,@StreetName,@City,@StateAbrv,@ZipCode,@Email,@Phone);

		Set @Iterator = @Iterator + 1;
    END

	BEGIN TRY  
	        
			INSERT INTO [RRD].[dbo].[WidgetWarehouse]([UID],[COMPANYUID],[NAME],[StreetNumber],[Street],[City],[State],[ZipCode],[Email],[Phone])
			SELECT [UID],[COMPANYUID],[NAME],[StreetNumber],[Street],[City],[State],[ZipCode],[Email],[Phone] from @TempWarehouse;
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
