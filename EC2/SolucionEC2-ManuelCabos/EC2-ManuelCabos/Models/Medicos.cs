//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EC2_ManuelCabos.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Medicos
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Medicos()
        {
            this.Citas = new HashSet<Citas>();
        }
    
        public string codmed { get; set; }
        public string codesp { get; set; }
        public string nommed { get; set; }
        public Nullable<int> anio_colegio { get; set; }
        public string coddis { get; set; }
        public Nullable<int> estado { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Citas> Citas { get; set; }
        public virtual Distrito Distrito { get; set; }
        public virtual Especialidad Especialidad { get; set; }
    }
}
