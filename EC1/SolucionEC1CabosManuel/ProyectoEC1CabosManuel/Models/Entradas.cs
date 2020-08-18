using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.ComponentModel.DataAnnotations;

namespace ProyectoEC1CabosManuel.Models
{
    public class Entradas
    {
        [Required]
        [Range(100,999)]
        [Display(Name ="Nro Entrada")]
        public int NroEntrada { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Fecha Entrada")]
        public DateTime FechaEntrada { get; set; }

        [Display(Name = "Nombre Película")]
        [Required]
        public string NombrePelicula { get; set; }

        [DataType(DataType.Time)]
        [Required]
        public DateTime Horario { get; set; }

        [Range(9,25)]
        [Required]
        public decimal Precio { get; set; }

        [Required]
        [Range(1,10)]
        public int Cantidad { get; set; }

        [Required]
        public bool Pagado { get; set; }

        public decimal Importe { get; set; }

    }
}