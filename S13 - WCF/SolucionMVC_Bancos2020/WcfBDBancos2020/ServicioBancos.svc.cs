using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

using System.Data;
using System.Data.SqlClient; // sqldatareader

namespace WcfBDBancos2020
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "ServicioBancos" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione ServicioBancos.svc o ServicioBancos.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class ServicioBancos : IServicioBancos
    {
        string cad_cn = 
            "server=.;database=bdbancos2020;user id=sa;password=sql;";
        public string Grabar_Cuenta(Cuentas obj)
        {
            string mensaje = "";
            try
            {
                SqlHelper.ExecuteNonQuery(cad_cn, "Grabar_Cuenta",
                         obj.num_cta, obj.cli_codigo, obj.cod_cta, obj.saldo);

                mensaje = "Nueva Cuenta creada correctamente";
            }
            catch (Exception ex)
            {
                mensaje=ex.Message;
            }

            return mensaje;
        }

        public List<Cuentas> Listar_Cuentas()
        {
            List<Cuentas> lista = new List<Cuentas>();

            SqlDataReader dr = SqlHelper.ExecuteReader(cad_cn, "Listar_Cuentas");

            while (dr.Read())
            {
                Cuentas c = new Cuentas();
                c.num_cta = dr[0].ToString();
                c.cli_codigo = dr[1].ToString();
                c.cod_cta = dr[2].ToString();
                c.saldo = dr.GetDecimal(3);
                //
                lista.Add(c);
            }
            dr.Close();

            return lista;
        }
    }
}
