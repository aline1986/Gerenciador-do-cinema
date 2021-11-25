using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Projeto.Entidades
{
    public class Gerenciamento_de_filmes
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string Descricao { get; set; }
        public int Duracao { get; set; }
        public string Imagem { get; set; }

        public Gerenciamento_de_filmes()
        {
                
        }

        public Gerenciamento_de_filmes(int id, string titulo, string descricao, int duracao, string imagem)
        {
            Id = id;
            Titulo = titulo;
            Descricao = descricao;
            Duracao = duracao;
            Imagem = imagem;
        }

        public override string ToString()
        {
            return $"Id:{Id}, Titulo:{Titulo}, Descricao{Descricao}, Duracao{Duracao}, Imagem{Imagem}";
        }
    }
}
