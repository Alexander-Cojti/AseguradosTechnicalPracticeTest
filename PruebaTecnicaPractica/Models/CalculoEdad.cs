using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaTecnicaPractica.Models
{
    public class CalculoEdad
    {
        [Required]
        public string Fecha { get; set; }
    }
}
