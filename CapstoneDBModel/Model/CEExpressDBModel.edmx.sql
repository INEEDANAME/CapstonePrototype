
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/12/2018 13:02:51
-- Generated from EDMX file: C:\Users\Dylan\source\repos\CEExpress_CapstonePrototype\CapstoneDBModel\Model\CEExpressDBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CEExpressDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Clients'
CREATE TABLE [dbo].[Clients] (
    [accountID] int IDENTITY(1,1) NOT NULL,
    [accountNumber] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [isManagment] nvarchar(max)  NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [percentageDiscount] nvarchar(max)  NOT NULL,
    [phoneNumber] nvarchar(max)  NOT NULL,
    [faxNumber] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [contactName] nvarchar(max)  NOT NULL,
    [costCentre] nvarchar(max)  NOT NULL,
    [Address_addressID] int  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [orderID] int IDENTITY(1,1) NOT NULL,
    [customerName] nvarchar(max)  NOT NULL,
    [fulfilmentStatus] nvarchar(max)  NOT NULL,
    [pickupAddress] nvarchar(max)  NOT NULL,
    [vehicleType] nvarchar(max)  NOT NULL,
    [destinationAddress] nvarchar(max)  NOT NULL,
    [createdTime] nvarchar(max)  NOT NULL,
    [readyTime] nvarchar(max)  NOT NULL,
    [dispatchedTime] nvarchar(max)  NOT NULL,
    [weight] nvarchar(max)  NOT NULL,
    [numberOfPieces] nvarchar(max)  NOT NULL,
    [serviceType] nvarchar(max)  NOT NULL,
    [packageType] nvarchar(max)  NOT NULL,
    [referenceNumber] nvarchar(max)  NOT NULL,
    [bilableAddress] nvarchar(max)  NOT NULL,
    [isRoundTrip] nvarchar(max)  NOT NULL,
    [assignedDriverID] nvarchar(max)  NOT NULL,
    [Client_accountID] int  NOT NULL,
    [Shipment_shipmentID] int  NOT NULL
);
GO

-- Creating table 'Reports'
CREATE TABLE [dbo].[Reports] (
    [reportID] int IDENTITY(1,1) NOT NULL,
    [desiredTimeFrame] nvarchar(max)  NOT NULL,
    [generatedDateTime] nvarchar(max)  NOT NULL,
    [isContainingGraphs] nvarchar(max)  NOT NULL,
    [isContainingCharts] nvarchar(max)  NOT NULL,
    [title] nvarchar(max)  NOT NULL,
    [customReportingConstraints] nvarchar(max)  NOT NULL,
    [generatedBy] nvarchar(max)  NOT NULL,
    [accountNumber] nvarchar(max)  NOT NULL,
    [customerName] nvarchar(max)  NOT NULL,
    [numberOfOrders] nvarchar(max)  NOT NULL,
    [expenses] nvarchar(max)  NOT NULL,
    [previousOrdersPlaced] nvarchar(max)  NOT NULL,
    [numberOfClientOrdersPlaced] nvarchar(max)  NOT NULL,
    [clientNames] nvarchar(max)  NOT NULL,
    [Client_accountID] int  NOT NULL
);
GO

-- Creating table 'Addresses'
CREATE TABLE [dbo].[Addresses] (
    [addressID] int IDENTITY(1,1) NOT NULL,
    [street] nvarchar(max)  NOT NULL,
    [postalCode] nvarchar(max)  NOT NULL,
    [province] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Shipments'
CREATE TABLE [dbo].[Shipments] (
    [shipmentID] int IDENTITY(1,1) NOT NULL,
    [driverNotes] nvarchar(max)  NOT NULL,
    [paperWaybillNumber] nvarchar(max)  NOT NULL,
    [pickedUpTime] nvarchar(max)  NOT NULL,
    [confirmedTime] nvarchar(max)  NOT NULL,
    [deliveryTime] nvarchar(max)  NOT NULL,
    [Driver_driverID] int  NOT NULL
);
GO

-- Creating table 'Drivers'
CREATE TABLE [dbo].[Drivers] (
    [driverID] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [phoneNumber] nvarchar(max)  NOT NULL,
    [currentLocation] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [accountID] in table 'Clients'
ALTER TABLE [dbo].[Clients]
ADD CONSTRAINT [PK_Clients]
    PRIMARY KEY CLUSTERED ([accountID] ASC);
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

-- Creating primary key on [addressID] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [PK_Addresses]
    PRIMARY KEY CLUSTERED ([addressID] ASC);
GO

-- Creating primary key on [shipmentID] in table 'Shipments'
ALTER TABLE [dbo].[Shipments]
ADD CONSTRAINT [PK_Shipments]
    PRIMARY KEY CLUSTERED ([shipmentID] ASC);
GO

-- Creating primary key on [driverID] in table 'Drivers'
ALTER TABLE [dbo].[Drivers]
ADD CONSTRAINT [PK_Drivers]
    PRIMARY KEY CLUSTERED ([driverID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------