using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Projeto.Entidades
{
    public class Gerenciamento_de_sessoes
    {
        /// <summary>
        /// Atributos
        /// </summary>
        public int Id { get; set; }
        public DateTime Data { get; set; }
        public TimeSpan Horario_de_inicio { get; set; }
        public TimeSpan Horario_de_fim { get; set; }
        public double Valor_do_ingresso { get; set; }
        public string Tipo_de_animação { get; set; }
        public string Tipo_de_audio { get; set; }
        public int Id_sala { get; set; }
        public int Id_filme { get; set; }

        /// <summary>
        /// Construtores
        /// </summary>
        public Gerenciamento_de_sessoes()
        {

        }

        public Gerenciamento_de_sessoes(int id, DateTime data, TimeSpan horario_de_inicio, TimeSpan horario_de_fim,
         double valor_do_ingresso, string tipo_de_animação, string tipo_de_audio,int id_sala, int id_filme)
        {
            Id = id;
            Data = data;
            Horario_de_inicio = horario_de_inicio;
            Horario_de_fim = horario_de_fim;
            Valor_do_ingresso = valor_do_ingresso;
            Tipo_de_animação = tipo_de_animação;
            Tipo_de_audio = tipo_de_audio;
            Id_sala = id_sala;
            Id_filme = id_filme;

        }


        /// <summary>
        /// Metodo override
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            return $"Id{Id}, Data{Data}, Horario_de_inicio{Horario_de_inicio}, Horario_de_Fim{Horario_de_fim}," +
                $"Valor_do_ingresso{Valor_do_ingresso},Tipo_de_animação{Tipo_de_animação },Tipo_de_audio{Tipo_de_audio}," +
                $"Id_sala{Id_sala},Id_filme{Id_filme} ";
        }
    }
}
