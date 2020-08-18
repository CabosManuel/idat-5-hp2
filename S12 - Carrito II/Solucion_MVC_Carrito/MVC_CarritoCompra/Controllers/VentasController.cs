using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MVC_CarritoCompra.Models;
using System.Transactions;

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

            if (Lista_Carrito.Count == 0)
                return RedirectToAction("Listar_Articulos");

            return View(Lista_Carrito);
        }

        // 16-07-2020
        public ActionResult Eliminar_Articulo_Carrito(string cod)
        {
            Lista_Carrito = (List<Carrito>)Session["carrito"];

            Carrito eliminar = Lista_Carrito.Find(a => a.codigo == cod);

            Lista_Carrito.Remove(eliminar);

            ViewBag.MENSAJE = "Se elimino al articulo: "+eliminar.nombre+" del carrito";

            Session["carrito"] = Lista_Carrito;

            return View();
        }

        // GET
        public ActionResult Pagar_Carrito()
        {
            ViewBag.CLIENTES = new SelectList(
                      db.Clientes.ToList(),"cli_cod","cli_nom");

            Lista_Carrito = (List<Carrito>)Session["carrito"];

            return View(Lista_Carrito);
        }

        // POST
        [HttpPost]
        public ActionResult Pagar_Carrito(string cod)
        {
            // iniciar la transaccion
            using (TransactionScope trx = new TransactionScope())
            {
                try
                {
                    ViewBag.CLIENTES = new SelectList(
                                          db.Clientes.ToList(), "cli_cod", "cli_nom");

                    Lista_Carrito = (List<Carrito>)Session["carrito"];

                    decimal suma = Lista_Carrito.Sum(c => c.importe);

                    // grabar la cabecera de la venta
                    string xnumero = db.PA_GRABAR_WEB_FAC_CABE(cod, suma).First();

                    // grabar el detalle de la venta
                    foreach (Carrito item in Lista_Carrito)
                    {
                        db.PA_GRABAR_FAC_DETA(xnumero, item.codigo,
                                              item.cantidad, item.precio);
                    }

                    TempData["MENSAJE"] = "La venta: " + xnumero + " Fue realizada con Exito";

                    // si llegamos hasta aqui, entonces tuvimos exito en la operacion
                    trx.Complete();

                    return RedirectToAction("FinalizarCarrito");
                }
                catch (Exception ex)
                {
                    ViewBag.MENSAJE = "Error: "+ex.Message;

                    return View(Lista_Carrito);
                }

            }
        }


        public ActionResult FinalizarCarrito()
        {
            ViewBag.MENSAJE = TempData["MENSAJE"].ToString();

            // finalizar la sesion
            //Session.Remove("carrito");
            Session.Abandon();

            return View();
        }
    }
}