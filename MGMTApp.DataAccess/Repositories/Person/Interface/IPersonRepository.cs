using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MGMTApp.Domain.Person;

namespace MGMTApp.DataAccess.Repositories
{
    public interface IPersonRepository
    {
        public Task<bool> AddAsync(AddPerson person);

        public Task<bool> UpdateAsync(UpdatePerson person);

        public Task<bool> DeleteAsync(int id);

        public Task<PersonDetails?> GetByIdAsync(int id);

        public Task<IEnumerable<PersonDataTableList>> GetAllPersonAsync(int pageNumber, int rowsOfPage);
    }
}