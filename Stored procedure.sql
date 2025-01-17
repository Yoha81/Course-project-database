CREATE OR ALTER PROCEDURE dbo.sp_ManageServiceCall
    @service_call_id INT = NULL,
    @worker_id INT,
    @customer_id INT,
    @call_date DATE,
    @issue_resolved CHAR(1)
AS
BEGIN
    BEGIN TRY
        IF @service_call_id IS NULL
        BEGIN
            INSERT INTO ServiceCalls (worker_id, customer_id, callDate, issueResolved)
            VALUES (@worker_id, @customer_id, @call_date, @issue_resolved);

            PRINT 'Service call created successfully.';
        END
        ELSE
        BEGIN
            UPDATE ServiceCalls
            SET worker_id = @worker_id,
                customer_id = @customer_id,
                callDate = @call_date,
                issueResolved = @issue_resolved
            WHERE id = @service_call_id;

            PRINT 'Service call updated successfully.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'Error in sp_ManageServiceCall: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_ApplyDiscount
    @discount_id INT,
    @customer_id INT,
    @date_used DATE
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1 FROM Discounts WHERE id = @discount_id AND validUntil >= @date_used
        )
        BEGIN
            THROW 50000, 'Invalid or expired discount.', 1;
        END

        INSERT INTO DiscountUsage (discount_id, customer_id, dateUsed)
        VALUES (@discount_id, @customer_id, @date_used);

        PRINT 'Discount applied successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'Error in sp_ApplyDiscount: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_CreateCustomerContract
    @customer_id INT,
    @start_date DATE,
    @end_date DATE
AS
BEGIN
    BEGIN TRY
        INSERT INTO Contracts (customer_id, startDate, endDate)
        VALUES (@customer_id, @start_date, @end_date);

        PRINT 'Customer contract created successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'Error in sp_CreateCustomerContract: ' + ERROR_MESSAGE();
    END CATCH
END;
