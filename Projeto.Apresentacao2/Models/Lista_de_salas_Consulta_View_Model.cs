using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Projeto.Apresentacao2.Models
{
    public class Lista_de_salas_Consulta_View_Model
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public int QuantidadeDeAssentos { get; set; }
        public string ImagemSala { get; set; }
    }
}