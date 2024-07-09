// Ignore Spelling: App

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MGMTApp.Domain.Person
{
    public class AddPerson
    {
        [Required]
        public string? FullName { get; set; }

        [Required]
        public string? Email { get; set; }

        public string? Address { get; set; }
    }
}