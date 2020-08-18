using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using WebApiNeptuno2020.Models;

namespace WebApiNeptuno2020.Controllers
{
    public class PedidosAPIController : ApiController
    {
        Neptuno2020Entities bd = new Neptuno2020Entities();

        // GET: api/PedidosAPI
        public IEnumerable<PedidosProductoFechas_API_Result> GetProductosFechas(
            int xcod, DateTime xfecha1, DateTime xfecha2)
        {
            var lista = bd.PedidosProductoFechas_API(xcod, xfecha1, xfecha2);

            return lista.ToList();
        }

        // GET: api/PedidosAPI/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/PedidosAPI
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/PedidosAPI/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/PedidosAPI/5
        public void Delete(int id)
        {
        }
    }
}
