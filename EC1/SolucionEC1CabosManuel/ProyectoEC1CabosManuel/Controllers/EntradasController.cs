using ProyectoEC1CabosManuel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoEC1CabosManuel.Controllers
{
    public class EntradasController : Controller
    {
        static List<Entradas> listaEntradas = new List<Entradas>();
        List<string> listaPeliculas = new List<string>()
        {
            "Kimi no na wa",
            "Evangelion: 3.0+1.0",
            "Interestelar",
            "Godzilla",
            "Ready Player One",
            "Pacific Rim",
            "Iron Man",
            "Batman vs Superman",
            "Guía del autoestopista galáctico",
            "Kung Fu Panda"
        };

        // GET: Lista_Entradas
        public ActionResult Lista_Entradas()
        {
            return View(listaEntradas);
        }


        // GET: Crear_Entrada
        public ActionResult Crear_Entrada()
        {
            Entradas entrada = new Entradas();
            ViewBag.peliculas = new SelectList(listaPeliculas);
            return View(entrada);
        }

        // POST: Crear_Entrada
        [HttpPost]
        public ActionResult Crear_Entrada(Entradas nuevaEntrada)
        {
            int nEntrada = nuevaEntrada.NroEntrada;
            
			
			//Validar si la entrada esta pagada para calcular importe (precio*cantidad)-------------------
			decimal importe = 0;
            if (nuevaEntrada.Pagado)
            {
                 importe = nuevaEntrada.Precio * nuevaEntrada.Cantidad;
            }
            nuevaEntrada.Importe = importe;
			//--------------------------------------------------------------------------------------------

            if (ModelState.IsValid)
            {
                listaEntradas.Add(nuevaEntrada);
                ViewBag.msj = "Entrada Nro Entrada " + nEntrada + " creada correctamente.";
            }

            ViewBag.peliculas = new SelectList(listaPeliculas);

            return View(nuevaEntrada);
        }


        // GET: Detalle_Entrada
        public ActionResult Detalle_Entrada(int nEntrada = 0)
        {
            Entradas entradaEncontrada = (from e in listaEntradas where e.NroEntrada == nEntrada select e).FirstOrDefault();
            return View(entradaEncontrada);
        }


        // GET: Eliminar_Entrada
        public ActionResult Eliminar_Entrada(int entrada)
        {
            ViewBag.nroEntrada = entrada;

            Entradas entradaEliminar = new Entradas();
            
            foreach(var item in listaEntradas)
            {
                if (item.NroEntrada == entrada)
                {
                    entradaEliminar = item;
                    break;
                }
            }
            
            return View(entradaEliminar);
        }

        // POST: Eliminar_Entrada
        [HttpPost]
        public ActionResult Eliminar_Entrada(int entrada, Entradas obj)
        {
            Entradas entradaEncontrada = listaEntradas.Find(x => x.NroEntrada == entrada);
            listaEntradas.Remove(entradaEncontrada);
            ViewBag.msj = "La entrada con Nro Entrada " + entrada + " fue eliminada";
            return View(obj);
        }


        // GET: Salir (Redirecciona a la vista de Login para logearse otra ves)
        public ActionResult Salir()
        {
            return RedirectToAction("Login", "Login");
        }
    }
}