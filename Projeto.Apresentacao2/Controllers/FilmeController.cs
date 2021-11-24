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
    public class FilmeController : Controller
    {
        // GET: Filme
        public ActionResult Cadastro()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Cadastro(Gerenciamento_de_filmes_Cadastro_View_Model model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Gerenciamento_de_filmes f = new Gerenciamento_de_filmes();

                    f.Titulo = model.Titulo;
                    f.Descricao = model.Descricao;
                    f.Duracao = model.Duracao;
                    f.Imagem = model.Imagem;

                    Gerenciamento_de_filmes_Repository rep = new Gerenciamento_de_filmes_Repository();
                    rep.Insert(f);

                    ViewBag.Message = $"Nome do filme {f.Titulo}, Cadastrado com sucesso!";
                    ModelState.Clear();
                }
                catch(Exception e)
                {
                    ViewBag.MessageErro = $"Filme já cadastrado!";
                    ModelState.Clear();
                }               
            }
            Gerenciamento_de_filmes_Cadastro_View_Model viewModel = new Gerenciamento_de_filmes_Cadastro_View_Model();
            return View(viewModel);
        }
    }
}