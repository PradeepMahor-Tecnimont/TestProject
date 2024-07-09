CREATE TABLE [dbo].[Person] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [FullName] NVARCHAR (100) NOT NULL,
    [Email]    NVARCHAR (100) NOT NULL,
    [Address]  NVARCHAR (200) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

