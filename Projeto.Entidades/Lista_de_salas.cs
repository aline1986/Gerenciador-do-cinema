using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Projeto.Entidades
{
   public class Lista_de_salas
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public int QuantidadeDeAssentos { get; set; }
        public string ImagemSala { get; set; }

        public Lista_de_salas()
        {

        }

        public Lista_de_salas(int id, string nome, int quantidadeDeAssentos, string imagemSala)
        {
            Id = id;
            Nome = nome;
            QuantidadeDeAssentos = quantidadeDeAssentos;
            ImagemSala = imagemSala;

        }
        public override string ToString()
        {
            return $"Id{Id}, Nome{Nome}, QuantidadeDeAssentos{QuantidadeDeAssentos},ImagemSala{ImagemSala} ";
        }
    }
}
