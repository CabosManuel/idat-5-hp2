using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using ProyectoEC3ManuelCabos.Models;
using PagedList;
using System.Transactions;

namespace ProyectoEC3ManuelCabos.Controllers
{
    public class PeliculasController : Controller
    {
        BDVIDEOS2019Entities db = new BDVIDEOS2019Entities();

        List<Carrito> listaCarrito = new List<Carrito>();
        
        public ActionResult buscar_peliculas(string cod_gen= "",int año=0,int nPag=1)
        {
            if (Session["carrito"]==null)
            {
                listaCarrito = new List<Carrito>();
                Session["carrito"] = listaCarrito;
            }

            // Reiniicar valores por formularios independientes
            if (Request.Form["btnGen"] != null)
            {
                año = 0;
            }
            else if (Request.Form["btnAño"] != null)
            {
                cod_gen = "";
            }

            ViewBag.vbCodGen = cod_gen;
            ViewBag.vbAño = año;
            ViewBag.vbGeneros = new SelectList(db.Genero.ToList(), "cod_gen", "des_gen");

            int nFilas = 5;
            var listaGeneros = db.sp_buscar_peliculas(cod_gen, año).ToList().ToPagedList(nPag, nFilas);

            return View(listaGeneros);
        }

        public ActionResult seleccionar_pelicula(string cod)
        {
            Peliculas p = db.Peliculas.Find(cod);
            ViewBag.vbFormatos = new SelectList(db.Formatos.ToList(), "precio", "descrip");
            return View(p);
        }

        [HttpPost]
        public ActionResult seleccionar_pelicula(Peliculas p)
        {
            if (ModelState.IsValid)
            {
                db.sp_actualizar_precio(p.cod_pel,p.precio);
                return RedirectToAction("agregar_carrito", new { cod_pel = p.cod_pel, precio = p.precio });
            }

            ViewBag.vbFormatos = new SelectList(db.Formatos.ToList(), "precio", "descrip");

            return View(p);
        }

        public ActionResult agregar_carrito(string cod_pel, decimal precio)
        {
            Peliculas p = db.Peliculas.Find(cod_pel);
            Carrito c = new Carrito(cod_pel, p.nom_pel, precio, 1);
            listaCarrito = (List<Carrito>)Session["carrito"];
            Carrito buscado = listaCarrito.Find(x => x.codigo == p.cod_pel);

            if (buscado == null)
            {
                listaCarrito.Add(c);
                ViewBag.vbMsj = "Pelicula: " + c.nombre 
                    + " agregado al carrito de compra";
            }else
            {
                if (buscado.precio!=precio)
                {
                    buscado.precio = precio;
                }
                buscado.cantidad++;
                ViewBag.vbMsj = "Se actualizo la cantidad de la película: " 
                    + c.nombre + " en el carrito de compra";
            }
            Session["carrito"] = listaCarrito;

            return View();
        }

        public ActionResult ver_carrito()
        {
            listaCarrito = (List<Carrito>)Session["carrito"];

            if (listaCarrito.Count == 0)
            {
                return RedirectToAction("buscar_peliculas");
            }
            return View(listaCarrito);
        }

        public ActionResult eliminar_pelicula_carrito(string cod)
        {
            listaCarrito = (List<Carrito>)Session["carrito"];
            Carrito eliminar = listaCarrito.Find(p => p.codigo == cod);

            listaCarrito.Remove(eliminar);
            ViewBag.vbMsj = "Se elimino correctamente la película: " + eliminar.nombre;
            Session["carrito"] = listaCarrito;
            return View();
        }

        public ActionResult pagar_carrito()
        {
            ViewBag.vbClientes = new SelectList(db.Clientes.ToList(),
                "cod_cli", "nom_cli");
            listaCarrito = (List<Carrito>)Session["carrito"];
            return View(listaCarrito);
        }

        [HttpPost]
        public ActionResult pagar_carrito(string cod_cli)
        {
            using (TransactionScope scope = new TransactionScope())

                try
                {
                    ViewBag.vbClientes = new SelectList(db.Clientes.ToList(),
                    "cod_cli", "nom_cli");

                    listaCarrito = (List<Carrito>)Session["carrito"];

                    decimal suma = listaCarrito.Sum(c => c.importe);

                    int num = Convert.ToInt32(db.sp_vta_cab(cod_cli, suma).First());

                    foreach (Carrito item in listaCarrito)
                    {
                        db.sp_vta_det(num , item.codigo, item.cantidad, suma);
                    }

                    TempData["mensaje"] = "La venta se realizo con éxito";

                    scope.Complete();

                    return RedirectToAction("finalizar_carrito");
                }
                catch (Exception ex)
                {
                    ViewBag.msj = "Error al realizar la compra. "+ex;
                    return View(listaCarrito);
                }
        }

        public ActionResult finalizar_carrito()
        {
            ViewBag.msj = TempData["mensaje"].ToString();
            Session.Abandon();

            return View();
        }
    }
}