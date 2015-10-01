
 use testdb
 GO

CREATE PROCEDURE usp_TryCatch
AS
  -- SET XACT_ABORT ON will cause the transaction to be uncommittable
  -- when the constraint violation occurs.
SET XACT_ABORT ON;
SET NOCOUNT ON;
  
BEGIN TRY
  BEGIN TRANSACTION;

  DELETE FROM Users
  WHERE User_id = 1;
  
  COMMIT TRANSACTION;
END TRY
BEGIN CATCH

-- put the lower code into single USP
    SELECT
    ERROR_NUMBER() AS ErrorNumber
    ,ERROR_SEVERITY() AS ErrorSeverity
    ,ERROR_STATE() AS ErrorState
    ,ERROR_LINE () AS ErrorLine
    ,ERROR_PROCEDURE() AS ErrorProcedure
    ,ERROR_MESSAGE() AS ErrorMessage;
  
  -- uncommittable.
  IF (XACT_STATE()) = -1
  BEGIN

    PRINT 'Rolling back transaction.'
    ROLLBACK TRANSACTION;
  END;
  
  -- committable.
  IF (XACT_STATE()) = 1
  BEGIN
    PRINT 'Committing transaction.'
    COMMIT TRANSACTION;
  END;
END CATCH
GO

EXEC usp_TryCatch
