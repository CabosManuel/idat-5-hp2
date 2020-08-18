using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using WebApiNeptuno2020.Models;

namespace WebApiNeptuno2020.Controllers
{
    public class PedidosController : Controller
    {
        PedidosAPIController api_ped = new PedidosAPIController();
        ProductosAPIController api_prod = new ProductosAPIController();
        
        // GET: Pedidos
        public ActionResult PedidosProductoRangoFechas(int xcodprod=1, 
            string xfecha_ini="01/01/2020", string xfecha_fin="01/01/2020")
        {
            DateTime fecha1 = Convert.ToDateTime(xfecha_ini);
            DateTime fecha2 = Convert.ToDateTime(xfecha_fin);

            var lista = api_ped.GetProductosFechas(xcodprod, fecha1, fecha2);

            ViewBag.PRODUCTOS = new SelectList(
                  api_prod.GetProductos(),"idproducto","nombreproducto");

            ViewBag.FECHA_INI = xfecha_ini;
            ViewBag.FECHA_FIN = xfecha_fin;

            return View(lista.ToList());
        }
    }
}