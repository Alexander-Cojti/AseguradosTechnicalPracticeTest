using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PruebaTecnicaPractica.Data;
using PruebaTecnicaPractica.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Linq.Dynamic.Core;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Globalization;

namespace PruebaTecnicaPractica.Controllers
{
    public class AseguradosController : Controller
    {
        public string draw = string.Empty;
        public string start = string.Empty;
        public string length = string.Empty;
        public string sortColumn = string.Empty;
        public string sortColumnDir = string.Empty;
        public string SearchValue = string.Empty;
        public int pageSize = 0, skip = 0, recordsTotal = 0;

        private readonly ContextDB _context;

        public AseguradosController(ContextDB context)
        {
            _context = context;
        }

        // GET: Asegurados
        public ActionResult Index()
        {
            return View();

        }


        // GET: Asegurados/Details/5
        public async Task<IActionResult> Details(Int64? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var t_asegurados = await _context.t_asegurados
                .FirstOrDefaultAsync(m => m.Id == id);
            if (t_asegurados == null)
            {
                return NotFound();
            }

            return View(t_asegurados);
        }

        // GET: Asegurados/Create
        public IActionResult Create()
        {
            GetCatalogoEstadoCivil();
            return View();
        }

        public void GetCatalogoEstadoCivil()
        {
            List<SelectListItem> CatalogoEstadoCivil = new List<SelectListItem>()
            {
                new SelectListItem("--Seleccione--", "", true, false)
            };
            try
            {

                List<SelectListItem> CatalogoEstadoCivilBD = _context.t_estado_civil
                                     .Select(a => new SelectListItem()
                                     {
                                         Value = a.Id.ToString(),
                                         Text = a.Descripcion
                                     })
                                     .ToList();
                if (CatalogoEstadoCivilBD != null && CatalogoEstadoCivilBD.Count > 0)
                {
                    CatalogoEstadoCivil.AddRange(CatalogoEstadoCivilBD);
                }
            }
            catch (Exception error)
            {
                Console.WriteLine(error.Message);
            }

            ViewBag.CatalogoEstadoCivil = new SelectList((CatalogoEstadoCivil.OrderByDescending(x => x.Selected)), "Value", "Text");
        }

        // POST: Asegurados/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nombre,Apellidos,Fecha_de_nacimiento,Edad,Estado_civil")] t_asegurados t_asegurados)
        {
            if (ModelState.IsValid)
            {
                _context.Add(t_asegurados);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(t_asegurados);
        }

        // GET: Asegurados/Edit/5


        public async Task<IActionResult> Edit(Int64? id)
        {
            if (id == null && id < 0)
            {
                return NotFound();
            }

            var t_asegurados = await _context.t_asegurados.FindAsync(id);
            if (t_asegurados == null)
            {
                return NotFound();
            }
            GetCatalogoEstadoCivil();
            return View(t_asegurados);
        }

        // POST: Asegurados/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Nombre,Apellidos,Fecha_de_nacimiento,Edad,Estado_civil")] t_asegurados t_asegurados)
        {
            if (id != t_asegurados.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(t_asegurados);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!t_aseguradosExists(t_asegurados.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(t_asegurados);
        }

        // GET: Asegurados/Delete/5
        public async Task<IActionResult> Delete(Int64? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var t_asegurados = await _context.t_asegurados
                .FirstOrDefaultAsync(m => m.Id == id);
            if (t_asegurados == null)
            {
                return NotFound();
            }

            return View(t_asegurados);
        }

        // POST: Asegurados/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Int64 id)
        {
            var t_asegurados = await _context.t_asegurados.FindAsync(id);
            _context.t_asegurados.Remove(t_asegurados);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool t_aseguradosExists(Int64 id)
        {
            return _context.t_asegurados.Any(e => e.Id == id);
        }
        [HttpPost]
        public ActionResult CalcularFechaNacimientoPorEdad(CalculoFechaNacimiento calculoFechaNacimiento)
        {
            string FechaNacimiento = string.Empty;
            if (ModelState.IsValid)
            {
                int Edad = Convert.ToInt32(calculoFechaNacimiento.Edad);
                DateTime now = DateTime.Today;
                FechaNacimiento = now.ToString("yyyy-MM-dd");
                if (Edad > 0)
                {
                    FechaNacimiento = now.AddYears(-Edad).ToString("yyyy-MM-dd");
                }
            }
            return Json(new { FechaNacimiento });
        }

        [HttpPost]
        public ActionResult CalcularEdadPorFecha(CalculoEdad calculoEdad)
        {
            int Edad = 0;
            if (ModelState.IsValid)
            {
                DateTime FechaNacimiento = DateTime.ParseExact(calculoEdad.Fecha, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                DateTime now = DateTime.Today;
                if (FechaNacimiento <= now)
                {
                    Edad = now.Year - FechaNacimiento.Year;
                }
            }
            return Json(new { Edad });
        }

        [HttpPost]
        public ActionResult Json()
        {
            List<t_asegurados> asegurados = new List<t_asegurados>();

            var draw = HttpContext.Request.Form.Where(x => x.Key.Equals("draw")).FirstOrDefault().Value;

            var start = HttpContext.Request.Form.Where(x => x.Key.Equals("start")).FirstOrDefault().Value.ToString();

            var length =
                HttpContext.Request.Form.Where(x => x.Key.Equals("length")).FirstOrDefault().Value.ToString();
            var order = HttpContext.Request.Form.Where(x => x.Key.Equals("order[0][column]")).FirstOrDefault().Value.ToString();
            var sortColumn =
                HttpContext.Request.Form.Where(x => x.Key.Equals("columns[" + order
                + "][name]")).FirstOrDefault().Value.ToString();
            var sortColumnDir =
            HttpContext.Request.Form.Where(x => x.Key.Equals("order[0][dir]")).FirstOrDefault().Value;
            var searchValue =
            HttpContext.Request.Form.Where(x => x.Key.Equals("search[value]")).FirstOrDefault().Value.ToString();

            pageSize = (string.IsNullOrEmpty(length)) ? 0 : Convert.ToInt32(length);
            skip = (string.IsNullOrEmpty(start)) ? 0 : Convert.ToInt32(start);
            recordsTotal = 0;

            IQueryable<t_asegurados> query = (
                from a in _context.t_asegurados
                select new t_asegurados
                {
                    Id = a.Id,
                    Nombre = a.Nombre,
                    Apellidos = a.Apellidos,
                    Fecha_de_nacimiento = a.Fecha_de_nacimiento,
                    Edad = a.Edad,
                    Estado_civil = a.Estado_civil,
                });
            if (searchValue != string.Empty)
            {
                query = query.Where(d => d.Nombre.Contains(searchValue) || d.Apellidos.Contains(searchValue));
            }

            if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDir)))
            {

                query = query.OrderBy($"{sortColumn} {sortColumnDir}");

            }
            recordsTotal = query.Count();

            asegurados = query.Skip(skip).Take(pageSize).ToList();

            List<t_estado_civil> list = _context.t_estado_civil.FromSqlRaw<t_estado_civil>("exec sp_get_t_estado_civil").ToList();
            List<ViewDataModelAsegurados> aseguradosCompleto = new List<ViewDataModelAsegurados>();
            foreach (var item in asegurados)
            {
                aseguradosCompleto.Add(new ViewDataModelAsegurados(item, list.Find(x => x.Id == item.Estado_civil).Descripcion));
            }
            return Json(new
            {
                draw = draw,
                recordsFiltered = recordsTotal,
                recordsTotal = recordsTotal,
                data = aseguradosCompleto
            });
        }
    }
}
