using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using WebApi_BDTRANSITO.Models;

namespace WebApi_BDTRANSITO.Controllers
{
    public class PapeletasAPIController : ApiController
    {
        BDTRANSITO2016Entities bd = new BDTRANSITO2016Entities();

        // GET: api/PapeletasAPI
        [HttpGet]
        [Route("api/PapeletasAPI/GetPapeletasPropietario/{xdni}")]
        public List<PAPELETAS_PROPIETARIO_Result> GetPapeletasPropietario(string xdni)
        {
            return bd.PAPELETAS_PROPIETARIO(xdni).ToList();
        }

        [HttpGet]
        [Route("api/PapeletasAPI/Pagar_Papeleta/{xnumero}")]
        public string Pagar_Papeleta(int xnumero)
        {
            string mensaje = "";
            try
            {
                bd.PAGAR_PAPELETA(xnumero);
                mensaje = "Numero de Papeleta: "+xnumero+" fue pagado correctamente";
            }
            catch (Exception ex)
            {
                mensaje = "Error: "+ex.Message;
            }
            return mensaje;
        }

        /*
        // GET: api/PapeletasAPI/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/PapeletasAPI
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/PapeletasAPI/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/PapeletasAPI/5
        public void Delete(int id)
        {
        }
        */
    }
}
