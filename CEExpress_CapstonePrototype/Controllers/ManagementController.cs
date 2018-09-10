using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CEExpress_CapstonePrototype.Controllers
{
    public class ManagementController : Controller
    {
        // GET: Management
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ManagementReport()
        {
            return View();
        }

        public ActionResult Analytics()
        {
            return View()
        }

        public ActionResult ClientReports()
        {
            return View();
        }
    }
}