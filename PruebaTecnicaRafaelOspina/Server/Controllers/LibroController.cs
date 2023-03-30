    using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PruebaDoubleV.Shared;
using PruebaTecnicaRafaelOspina.Server.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaTecnicaRafaelOspina.Server.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class LibroController : Controller
    {
        private readonly PruebaContext _context;

        public LibroController(PruebaContext context)
        {
            _context = context;
        }

        // GET: api/Personas
        [HttpGet]
        public async Task<ActionResult<IEnumerable<LibroDTO.LibroResponse>>> GetAutores()
        {
            var listado = from a in _context.Libros
                          select new LibroDTO.LibroResponse
                          {
                              EditorialesId = (int)a.EditorialesId,
                              ISBN = a.Isbn,
                              NPaginas = a.NPaginas,
                              Sinopsis = a.Sinopsis,
                              Titulo = a.Titulo
                          };

            return await listado.ToListAsync();
        }

        // GET: api/Personas/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Libro>> GetLibro(int id)
        {
            var persona = await _context.Libros.FindAsync(id);

            if (persona == null)
            {
                return NotFound();
            }

            return persona;
        }

        // PUT: api/Personas/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPersona(int id, Libro persona)
        {
            if (id != persona.Isbn)
            {
                return BadRequest();
            }

            _context.Entry(persona).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LibrosExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Personas
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        /*[HttpPost]
        public async Task<ActionResult<Persona>> PostPersona(Persona persona)
        {
            _context.Personas.Add(persona);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPersona", new { id = persona.Id }, persona);
        }*/
        [HttpPost]
        public async Task<ActionResult<bool>> CrearPersona(LibroDTO.LibroRequest personaVal)
        {
            try
            {
                var persona = new Libro
                {
                    Isbn = personaVal.ISBN,
                    NPaginas = personaVal.NPaginas,
                    Sinopsis = personaVal.Sinopsis,
                    Titulo = personaVal.Titulo
                };
                _context.Libros.Add(persona);
                await _context.SaveChangesAsync();

                return Ok(true);

            }
            catch (Exception ex)
            {
                return BadRequest("Se presento el siguiente problema " + ex.Message);

            }

        }

        // DELETE: api/Personas/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteLibro(int id)
        {
            var persona = await _context.Libros.FindAsync(id);
            if (persona == null)
            {
                return NotFound();
            }

            _context.Libros.Remove(persona);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool LibrosExists(int id)
        {
            return _context.Libros.Any(e => e.Isbn == id);
        }
    }
}
