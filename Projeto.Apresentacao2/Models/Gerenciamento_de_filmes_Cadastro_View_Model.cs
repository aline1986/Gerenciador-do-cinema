using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Projeto.Apresentacao2.Models
{
    public class Gerenciamento_de_filmes_Cadastro_View_Model
    {
        public string Titulo  { get; set; }
        public string Descricao { get; set; }
        public int Duracao { get; set; }
        public string Imagem { get; set; }
    }
}