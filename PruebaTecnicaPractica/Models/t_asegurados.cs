using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaTecnicaPractica.Models
{
    public class t_asegurados
    {
        [Key]
        public Int64 Id { get; set; }
        [StringLength(60)]
        [Required]
        public string Nombre { get; set; }
        [Required]
        [StringLength(120)]
        public string Apellidos { get; set; }
        [Required]
        [DataType(DataType.Date)]
        public DateTime Fecha_de_nacimiento { get; set; }
        [Required]
        public int Edad { get; set; }
        [Required]
        public int Estado_civil { get; set; }
    }

    public class ViewDataModelAsegurados
    {
        public ViewDataModelAsegurados()
        {

        }
        public ViewDataModelAsegurados(t_asegurados t, string estadoCivil)
        {
            this.Id = t.Id;
            this.Nombre = t.Nombre;
            this.Apellidos = t.Apellidos;
            this.Edad = t.Edad;
            this.Fecha_de_nacimiento = t.Fecha_de_nacimiento;
            this.Estado_civil = t.Estado_civil;
            this.Ec_desc = estadoCivil;
        }
        public Int64 Id { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public DateTime Fecha_de_nacimiento { get; set; }
        public int Edad { get; set; }
        public int Estado_civil { get; set; }
        public string Ec_desc { get; set; }
    }
}
