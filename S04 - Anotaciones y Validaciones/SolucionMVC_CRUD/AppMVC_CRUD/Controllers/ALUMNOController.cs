using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using AppMVC_CRUD.Models; // acceder a los modelos

namespace AppMVC_CRUD.Controllers
{
    public class ALUMNOController : Controller
    {
        static List<ALUMNO> Lista = new List<ALUMNO>();

        void Poblar_Alumnos()
        {
            ALUMNO alu1 = new ALUMNO()
            {
                 codalu=101, nomalu="Victor Rojas", pension=420
            };
            ALUMNO alu2 = new ALUMNO()
            {
                codalu = 245, nomalu = "Susana Torres", pension = 400
            };
            //
            Lista.Add(alu1);
            Lista.Add(alu2);
        }

        // GET: ALUMNO
        public ActionResult Listado()
        {
            // poblar los alumnos
            // Poblar_Alumnos();
            // enviar la lista de alumnos "Lista" a la vista
            return View(Lista);
        }

        //////////////////////////
        // GET
        public ActionResult NuevoAlumno()
        {
            // mostrar una vista que nos permita ingresar los datos
            // de un nuevo alumno
            ALUMNO obj = new ALUMNO();
            // enviar la instancia (objeto) de la clase ALUMNO
            return View(obj);
        }

        // POST
        [HttpPost]
        public ActionResult NuevoAlumno(ALUMNO x)
        {
            int xcod = x.codalu;

            // si el modelo del alumno (x) es valido, entonces grabamos
            if (ModelState.IsValid==true)
            { 
                // almacenar en la lista de alumnos
                Lista.Add(x);
                // redirigirnos hacia el action Listado
                // return RedirectToAction("Listado");

                ViewData["mensaje1"] = "Alumno grabado correctamente";
                ViewData.Add("mensaje2", "Alumno grabado OK");

                ViewBag.MENSAJE = "Alumno: "+x.nomalu+" grabado exitosamente";
            }

            // ViewBag -> enviar datos desde el action a su vista
            // ViewData -> enviar datos desde el action a su vista
            //
            // TempData -> enviar datos desde un action a otro (action)
            // Session -> enviar datos desde un action a otro (action)

            return View(x);
        }


        // GET: EliminarAlumno
        public ActionResult EliminarAlumno(int codigo)
        {
            // encontrar los datos del Alumno a Eliminar
            ALUMNO buscado = new ALUMNO();
            //
            foreach (var item in Lista)
            {
                if (item.codalu==codigo)
                {
                    buscado = item;
                    break;
                }
            }

            return View(buscado);
        }


        // POST: EliminarAlumno
        [HttpPost]
        public ActionResult EliminarAlumno(int codigo, ALUMNO obj)
        {
            ALUMNO encontrado = Lista.Find(z => z.codalu == codigo);

            Lista.Remove(encontrado);

            ViewBag.MENSAJE = "Alumno con codigo: "+codigo+" fue eliminado";

            return View(obj);
        }

        /////// Desde aqui es lo nuevo: 21-05-2020 //////
        // GET : DetalleAlumno
        public ActionResult DetalleAlumno(int xcodalu=0)
        {
            // Lambda
            // ALUMNO alu_encontrado = Lista.Find(a => a.codalu == xcodigo);
            // Expresion de Consulta => siempre devuelve una lista
            ALUMNO alu_encontrado = (from a in Lista
                                     where a.codalu == xcodalu
                                    select a).FirstOrDefault();
            //
            return View(alu_encontrado);
        }
        
        // GET : EditarAlumno
        public ActionResult EditarAlumno(int xcodalu=0)
        {
            ALUMNO alu_editar = Lista.Find(a => a.codalu == xcodalu);

            return View(alu_editar);
        }

        // POST : EditarAlumno
        [HttpPost]
        public ActionResult EditarAlumno(int xcodalu, ALUMNO obj)
        {
            // original
            ALUMNO alu_editar = Lista.Find(a => a.codalu == xcodalu);

            alu_editar.nomalu = obj.nomalu;
            alu_editar.pension = obj.pension;
            alu_editar.fecnac = obj.fecnac;
            alu_editar.genero = obj.genero;
            alu_editar.carrera = obj.carrera;

            return RedirectToAction("Listado");
        }


    }
}