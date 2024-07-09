using MGMTApp.DataAccess.Repositories;
using MGMTApp.Domain.Person;
using Microsoft.AspNetCore.Mvc;
using System;

namespace MGMTApp.WebApp.Controllers
{
    public class PersonController : Controller
    {
        private readonly IPersonRepository _personRepository;

        public PersonController(IPersonRepository personRepository)
        {
            _personRepository = personRepository;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Person()
        {
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> Add()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Add(AddPerson person)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View(person);
                }

                bool addPerson = await _personRepository.AddAsync(person);
                if (addPerson)
                {
                    TempData["msg"] = "Successfully Added";
                }
                else
                {
                    TempData["msg"] = "Could Not Added";
                }
            }
            catch (Exception ex)
            {
                TempData["msg"] = "Could Not Added";
            }
            return RedirectToAction(nameof(Add));
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var person = await _personRepository.GetByIdAsync(id);
            if (person == null)
            {
                throw new Exception();
            }
            return View("Edit", person);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(UpdatePerson person)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View(person);
                }
                var updateResult = await _personRepository.UpdateAsync(person);
                if (updateResult)
                {
                    TempData["msg"] = "Edit Successfully.";
                    return RedirectToAction(nameof(DisplayAllPerson));
                }
                else
                {
                    TempData["msg"] = "Could Not Edit.";
                    return View(person);
                }
            }
            catch (Exception ex)
            {
                TempData["msg"] = "Could Not Edit.";
                return View(person);
            }
        }

        [HttpGet]
        public async Task<IActionResult> DisplayAllPerson()
        {
            try
            {
                var personAll = await _personRepository.GetAllPersonAsync();
                return View(personAll);
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var deleteResult = await _personRepository.DeleteAsync(id);
            return RedirectToAction(nameof(DisplayAllPerson));
        }
    }
}