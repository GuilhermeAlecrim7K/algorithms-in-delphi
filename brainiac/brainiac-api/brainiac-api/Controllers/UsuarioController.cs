using brainiac_api.Data;
using brainiac_api.Models;
using Microsoft.AspNetCore.Mvc;

namespace brainiac_api.Controllers
{
    [ApiController]
    [Route("Usuario")]
    public class UsuarioController : ControllerBase
    {
        private BrainiacDb _context;

        public UsuarioController(BrainiacDb _context)
        {
            this._context = _context;
        }

        [HttpGet]
        public IActionResult GetAll()
        {
            return Ok(_context.Usuarios);
        }

        [HttpGet("{Id}")]
        public IActionResult GetById(Guid Id)
        {
            Usuario user = _context.Usuarios.FirstOrDefault(user => user.Id == Id);
            if (user != null)
            {
                return Ok(user);
            }
            return NotFound(user);
        }

    }
}
