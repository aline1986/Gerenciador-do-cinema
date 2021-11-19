using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Projeto.Entidades;

namespace Projeto.DAL
{
    public class Gerenciamento_de_filmes_Repository : Conexao
    {
        public void Insert(Gerenciamento_de_filmes G)
        /// Declaracao do Metodo Gerenciamento_de_sessoes
        {
            OpenConnection();
            /// Abre a Conexao
            string query = "INSERT INTO Gerenciamento_de_sessoes (Titulo, Descricao, Duracao, Imagem)" +
                " VALUES (@Titulo, @Descricao, @Duracao, @Imagem')";

            // Conversa com a Base
            com = new SqlCommand(query, con);
            ///Instancia do SqlCommand
            com.Parameters.AddWithValue("@Titulo", G.Titulo);
            /// Titulo
            com.Parameters.AddWithValue("@Descricao", G.Descricao);
            /// Campo Descricao
            com.Parameters.AddWithValue("@Duracao", G.Duracao);
            /// Duracao
            com.Parameters.AddWithValue("@Imagem", G.Imagem);
            /// Campo Imagem

            com.ExecuteNonQuery();
            /// Roda a Querie
            CloseConnection();
            /// Fecha a Conexao 
        }

        public void Update(Gerenciamento_de_filmes G)
        /// Declaracao do Metodo de Editar os Dados do Gerenciamento_de_sessoes
        {
            OpenConnection();
            /// Abre a Conexao
            string query = "UPDATE Gerenciamento_de_filmes SET Titulo = @Titulo, Descricao = @Descricao, Duracao = @Duracao ," +
                " Imagem = @Imagem  Where Id = @Id";
            /// Conversa com a Base
            com = new SqlCommand(query, con);
            /// Instancia do SqlCommand
            com.Parameters.AddWithValue("@Id", G.Id);
            /// Campo Id
            com.Parameters.AddWithValue("@Titulo", G.Titulo);
            /// Campo Titulo
            com.Parameters.AddWithValue("@Descricao", G.Descricao);
            /// Campo Descricao
            com.Parameters.AddWithValue("@Duracao", G.Duracao);
            /// Campo Duracao
            com.Parameters.AddWithValue("@Imagem", G.Imagem);
            /// Campo Imagem

            com.ExecuteNonQuery();
            /// Roda a Querie
            CloseConnection();
            /// Fecha a Conexao
        }

        public void Delete(Gerenciamento_de_filmes G)
        /// Metodo de Desligamento do Lista_de_salas
        {
            OpenConnection();
            /// Abre a Conexao com a Base
            string query = "DELETE FROM Gerenciamento_de_filmes   WHERE Id = @Id";
            /// Conversa com a Base
            com = new SqlCommand(query, con);
            /// Instancia do SqlCommand
            com.Parameters.AddWithValue("@Id", G.Id);
            /// Parametro Codigo do gerenciamento de filmes
            com.ExecuteNonQuery();
            /// Roda a Query
            CloseConnection();
            /// FEcha a Conexao
        }

        public List<Gerenciamento_de_filmes> FindAll()
        /// Metodo de Listagem
        {
            OpenConnection();
            /// Abre a Conexao
            string query = "SELECT * FROM Gerenciamento_de_filmes";
            /// Conversa com a Base
            com = new SqlCommand(query, con);
            /// Instancia do SqlCommand
            dr = com.ExecuteReader();
            /// Leitura dos Dados
            List<Gerenciamento_de_filmes> lista = new List<Gerenciamento_de_filmes>();
            /// Instancia do Lista com a Entidade Gerenciamento_de_filmes
            while (dr.Read())
            {
                /// Leitura dos Dados
                Gerenciamento_de_filmes G = new Gerenciamento_de_filmes();
                /// Instancia da Entidade Gerenciamento_de_filmes
                G.Id = Convert.ToInt32(dr["Id"]);
                /// Campo Id
                G.Titulo = Convert.ToString(dr["Titulo"]);
                /// Campo Titulo
                G.Descricao = Convert.ToString(dr["Descricao"]);
                /// Campo Descricao
                G.Duracao = (TimeSpan)dr["Duracao"];
                /// Campo Duracao
                G.Imagem = Convert.ToString(dr["Imagem"]);
                /// Campo Valor_do_ingresso

                lista.Add(G);
            }

            CloseConnection();
            /// Fecha a Conexao
            return lista;
            /// Retorna Para a Lista
        }
        public Gerenciamento_de_filmes FindById(int Id)
        /// Metodo de Consulta Filtrada
        {
            OpenConnection();
            /// Abre a Conexao
            string query = "SELECT * FROM Gerenciamento_de_filmes WHERE Id = @Id";
            /// Conversa com a Base
            com = new SqlCommand(query, con);
            /// Instancia do sqlCommand
            com.Parameters.AddWithValue("@Id", Id);
            /// Campo Codigo do Gerenciamento de filmes
            dr = com.ExecuteReader();
            /// Leitura dos Dados
            Gerenciamento_de_filmes G = null;
            /// Instancia da Entidade Gerenciamento_de_sessoes
            if (dr.Read())
            {
                /// Leitura dos Dados
                G = new Gerenciamento_de_filmes();

                G.Id = Convert.ToInt32(dr["Id"]);
                /// Campo Id
                G.Titulo = Convert.ToString(dr["Titulo"]);
                /// Campo Titulo
                G.Descricao = Convert.ToString(dr["Descricao"]);
                /// Campo Descricao
                G.Duracao = (TimeSpan)(dr["Duracao"]);
                /// Campo Duracao
                G.Imagem = Convert.ToString(dr["Imagem"]);
                /// Campo Descricao
            }

            CloseConnection();
            /// Fecha a Conexao
            return G;
            /// Retorna a Entidade
        }

    }

}
