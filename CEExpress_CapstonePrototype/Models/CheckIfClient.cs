using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CEExpress_CapstonePrototype.Models
{
    public class CheckIfClient
    {
        public string AccountNumber { get; set; }
        public string Password { get; set; }
        public string IsManagement { get; set; }
        public string Name { get; set; }

    }
}