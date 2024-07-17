﻿CREATE TABLE [dbo].[Person] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [GuidId] NVARCHAR(MAX) NOT NULL,
    [UserName] NVARCHAR (100) NOT NULL,
    [FirstName] NVARCHAR (100) NOT NULL,
    [LastName] NVARCHAR (100) NOT NULL,
    [Gender] NVARCHAR (100) NOT NULL,
    [Email]    NVARCHAR (100) NOT NULL,
    [MobileNo]    NVARCHAR (15) NOT NULL,
    [Address]  NVARCHAR (200) NOT NULL,
    [Password] NVARCHAR (25) NOT NULL,
    [ConfirmPassword] NVARCHAR (25) NOT NULL,
    [IsActive] INT NOT NULL,
    [CreatedBy] NVARCHAR(50) NOT NULL,
    [CreatedOn] DATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

