using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PruebaDoubleV.Shared
{
    public class LibroDTO
    {
        public class LibroRequest
        {
            public int ISBN { get; set; }
            public int EditorialesId { get; set; }
            public string Titulo { get; set; }
            public string Sinopsis { get; set; }
            public string NPaginas { get; set; }
        }
        public class LibroResponse
        {
            public int ISBN { get; set; }
            public int EditorialesId { get; set; }
            public string Titulo { get; set; }
            public string Sinopsis { get; set; }
            public string NPaginas { get; set; }
        }
    }
}
