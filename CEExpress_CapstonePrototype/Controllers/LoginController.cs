using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace CEExpress_CapstonePrototype.Controllers
{
    public class LoginController : Controller
    {
  
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string uname, string pass)
        {
            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri("https://api.dwaybill.com/2000105850/");
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync("orders.json?v=1&key=f1d621905cece65bcbbb5018adacdd39adacdd39&customer_number=DYN833&password=pass").Result;
                if (response.IsSuccessStatusCode)
                {
                    ViewBag.Message = "Success";
                    return RedirectToAction("Index", "Orders");

            }
                else
                    ViewBag.Message = "Failed";
                    return RedirectToAction("Index", "Home");
        }

        


    }
}