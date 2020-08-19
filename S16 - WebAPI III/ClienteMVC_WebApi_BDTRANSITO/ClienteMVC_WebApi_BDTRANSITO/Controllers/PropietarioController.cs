using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using System.IO; // stream
using System.Net; // webrequest, webresponse
using System.Runtime.Serialization.Json; // datacontractjsonserializer
using ClienteMVC_WebApi_BDTRANSITO.Models; // modelos

namespace ClienteMVC_WebApi_BDTRANSITO.Controllers
{
    public class PropietarioController : Controller
    {
        // GET: Propietario
        public ActionResult ListarPropietarios(string xnom="")
        {
            if (xnom == null || xnom == string.Empty)
                xnom = "A";
            //
            string ruta = "http://localhost:11336/api/PropietarioAPI/GetPropietarios/"+xnom;
            //
            WebRequest solicitud = WebRequest.Create(ruta);
            //
            WebResponse respuesta = solicitud.GetResponse();
            //
            List<LISTAR_PROPIETARIOS> lista = new List<LISTAR_PROPIETARIOS>();
            //
            DataContractJsonSerializer json = 
                new DataContractJsonSerializer(typeof(List<LISTAR_PROPIETARIOS>));
            //
            Stream datos = respuesta.GetResponseStream();
            //
            lista = (List<LISTAR_PROPIETARIOS>)json.ReadObject(datos);
            //
            ViewBag.NOMBRE = xnom;
            //
            return View(lista);
        }
    }
}