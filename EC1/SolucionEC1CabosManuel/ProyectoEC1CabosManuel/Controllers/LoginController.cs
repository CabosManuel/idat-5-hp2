using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoEC1CabosManuel.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string usuario, string clave)
        {
            if(usuario=="CIBER" && clave=="S302LC")
            {
                return RedirectToAction("Lista_Entradas","Entradas");
            }
            else
            {
                ViewBag.error = "El usuario y/o contraseña son incorrectos.";

            }

            return View();
        }
    }
}