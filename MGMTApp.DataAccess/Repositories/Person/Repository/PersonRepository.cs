using MGMTApp.Domain.Person;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MGMTApp.DataAccess.Repositories
{
    public class PersonRepository : IPersonRepository
    {
        private readonly ISqlDataAccess _dataAccess;
        private readonly IConfiguration _configuration;

        public PersonRepository(ISqlDataAccess db, IConfiguration configuration)
        {
            _dataAccess = db;
            _configuration = configuration;
        }

        public async Task<bool> AddAsync(AddPerson person)
        {
            try
            {
                await _dataAccess.SaveData("sp_add_person", new
                {
                    Name = person.FullName,
                    email = person.Email,
                    address = person.Address
                });
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<bool> UpdateAsync(UpdatePerson person)
        {
            try
            {
                await _dataAccess.SaveData("sp_update_person", new
                {
                    id = person.Id,
                    Name = person.FullName,
                    email = person.Email,
                    address = person.Address
                });
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<bool> DeleteAsync(int id)
        {
            try
            {
                await _dataAccess.SaveData("sp_delete_person", new { Id = id });
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<PersonDetails?> GetByIdAsync(int id)
        {
            IEnumerable<PersonDetails> result = await _dataAccess.GetData<PersonDetails, dynamic>
                ("sp_get_person", new { Id = id });
            return result.FirstOrDefault();
        }

        public async Task<IEnumerable<PersonDataTableList>> GetAllPersonAsync()
        {
            string query = "sp_get_Allperson";
            return await _dataAccess.GetData<PersonDataTableList, dynamic>(query, new { });
        }
    }
}