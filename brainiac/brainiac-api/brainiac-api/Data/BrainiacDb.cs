using Microsoft.EntityFrameworkCore;

namespace brainiac_api.Data
{
    public class BrainiacDb : DbContext
    {

        public BrainiacDb(DbContextOptions<BrainiacDb> options) : base(options)
        {

        }

    }
}
