CREATE PROCEDURE sp_add_person(
   @GuidId nvarchar(max),
   @UserName nvarchar(100),
   @FirstName nvarchar(100),
   @LastName nvarchar(100),
   @Gender nvarchar(100),
   @Email nvarchar(100),
   @MobileNo nvarchar(15),
   @Address nvarchar(200),
   @Password nvarchar(25),
   @ConfirmPassword nvarchar(25),
   @IsActive int,
   @CreatedBy nvarchar(50),
   @CreatedOn datetime,
   @ReturnType nvarchar(2) = NULL OUT,
   @ReturnText nvarchar(max) = NULL OUT
)
AS
BEGIN

SET NOCOUNT ON;

    DECLARE @SpName										NVARCHAR(128) = OBJECT_NAME(@@PROCID)
    DECLARE @TranCount									INT = @@TRANCOUNT

	DECLARE @ActionIdAdd								NVARCHAR(128) = 'ADD'
	DECLARE @DataNew									NVARCHAR(MAX)

	DECLARE @Nominative									NVARCHAR(128)
	DECLARE @CustomerContactIdOld						NVARCHAR(128)
	DECLARE @IsDeletedOld								BIT
	DECLARE @RandomString								CHAR(2)

 BEGIN TRY

		-- Check User permission
	/*
    	IF dbo.sfAppEntityProfileUserEnabledCheck(@UIAppId, @UIEntityId, @UIProfileId, @UIUserId, @UICultureInfoId) = 0
		BEGIN
			SET @ReturnType = 'KO'
			SET @ReturnText = 'User not authorized'
			RETURN -1
		END


        -- Check if the contact already exists for the same customer
		SELECT @CustomerContactIdOld = cc.CustomerContactId, @IsDeletedOld = cc.IsDeleted
			FROM dbo.CustomerContact AS cc
		WHERE cc.CustomerId = @CustomerId
			AND cc.FirstName = @FirstName
			AND cc.LastName = @LastName

		IF @CustomerContactIdOld IS NOT NULL AND @IsDeletedOld = 0
		BEGIN
			SET @ReturnMessage = dbo.sfDictionaryGet(@UIAppId, @UIEntityId, @UIProfileId, @UIUserId, @UICultureInfoId, @SpName + '01', @UICultureInfoId)
			RETURN -1
		END
            IF @TranCount = 0 BEGIN TRAN
        ELSE SAVE TRAN @SpName

        IF @CustomerContactIdOld IS NOT NULL AND @IsDeletedOld = 1
		BEGIN
			EXEC dbo.spRandomStringCreate
				@UIAppId = @UIAppId,
			    @UIEntityId = @UIEntityId,
			    @UIProfileId = @UIProfileId,
			    @UIUserId = @UIUserId,
			    @UICultureInfoId = @UICultureInfoId,
			    @Len = 2,
			    @ReturnMessage = @RandomString OUTPUT

			UPDATE dbo.CustomerContact
				SET LastName = SUBSTRING(LastName, 1, LEN(LastName) - 2) + @RandomString
			WHERE CustomerContactId = @CustomerContactIdOld
		END

    */

INSERT INTO [dbo].[Person]
           ([GuidId]
           ,[UserName]
           ,[FirstName]
           ,[LastName]
           ,[Gender]
           ,[Email]
           ,[MobileNo]
           ,[Address]
           ,[Password]
           ,[ConfirmPassword]
           ,[IsActive]
           ,[CreatedBy]
           ,[CreatedOn])
     VALUES
           (@GuidId,
           @UserName,
           @FirstName,
           @LastName,
           @Gender,
           @Email,
           @MobileNo,
           @Address,
           @Password,
           @ConfirmPassword,
           @IsActive,
           @CreatedBy,
           @CreatedOn);

		     END TRY

    BEGIN CATCH
        DECLARE @xState INT = XACT_STATE()

        IF @xState = -1
            ROLLBACK
        IF @xState = 1 AND @TranCount = 0
            ROLLBACK

    --        IF @xState = 1 AND @TranCount > 0
    ---          ROLLBACK TRAN @SpName
 /*
 	IF @TranCount = 0
			EXEC log.spDBErrorLogCreate @UIAppId = @UIAppId, @UIEntityId = @UIEntityId, @UIProfileId = @UIProfileId, @UIUserId = @UIUserId, @UICultureInfoId = @UICultureInfoId,
				@Id = @CustomerId, @ReturnMessage = @ReturnMessage
		ELSE
			SET @ReturnMessage = ERROR_PROCEDURE() + ' - ' + CONVERT(VARCHAR(50), ERROR_LINE()) + ' - ' + ERROR_MESSAGE()
 */
	        SET @ReturnType = 'KO'
            SET @ReturnText = ERROR_PROCEDURE() + ' - ' + CONVERT(VARCHAR(50), ERROR_LINE()) + ' - ' + ERROR_MESSAGE()

    END CATCH
END;