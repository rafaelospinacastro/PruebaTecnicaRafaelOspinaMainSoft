using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PruebaDoubleV.Shared
{
    public class PersonaDTO
    {
        public class CrearPersona
        {            
            public string Nombres { get; set; }
            public string Apellidos { get; set; }
            public string NumeroIdentificacion { get; set; }
            public string Email { get; set; }
            public string TipoIdentificacion { get; set; }
        }
    }
}
