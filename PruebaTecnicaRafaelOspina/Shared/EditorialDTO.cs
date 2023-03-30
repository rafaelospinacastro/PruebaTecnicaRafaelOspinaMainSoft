using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PruebaDoubleV.Shared
{
    public class EditorialDTO
    {
        public class EditorialRequest
        {
            public int Id { get; set; }
            public string Nombres { get; set; }
            public string Sede { get; set; }
        }
        public class EditorialResponse
        {
            public int Id { get; set; }
            public string Nombres { get; set; }
            public string Sede { get; set; }
        }
    }
}
