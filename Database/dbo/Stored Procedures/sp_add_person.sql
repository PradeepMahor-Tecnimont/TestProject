CREATE PROCEDURE sp_add_person(
    @name NVARCHAR(100),
    @emil NVARCHAR(100),
    @address NVARCHAR(200)
)
AS
BEGIN
    INSERT INTO dbo.Person (FullName, Email, [Address])
    VALUES (@name, @emil, @address)
END;