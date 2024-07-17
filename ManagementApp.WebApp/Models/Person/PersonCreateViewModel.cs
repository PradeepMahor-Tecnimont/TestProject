﻿using System.ComponentModel.DataAnnotations;

namespace MGMTApp.WebApp.Models
{
    public class PersonCreateViewModel
    {
        [Display(Name = "Id")]
        public int? Id { get; set; }

        [Required]
        [Display(Name = "Full Name")]
        public string? FullName { get; set; }

        [Required]
        [Display(Name = "Email")]
        public string? Email { get; set; }

        [Required]
        [Display(Name = "Address")]
        public string? Address { get; set; }
    }
}