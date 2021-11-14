using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Projeto.Apresentacao2.Models
{
    public class Gerenciamento_de_sessoes_Edicao_View_Model
    {
        [Required(ErrorMessage = "Altere o Id ")]
        public int Id { get; set; }

        [Required(ErrorMessage = "Altere a data da sessão ")]
        public DataType Data { get; set; }

        [Required(ErrorMessage = "Altere o horário de início da sessão ")]
        public TimeSpan Horario_de_inicio { get; set; }

        [Required(ErrorMessage = "Altere o horário de fim da sessão ")]
        public TimeSpan Horario_de_fim { get; set; }
    }
}