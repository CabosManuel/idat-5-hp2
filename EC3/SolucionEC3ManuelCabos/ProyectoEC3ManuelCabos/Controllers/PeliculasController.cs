using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using ProyectoEC3ManuelCabos.Models;
using PagedList;

namespace ProyectoEC3ManuelCabos.Controllers
{
    public class PeliculasController : Controller
    {
        BDVIDEOS2019Entities db = new BDVIDEOS2019Entities();
        public ActionResult buscar_peliculas(string cod_gen= "",int año=0,int nPag=1)
        {
            ViewBag.vbCodGen = cod_gen;
            ViewBag.vbAño = año;
            ViewBag.vbGeneros = new SelectList(db.Genero.ToList(), "cod_gen", "cod_gen");

            int nFilas = 5;
            var listaGeneros = db.sp_buscar_peliculas(cod_gen, año).ToList().ToPagedList(nPag, nFilas);

            return View(listaGeneros);
        }

       
    }
}