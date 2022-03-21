using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaTecnicaPractica.Models
{
    public class t_estado_civil
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [MaxLength(10)]
        public string Descripcion { get; set; }
    }
    public class ComboCitiesViewModel
    {
        public IEnumerable<t_estado_civil> CatEstadoCivil { get; set; }

        public int SelectedEstadoCivil { get; set; }

    }
}
