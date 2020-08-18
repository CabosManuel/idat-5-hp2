using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MVC_CarritoCompra.Models;

namespace MVC_CarritoCompra.Controllers
{
    public class VentasController : Controller
    {
        BDVENTAS2020Entities db = new BDVENTAS2020Entities();

        List<Carrito> Lista_Carrito = new List<Carrito>();

        // GET: Ventas
        public ActionResult Listar_Articulos(string nombre="")
        {
            // si la variable de session no existe, entonces:
            // 1. inicializamos a lista_carrito
            // 2. asignamos lista_carrito a la variable de session
            if (Session["carrito"] == null)
            {
                Lista_Carrito = new List<Carrito>();
                Session["carrito"]= Lista_Carrito;
            }

            ViewBag.NOMBRE = nombre;

            // filtrar los articulos que inicien con el valor de la variable nombre
            List<Articulos> lista =
                db.Articulos.Where(a => a.art_nom.StartsWith(nombre)).ToList();

            return View(lista);
        }

        public ActionResult Seleccionar_Articulo(string cod)
        {
            Articulos art = db.Articulos.Find(cod);

            return View(art);
        }

        public ActionResult Agregar_Articulo_Carrito(string cod)
        {
            Articulos art = db.Articulos.Find(cod);
            // definir una variable carrito
            Carrito car = new Carrito(cod, art.art_nom, art.art_pre, 1);
            // recuperamos lista_carrito desde la session
            Lista_Carrito = (List<Carrito>)Session["carrito"];
            // buscar el codigo del articulo a almacenar en el carrito en lista_carrito
            Carrito buscado = Lista_Carrito.Find(x => x.codigo == cod);

            // si es nulo, no se encontro al articulo
            if (buscado==null)
            {
                Lista_Carrito.Add(car);
                //
                ViewBag.MENSAJE = "Articulo: "+ car.nombre +
                                  " agregado al carrito de compra";
            }
            else // si no es nulo, se encontro el codigo del articulo
            {
                buscado.cantidad++;
                //
                ViewBag.MENSAJE = "Se actualizo la cantidad del Articulo: " + buscado.nombre +
                                  " en el carrito de compra";
            }
            //
            Session["carrito"] = Lista_Carrito;
            //
            return View();
        }

        public ActionResult Ver_Carrito_Compra()
        {
            Lista_Carrito = (List<Carrito>)Session["carrito"];


            return View(Lista_Carrito);
        }
    }
}