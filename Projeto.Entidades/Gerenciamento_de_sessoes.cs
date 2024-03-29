﻿using System;
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
        public int Horario_de_inicio { get; set; }
        public int Horario_de_fim { get; set; }
        public double Valor_do_ingresso { get; set; }
        public double Valor_do_ingresso_centavos { get; set; }
        public string Tipo_de_animacao { get; set; }
        public string Tipo_de_audio { get; set; }
        public int Id_sala { get; set; }
        public int Id_filme { get; set; }
        public int Duracao { get; set; }
        public int Horario_de_inicio_Minuto { get; set; }
        public int Horario_de_Inicio_Segundo { get; set; }
        public int Horario_de_fim_Minuto { get; set; }
        public int Horario_de_fim_Segundo { get; set; }
        public int Duracao_Minuto { get; set; }
        public int Duracao_Segundo { get; set; }

        /// <summary>
        /// Construtores
        /// </summary>
        public Gerenciamento_de_sessoes()
        {

        }

        public Gerenciamento_de_sessoes(int id, DateTime data, int horario_de_inicio, int horario_de_fim,
         double valor_do_ingresso, string tipo_de_animação, string tipo_de_audio,int id_sala, int id_filme,
         int horario_de_inicio_Minuto, int horario_de_Inicio_Segundo, int horario_de_fim_Minuto, 
         int horario_de_fim_Segundo, int duracao_Minuto, int duracao_Segundo,double valor_do_ingresso_centavos)
        {
            Id = id;
            Data = data;
            Horario_de_inicio = horario_de_inicio;
            Horario_de_fim = horario_de_fim;
            Valor_do_ingresso = valor_do_ingresso;
            Valor_do_ingresso_centavos = valor_do_ingresso_centavos;
            Tipo_de_animacao = tipo_de_animação;
            Tipo_de_audio = tipo_de_audio;
            Id_sala = id_sala;
            Id_filme = id_filme;
            Horario_de_inicio_Minuto = horario_de_inicio_Minuto;
            Horario_de_Inicio_Segundo = horario_de_fim_Segundo;
            Horario_de_fim_Minuto = horario_de_fim_Minuto;
            Horario_de_fim_Segundo = horario_de_fim_Segundo;
            Duracao_Minuto = duracao_Minuto;
            Duracao_Segundo = duracao_Segundo;
        }


        /// <summary>
        /// Metodo override
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            return $"Id{Id}, Data{Data}, Horario_de_inicio{Horario_de_inicio}, Horario_de_Fim{Horario_de_fim}," +
                $"Valor_do_ingresso{Valor_do_ingresso},Tipo_de_animacao{Tipo_de_animacao },Tipo_de_audio{Tipo_de_audio}," +
                $"Id_sala{Id_sala},Id_filme{Id_filme} ";
        }
    }
}
