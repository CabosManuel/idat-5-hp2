//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MVC_CarritoCompra.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Clientes
    {
        [Key]
        public string cli_cod { get; set; }
        public string cli_nom { get; set; }
        public string cli_tel { get; set; }
        public string cli_cor { get; set; }
        public string cli_dir { get; set; }
        public Nullable<decimal> cli_cre { get; set; }
    }
}
