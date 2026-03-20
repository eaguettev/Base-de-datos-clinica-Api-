CREATE DATABASE HospitalDB;
GO
USE HospitalDB;
GO

CREATE TABLE Patients (
    PatientId INT PRIMARY KEY IDENTITY(1,1),
    DocumentType NVARCHAR(10) NOT NULL,
    DocumentNumber NVARCHAR(20) NOT NULL,
    FirstName NVARCHAR(80) NOT NULL,
    LastName NVARCHAR(80) NOT NULL,
    BirthDate DATE NOT NULL,
    PhoneNumber NVARCHAR(20) NULL,
    Email NVARCHAR(120) NULL,
    CreatedAt DATETIME2 DEFAULT GETUTCDATE(),
    -- Restricción de unicidad para evitar duplicados por tipo y número de documento
    CONSTRAINT UQ_Patient_Document UNIQUE (DocumentType, DocumentNumber)
);
GO

-- Procedimiento Almacenado solicitado
CREATE PROCEDURE sp_GetPatientsCreatedAfter
    @StartDate DATETIME2
AS
BEGIN
    SELECT * FROM Patients 
    WHERE CreatedAt > @StartDate;
END;
GO