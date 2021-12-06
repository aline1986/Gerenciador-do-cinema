using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Projeto.Entidades;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Projeto.Apresentacao2;

namespace Projeto.Apresentacao2.Tests.Controllers
{
    [TestClass]
    public class FilmeControllerTest
    {
        [TestMethod]
        public void UnitTest1()
        {
            Gerenciamento_de_filmes gf = new Gerenciamento_de_filmes();
            gf.Titulo = "Uma Noite no Museu 2";
            gf.Imagem = "download.png";
            gf.Duracao = 3;
            gf.DuracaoMinuto = 30;
            gf.DuracaoSegundo = 20;
            gf.Descricao = "Filme Muito Bom Para Toda a Família";

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
            con.Open();

            SqlCommand com = new SqlCommand("INSERT INTO Gerenciamento_de_filmes(Titulo, Descricao, Duracao, " +
                    "Imagem, DuracaoMinuto, DuracaoSegundo) VALUES ('" + gf.Titulo + "', '" + gf.Descricao + "', " + gf.Duracao + ", '" + gf.Imagem + "', " + gf.DuracaoMinuto + ", " + gf.DuracaoSegundo + ")", con);
            com.ExecuteReader();

            

            con.Close();
        }
    }
}
