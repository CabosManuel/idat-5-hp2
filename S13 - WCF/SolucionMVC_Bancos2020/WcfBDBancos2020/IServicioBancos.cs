using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WcfBDBancos2020
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IServicioBancos" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IServicioBancos
    {
        [OperationContract]
        string Grabar_Cuenta(Cuentas obj);

        [OperationContract]
        List<Cuentas> Listar_Cuentas();
    }
}
