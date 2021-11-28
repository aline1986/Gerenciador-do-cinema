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
    public class UsuarioController : Controller
    {
        public ActionResult Cadastro()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Cadastro(Usuario model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Usuario u = new Usuario();

                    u.Login = model.Login;
                    u.Senha = model.Senha;

                    Usuario_Repository rep = new Usuario_Repository();
                    rep.Insert(u);

                    ViewBag.Message = $"Usuário(a) {u.Login}, Cadastrado(a) com sucesso!";
                    ModelState.Clear();
                }
                catch (Exception e)
                {
                    ViewBag.MessageErro = $"Usuário(a) já cadastrado!";
                    ModelState.Clear();
                }
            }
            Usuario_Cadastro_View_Model viewModel = new Usuario_Cadastro_View_Model();
            return View(viewModel);
        
        }
    }
}