using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Projeto.Apresentacao2.Models
{
    public class Gerenciamento_de_filmes_Edicao_View_Model
    {
        [Required(ErrorMessage = "Altere o título do filme")]
        public int Id { get; set; }

        [Required(ErrorMessage = "Altere o título do filme")]
        public string Titulo { get; set;}

        [Required(ErrorMessage = "Altere a descrição do filme")]
        public string Descricao { get; set; }

        [Required(ErrorMessage = "Altere a duracao do filme")]
        public TimeSpan Duracao { get; set; }

        [Required(ErrorMessage = "Altere a imagem do filme")]
        public string Imagem { get; set; }

    }
}