using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using AppMVC_Neptuno.Models;

// importar para poder usar un conversor: ToPagedList(,,,);
using PagedList;

namespace AppMVC_Neptuno.Controllers
{
    public class Neptuno2019Controller : Controller
    {
        // definimos una variable del ADO Net Entity Data Model
        Neptuno2019Entities db = new Neptuno2019Entities();

        // GET: Neptuno2019
        public ActionResult Listar_Clientes_tabla()
        {
            return View(db.Clientes.ToList());
        }
        
        public ActionResult Listar_Clientes_SP()
        {
            return View(db.pa_listar_clientes().ToList());
        }

        public ActionResult Listar_Pedidos_Por_Cliente(string codcli="")
        {
            // tabla
            ViewBag.CLIENTES1 = 
                new SelectList(db.Clientes.ToList(), "IdCliente","NombreCompañia");

            // proced. almacenado
            ViewBag.CLIENTES2 = 
                new SelectList(db.pa_listar_clientes().ToList(), "IdCliente", "NombreCompañia");

            return View(db.pa_pedidos_cliente(codcli).ToList());
        }

        // GET
        public ActionResult Insertar_Cliente_SP()
        {
            // obteniendo la lista de paises sin repetir
            // linq
            List<string> l_paises1 = (from c in db.Clientes
                                      select c.Pais).Distinct().ToList();

            

            // enviando la lista de paises
            ViewBag.PAISES = new SelectList(l_paises1);

            // usando una tabla como modelo
            return View(new Clientes());
        }

        //POST
        [HttpPost]
        public ActionResult Insertar_Cliente_SP(Clientes obj)
        {
            // llamar al proced almacenado
            db.pa_insertar_cliente(obj.IdCliente, obj.NombreCompañia, obj.Pais, obj.Telefono);

            // lambda
            List<string> l_paises2 = db.Clientes.Select(c => c.Pais).Distinct().ToList();
            
            // enviando la lista de paises
            ViewBag.PAISES = new SelectList(l_paises2);

            ViewBag.MENSAJE = "Nuevo Cliente grabado correctamente";

            return View(obj);
        }

        ///////// 25/06/2020 /////////////////////

        public ActionResult Actualizar_Cliente_SP(string codcli)
        {
            Clientes obj = db.Clientes.Find(codcli);

            List<string> l_paises = 
                db.Clientes.Select(x => x.Pais).Distinct().ToList();

            ViewBag.PAISES = new SelectList(l_paises);

            return View(obj);
        }

        [HttpPost]
        public ActionResult Actualizar_Cliente_SP(Clientes cli)
        {
            // si no hubiera error, actualizamos y nos redireccionamos
            // hacia el listado de clientes
            if (ModelState.IsValid)
            { 
                // Actualizar el Cliente
                db.pa_actualizar_cliente(cli.IdCliente, cli.NombreCompañia,
                                         cli.Pais, cli.Telefono);

                //
                return RedirectToAction("Listar_Clientes_SP");
            }

            List<string> l_paises =
                db.Clientes.Select(x => x.Pais).Distinct().ToList();

            ViewBag.PAISES = new SelectList(l_paises);

            return View(cli);

        }

        public ActionResult Eliminar_Cliente_SP(string codcli)
        {
            Clientes obj = db.Clientes.Find(codcli);

            return View(obj);
        }

        [HttpPost]
        public ActionResult Eliminar_Cliente_SP(string codcli, Clientes xyz)
        {
            Clientes obj = db.Clientes.Find(codcli);

            try
            {
                db.pa_eliminar_cliente(codcli);

                return RedirectToAction("Listar_Clientes_SP");
            }
            catch (Exception)
            {
                ViewBag.MENSAJE = "Error al Eliminar al Cliente: " + obj.NombreCompañia;
                return View(obj);
            }

        }


        // PAGINACION
        public ActionResult ListarClientesPaginacion()
        {
            return View(db.Clientes.ToList());
        }


        public ActionResult ListarClientesPaginacionSP()
        {
            return View(db.pa_listar_clientes().ToList());
        }

        // 02-07-2020

        public ActionResult ListarPedidosPorCategoria(int codcat=0)
        {
            // devolvemos la lista de las categorias en un ViewBag
            ViewBag.CATEGORIAS = new SelectList(db.Categorias.ToList(),
                                        "IdCategoria","nombrecategoria");

            // devolvemos como modelo el resultado del proced. almacenado
            var lista = db.ProductosPorCategoria(codcat).ToList();

            return View(lista);
        }

        public ActionResult DetalleProducto(int id)
        {
            var prod = db.Productos.Find(id);
            
            return View(prod);
        }


        /*
        public ActionResult ListarPedidosPorCliente(string codigo="")
        {
            ViewBag.CLIENTES = new SelectList(
                db.Clientes.ToList(), "idcliente", "nombrecompañia");

            var lista = db.pa_pedidos_cliente(codigo).ToList();

            return View(lista);
        }

        */
        public ActionResult ListarPedidosPorCliente(string codigo = "", 
                                                    int nPag=1)
        {
            ViewBag.CODIGO = codigo;

            ViewBag.CLIENTES = new SelectList(
                db.Clientes.ToList(), "idcliente", "nombrecompañia");

            int n_filas = 4;

            var lista = db.pa_pedidos_cliente(codigo).ToList().ToPagedList(nPag, n_filas);

            return View(lista);
        }

        // version 2 para eliminar
        /*
        public ActionResult Eliminar_Cliente_SP(string codcli)
        {
            Clientes obj = db.Clientes.Find(codcli);

            return View(obj);
        }

        [HttpPost, ActionName("Eliminar_Cliente_SP")]
        public ActionResult Eliminar_Cliente_desde_SP(string codcli)
        {

            Clientes obj = db.Clientes.Find(codcli);

            try
            {
                db.pa_eliminar_cliente(codcli);

                return RedirectToAction("Listar_Clientes_SP");
            }
            catch (Exception)
            {
                ViewBag.MENSAJE = "Error al Eliminar al Cliente: "+obj.NombreCompañia;
                return View(obj);
            }
            
        }
        */

        // version de 3 para eliminar
        /*
        public ActionResult Eliminar_Cliente_SP(string codcli)
        {
            Clientes obj = db.Clientes.Find(codcli);

            TempData["codigo"] = codcli;

            return View(obj);
        }

        [HttpPost] 
        public ActionResult Eliminar_Cliente_desde_SP()
        {
            string codcli = TempData["codigo"].ToString();

            Clientes obj = db.Clientes.Find(codcli);

            try
            {
                db.pa_eliminar_cliente(codcli);

                return RedirectToAction("Listar_Clientes_SP");
            }
            catch (Exception)
            {
                ViewBag.MENSAJE = "Error al Eliminar al Cliente: " + obj.NombreCompañia;
                return View(obj);
            }

        }
        */
    }
}