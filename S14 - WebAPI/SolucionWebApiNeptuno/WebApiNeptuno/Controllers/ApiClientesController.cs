using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using WebApiNeptuno.Models;

namespace WebApiNeptuno.Controllers
{
    public class ApiClientesController : ApiController
    {

        Neptuno2019Entities db = new Neptuno2019Entities();

        // GET: api/ApiClientes
        public IEnumerable<Clientes> GetClientes()
        {
            return db.Clientes.ToList();
        }

        // GET: api/ApiClientes/5
        public Clientes GetCliente(string cod)
        {
            return db.Clientes.Find(cod);
        }

        // GET con STORE PROCEDURE
        public IEnumerable<sp_api_listar_clientes_Result> GetApiClientes()
        {
            return db.sp_api_listar_clientes().ToList();
        }


        // POST: api/ApiClientes
        public string CrearCliente(Clientes cli)
        {
            string mensaje = "";
            try
            {
                db.Clientes.Add(cli);
                db.SaveChanges();
                mensaje = "Se registro correctamente";
            }
            catch (Exception e)
            {
                mensaje = "ERROR: " + e.Message;
            }
            return mensaje;
        }

        // PUT: api/ApiClientes/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/ApiClientes/5
        public string EliminarCliente(string cod)
        {
            string mensaje = "";
            try
            {
                Clientes c = GetCliente(cod);
                db.Clientes.Remove(c);
                db.SaveChanges();
                mensaje = "Cliente eliminado correctamente";
            }
            catch (Exception e)
            {
                mensaje = "ERROR: "+e.Message;
            }
            return mensaje;
        }
    }
}
