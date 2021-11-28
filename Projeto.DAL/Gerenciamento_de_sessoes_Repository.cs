using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Projeto.Entidades;

namespace Projeto.DAL
{
    public class Gerenciamento_de_sessoes_Repository : Conexao
    {
        public void Insert(Gerenciamento_de_sessoes G)
        /// Declaracao do Metodo Gerenciamento_de_sessoes
        {
            OpenConnection();
            /// Abre a Conexao
            string query = "INSERT INTO Gerenciamento_de_sessoes (Data, Horario_de_inicio, Horario_de_fim, Valor_do_ingresso, Tipo_de_animacao, Tipo_de_audio, Id_sala, Id_filme)" +
                " VALUES (@Data, @Horario_de_inicio, @Horario_de_fim, @Valor_do_ingresso, @Tipo_de_animacao, @Tipo_de_audio, @Id_sala, @Id_filme')";
           
            // Conversa com a Base
            com = new SqlCommand(query, con);
            ///Instancia do SqlCommand
            com.Parameters.AddWithValue("@Data", G.Data);
            /// Data
            com.Parameters.AddWithValue("@Horario_de_inicio", G.Horario_de_inicio);
            /// Campo Horario_de_inicio
            com.Parameters.AddWithValue("@Horario_de_fim", G.Horario_de_fim);
            /// Horario_de_fim
            com.Parameters.AddWithValue("@Valor_do_ingresso", G.Valor_do_ingresso);
            /// Campo Valor_do_ingresso
            com.Parameters.AddWithValue("@Tipo_de_animacao", G.Tipo_de_animacao);
            /// Tipo_de_animação"
            com.Parameters.AddWithValue("@Tipo_de_audio", G.Tipo_de_audio);
            /// Tipo_de_audio
            com.Parameters.AddWithValue("@Id_sala", G.Id_sala);
            /// Id_sala
            com.Parameters.AddWithValue("@Id_filme", G.Id_filme);
            /// Campo Id_filme
            com.ExecuteNonQuery();
            /// Roda a Querie
            CloseConnection();
            /// Fecha a Conexao 
        }

        public void Update(Gerenciamento_de_sessoes G)
        /// Declaracao do Metodo de Editar os Dados do Gerenciamento_de_sessoes
        {
            OpenConnection();
            /// Abre a Conexao
            string query = "UPDATE Gerenciamento_de_sessoes SET Data = @Data, Horario_de_inicio = @Horario_de_inicio, Horario_de_fim = @Horario_de_fim ," +
                " Valor_do_ingresso = @Valor_do_ingresso, Tipo_de_animacao = @Tipo_de_animacao, Tipo_de_audio = @Tipo_de_audio, Id_sala = @Id_sala, Id_filme = @Id_filme" +
                " Where Id = @Id";
            /// Conversa com a Base
            com = new SqlCommand(query, con);
            /// Instancia do SqlCommand
            com.Parameters.AddWithValue("@Id", G.Id);
            /// Campo Id
            com.Parameters.AddWithValue("@Data", G.Data);
            /// Campo Data
            com.Parameters.AddWithValue("@Horario_de_inicio", G.Horario_de_inicio);
            /// Campo Horario_de_inicio
            com.Parameters.AddWithValue("@Horario_de_fim", G.Horario_de_fim);
            /// Campo Horario_de_fim
            com.Parameters.AddWithValue("@Valor_do_ingresso", G.Valor_do_ingresso);
            /// Campo Valor_do_ingresso
            com.Parameters.AddWithValue("@Tipo_de_animacao", G.Tipo_de_animacao);
            /// Tipo_de_animacao
            com.Parameters.AddWithValue("@Tipo_de_audio", G.Tipo_de_audio);
            /// Tipo_de_audio
            com.Parameters.AddWithValue("@Id_sala", G.Id_sala);
            /// Campo Id_sala
            com.Parameters.AddWithValue("@Id_filme", G.Id_filme);
            /// Campo Id_filme
            com.ExecuteNonQuery();
            /// Roda a Querie
            CloseConnection();
            /// Fecha a Conexao
            }

        public void Delete(Gerenciamento_de_sessoes G)
        /// Metodo de Desligamento do Gerenciamento de filmes da Aplicacao
        {
        OpenConnection();
        /// Abre a Conexao com a Base
        string query = "DELETE FROM Gerenciamento_de_sessoes   WHERE Id = @Id";
        /// Conversa com a Base
        com = new SqlCommand(query, con);
        /// Instancia do SqlCommand
        com.Parameters.AddWithValue("@Id", G.Id);
            /// Parametro Id Gerenciamento_de_sessoes
            com.ExecuteNonQuery();
        /// Roda a Query
        CloseConnection();
        /// FEcha a Conexao
        }

        public List<Gerenciamento_de_sessoes> FindAll()
        /// Metodo de Listagem
        {
        OpenConnection();
        /// Abre a Conexao
        string query = "SELECT * FROM Gerenciamento_de_sessoes";
        /// Conversa com a Base
        com = new SqlCommand(query, con);
        /// Instancia do SqlCommand
        dr = com.ExecuteReader();
        /// Leitura dos Dados
        List<Gerenciamento_de_sessoes> lista = new List<Gerenciamento_de_sessoes>();
            /// Instancia do Lista com a Entidade Gerenciamento_de_sessoes
            while (dr.Read())
        {
        /// Leitura dos Dados
        Gerenciamento_de_sessoes G = new Gerenciamento_de_sessoes();
         /// Instancia da Entidade Gerenciamento_de_sessoes
         G.Id = Convert.ToInt32(dr["Id"]);
         /// Campo Id
         G.Data = Convert.ToDateTime(dr["Data"]);
        /// Campo Data
         G.Horario_de_inicio = Convert.ToInt32(dr["Horario_de_inicio"]);
        /// Horario_de_inicio
         G.Horario_de_fim = Convert.ToInt32(dr["Horario_de_fim"]);
         /// Horario_de_fim
         G.Valor_do_ingresso = Convert.ToDouble(dr["Valor_do_ingresso"]);
         /// Campo Valor_do_ingresso

                lista.Add(G);
                }

                CloseConnection();
                /// Fecha a Conexao
                return lista;
                /// Retorna Para a Lista
                }
        public Gerenciamento_de_sessoes FindById(int Id)
        /// Metodo de Consulta Filtrada
        {
        OpenConnection();
        /// Abre a Conexao
        string query = "SELECT * FROM Gerenciamento_de_sessoes WHERE Id = @Id";
        /// Conversa com a Base
        com = new SqlCommand(query, con);
        /// Instancia do sqlCommand
        com.Parameters.AddWithValue("@Id", Id);
            /// Campo Id Gerenciamento_de_sessoes
            dr = com.ExecuteReader();
            /// Leitura dos Dados
            Gerenciamento_de_sessoes G = null;
            /// Instancia da Entidade Gerenciamento_de_sessoes
            if (dr.Read())
            {
                /// Leitura dos Dados
                G = new Gerenciamento_de_sessoes();

                G.Id = Convert.ToInt32(dr["Id"]);
                /// Campo Codigo
                G.Data = Convert.ToDateTime(dr["Data"]);
                /// Campo Data
                G.Horario_de_inicio = Convert.ToInt32(dr["Horario_de_inicio"]);
                /// Campo Horario_de_inicio
                G.Horario_de_fim = Convert.ToInt32(dr["Horario_de_fim"]);
                /// Campo Horario_de_fim
                G.Valor_do_ingresso = Convert.ToDouble(dr["Valor_do_ingresso"]);
                /// Campo Valor_do_ingresso
            }

            CloseConnection();
                /// Fecha a Conexao
                return G;
                /// Retorna a Entidade
            }

     }
}

