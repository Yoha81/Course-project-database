CREATE OR ALTER PROCEDURE dbo.sp_SetCustomer
    @id INT = NULL OUTPUT,
    @name NVARCHAR(50) = NULL,
    @address NVARCHAR(100) = NULL,
    @phone NVARCHAR(20) = NULL,
    @email NVARCHAR(50) = NULL,
    @plan_id INT = NULL
AS
BEGIN
    BEGIN TRY
        IF @id IS NULL
        BEGIN
            SET @id = 1 + ISNULL((SELECT TOP(1) id FROM Customers ORDER BY id DESC), 0);
            
            INSERT INTO Customers (id, name, address, phone, email, plan_id)
            VALUES (@id, @name, @address, @phone, @email, @plan_id);
        END
        ELSE
        BEGIN
            UPDATE TOP(1) Customers
            SET 
                name = ISNULL(@name, name),
                address = ISNULL(@address, address),
                phone = ISNULL(@phone, phone),
                email = ISNULL(@email, email),
                plan_id = ISNULL(@plan_id, plan_id)
            WHERE id = @id;
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END;

GO
CREATE OR ALTER PROCEDURE dbo.sp_SetContract
    @id INT = NULL OUTPUT,
    @customer_id INT = NULL,
    @startDate DATE = NULL,
    @endDate DATE = NULL
AS
BEGIN
    BEGIN TRY
        IF @id IS NULL
        BEGIN
            SET @id = 1 + ISNULL((SELECT TOP(1) id FROM Contracts ORDER BY id DESC), 0);

            INSERT INTO Contracts (id, customer_id, startDate, endDate)
            VALUES (@id, @customer_id, @startDate, @endDate);
        END
        ELSE
        BEGIN
            UPDATE TOP(1) Contracts
            SET 
                customer_id = ISNULL(@customer_id, customer_id),
                startDate = ISNULL(@startDate, startDate),
                endDate = ISNULL(@endDate, endDate)
            WHERE id = @id;
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END;