using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Projeto.Apresentacao2.Models
{
    public class Lista_de_salas_Edicao_View_Model
    {
        [Required(ErrorMessage = "Altere nome da sala")]
        public int Id { get; set; }

        [Required(ErrorMessage = "Altere nome da sala")]
        public string Nome { get; set; }

        [Required(ErrorMessage = "Altere quantidade de assentos")]
        public int QuantidadeDeAssentos { get; set; }

        [Required(ErrorMessage = "Altere imagem")]
        public string ImagemSala { get; set; }

    }
}