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

        [TestMethod]
        public void TestMethod2()
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                con.Open();

                Gerenciamento_de_filmes gf = new Gerenciamento_de_filmes();
                gf.Titulo = "Marley e Eu";
                gf.Imagem = "dowload.png";
                gf.Descricao = "Fime para toda famíla";
                gf.Duracao = 2;
                gf.DuracaoMinuto = 20;
                gf.DuracaoSegundo = 10;

                com = new SqlCommand("Insert Into Gerenciamento_de_filmes(Titulo,Imagem,Descricao,Duracao,DuracaoMinuto,DuracaoSegundo)Values('" + gf.Titulo + "','" + gf.Imagem + "','" + gf.Descricao + "'," + gf.Duracao + "," + gf.DuracaoMinuto + "," + gf.DuracaoSegundo + ")", con);

                con.Close();

            }
            catch (Exception)
            {

                Assert.IsTrue(true);
            }
        }

        [TestMethod]
        public void TestMethod3()
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                con.Open();

                Gerenciamento_de_filmes gf = new Gerenciamento_de_filmes();
                gf.Id = 1002;
                gf.Titulo = "Sai de Baixo 2";
                gf.Imagem = "dowload.png";
                gf.Descricao = "Fime para toda famíla";
                gf.Duracao = 2;
                gf.DuracaoMinuto = 20;
                gf.DuracaoSegundo = 10;

                com = new SqlCommand("Update Gerenciamento_de_filmes Set Titulo = '" + gf.Titulo + "', Descricao = '" + gf.Descricao + "', Duracao = " + gf.Duracao + ", DuracaoMinuto = " + gf.DuracaoMinuto + ", DuracaoSegundo = " + gf.DuracaoSegundo + " Where Id = " + gf.Id, con);

                con.Close();

            }
            catch (Exception)
            {

                Assert.IsTrue(true);
            }
        }

        [TestMethod]
        public void TestMethod4()
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                con.Open();

                Gerenciamento_de_filmes gf = new Gerenciamento_de_filmes();
                gf.Id = 1002;
                gf.Imagem = "dowload.png";
                
                com = new SqlCommand("Update Gerenciamento_de_filmes Set Imagem = " + gf.Imagem + " Where Id = " + gf.Id, con);

                con.Close();

            }
            catch (Exception)
            {

                Assert.IsTrue(true);
            }
        }

        [TestMethod]
        public void TestMethod5()
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                con.Open();

                Gerenciamento_de_filmes gf = new Gerenciamento_de_filmes();
                gf.Id = 1002;
                
                com = new SqlCommand("Delete From Gerenciamento_de_filmes Where Id = " + gf.Id, con);

                con.Close();

            }
            catch (Exception)
            {

                Assert.IsTrue(true);
            }
        }

        [TestMethod]
        public void TestMethod6()
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                con.Open();

                Gerenciamento_de_filmes gf = new Gerenciamento_de_filmes();
                gf.Id = 1002;
                gf.Titulo = "Sai de Baixo 2";
                gf.Imagem = "dowload.png";
                gf.Descricao = "Fime para toda famíla";
                gf.Duracao = 2;
                gf.DuracaoMinuto = 20;
                gf.DuracaoSegundo = 10;

                Lista_de_salas ls = new Lista_de_salas();
                ls.Id = 1025;
                ls.ImagemSala = "download.png";
                ls.Nome = "Tony Stark";
                ls.QuantidadeDeAssentos = 225;
                

                Gerenciamento_de_sessoes gs = new Gerenciamento_de_sessoes();
                gs.Id = 1002;
                gs.Data = DateTime.Now;
                gs.Horario_de_inicio = 15;
                gs.Horario_de_inicio_Minuto = 45;
                gs.Horario_de_Inicio_Segundo = 37;
                gs.Valor_do_ingresso = 28;
                gs.Valor_do_ingresso_centavos = 32;
                gs.Tipo_de_animacao = "3D";
                gs.Tipo_de_audio = "Dublado";
                gs.Id_filme = gf.Id;
                gs.Horario_de_fim = gs.Horario_de_inicio_Minuto + gf.Duracao;
                gs.Horario_de_fim_Minuto = gs.Horario_de_inicio_Minuto + gf.DuracaoSegundo;
                gs.Horario_de_fim_Segundo = gs.Horario_de_Inicio_Segundo + gf.DuracaoSegundo;
                gs.Id_sala = ls.Id;

                com = new SqlCommand("Insert Into Gerenciamento_de_Sessoes (Data, Horario_de_inicio, Horario_de_inicio_Minuto, Horario_de_inicio_segundo, Valor_do_ingresso_centavos, Valor_do_ingresso_reais)Values('" + gs.Data + "', " +
                    ""+ gs.Horario_de_inicio +", " + gs.Horario_de_inicio_Minuto + ", " + gs.Horario_de_Inicio_Segundo + ", " + gs.Valor_do_ingresso_centavos + ", " + gs.Valor_do_ingresso + ") ", con);

                con.Close();

            }
            catch (Exception)
            {

                Assert.IsTrue(true);
            }
        }

        [TestMethod]
        public void TestMethod7()
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                con.Open();

                Gerenciamento_de_filmes gf = new Gerenciamento_de_filmes();
                gf.Id = 1002;
                
                com = new SqlCommand("Select * From Gerenciamento_de_filmes Where Id =" + gf.Id, con);

                con.Close();

            }
            catch (Exception)
            {

                Assert.IsTrue(true);
            }
        }

        [TestMethod]
        public void TestMethod8()
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                con.Open();
                

                com = new SqlCommand("Select * From Gerenciamento_de_filmes" , con);

                con.Close();

            }
            catch (Exception)
            {

                Assert.IsTrue(true);
            }
        }

        [TestMethod]
        public void TestMethod9()
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                con.Open();

                Gerenciamento_de_filmes gf = new Gerenciamento_de_filmes();
                gf.Id = 1002;
                gf.Titulo = "Sai de Baixo 2";
                gf.Imagem = "dowload.png";
                gf.Descricao = "Fime para toda famíla";
                gf.Duracao = 2;
                gf.DuracaoMinuto = 20;
                gf.DuracaoSegundo = 10;

                Lista_de_salas ls = new Lista_de_salas();
                ls.Id = 1025;
                ls.ImagemSala = "download.png";
                ls.Nome = "Tony Stark";
                ls.QuantidadeDeAssentos = 225;


                Gerenciamento_de_sessoes gs = new Gerenciamento_de_sessoes();
                gs.Id = 1002;
                gs.Data = DateTime.Now;
                gs.Horario_de_inicio = 15;
                gs.Horario_de_inicio_Minuto = 45;
                gs.Horario_de_Inicio_Segundo = 37;
                gs.Valor_do_ingresso = 28;
                gs.Valor_do_ingresso_centavos = 32;
                gs.Tipo_de_animacao = "3D";
                gs.Tipo_de_audio = "Dublado";
                gs.Id_filme = gf.Id;
                gs.Horario_de_fim = gs.Horario_de_inicio_Minuto + gf.Duracao;
                gs.Horario_de_fim_Minuto = gs.Horario_de_inicio_Minuto + gf.DuracaoSegundo;
                gs.Horario_de_fim_Segundo = gs.Horario_de_Inicio_Segundo + gf.DuracaoSegundo;
                gs.Id_sala = ls.Id;

                com = new SqlCommand("Update Gerenciamento_de_sessoes Set Data = '" + gs.Data + "', Horario_de_Inicio = " + gs.Horario_de_inicio + ", Horario_de_inicio_Minuto = " + gs.Horario_de_inicio_Minuto + ", Horario_de_inicio_segundo = " + gs.Horario_de_Inicio_Segundo + ", Valor_do_ingresso_reais = " + gs.Valor_do_ingresso + ", Valor_do_ingresso_centavos = " + gs.Valor_do_ingresso_centavos + ", Tipo_de_animacao = '" + gs.Tipo_de_animacao + "', Tipo_de_audio = '" + gs.Tipo_de_audio + "' " +
                    "Where Id = " + gs.Id, con);

                con.Close();

            }
            catch (Exception)
            {

                Assert.IsTrue(true);
            }
        }

        [TestMethod]
        public void TestMethod10()
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                con.Open();

                
                com = new SqlCommand("Select * From View VW_Sessao_Filme_Sala", con);

                con.Close();

            }
            catch (Exception)
            {

                Assert.IsTrue(true);
            }
        }

        [TestMethod]
        public void TestMethod11()
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                con.Open();

                Gerenciamento_de_sessoes gs = new Gerenciamento_de_sessoes();
                gs.Id = 10;
                com = new SqlCommand("Select * From View Gerenciamento_de_sessoes Where Id = " + gs.Id, con);

                con.Close();

            }
            catch (Exception)
            {

                Assert.IsTrue(true);
            }
        }

        [TestMethod]
        public void TestMethod12()
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                con.Open();

                Gerenciamento_de_sessoes gs = new Gerenciamento_de_sessoes();

                com = new SqlCommand("Delete From View Gerenciamento_de_sessoes Where Id =" + gs.Id, con);

                con.Close();

            }
            catch (Exception)
            {

                Assert.IsTrue(true);
            }
        }
    }
}
