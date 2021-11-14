using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Projeto.Apresentacao2.Models
{
    public class Gerenciamento_de_sessoes_Consulta_View_Model
    {
        public int Id { get; set; }
        public DateTime Data { get; set; }
        public TimeSpan Horario_de_inicio { get; set; }
        public TimeSpan Horario_de_fim { get; set; }
    }
}