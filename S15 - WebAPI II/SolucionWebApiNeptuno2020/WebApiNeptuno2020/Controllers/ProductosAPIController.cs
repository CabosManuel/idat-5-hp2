using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using WebApiNeptuno2020.Models;

namespace WebApiNeptuno2020.Controllers
{
    public class ProductosAPIController : ApiController
    {
        Neptuno2020Entities bd = new Neptuno2020Entities();

        // GET: api/ProductosAPI
        public IEnumerable<Listar_Productos_API_Result> GetProductos()
        {
            return bd.Listar_Productos_API().ToList();
        }

        // GET: api/ProductosAPI/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/ProductosAPI
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/ProductosAPI/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/ProductosAPI/5
        public void Delete(int id)
        {
        }
    }
}
