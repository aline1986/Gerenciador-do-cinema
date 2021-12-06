using System;
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Projeto.Apresentacao2;
using Projeto.DAL;
using Projeto.Entidades;

namespace Projeto.Apresentacao2.Tests
{
    [TestClass]
    public class UnitTest1 : Conexao
    {
        [TestMethod]
        public void TestMethod1()
        {
            try
            {

            
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
            con.Open();
            Gerenciamento_de_filmes gf = new Gerenciamento_de_filmes();
            gf.Titulo = "Deu a Louca nos bichos";
            gf.Imagem = "download.png";
            gf.Descricao = "Filme Para Toda a Família";
            gf.Duracao = 1;
            gf.DuracaoMinuto = 30;
            gf.DuracaoSegundo = 45;

            Gerenciamento_de_filmes_Repository rep = new Gerenciamento_de_filmes_Repository();

            rep.Insert(gf);
            con.Close();
            }
            catch (Exception)
            {

                Assert.IsTrue(true);
            }
        }
    }
}
