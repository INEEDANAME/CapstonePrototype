using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CapstoneDBModel.Model;

namespace CEExpress_CapstonePrototype.Controllers
{
    public class ClientController : Controller
    {
    
        // GET: Client
        [Authorize]
        public ActionResult Index()
        {
            ViewBag.Message = "You must be logged-in to view that page";
            return View();
        }

        [Authorize]
        public ActionResult OrderPage()
        {
            return View();
        }



       
    }
}
