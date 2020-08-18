using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

// referenciar al servicio web
using AppMVC_Bancos2020.WSBANCOS2020;

namespace AppMVC_Bancos2020.Controllers
{
    public class CuentasController : Controller
    {
        // debemos crear una variable a la clase del
        // servicio:
        ServicioBancosClient ws = new ServicioBancosClient();

        // GET: Cuentas
        public ActionResult ListadoCuentas()
        {
            return View(ws.Listar_Cuentas().ToList());
        }

        // GET
        public ActionResult GrabarCuenta()
        {
            return View(new Cuentas());
        }

        // POST
        [HttpPost]
        public ActionResult GrabarCuenta(Cuentas obj)
        {
            ViewBag.MENSAJE = ws.Grabar_Cuenta(obj);

            return View(obj);
        }
    }
}