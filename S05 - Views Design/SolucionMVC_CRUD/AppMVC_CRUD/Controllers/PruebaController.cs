using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppMVC_CRUD.Controllers
{
    public class PruebaController : Controller
    {
        // GET: Prueba
        public ActionResult Calculos()
        {
            return View();
        }

        // GET: POST
        [HttpPost]
        public ActionResult Calculos(int numero1, int numero2)
        {
            int sumar = numero1 + numero2;

            if (sumar>100)
            {
                return RedirectToAction("Listado","ALUMNO");
            }

            ViewBag.RESULTADO = sumar;
            ViewBag.NUM1 = numero1;
            ViewBag.NUM2 = numero2;

            return View();
        }
    }
}