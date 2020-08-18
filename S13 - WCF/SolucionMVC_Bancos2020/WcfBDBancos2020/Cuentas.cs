using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Runtime.Serialization;

namespace WcfBDBancos2020
{
    [DataContract]
    public class Cuentas
    {
        [DataMember]
        public string num_cta { get; set; }
        [DataMember]
        public string cli_codigo { get; set; }
        [DataMember]
        public string cod_cta { get; set; }
        [DataMember]
        public decimal saldo { get; set; }
    }
}