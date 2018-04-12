
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/12/2018 16:44:30
-- Generated from EDMX file: C:\Users\Dylan\source\repos\CEExpress_CapstonePrototype\CapstoneDBModel\Model\CEExpressDBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CEExpressCapstonePrototype_db];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ClientAddress]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Clients] DROP CONSTRAINT [FK_ClientAddress];
GO
IF OBJECT_ID(N'[dbo].[FK_ClientOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_ClientOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_ClientReport]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reports] DROP CONSTRAINT [FK_ClientReport];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderShipment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_OrderShipment];
GO
IF OBJECT_ID(N'[dbo].[FK_ShipmentDriver]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Shipments] DROP CONSTRAINT [FK_ShipmentDriver];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Addresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Addresses];
GO
IF OBJECT_ID(N'[dbo].[Clients]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clients];
GO
IF OBJECT_ID(N'[dbo].[Drivers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Drivers];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[Reports]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reports];
GO
IF OBJECT_ID(N'[dbo].[Shipments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Shipments];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Addresses'
CREATE TABLE [dbo].[Addresses] (
    [addressID] int IDENTITY(1,1) NOT NULL,
    [street] nvarchar(max)  NOT NULL,
    [postalCode] nvarchar(6)  NOT NULL,
    [province] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Clients'
CREATE TABLE [dbo].[Clients] (
    [accountID] int IDENTITY(1,1) NOT NULL,
    [accountNumber] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [isManagment] bit  NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [percentageDiscount] real  NULL,
    [phoneNumber] decimal(10,0)  NOT NULL,
    [faxNumber] decimal(10,0)  NULL,
    [email] nvarchar(max)  NOT NULL,
    [contactName] nvarchar(max)  NOT NULL,
    [costCentre] nvarchar(128)  NULL,
    [Address_addressID] int  NOT NULL
);
GO

-- Creating table 'Drivers'
CREATE TABLE [dbo].[Drivers] (
    [driverID] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [phoneNumber] decimal(10,0)  NOT NULL,
    [currentLocation] nvarchar(max)  NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [orderID] int IDENTITY(1,1) NOT NULL,
    [customerName] nvarchar(max)  NOT NULL,
    [fulfilmentStatus] nvarchar(15)  NOT NULL,
    [pickupAddress] nvarchar(max)  NOT NULL,
    [vehicleType] nvarchar(64)  NULL,
    [destinationAddress] nvarchar(max)  NOT NULL,
    [createdTime] binary(8)  NOT NULL,
    [readyTime] time  NOT NULL,
    [dispatchedTime] time  NULL,
    [weight] real  NOT NULL,
    [numberOfPieces] int  NOT NULL,
    [serviceType] nvarchar(50)  NOT NULL,
    [packageType] nvarchar(50)  NULL,
    [referenceNumber] nvarchar(50)  NOT NULL,
    [bilableAddress] nvarchar(max)  NOT NULL,
    [isRoundTrip] bit  NULL,
    [assignedDriverID] int  NULL,
    [Client_accountID] int  NOT NULL,
    [Shipment_shipmentID] int  NOT NULL,
    [ordersPlaced] int  NULL,
    [ordersDelivered] int  NULL
);
GO

-- Creating table 'Reports'
CREATE TABLE [dbo].[Reports] (
    [reportID] int IDENTITY(1,1) NOT NULL,
    [desiredTimeFrame] binary(8)  NOT NULL,
    [generatedDateTime] time  NOT NULL,
    [isContainingGraphs] bit  NOT NULL,
    [isContainingCharts] bit  NOT NULL,
    [title] nvarchar(max)  NOT NULL,
    [customReportingConstraints] nvarchar(max)  NULL,
    [generatedBy] nvarchar(max)  NOT NULL,
    [accountNumber] nvarchar(max)  NOT NULL,
    [customerName] nvarchar(max)  NULL,
    [numberOfOrders] int  NULL,
    [expenses] float  NULL,
    [previousOrdersPlaced] int  NULL,
    [numberOfClientOrdersPlaced] int  NULL,
    [clientNames] nvarchar(max)  NULL,
    [Client_accountID] int  NOT NULL
);
GO

-- Creating table 'Shipments'
CREATE TABLE [dbo].[Shipments] (
    [shipmentID] int IDENTITY(1,1) NOT NULL,
    [driverNotes] nvarchar(max)  NULL,
    [paperWaybillNumber] nvarchar(64)  NULL,
    [pickedUpTime] binary(8)  NULL,
    [confirmedTime] time  NULL,
    [deliveryTime] time  NULL,
    [Driver_driverID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [addressID] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [PK_Addresses]
    PRIMARY KEY CLUSTERED ([addressID] ASC);
GO

-- Creating primary key on [accountID] in table 'Clients'
ALTER TABLE [dbo].[Clients]
ADD CONSTRAINT [PK_Clients]
    PRIMARY KEY CLUSTERED ([accountID] ASC);
GO

-- Creating primary key on [driverID] in table 'Drivers'
ALTER TABLE [dbo].[Drivers]
ADD CONSTRAINT [PK_Drivers]
    PRIMARY KEY CLUSTERED ([driverID] ASC);
GO

-- Creating primary key on [orderID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([orderID] ASC);
GO

-- Creating primary key on [reportID] in table 'Reports'
ALTER TABLE [dbo].[Reports]
ADD CONSTRAINT [PK_Reports]
    PRIMARY KEY CLUSTERED ([reportID] ASC);
GO

-- Creating primary key on [shipmentID] in table 'Shipments'
ALTER TABLE [dbo].[Shipments]
ADD CONSTRAINT [PK_Shipments]
    PRIMARY KEY CLUSTERED ([shipmentID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Address_addressID] in table 'Clients'
ALTER TABLE [dbo].[Clients]
ADD CONSTRAINT [FK_ClientAddress]
    FOREIGN KEY ([Address_addressID])
    REFERENCES [dbo].[Addresses]
        ([addressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientAddress'
CREATE INDEX [IX_FK_ClientAddress]
ON [dbo].[Clients]
    ([Address_addressID]);
GO

-- Creating foreign key on [Client_accountID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_ClientOrder]
    FOREIGN KEY ([Client_accountID])
    REFERENCES [dbo].[Clients]
        ([accountID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientOrder'
CREATE INDEX [IX_FK_ClientOrder]
ON [dbo].[Orders]
    ([Client_accountID]);
GO

-- Creating foreign key on [Client_accountID] in table 'Reports'
ALTER TABLE [dbo].[Reports]
ADD CONSTRAINT [FK_ClientReport]
    FOREIGN KEY ([Client_accountID])
    REFERENCES [dbo].[Clients]
        ([accountID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientReport'
CREATE INDEX [IX_FK_ClientReport]
ON [dbo].[Reports]
    ([Client_accountID]);
GO

-- Creating foreign key on [Driver_driverID] in table 'Shipments'
ALTER TABLE [dbo].[Shipments]
ADD CONSTRAINT [FK_ShipmentDriver]
    FOREIGN KEY ([Driver_driverID])
    REFERENCES [dbo].[Drivers]
        ([driverID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ShipmentDriver'
CREATE INDEX [IX_FK_ShipmentDriver]
ON [dbo].[Shipments]
    ([Driver_driverID]);
GO

-- Creating foreign key on [Shipment_shipmentID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_OrderShipment]
    FOREIGN KEY ([Shipment_shipmentID])
    REFERENCES [dbo].[Shipments]
        ([shipmentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderShipment'
CREATE INDEX [IX_FK_OrderShipment]
ON [dbo].[Orders]
    ([Shipment_shipmentID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------