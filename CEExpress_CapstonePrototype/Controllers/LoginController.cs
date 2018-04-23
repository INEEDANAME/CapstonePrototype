using CapstoneDBModel.Model;
using CEExpress_CapstonePrototype.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace CEExpress_CapstonePrototype.Controllers
{
    public class LoginController : Controller
    {

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(userLogin login, string ReturnUrl="")
        {

            string message = "";
            using (CEExpressDBEntities de = new CEExpressDBEntities())
            {
                var v = de.Clients.Where(a => a.accountNumber == login.AccountNumber).FirstOrDefault();
                if (v != null)
                {
                    if (string.Compare(login.Password, v.password) == 0)
                    {
                        int timeout = login.RememberMe ? 525600 : 20; //525600 min = 1 year
                        var ticket = new FormsAuthenticationTicket(login.AccountNumber, login.RememberMe, timeout);
                        string encrypted = FormsAuthentication.Encrypt(ticket);
                        var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encrypted);
                        cookie.Expires = DateTime.Now.AddMinutes(timeout);
                        cookie.HttpOnly = true;
                        Response.Cookies.Add(cookie);

                        if (Url.IsLocalUrl(ReturnUrl))
                        {
                            return Redirect(ReturnUrl);
                        }
                        else
                        {
                            return RedirectToAction("Index", "Orders");
                        }
                    }
                    else
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
                        {
                            message = "Invalid credentials, please try again!";
                         
                        }                   
                    }
                }
                else
                {
                    message = "Please enter valid credentials!";
                }           
            }
                ViewBag.Message = message;
                return View();     
        }

        //Logout
        [Authorize]
        [HttpPost]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "Clients");
        }
    }
}