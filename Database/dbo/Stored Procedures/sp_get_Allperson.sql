/* READ OPERATION */

CREATE PROCEDURE [dbo].[sp_get_Allperson](
@PageNumber AS INT,
@RowsOfPage AS INT
)
AS

--SET @PageNumber=2
--SET @RowsOfPage=4
BEGIN
  SELECT [Id]
      ,[FullName]
      ,[Email]
      ,[Address],
	  ROWCOUNT_BIG() as TotalRow
	  FROM [Person]
ORDER BY [Id]
OFFSET (@PageNumber-1)*@RowsOfPage ROWS
FETCH NEXT @RowsOfPage ROWS ONLY
END;