CREATE PROCEDURE sp_update_person(
    @id INT,
    @name NVARCHAR(100),
    @email NVARCHAR(100),
    @address NVARCHAR(200)
)
AS
BEGIN
    UPDATE dbo.Person
    SET FullName = @name, Email = @email, [Address] = @address
    WHERE Id = @id
END;