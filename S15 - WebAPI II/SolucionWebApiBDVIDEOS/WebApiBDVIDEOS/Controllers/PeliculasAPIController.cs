using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using WebApiBDVIDEOS.Models;

namespace WebApiBDVIDEOS.Controllers
{
    public class PeliculasAPIController : ApiController
    {
        BDVIDEOS2016Entities bd = new BDVIDEOS2016Entities();

        // GET: api/PeliculasAPI
        public IEnumerable<int> GetAnios()
        {
            var lista = bd.Listar_Anios_Alquiler().ToList();

            return lista;
        }

        //

        public IEnumerable<Top_Peliculas_Alquiler_Anio_Result> GetTopPeliculasAnio(int num, int anio)
        {
            var lista = bd.Top_Peliculas_Alquiler_Anio(num, anio).ToList();

            return lista;
        }

        // GET: api/PeliculasAPI/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/PeliculasAPI
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/PeliculasAPI/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/PeliculasAPI/5
        public void Delete(int id)
        {
        }
    }
}
