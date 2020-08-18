using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


using WebApiNeptuno.Controllers;
using WebApiNeptuno.Models;

namespace WebApiNeptuno.Controllers
{
    public class ClientesController : Controller
    {

        ApiClientesController api = new ApiClientesController();

        // GET: Clientes
        public ActionResult ListarClientes()
        {
            return View(api.GetClientes().ToList());
        }

        public ActionResult ListarApiClientes()
        {
            return View(api.GetApiClientes().ToList());
        }

        // GET: Clientes/Details/5
        public ActionResult DetalleCliente(string cod)
        {
            return View(api.GetCliente(cod));
        }

        // GET: Clientes/Create
        public ActionResult CrearCliente()
        {
            return View(new Clientes());
        }

        // POST: Clientes/Create
        [HttpPost]
        public ActionResult CrearCliente(Clientes cli)
        {
            ViewBag.Mensaje = api.CrearCliente(cli);
            return View(cli);
        }

        // GET: Clientes/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Clientes/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Clientes/Delete/5
        public ActionResult EliminarCliente(string cod)
        {
            Clientes cli = api.GetCliente(cod);
            return View(cod);
        }

        // POST: Clientes/Delete/5
        [HttpPost]
        public ActionResult EliminarCliente(string cod, Clientes cli)
        {
            Clientes obj = api.GetCliente(cod);
            ViewBag.Mensaje = api.EliminarCliente(cod);

            return View();
        }
    }
}
