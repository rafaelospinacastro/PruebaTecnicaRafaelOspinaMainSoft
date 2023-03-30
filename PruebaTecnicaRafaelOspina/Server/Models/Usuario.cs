using System;
using System.Collections.Generic;

#nullable disable

namespace PruebaTecnicaRafaelOspina.Server.Models
{
    public partial class Usuario
    {
        public int Id { get; set; }
        public string Usuario1 { get; set; }
        public string Password { get; set; }
        public DateTime? FechaCreacion { get; set; }
    }
}
