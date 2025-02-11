﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AppMVC_Neptuno.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class Neptuno2019Entities : DbContext
    {
        public Neptuno2019Entities()
            : base("name=Neptuno2019Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Clientes> Clientes { get; set; }
        public virtual DbSet<Categorias> Categorias { get; set; }
        public virtual DbSet<Productos> Productos { get; set; }
    
        public virtual int pa_insertar_cliente(string idcliente, string nombre, string pais, string telefono)
        {
            var idclienteParameter = idcliente != null ?
                new ObjectParameter("idcliente", idcliente) :
                new ObjectParameter("idcliente", typeof(string));
    
            var nombreParameter = nombre != null ?
                new ObjectParameter("nombre", nombre) :
                new ObjectParameter("nombre", typeof(string));
    
            var paisParameter = pais != null ?
                new ObjectParameter("pais", pais) :
                new ObjectParameter("pais", typeof(string));
    
            var telefonoParameter = telefono != null ?
                new ObjectParameter("telefono", telefono) :
                new ObjectParameter("telefono", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pa_insertar_cliente", idclienteParameter, nombreParameter, paisParameter, telefonoParameter);
        }
    
        public virtual ObjectResult<pa_listar_clientes_Result> pa_listar_clientes()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<pa_listar_clientes_Result>("pa_listar_clientes");
        }
    
        public virtual ObjectResult<pa_pedidos_cliente_Result> pa_pedidos_cliente(string idcliente)
        {
            var idclienteParameter = idcliente != null ?
                new ObjectParameter("idcliente", idcliente) :
                new ObjectParameter("idcliente", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<pa_pedidos_cliente_Result>("pa_pedidos_cliente", idclienteParameter);
        }
    
        public virtual int pa_actualizar_cliente(string idcliente, string nombre, string pais, string telefono)
        {
            var idclienteParameter = idcliente != null ?
                new ObjectParameter("idcliente", idcliente) :
                new ObjectParameter("idcliente", typeof(string));
    
            var nombreParameter = nombre != null ?
                new ObjectParameter("nombre", nombre) :
                new ObjectParameter("nombre", typeof(string));
    
            var paisParameter = pais != null ?
                new ObjectParameter("pais", pais) :
                new ObjectParameter("pais", typeof(string));
    
            var telefonoParameter = telefono != null ?
                new ObjectParameter("telefono", telefono) :
                new ObjectParameter("telefono", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pa_actualizar_cliente", idclienteParameter, nombreParameter, paisParameter, telefonoParameter);
        }
    
        public virtual int pa_eliminar_cliente(string idcliente)
        {
            var idclienteParameter = idcliente != null ?
                new ObjectParameter("idcliente", idcliente) :
                new ObjectParameter("idcliente", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pa_eliminar_cliente", idclienteParameter);
        }
    
        public virtual ObjectResult<ProductosPorCategoria_Result> ProductosPorCategoria(Nullable<int> idcategoria)
        {
            var idcategoriaParameter = idcategoria.HasValue ?
                new ObjectParameter("idcategoria", idcategoria) :
                new ObjectParameter("idcategoria", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ProductosPorCategoria_Result>("ProductosPorCategoria", idcategoriaParameter);
        }
    }
}
