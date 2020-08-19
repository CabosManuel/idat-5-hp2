using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using WebApi_BDTRANSITO.Models;

namespace WebApi_BDTRANSITO.Controllers
{
    public class PropietarioAPIController : ApiController
    {
        BDTRANSITO2016Entities bd = new BDTRANSITO2016Entities();

        // GET: api/PropietarioAPI
        [HttpGet]
        [Route("api/PropietarioAPI/GetPropietarios/{xnombre}")]
        public List<LISTAR_PROPIETARIOS_Result> GetPropietarios(string xnombre)
        {
            return bd.LISTAR_PROPIETARIOS(xnombre).ToList();
        }

        /*
        // GET: api/PropietarioAPI/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/PropietarioAPI
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/PropietarioAPI/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/PropietarioAPI/5
        public void Delete(int id)
        {
        }
        */
    }
}
