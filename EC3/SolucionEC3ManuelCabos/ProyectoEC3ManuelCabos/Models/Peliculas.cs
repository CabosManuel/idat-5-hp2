//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoEC3ManuelCabos.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Peliculas
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Peliculas()
        {
            this.Venta_Detalle = new HashSet<Venta_Detalle>();
            this.Actores = new HashSet<Actores>();
        }
    
        public string cod_pel { get; set; }
        public string nom_pel { get; set; }
        public Nullable<int> duracion { get; set; }
        public string cod_gen { get; set; }
        public Nullable<int> cant_cop { get; set; }
        public Nullable<int> año { get; set; }
    
        public virtual Genero Genero { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Venta_Detalle> Venta_Detalle { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Actores> Actores { get; set; }
    }
}
