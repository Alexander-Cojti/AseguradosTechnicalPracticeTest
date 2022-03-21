using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using PruebaTecnicaPractica.Models;

namespace PruebaTecnicaPractica.Data
{
    public class ContextDB : DbContext
    {
        public ContextDB(DbContextOptions<ContextDB> options) : base(options)
        {

        }
        public DbSet<t_asegurados> t_asegurados { get; set; }
        public DbSet<t_estado_civil> t_estado_civil { get; set; }
    }
}
