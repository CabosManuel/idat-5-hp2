using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClienteMVC_WebApi_BDTRANSITO.Models
{
    public class PAPELETAS_PROPIETARIO
    {
        public int NROPAP { get; set; }
        public string NROPLA { get; set; }
        public string DESINF { get; set; }
        public string PAPFECHA { get; set; }
        public Nullable<decimal> IMPORTE { get; set; }
        public string PAGADO { get; set; }
    }
}