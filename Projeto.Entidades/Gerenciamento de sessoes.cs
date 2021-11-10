using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Projeto.Entidades
{
    public class Gerenciamento_de_sessoes
    {
        public int Id { get; set; }
        public DateTime Data { get; set; }
        public TimeSpan Horario_de_inicio { get; set; }
        public TimeSpan Horario_de_fim { get; set; }

        public Gerenciamento_de_sessoes()
        {

        }

        public Gerenciamento_de_sessoes(int id, DateTime data, TimeSpan horario_de_inicio, TimeSpan horario_de_fim)
        {
            Id = id;
            Data = data;
            Horario_de_inicio = horario_de_inicio;
            Horario_de_fim = horario_de_fim;
        }

        public override string ToString()
        {
            return $"Id{Id}, Data{Data}, Horario_de_inicio{Horario_de_inicio}, Horario_de_Fim{Horario_de_fim}";
        }
    }
}
