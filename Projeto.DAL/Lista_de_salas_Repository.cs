using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Projeto.Entidades;

namespace Projeto.DAL
{
    public class Lista_de_salas_Repository : Conexao
    {
        public void Insert(Lista_de_salas L)
        /// Declaracao do Metodo Gerenciamento_de_sessoes
        {
            OpenConnection();
            /// Abre a Conexao
            string query = "INSERT INTO Lista_de_salas (Nome, QuantidadeDeAssentos, ImagemSala)" +
                " VALUES (@Nome, @QuantidadeDeAssentos, @ImagemSala')";

            // Conversa com a Base
            com = new SqlCommand(query, con);
            ///Instancia do SqlCommand
            com.Parameters.AddWithValue("@Nome", L.Nome);
            /// Nome
            com.Parameters.AddWithValue("@QuantidadeDeAssentos", L.QuantidadeDeAssentos);
            /// Campo QuantidadeDeAssentos
            com.Parameters.AddWithValue("@ImagemSala", L.ImagemSala);
            /// ImagemSala


            com.ExecuteNonQuery();
            /// Roda a Querie
            CloseConnection();
            /// Fecha a Conexao 
        }

        public void Update(Lista_de_salas L)
        /// Declaracao do Metodo de Editar os Dados do Lista_de_salas
        {
            OpenConnection();
            /// Abre a Conexao
            string query = "UPDATE Lista_de_salas SET Nome = @Nome, QuantidadeDeAssentos = @QuantidadeDeAssentos ," +
                " ImagemSala = @ImagemSala  Where Id = @Id";
            /// Conversa com a Base
            com = new SqlCommand(query, con);
            /// Instancia do SqlCommand
            com.Parameters.AddWithValue("@Id", L.Id);
            /// Campo Id
            com.Parameters.AddWithValue("@Nome", L.Nome);
            /// Campo Nome
            com.Parameters.AddWithValue("@QuantidadeDeAssentos", L.QuantidadeDeAssentos);
            /// Campo QuantidadeDeAssentos
            com.Parameters.AddWithValue("@ImagemSala", L.ImagemSala);
            /// Campo ImagemSala


            com.ExecuteNonQuery();
            /// Roda a Querie
            CloseConnection();
            /// Fecha a Conexao
        }

        public void Delete(Lista_de_salas L)
        /// Metodo de Desligamento do Lista_de_salas
        {
            OpenConnection();
            /// Abre a Conexao com a Base
            string query = "DELETE FROM Lista_de_salas   WHERE Id = @Id";
            /// Conversa com a Base
            com = new SqlCommand(query, con);
            /// Instancia do SqlCommand
            com.Parameters.AddWithValue("@Id", L.Id);
            /// Parametro Codigo do Lista_de_salas
            com.ExecuteNonQuery();
            /// Roda a Query
            CloseConnection();
            /// FEcha a Conexao
        }

        public List<Lista_de_salas> FindAll()
        /// Metodo de Listagem
        {
            OpenConnection();
            /// Abre a Conexao
            string query = "SELECT * FROM Lista_de_salas";
            /// Conversa com a Base
            com = new SqlCommand(query, con);
            /// Instancia do SqlCommand
            dr = com.ExecuteReader();
            /// Leitura dos Dados
            List<Lista_de_salas> lista = new List<Lista_de_salas>();
            /// Instancia do Lista com a Entidade Lista_de_salas
            while (dr.Read())
            {
                /// Leitura dos Dados
                Lista_de_salas L = new Lista_de_salas();
                /// Instancia da Entidade Lista_de_salas
                L.Id = Convert.ToInt32(dr["Id"]);
                /// Campo Id
                L.Nome = Convert.ToString(dr["Nome"]);
                /// Campo Nome
                L.QuantidadeDeAssentos = Convert.ToInt32(dr["QuantidadeDeAssentos"]);
                /// Campo QuantidadeDeAssentos

                L.ImagemSala = Convert.ToString(dr["ImagemSala"]);
                /// Campo ImagemSala

                lista.Add(L);
            }

            CloseConnection();
            /// Fecha a Conexao
            return lista;
            /// Retorna Para a Lista
        }
        public Lista_de_salas FindById(int Id)
        /// Metodo de Consulta Filtrada
        {
            OpenConnection();
            /// Abre a Conexao
            string query = "SELECT * FROM Lista_de_salas WHERE Id = @Id";
            /// Conversa com a Base
            com = new SqlCommand(query, con);
            /// Instancia do sqlCommand
            com.Parameters.AddWithValue("@Id", Id);
            /// Campo Codigo do Lista_de_salas
            dr = com.ExecuteReader();
            /// Leitura dos Dados
            Lista_de_salas L = null;
            /// Instancia da Entidade Lista_de_salas
            if (dr.Read())
            {
                /// Leitura dos Dados
                L = new Lista_de_salas();

                L.Id = Convert.ToInt32(dr["Id"]);
                /// Campo Id
                L.Nome = Convert.ToString(dr["Nome"]);
                /// Campo Nome
                L.QuantidadeDeAssentos = Convert.ToInt32(dr["QuantidadeDeAssentos"]);
                /// Campo QuantidadeDeAssentos
                L.ImagemSala = Convert.ToString(dr["ImagemSala"]);
                /// Campo ImagemSala
            }

            CloseConnection();
            /// Fecha a Conexao
            return L;
            /// Retorna a Entidade
        }

    }

}
