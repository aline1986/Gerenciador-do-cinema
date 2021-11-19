using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Projeto.Entidades;

namespace Projeto.DAL
{
    public class Usuario_Repository : Conexao
    {
        public void Insert(Usuario U)
        /// Declaracao do Metodo Usuario
        {
            OpenConnection();
            /// Abre a Conexao
            string query = "INSERT INTO Usuario (Login, Senha)" +
                " VALUES (@Login, @Senha')";

            // Conversa com a Base
            com = new SqlCommand(query, con);
            ///Instancia do SqlCommand
            com.Parameters.AddWithValue("@Login", U.Login);
            /// Nome
            com.Parameters.AddWithValue("@Senha", U.Senha);
            /// Campo Senha
          


            com.ExecuteNonQuery();
            /// Roda a Querie
            CloseConnection();
            /// Fecha a Conexao 
        }

    }
}
