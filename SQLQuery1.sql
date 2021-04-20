CREATE TABLE S3Data1 (
id [int] IDENTITY(1,1) NOT NULL,
file_id nvarchar(500) NOT NULL,
name nvarchar(500) NOT NULL
);

CREATE TABLE dbo.S3 (
id [int] IDENTITY(1,1) NOT NULL,
is_linc nvarchar(50) NOT NULL
);

INSERT INTO [dbo].[S3Data1]
           ([file_id]
           ,[name])
     VALUES
           ('ID1','Test')