using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using WebApiBDVIDEOS.Models;

namespace WebApiBDVIDEOS.Controllers
{
    public class PeliculasController : Controller
    {
        PeliculasAPIController api = new PeliculasAPIController();

        // GET: Peliculas
        public ActionResult TopPeliculasAnio(int n_top=5, int n_anio=2015)
        {
            ViewBag.TOP = n_top;
            ViewBag.ANIOS = new SelectList(api.GetAnios());

            return View(api.GetTopPeliculasAnio(n_top, n_anio));
        }
    }
}