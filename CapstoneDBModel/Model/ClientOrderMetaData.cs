using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.ComponentModel.DataAnnotations;
namespace CapstoneDBModel.Model
{
    public class ClientOrderMetaData
    {
        [Display(Name="Order ID")]
        public int orderID { get; set; }

        [Display(Name = "Order Status")]
        public string fulfilmentStatus { get; set; }

        [Display(Name = "Origin Address")]
        public string pickupAddress { get; set; }

        [Display(Name = "Destination Address")]
        public string destinationAddress { get; set; }

        [Display(Name = "Weight")]
        public float weight { get; set; }

        [Display(Name = "Item Count")]
        public int numberOfPieces { get; set; }

        [Display(Name = "Service Type")]
        public string serviceType { get; set; }

        [Display(Name = "Package Type")]
        public string packageType { get; set; }

        [Display(Name = "Reference Number")]
        public string referenceNumber { get; set; }

        [Display(Name = "Billing Address")]
        public string bilableAddress { get; set; }
    }
}