//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CapstoneDBModel.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        public int orderID { get; set; }
        public string customerName { get; set; }
        public string fulfilmentStatus { get; set; }
        public string pickupAddress { get; set; }
        public string vehicleType { get; set; }
        public string destinationAddress { get; set; }
        public byte[] createdTime { get; set; }
        public System.TimeSpan readyTime { get; set; }
        public Nullable<System.TimeSpan> dispatchedTime { get; set; }
        public float weight { get; set; }
        public int numberOfPieces { get; set; }
        public string serviceType { get; set; }
        public string packageType { get; set; }
        public string referenceNumber { get; set; }
        public string bilableAddress { get; set; }
        public Nullable<bool> isRoundTrip { get; set; }
        public Nullable<int> assignedDriverID { get; set; }
        public int Client_accountID { get; set; }
        public int Shipment_shipmentID { get; set; }
    
        public virtual Client Client { get; set; }
        public virtual Shipment Shipment { get; set; }
    }
}