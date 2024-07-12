using System.ComponentModel.DataAnnotations;

namespace MGMTApp.WebApp.Models
{
    public class PersonViewModel
    {
        public decimal? TotalRow { get; set; }

        public decimal RowNumber { get; set; }

        [Display(Name = "Id")]
        public int Id { get; set; }

        [Display(Name = "Full Name")]
        public string? FullName { get; set; }

        [Display(Name = "Email")]
        public string? Email { get; set; }

        [Display(Name = "Address")]
        public string? Address { get; set; }
    }
}