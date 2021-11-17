using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Projeto.Apresentacao2.Models
{
    public class Gerenciamento_de_sessoes_Excluir_View_Model
    {
        public int Id { get; set; }
        public DateTime Data { get; set; }
        public TimeSpan Horario_de_inicio { get; set; }
        public TimeSpan Horario_de_fim { get; set; }
        public double Valor_do_ingresso { get; set; }
        public string Tipo_de_animação { get; set; }
        public string Tipo_de_audio { get; set; }
        public int Id_sala { get; set; }
        public int Id_filme { get; set; }
    }
}