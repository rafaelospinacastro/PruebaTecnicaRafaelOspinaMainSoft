﻿using System;
using System.Collections.Generic;

#nullable disable

namespace PruebaDoubleV.Server.Models
{
    public partial class Persona
    {
        public int Id { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string NumeroIdentificacion { get; set; }
        public string Email { get; set; }
        public string TipoIdentificacion { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public string TipoNumIdentificacion { get; set; }
        public string NombresApellidos { get; set; }
    }
}
