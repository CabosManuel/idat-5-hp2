using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using EC2_ManuelCabos.Models;
using PagedList;

namespace EC2_ManuelCabos.Controllers
{
    public class CitasController : Controller
    {

        BDCLINICA2019 db = new BDCLINICA2019();
        
        public ActionResult insertar_cita_sp()
        {
            List<string> listaMedicos = (from m in db.Medicos select m.codmed).Distinct().ToList();
            List<string> listaPacientes = (from p in db.Pacientes select p.codpac).Distinct().ToList();

            ViewBag.medicos = new SelectList(listaMedicos);
            ViewBag.pacientes = new SelectList(listaPacientes);
            
            return View(new Citas());
        }
        
        [HttpPost]
        public ActionResult insertar_cita_sp(Citas obj)
        {
            if (ModelState.IsValid)
            {
                db.sp_insertar_cita(obj.nrocita, obj.codmed, obj.codpac, obj.tipo, obj.pago, obj.fecha, obj.descrip);
                return RedirectToAction("listar_citas_sp");
            }            

            List<string> listaMedicos = db.Citas.Select(c => c.codmed).Distinct().ToList();
            List<string> listaPacientes = db.Citas.Select(c => c.codpac).Distinct().ToList();
            
            ViewBag.medicos = new SelectList(listaMedicos);
            ViewBag.pacientes = new SelectList(listaPacientes);

            return View(obj);
        }
        
        public ActionResult listar_citas_sp()
        {
            return View(db.sp_listar_citas().ToList());
        }

        public ActionResult actualizar_cita_sp(int ncita)
        {
            Citas obj = db.Citas.Find(ncita);

            List<string> listaMedicos = db.Citas.Select(c => c.codmed).Distinct().ToList();
            List<string> listaPacientes = db.Citas.Select(c => c.codpac).Distinct().ToList();
            
            ViewBag.medicos = new SelectList(listaMedicos);
            ViewBag.pacientes = new SelectList(listaPacientes);

            return View(obj);
        }

        [HttpPost]
        public ActionResult actualizar_cita_sp(Citas obj)
        {
            if (ModelState.IsValid)
            {                
                db.sp_actualizar_cita(obj.nrocita,obj.codmed,obj.codpac,obj.tipo,obj.pago,obj.fecha,obj.descrip);
                return RedirectToAction("listar_citas_sp");
            }

            List<string> listaMedicos = db.Citas.Select(c => c.codmed).Distinct().ToList();
            List<string> listaPacientes = db.Citas.Select(c => c.codpac).Distinct().ToList();

            ViewBag.medicos = new SelectList(listaMedicos);
            ViewBag.pacientes = new SelectList(listaPacientes);

            return View(obj);

        }

        public ActionResult eliminar_cita_sp(int ncita)
        {
            Citas obj = db.Citas.Find(ncita);
            return View(obj);
        }

        [HttpPost]
        public ActionResult eliminar_cita_sp(int ncita, Citas extra)
        {
            Citas obj = db.Citas.Find(ncita);

            try
            {
                db.sp_eliminar_cita(ncita);
                return RedirectToAction("listar_citas_sp");
            }
            catch (Exception)
            {
                ViewBag.msj = "Error al Eliminar la cita: " + obj.nrocita;
                return View(obj);
            }

        }

        public ActionResult medico_anio_sp(string codmed = "",int anio=0,int nPag=1)
        {
            ViewBag.codmed = codmed;
            ViewBag.anio = anio;
            ViewBag.medicos = new SelectList(db.Medicos.ToList(),"codmed", "codmed");

            int nFilas = 4;
            var lista = db.sp_medico_anio(codmed,anio).ToList().ToPagedList(nPag,nFilas);

            return View(lista);
        }

        public ActionResult detalle_cita_sp(int ncita)
        {
            var obj = db.sp_detalle_cita(ncita);
            return View(obj);
        }

        public ActionResult medico_especialidad_sp(string codesp = "",int nPag = 1)
        {
            ViewBag.codesp = codesp;
            ViewBag.especialidades = new SelectList(db.Especialidad.ToList(), "codesp", "codesp");

            int nFilas = 3;
            var lista = db.sp_medico_especilidad(codesp).ToList().ToPagedList(nPag, nFilas);

            return View(lista);
        }
    }
}