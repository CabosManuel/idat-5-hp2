using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MVC_Neptuno2019_EF.Models;//(1)

namespace MVC_Neptuno2019_EF.Controllers
{
    public class ClientesV1Controller : Controller
    {
        //crear variable para utilizar al entity framework
        Neptuno2019Entities bd = new Neptuno2019Entities();//(2)

        // GET: ClientesV1
        public ActionResult ListadoClientes()
        {
            List<Clientes> lista = bd.Clientes.ToList();
            return View(lista);
        }

        // GET: ClientesV1/Details/5
        public ActionResult DetalleCliente(String id)
        {
            Clientes cliente = bd.Clientes.ToList().Find(c=>c.IdCliente.Equals(id));
            return View();
        }

        // GET: ClientesV1/Create
        public ActionResult GrabarCliente()
        {
            Clientes objcli = new Clientes();
            return View();
        }

        // POST: ClientesV1/Create
        [HttpPost]
        public ActionResult GrabarCliente(FormCollection collection)
        {
            try
            {
                string xcod = collection.Get("txtcod");

                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ClientesV1/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ClientesV1/Edit/5
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

        // GET: ClientesV1/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ClientesV1/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
