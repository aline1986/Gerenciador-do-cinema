using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Projeto.Apresentacao2.Models;
using Projeto.Entidades;
using Projeto.DAL;

namespace Projeto.Apresentacao2.Controllers
{
    public class SalaController : Controller
    {
        public ActionResult Cadastro()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Cadastro(Lista_de_salas_Cadastro_View_Model model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Lista_de_salas l = new Lista_de_salas();

                    l.Nome = model.Nome;
                    l.QuantidadeDeAssentos = model.QuantidadeDeAssentos;
                    
                    Lista_de_salas_Repository rep = new Lista_de_salas_Repository();
                    rep.Insert(l);

                    ViewBag.Message = $"Sala {l.Nome}, Cadastrada com sucesso!";
                    ModelState.Clear();
                }
                catch (Exception e)
                {
                    ViewBag.MessageErro = $"Erro {e.Message}!";
                    ModelState.Clear();
                }
            }
            Lista_de_salas_Cadastro_View_Model viewModel = new Lista_de_salas_Cadastro_View_Model();
            return View(viewModel);
        }
    }
}