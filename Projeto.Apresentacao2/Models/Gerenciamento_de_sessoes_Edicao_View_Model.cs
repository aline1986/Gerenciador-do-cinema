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
        public DateTime Data { get; set; }

        [Required(ErrorMessage = "Altere o horário de início da sessão ")]
        public TimeSpan Horario_de_inicio { get; set; }

        [Required(ErrorMessage = "Altere o horário de fim da sessão ")]
        public TimeSpan Horario_de_fim { get; set; }


        [Required(ErrorMessage = "Altere o valor do ingresso ")]
        public double Valor_do_ingresso { get; set; }

        [Required(ErrorMessage = "Altere o tipo de animação (2D/3D) ")]
        public string Tipo_de_animação { get; set; }

        [Required(ErrorMessage = "Altere o tipo de audio ")]
        public string Tipo_de_audio { get; set; }

        [Required(ErrorMessage = "Altere a sala vinculada a sessão  ")]
        public int Id_sala { get; set; }

        [Required(ErrorMessage = "Altere o filme vinculado a sessão ")]
        public int Id_filme { get; set; }



    }
}


