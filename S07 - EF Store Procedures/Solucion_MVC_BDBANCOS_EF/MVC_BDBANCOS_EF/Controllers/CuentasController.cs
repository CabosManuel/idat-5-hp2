using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MVC_BDBANCOS_EF.Models;

namespace MVC_BDBANCOS_EF.Controllers
{
    public class CuentasController : Controller
    {
        // definir la variable del Entity Framework
        BDBANCOS2018Entities db = new BDBANCOS2018Entities();

        // GET: Cuentas
        public ActionResult ListadoCuentas()
        {
            return View(db.usp_Listar_Cuentas().ToList());
        }

        // GET: Cuentas/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Cuentas/Create
        public ActionResult Grabar_Cuenta()
        {
            // enviar a traves de 2 variables ViewBag, la lista de clientes y 
            // de tipos de cuenta
            ViewBag.CLIENTES = 
                new SelectList(db.Clientes.ToList(),"cli_codigo","cli_nombre");

            ViewBag.TIPO_CUENTAS =
                new SelectList(db.Tipo_Cuentas.ToList(),"cod_cta","desc_cta");

            return View(new Cuentas());
        }

        // POST: Cuentas/Create
        [HttpPost]
        public ActionResult Grabar_Cuenta(Cuentas obj)
        {
            try
            {
                // TODO: Add insert logic here
                db.Cuentas.Add(obj); // se almacena en memoria
                db.SaveChanges(); // se confirma la insercion de la nueva cuenta

                return RedirectToAction("ListadoCuentas");
            }
            catch
            {
                // enviar a traves de 2 variables ViewBag, la lista de clientes y 
                // de tipos de cuenta
                ViewBag.CLIENTES =
                    new SelectList(db.Clientes.ToList(), "cli_codigo", "cli_nombre");

                ViewBag.TIPO_CUENTAS =
                    new SelectList(db.Tipo_Cuentas.ToList(), "cod_cta", "desc_cta");

                return View(obj);
            }
        }

        // GET: Cuentas/Edit/5
        public ActionResult Actualizar_Cuenta(string id)
        {
            Cuentas obj = db.Cuentas.Find(id);

            // enviar a traves de 2 variables ViewBag, la lista de clientes y 
            // de tipos de cuenta
            ViewBag.CLIENTES =
                new SelectList(db.Clientes.ToList(), "cli_codigo", "cli_nombre");

            ViewBag.TIPO_CUENTAS =
                new SelectList(db.Tipo_Cuentas.ToList(), "cod_cta", "desc_cta");

            return View(obj);
        }

        // POST: Cuentas/Edit/5
        [HttpPost]
        public ActionResult Actualizar_Cuenta(Cuentas obj)
        {
            try
            {
                // TODO: Add update logic here
                db.usp_Actualizar_Cuenta(obj.num_cta, obj.cli_codigo,
                                          obj.cod_cta, obj.saldo);

                return RedirectToAction("ListadoCuentas");
            }
            catch
            {
                // enviar a traves de 2 variables ViewBag, la lista de clientes y 
                // de tipos de cuenta
                ViewBag.CLIENTES =
                    new SelectList(db.Clientes.ToList(), "cli_codigo", "cli_nombre");

                ViewBag.TIPO_CUENTAS =
                    new SelectList(db.Tipo_Cuentas.ToList(), "cod_cta", "desc_cta");

                return View(obj);
            }
        }

        // GET: Cuentas/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Cuentas/Delete/5
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
