using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using AppMVC_Neptuno.Models;

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

    }
}