CREATE OR ALTER PROCEDURE dbo.sp_GetCustomers
    @CustomerID INT = NULL,
    @Name NVARCHAR(50) = NULL,
    @PageSize INT = 20,
    @PageNumber INT = 1,
    @SortColumn VARCHAR(128) = 'id',
    @SortDirection BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    IF @CustomerID IS NOT NULL
    AND NOT EXISTS(SELECT 1 FROM Customers WHERE id = @CustomerID)
    BEGIN
        PRINT 'Incorrect value of @CustomerID';
        RETURN;
    END

    SELECT *
    FROM Customers
    WHERE (id = @CustomerID OR @CustomerID IS NULL)
      AND (@Name IS NULL OR name LIKE @Name + '%')
    ORDER BY
        CASE WHEN @SortDirection = 0 THEN 
            CASE @SortColumn
                WHEN 'id' THEN CAST(id AS NVARCHAR(50))
                WHEN 'name' THEN name
                WHEN 'address' THEN address
                WHEN 'phone' THEN phone
            END
        END ASC,
        CASE WHEN @SortDirection = 1 THEN 
            CASE @SortColumn
                WHEN 'id' THEN CAST(id AS NVARCHAR(50))
                WHEN 'name' THEN name
                WHEN 'address' THEN address
                WHEN 'phone' THEN phone
            END
        END DESC
    OFFSET (@PageNumber - 1) * @PageSize ROWS  
    FETCH NEXT @PageSize ROWS ONLY;
END;

GO
CREATE OR ALTER PROCEDURE dbo.sp_GetContracts
    @ContractID INT = NULL,
    @CustomerID INT = NULL,
    @StartDate DATE = NULL,
    @PageSize INT = 20,
    @PageNumber INT = 1,
    @SortColumn VARCHAR(128) = 'id',
    @SortDirection BIT = 0 
AS
BEGIN
    SET NOCOUNT ON;

    IF @ContractID IS NOT NULL
    AND NOT EXISTS(SELECT 1 FROM Contracts WHERE id = @ContractID)
    BEGIN
        PRINT 'Incorrect value of @ContractID';
        RETURN;
    END

    SELECT *
    FROM Contracts
    WHERE (id = @ContractID OR @ContractID IS NULL)
      AND (customer_id = @CustomerID OR @CustomerID IS NULL)
      AND (@StartDate IS NULL OR startDate >= @StartDate)
    ORDER BY
        CASE WHEN @SortDirection = 0 THEN 
            CASE @SortColumn
                WHEN 'id' THEN CAST(id AS NVARCHAR(50))
                WHEN 'customer_id' THEN CAST(customer_id AS NVARCHAR(50))
                WHEN 'startDate' THEN startDate
                WHEN 'endDate' THEN endDate
            END
        END ASC,
        CASE WHEN @SortDirection = 1 THEN 
            CASE @SortColumn
                WHEN 'id' THEN CAST(id AS NVARCHAR(50))
                WHEN 'customer_id' THEN CAST(customer_id AS NVARCHAR(50))
                WHEN 'startDate' THEN startDate
                WHEN 'endDate' THEN endDate
            END
        END DESC
    OFFSET (@PageNumber - 1) * @PageSize ROWS  
    FETCH NEXT @PageSize ROWS ONLY;
END;