using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using System.IO;
using System.Net;
using System.Runtime.Serialization.Json;
using ClienteMVC_WebApi_BDTRANSITO.Models;

namespace ClienteMVC_WebApi_BDTRANSITO.Controllers
{
    public class PapeletasController : Controller
    {
        // GET: Papeletas
        public ActionResult PapeletasPropietario(string xdni)
        {
            string ruta = "http://localhost:11336/api/PapeletasAPI/GetPapeletasPropietario/" + xdni;
            //
            WebRequest solicitud = WebRequest.Create(ruta);
            //
            WebResponse respuesta = solicitud.GetResponse();
            //
            List<PAPELETAS_PROPIETARIO> lista = new List<PAPELETAS_PROPIETARIO>();
            //
            DataContractJsonSerializer json =
                new DataContractJsonSerializer(typeof(List<PAPELETAS_PROPIETARIO>));
            //
            Stream datos = respuesta.GetResponseStream();
            //
            lista = (List<PAPELETAS_PROPIETARIO>)json.ReadObject(datos);
            //
            ViewBag.DNI = xdni;
            //
            return View(lista);
        }

        public ActionResult PagarPapeleta(int xnumero)
        {
            string ruta = "http://localhost:11336/api/PapeletasAPI/Pagar_Papeleta/" + xnumero;
            //
            WebRequest solicitud = WebRequest.Create(ruta);
            //
            WebResponse respuesta = solicitud.GetResponse();
            //
            DataContractJsonSerializer json =
                new DataContractJsonSerializer(typeof(string));
            //
            Stream datos = respuesta.GetResponseStream();
            //
            string mensaje = json.ReadObject(datos).ToString();
            //
            ViewBag.NUMERO = xnumero;
            ViewBag.MENSAJE = mensaje;
            //
            return View();
        }

    }
}