using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Projeto.Apresentacao2.Models
{
    public class Lista_de_salas_Cadastro_View_Model
    {
        public string Nome { get; set; }
        public int QuantidadeDeAssentos { get; set; }
    }
}