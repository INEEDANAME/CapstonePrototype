using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CEExpress_CapstonePrototype.Models
{
    public class userLogin
    {
        [Display(Name = "Account Number")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Account number required")]
        public string AccountNumber { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Password required")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        
        [Display(Name = "Remember Me")]
        public bool RememberMe { get; set; }
    }
}