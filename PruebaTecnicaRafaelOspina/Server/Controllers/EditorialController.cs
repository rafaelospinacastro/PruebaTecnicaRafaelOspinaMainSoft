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
    public class EditorialController : Controller
    {
        private readonly PruebaContext _context;

        public EditorialController(PruebaContext context)
        {
            _context = context;
        }

        // GET: api/Personas
        [HttpGet]
        public async Task<ActionResult<IEnumerable<EditorialDTO.EditorialResponse>>> GetAutores()
        {
            var listado = from a in _context.Editoriales
                          select new EditorialDTO.EditorialResponse
                          {
                              Nombres = a.Nombre,
                              Sede = a.Sede,
                              Id = a.Id
                          };

            return await listado.ToListAsync();
        }

        // GET: api/Personas/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Editoriale>> GetAutor(int id)
        {
            var persona = await _context.Editoriales.FindAsync(id);

            if (persona == null)
            {
                return NotFound();
            }

            return persona;
        }

        // PUT: api/Personas/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPersona(int id, Editoriale persona)
        {
            if (id != persona.Id)
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
                if (!EditorialExists(id))
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
        public async Task<ActionResult<bool>> CrearPersona(EditorialDTO.EditorialRequest personaVal)
        {
            try
            {
                var persona = new Editoriale
                {
                    Sede = personaVal.Sede,
                    Nombre = personaVal.Nombres
                };
                _context.Editoriales.Add(persona);
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
        public async Task<IActionResult> DeletePersona(int id)
        {
            var persona = await _context.Editoriales.FindAsync(id);
            if (persona == null)
            {
                return NotFound();
            }

            _context.Editoriales.Remove(persona);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool EditorialExists(int id)
        {
            return _context.Editoriales.Any(e => e.Id == id);
        }
    }
}
