CREATE PROCEDURE sp_update_person(
   @id INT,
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
   @CreatedOn datetime
)
AS
BEGIN
    UPDATE dbo.Person
       SET
      [UserName] = @UserName ,
      [FirstName] = @FirstName,
      [LastName] = @LastName ,
      [Gender] = @Gender,
      [Email] = @Email ,
      [MobileNo] = @MobileNo ,
      [Address] = @Address ,
      [Password] = @Password ,
      [ConfirmPassword] = @ConfirmPassword ,
      [IsActive] = @IsActive ,
      [CreatedBy] = @CreatedBy ,
      [CreatedOn] = @CreatedOn
    WHERE Id = @id and
        [GuidId] = @GuidId
END;