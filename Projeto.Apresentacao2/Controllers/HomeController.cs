using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Projeto.Apresentacao2.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();

        }

        public ActionResult Logado()
        {
            return View();
        }

        public ActionResult Erro()
        {
            return View();
        }

        public ActionResult Catch()
        {
            return View();
        }

        public ActionResult CadastroSucessoFilme()
        {
            return View();
        }

        public ActionResult CadastroErroFilme()
        {
            return View();
        }

        public ActionResult EditarSucessoFilme()
        {
            return View();
        }

        public ActionResult EditarErroFilme()
        {
            return View();
        }

        public ActionResult ExcluirSucessoFilme()
        {
            return View();
        }

        public ActionResult ExcluirErroFilme()
        {
            return View();
        }

        public ActionResult EditarSucessoImgFilme()
        {
            return View();
        }

        public ActionResult EditarErroImgFilme()
        {
            return View();
        }
    }
}