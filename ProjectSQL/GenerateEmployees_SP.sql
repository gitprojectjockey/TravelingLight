USE [RRD]
GO
/****** Object:  StoredProcedure [dbo].[GenerateEmployees]    Script Date: 5/15/2018 6:45:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[GenerateEmployees]
 @CompanyUID uniqueidentifier,
 @CompanyName [nvarchar](200),
 @RequestedEmployeeCount int
AS
BEGIN
    DECLARE @Random INT;
	DECLARE @Lower INT;
	DECLARE @Iterator INT;
	
	DECLARE @EmployeeNamesRowCount INT;
	DECLARE @StreetNamesRowCount INT;
	DECLARE @CityNamesInStateRowCount INT;
	
	DECLARE @EmailCompanyName [nvarchar](200);
	DECLARE @EmployeeFName [nvarchar](200);
	DECLARE @EmployeeLName [nvarchar](200);
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

	DECLARE @TempEmployee TABLE
	(
		[FirstName] [nvarchar](200) NOT NULL,
		[LastName] [nvarchar](200) NOT NULL,
		[UID] [uniqueidentifier] NOT NULL,
		[CompanyUID] [uniqueidentifier] NOT NULL,
		[StreetNumber] [nvarchar](200) NULL,
		[Street] [nvarchar](2000) NULL,
		[City] [nvarchar](100) NULL,
		[State] [nvarchar](100) NULL,
		[ZipCode] [nvarchar](20) NULL,
		[Email] [nvarchar](2000) NULL,
		[Phone] [nvarchar](20) NULL
	);

--NOTE: CLEAR THE TABLE
DELETE FROM [RRD].[dbo].[Employee];

SET @Iterator = 1;
SET @Lower = 1; ---- The lowest random number
SET @EmployeeNamesRowCount = (Select Count(Id) From RandomEmployeeNames);
SET @StreetNamesRowCount = (Select Count(Id) From RandomStreetNames);

 WHILE (@Iterator <= @RequestedEmployeeCount)
    BEGIN
		SELECT @Random = ROUND(((@EmployeeNamesRowCount  - @Lower) * RAND() + @Lower), 0);
		SELECT @StreetNumber = ROUND(((1000  - @Lower -1) * RAND() + @Lower), 0);
		SELECT @EmployeeFName = RTRIM(LTRIM((Select TOP 1 Name From RandomEmployeeNames where ID in (@Random))));

		SELECT @Random = ROUND(((@EmployeeNamesRowCount  - @Lower) * RAND() + @Lower), 0)
		SELECT @EmployeeLName = RTRIM(LTRIM((Select TOP 1 Name From RandomEmployeeNames where ID in (@Random))));

		SELECT @Random = ROUND(((@StreetNamesRowCount  - @Lower) * RAND() + @Lower), 0)
		SELECT @StreetName = RTRIM(LTRIM((Select TOP 1  Name From RandomStreetNames where ID in (@Random))));

		SELECT @Random = ROUND(((50  - @Lower -1) * RAND() + @Lower), 0);
		SELECT @StateAbrv = (Select TOP 1 Abbreviation From RandomPostalState where StateId in(@Random));
		SELECT @StateId = (Select TOP 1 StateId From RandomPostalState where Abbreviation in (@StateAbrv));
		SELECT @CityNamesInStateRowCount = (Select Count(StateId) From RandomZipCode where StateId = @StateId);

		SELECT @Random = ROUND(((@CityNamesInStateRowCount  - @Lower) * RAND() + @Lower), 0)

		INSERT INTO @CityData
				SELECT City, Zip, Row_Number() Over (Order By City) As RowNumber
				FROM RandomZipCode
				WHERE StateId =  @StateId
				 
		SELECT @City = (Select TOP 1 Name from @CityData where RowNumber in (@Random));
		SELECT @ZipCode = (Select TOP 1 Zip From @CityData where RowNumber in (@Random));

		SELECT @Phone = CONCAT(convert(numeric(12,0),rand() * 899) + 100,'-', convert(numeric(12,0),rand() * 899) + 100,'-', convert(numeric(12,0),rand() * 8999) + 1000);

	    SELECT @EmailCompanyName = REPLACE(LTRIM(RTRIM(@CompanyName)), ' ', '');
		SELECT @EmailCompanyName = REPLACE(@EmailCompanyName, '.', '');
		SELECT @EmailCompanyName = LOWER(@EmailCompanyName);
		SELECT @Email = LTRIM(RTRIM(CONCAT(LOWER(@EmployeeFName),'.',LOWER(@EmployeeLName),'@',@EmailCompanyName,'.com' )));


		INSERT INTO @TempEmployee([FirstName],[LastName],[UID],[CompanyUID],[StreetNumber],[Street],[City],[State],[ZipCode],[Email],[Phone])
		VALUES(@EmployeeFName,@EmployeeLName,NEWSEQUENTIALID(),@CompanyUID,@StreetNumber,@StreetName,@City,@StateAbrv,@ZipCode,@Email,@Phone);

		Set @Iterator = @Iterator + 1;
    END

	BEGIN TRY  
			INSERT INTO [RRD].[dbo].[Employee]([FirstName],[LastName],[UID],[CompanyUID],[StreetNumber],[Street],[City],[State],[ZipCode],[Email],[Phone])
			SELECT [FirstName],[LastName],[UID],[CompanyUID],[StreetNumber],[Street],[City],[State],[ZipCode],[Email],[Phone] from @TempEmployee;
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
