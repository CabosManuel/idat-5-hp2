using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.ComponentModel.DataAnnotations; // utilizar atributos de validacion, 
                                             // tambien para establecer un nombre sobre el campo del modelo

namespace AppMVC_CRUD.Models
{
    public class ALUMNO
    {
        // prop seguido de 2 veces tecla tab, para crear
        // propiedades
        [Required]
        [Range(100, 99999)]
        [Display(Name ="Codigo")]
        public int codalu { get; set; }

        [StringLength(50, MinimumLength =10)]
        [Display(Name ="Nombre del Alumno")]
        public string nomalu { get; set; }

        [Range(250, 550)]
        [Display(Name ="Pension")]
        public decimal pension { get; set; }
        //// 21-05-2020/////

        [DataType(DataType.Date)]
        public DateTime fecnac { get; set; }

        [Required]
        public bool genero { get; set; }

        [Required]
        public string carrera { get; set; }
    }
}