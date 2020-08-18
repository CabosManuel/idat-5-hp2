using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AplicacionMVC01.Controllers
{
    public class BasicoController : Controller
    {
        // GET: Basico
        public ActionResult Index()
        {
            //Enviar datos desde ActionResult (Controller)
            ViewBag.nombre = "Manuel Cabos";
            ViewData["edad"] = 19;
            return View();
        }
    }
}