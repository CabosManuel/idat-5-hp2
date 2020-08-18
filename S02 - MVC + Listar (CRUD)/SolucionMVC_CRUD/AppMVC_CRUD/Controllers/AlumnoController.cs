using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using AppMVC_CRUD.Models; //Acceso al Model

namespace AppMVC_CRUD.Controllers
{
    public class AlumnoController : Controller
    {
        static List<Alumno> alumnos = new List<Alumno>();

        void setAlumnos()
        {
            Alumno alu1 = new Alumno()
            {
                codAlu = 101,
                nomAlu = "Manuel Cabos",
                pension = 460
            };
            Alumno alu2 = new Alumno()
            {
                codAlu = 102,
                nomAlu = "Alejandro Apolaya",
                pension = 460
            };
            alumnos.Add(alu1);
            alumnos.Add(alu2);
        }

        // GET: Alumno
        public ActionResult Listado()
        {
            setAlumnos();
            return View(alumnos);
        }
    }
}