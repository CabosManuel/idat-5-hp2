using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MVC_CarritoCompra.Models
{
    public class Carrito
    {
        [Key]
        public string codigo { get; set; }
        public string nombre { get; set; }
        public decimal precio { get; set; }
        public int cantidad { get; set; }
        public decimal importe {
            get {
                return precio * cantidad;
            }
        }
        //
        public Carrito() { }
        public Carrito(string xcod, string xnom,
                       decimal xpre, int xcant)
        {
            codigo = xcod;
            nombre = xnom;
            precio = xpre;
            cantidad = xcant;
        }
    }
}