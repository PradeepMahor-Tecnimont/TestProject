﻿using MGMTApp.WebApp.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.ComponentModel.Design;
using System.Globalization;

namespace MGMTApp.WebApp.Controllers
{
    public class BaseController : Controller
    {
        public static string ToTitleCase(string str)
        {
            TextInfo myTI = new CultureInfo("en-US", false).TextInfo;
            return myTI.ToTitleCase(str);
        }

        public void Notify(string Title, string Message, string Provider, NotificationType notificationType)
        {
            var msg = new
            {
                message = Message,
                title = Title,
                icon = notificationType.ToString(),
                type = notificationType.ToString(),
                provider = Provider//GetProvider()
            };

            TempData["Message"] = JsonConvert.SerializeObject(msg);
        }
    }
}